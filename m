From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 18 Sep 2015 17:47:29 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <8737yevmy7.fsf@dell.be.48ers.dk>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
 <20150915093030.622d2366@free-electrons.com>
 <87zj0oumrg.fsf@dell.be.48ers.dk> <55F89C46.3010904@lucaceresoli.net>
 <8737yevmy7.fsf@dell.be.48ers.dk>
Message-ID: <55FC3211.3010009@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

Peter Korsgaard wrote:
>>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
>
> Hi,
>
>   >> Sure, I get that. I just question the sensibility of combining a 6+ year
>   >> old kernel with modern user space.
>
>   > I agree with you on the principle, but in the practice I have devices
>   > running very fine on 2.6.30 and some user space applications using
>   > C++11.
>
> Ok, and are you actively doing system level development, or "just"
> adjusting a single application on a mature product? E.G. are you
> interested in getting the latest versions of all the libraries or rather
> freeze the entire system except for your application?

I work both on new products and on mature products. But the latter
receive consistent updates at times, which might add a lot more packages
or change the dependencies.

In both cases I want a recent a fairly recent set of packages.

A few months ago I had to bump a library to a version that was not yet
stable at that time, and thus not yet in Buildroot, because it
implemented a method that we needed in an application.

>   > Yes, I used a fairly recent toolchain (gcc 4.8 IIRC), which is
>   > of course a bad idea, I know... But in the practice it works.
>
> Then you presumably already had to backport kernel fixes to build with
> 4.8? E.G. I've worked on a system stuck on 2.6.37 where I had to
> backport this to get it to run with gcc 4.7+:

Nope. Maybe because I'm currently working mostly on ARM9 machines, and
ARM9 is definitely "mature".

However I had to forced an "old" Sourcery toolchain (2013.05) for an
ARM9 project because I was getting mysterious runtime errors with
2014.05, the latest available in BR at that time.

>>>> I'm not sure how complicated it is to backport devtmpfs. However I
>   >> > would suspect that it isn't that easy.
>   >>
>   >> Take a look at 2b2af54a5bb6f7e80ccf78f20084b93c398c3a8b in the
>   >> kernel. To me it looks quite self contained, so backporting it to
>   >> something close to 2.6.32 doesn't look too bad.
>
>   > I think I had a look a couple of years ago when I did the first project
>   > on the same SoC. I think I had a look and found it non trival, but the
>   > product to create had no hotplugging capabilities and no firmware
>   > loading needs, so I just went for a static /dev.
>
>   > Now I have a real goal, so I might try harder to look into backporting
>   > devtmpfs.
>
> It seems doable to backport devtmpfs support to 2.6.30.
>
> I just tried cherry-picking 6fcf53acccf85b4 + 2b2af54a5bb6f7e80ccf7 and
> I only get a trivial conflict about some header files getting added to
> init/main.c
>
> To give it a quick test I tweaked our qemu_x86_defconfig to build 2.6.30
> + the two backports and booted it:
>
> Welcome to Buildroot
> buildroot login: root
> # uname -a
> Linux buildroot 2.6.30-00193-g9a8d49a #3 Wed Sep 16 09:27:23 CEST 2015 i686 GNU/Linux
> # grep devtmpfs /proc/mounts
> devtmpfs /dev devtmpfs rw,size=63272k,nr_inodes=15818 0 0
>
> (I did have to fix the kernel a bit to get it to build with sourcery
> codebench 2011.09, E.G. gcc 4.6.1 - But that was just s/-m elf_x86/-m32/)

Interesting. I'll have a look... sometime.

-- 
Luca
