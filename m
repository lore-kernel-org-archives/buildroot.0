From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 16 Aug 2018 00:13:59 -0300
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
References: <20180813161955.GE7915@scaer>
Message-ID: <5b74ebf74a4c2_34db3fa85c5f35681332@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Aug 13, 2018 at 01:19 PM, Yann E. MORIN wrote:
> On 2018-08-13 11:33 -0300, Ricardo Martincoski spake thusly:
>> On Sun, Aug 12, 2018 at 05:41 PM, Thomas Petazzoni wrote:
>> > On Sun, 12 Aug 2018 22:25:43 +0200, Yann E. MORIN wrote:
>> >> > Commit 'refs/pull/1014/head' is a branch name.
>> >> > Using a branch name is not supported.  
> [--SNIP--]
>> >> Sure, you'd argue that an automated build job could do the build. But
>> >> you anyway have to write some scripting for that automated job anyway.
>> >> Just have it prepare a git clone of the affected package, checkout the
>> >> correct commit, and prepare a local.mk with the correct override-srcdir
>> >> befor attempting the buildroot build.
>> It seems a lot of scripting for something that git supports natively and that
> 
> Not true: they are not even fetched by default at all. If they were,
> then we would not be having this discussion. As it stands, we currently
> have to resort to unstable trickery to use those.

OK. The porcelain commands do support them but they are not fetched using the
default options.

> 
>> could be added to the backend to support the right way: using sha1 for
>> reproducibility.
> 
> I also thought about it and tried to replace the special ref by its
> expanded sha1 and name the local archive by the sha1.

No. Sorry. I meant the other way around:
To always use (for special refs) a sha1 as version of the package and get the
download infra to fetch it using the name expanded from the sha1 (by git
ls-remote), as it is reproducible.
It also works for branches tips and tags and provides some performance
improvement, nothing so dramatic as --depth 1 but without all the corner cases
that come with shallow clones, because it is not shallow, we just download more
like... on-demand.

[snip]
>> What I think we should do is:
>>  - to re-add support to download of the sha1 of any ref (branch, tag, special
>>    ref).
> 
> That is not supposed to be broken, and should work again if we check if
> the remote has the ref as we both suggested in previous replies in this
> thread (but you and I with different solutions).

Sorry. I failed to express what I wanted to. Let me try again:
  - to re-add support to download of the sha1 of *any* ref (sha1 of branch tip
    and sha1 of tag currently do work, sha1 of special ref worked in the past
    but don't work anymore).

> 
>>  - add automated tests to avoid going back and forth, supporting some refs,
>>    then dropping support for them and then supporting them.
> 
> Yes, your series doing that is still pending... TBH, it is still marked
> as unread here, because I still want to have a look at it...

Great! Please do review when you find some time.
They use br2-external, hash-check and git repos.

> 
>>  - drop the support to the name of a special ref as it is not guaranteed to be
>>    reproducible.
> 
> This should be done before we add tests, I think.

*should*: no. We can always adapt the tests when the behavior needs to change.
If we had already the test case for the name of a special ref as package
version, we would keep it, and just change it (in the same commit removing the
code from the backend) to ensure the download using the name of a special ref
always fails instead of always succeeding.

But yes. It *can* be done before.


Regards,
Ricardo
