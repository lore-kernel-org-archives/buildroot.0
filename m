From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2018 23:11:12 +0100
Subject: [Buildroot] [PATCH 2/5] download/git: re-run the backend with a
 lock to the git tree
In-Reply-To: <20181014125415.GG31509@scaer>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
 <b5a3123305e1d4cef3cbdb17985e73161d13f407.1534972250.git.yann.morin.1998@free.fr>
 <20180910225228.56cdb555@windsurf> <20181014125415.GG31509@scaer>
Message-ID: <a1e6c685-bd6d-0de0-faaf-523b2f650ce7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14/10/2018 13:54, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-09-10 22:52 +0200, Thomas Petazzoni spake thusly:
>> On Wed, 22 Aug 2018 23:10:55 +0200, Yann E. MORIN wrote:
>>> The access-pattern to the git repository must be entirely atomic.
>>>
>>> This atomicity is currently guaranteed by the caller, from a higher
>>> level. But this is not optimum, and it is better that the backend does
>>> the locking it needs by itself, so that other backends from other builds
>>> can still download for the same package (e.g. another build uses a wget
>>> download for that package).
>>
>> I'd like to challenge the complexity vs. benefit of this patch and
>> PATCH 3/5. Basically, you replace a single $(FLOCK) call in dl-wrapper,
>> by 30 additional lines in the git-specific wrapper (including a
>> non-trivial trick that consists in calling itself), for a benefit that
>> is very, very limited. A download of the exact same package, from
>> another download method, happening at the same time. Can occur yes, but
>> is it really worth the additional complexity? I doubt it.

 As discussed at the Buildroot meeting, the change can be made a lot simpler by
just doing the flock from withint the dl-wrapper, around the git call. Then you
don't need that weird re-exec.

>>
>> So at this point, I am not really enthusiastic about 2/5 and 3/5, but
>> perhaps you'll have some convincing arguments ?
> 
> So, the use-case I have is that I get 9 parallel jobs on the same
> machine, with 6 of them retrieving the kernel from a very fast http/1.1
> server, and the three others getting theirs from a rather slow and big
> git repository.

 This particular use case is a bit crazy.

 However, it *does* make sense to do more fine-grain locking of downloads,
because now we serialize all the downloads of a package. Downloads of different
versions of a package really can happen in parallel without problem. Except for
git downloads, because they use the shared git directory, but since it is
git-specific, a git-specific lock should be used.

 Somewhat related to that: because of the locking we currently do (since the
per-package download dir), there is actually no reason any longer to do the
downloads to temporary files and move them to the correct place afterwards. We
can rely on the lock to serialize things, and download immediately to the
correct place.


 So, my proposal would be:

1. Remove the redundant temporary files from the download infra.
2. Replace the flock on the per-package download dir with a flock of a temporary
file named ${filename}.lock. That way, we serialize just what needs to be
serialized.
3. Add a git-specific "global" lock, but do it directly from the dl-wrapper to
keep the code simple.

(in terms of patch order, obviously 2 and 3 have to be swapped).


 With this in mind, I've marked patches 2 and 3 as Changes Requested.

 Regards,
 Arnout

> 
> Downloading the 6 http in parallel takes under 2 minutes, while each git
> download takes about 20 to 30 minutes.
> 
> Scheduling (not) helping, it happens that, when a git one gets scheduled
> first, the 6 http/1.1 ones are stalled, when they could in fact proceed,
> and even finish before the first git download is done. And if scheduling
> is really mad at you, then it will schedule the two other git downloads
> before any of the http/1.1 ones.
> 
> So yes, it helps tremendously: some builds finish earlier and can go to
> CI earlier.
> 
> Note that one may argue that BR2_DL_DIR should be set in the environment,
> so that it points to the non-default location, so that it gets reused
> everytime, thus alleviating the need for a big download. Yes, right, but
> there are use-cases where this is not wanted.
> 
> Regards,
> Yann E. MORIN.
> 
>> Best regards,
>>
>> Thomas
>> -- 
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> 
