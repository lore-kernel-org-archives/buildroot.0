From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 17:51:00 +0200
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <55820390.2070708@mind.be>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150303142901.5998a72c@free-electrons.com> <54F8DD53.3060000@mind.be>
 <CAHkwnC9wQZj6YxexYEt2fuZaeK_GD-S_BTg45wTcr9ZiLyKeKg@mail.gmail.com>
 <55820390.2070708@mind.be>
Message-ID: <CAHkwnC-nw6rSFLHOx5-A-k-zQS78zxzL9NLFRmhKK5k92RuYvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 18, 2015 at 1:32 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/14/15 17:15, Fabio Porcedda wrote:
>> On Thu, Mar 5, 2015 at 11:48 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> [snip]
>>>  However, I don't like at all the approach of passing the custom -I and -L
>>> flags. I think it's much better to start with something that was suggested
>>> before in the BR developer meeting: use the toolchain wrapper also for the
>>> internal toolchain. Then we can pass the per-package staging dir through the
>>> environment, and use it in the --sysroot argument of the compiler.
>>>
>>>  We'll also have to do something about ccache then - that could be a problem.
>>> Perhaps ccache should be called from within the wrapper as well, that may solve
>>> a bunch of other ccache problems.
>>
>> Using an internal wrapper we can also pass pass the -I and -L
>> automatically like the --sysroot option?
>
>  Yes we can. Of course, the path to the package sysroot has to be passed through
> the environment.
>
>>
>> If we use a per-package sysroot we need to copy the sysroot directory
>> too, because the size of a uclibc sysroot is at least 11MB (if i
>> remember correctly the size of a glibc sysroot is something like
>> 40MB), so if we copy without using hard links, it will take at least
>> 10MB up to 40MB for every package.
>>
>> The size of the output directory of a defconfig + allyespackageconfig is 11GB.
>> IMHO we have the following choices:
>> a) common sysroot & per-package staging & without hard links
>>   - the -I -L options are passed trough the toolchain wrapper
>>   - output size is 16GB (11GB+5GB)
>
>  Where does the 5GB come from? Experimental evidence from running this series?

If i remember correctly this was calculated from experimental evidence.

>>   - no side effects to fear, because hard links are not used
>> b) per-package sysroot & without hard links
>>   - sysroot are passed trough the toolchain wrapper
>>   - output size will be 16GB plus 11MB * 694 = 16GB + 7GB = 23 GB
>>   - no side effects to fear, because hard links are not used
>> c) per-package sysroot & with hard links for toolchain
>>  - sysroot are passed trough the toolchain wrapper
>>   - output size will be 16GB
>>   - side effects to fear for the toolchain files because hard links
>> are used for them
>> d) per-package sysroot & with hard links for all files
>>  - sysroot are passed trough the toolchain wrapper
>>   - output size will be 11GB, so no increased size
>>   - side effects to fear because hard links are used
>
>  Actually I'm not really concerned about the size, even if it's more than
> doubled by this feature. We use factors less space than yocto so we can afford
> to double it :-)
>
>  I'm more concerned about the time penalty of copying things around all the
> time. So in that respect, option a) or d) are more attractive. But even creating
> all the hardlinks takes a lot of time (probably not that much faster than copying).

I've made some tests about this, i will send those numbers with the
updated patch set.

>  A completely wild alternative is to build and use unionfs-fuse, but that
> requires fusermount to be properly installed on the host. Can we assume that?

Good question, maybe requiring fusermount is fine, but  I don't know
unionfs-fuse so i don't how much it is a viable solution.

>>
>> The cheaper one with almost no size and speed penalization is d) but
>> if some file is overwritten other package sysroot could be affected.
>> Maybe we can prevent the overwriting by removing the write permission
>> on staging files?
>
>  Yep, that's an option. It can actually be done while rsyncing.

Right, I've used rsync for creating hard links in my updated patch set.

BR
-- 
Fabio Porcedda
