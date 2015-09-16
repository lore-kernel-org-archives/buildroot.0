From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Sep 2015 09:32:32 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
	(without devtmpfs)
In-Reply-To: <55F89C46.3010904@lucaceresoli.net> (Luca Ceresoli's message of
 "Wed, 16 Sep 2015 00:31:34 +0200")
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
 <20150915093030.622d2366@free-electrons.com>
 <87zj0oumrg.fsf@dell.be.48ers.dk> <55F89C46.3010904@lucaceresoli.net>
Message-ID: <8737yevmy7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

Hi,

 >> Sure, I get that. I just question the sensibility of combining a 6+ year
 >> old kernel with modern user space.

 > I agree with you on the principle, but in the practice I have devices
 > running very fine on 2.6.30 and some user space applications using
 > C++11.

Ok, and are you actively doing system level development, or "just"
adjusting a single application on a mature product? E.G. are you
interested in getting the latest versions of all the libraries or rather
freeze the entire system except for your application?


 > Yes, I used a fairly recent toolchain (gcc 4.8 IIRC), which is
 > of course a bad idea, I know... But in the practice it works.

Then you presumably already had to backport kernel fixes to build with
4.8? E.G. I've worked on a system stuck on 2.6.37 where I had to
backport this to get it to run with gcc 4.7+:

commit 8428e84d42179c2a00f5f6450866e70d802d1d05
Author: Catalin Marinas <catalin.marinas@arm.com>
Date:   Mon Nov 7 18:05:53 2011 +0100

    ARM: 7150/1: Allow kernel unaligned accesses on ARMv6+ processors
    
    Recent gcc versions generate unaligned accesses by default on ARMv6 and
    later processors. This patch ensures that the SCTLR.A bit is always
    cleared on such processors to avoid kernel traping before
    alignment_init() is called.
    
    Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
    Tested-by: John Linn <John.Linn@xilinx.com>
    Acked-by: Nicolas Pitre <nico@linaro.org>
    Cc: stable at vger.kernel.org
    Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>


 > I had to spend a little time to check some packages that try to use
 > kernel features not available in the running kernel. IIRC I only had
 > issues with dhcpcd which tends to use recently-introduced
 > syscalls. Other packaged run without problems.

I've personally had issues with network-manager (and dhcpcd like you
said) as well.


 >> I agree that it isn't a _LOT_ of complexity, but it isn't non trivial
 >> either.

 > FWIW, it's even less complex in the v2 patchset that's half-brewed here.

True.


>> > I'm not sure how complicated it is to backport devtmpfs. However I
 >> > would suspect that it isn't that easy.
 >> 
 >> Take a look at 2b2af54a5bb6f7e80ccf78f20084b93c398c3a8b in the
 >> kernel. To me it looks quite self contained, so backporting it to
 >> something close to 2.6.32 doesn't look too bad.

 > I think I had a look a couple of years ago when I did the first project
 > on the same SoC. I think I had a look and found it non trival, but the
 > product to create had no hotplugging capabilities and no firmware
 > loading needs, so I just went for a static /dev.

 > Now I have a real goal, so I might try harder to look into backporting
 > devtmpfs.

It seems doable to backport devtmpfs support to 2.6.30.

I just tried cherry-picking 6fcf53acccf85b4 + 2b2af54a5bb6f7e80ccf7 and
I only get a trivial conflict about some header files getting added to
init/main.c

To give it a quick test I tweaked our qemu_x86_defconfig to build 2.6.30
+ the two backports and booted it:

Welcome to Buildroot
buildroot login: root
# uname -a
Linux buildroot 2.6.30-00193-g9a8d49a #3 Wed Sep 16 09:27:23 CEST 2015 i686 GNU/Linux
# grep devtmpfs /proc/mounts 
devtmpfs /dev devtmpfs rw,size=63272k,nr_inodes=15818 0 0

(I did have to fix the kernel a bit to get it to build with sourcery
codebench 2011.09, E.G. gcc 4.6.1 - But that was just s/-m elf_x86/-m32/)

 >> I agree, the patches themselves are very nice work!

 > Thanks both! :)

You're welcome.

-- 
Venlig hilsen,
Peter Korsgaard 
