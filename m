From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 08 Mar 2017 21:38:26 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-03-07
References: <20170308072845.2624A2076F@mail.free-electrons.com>
Message-ID: <2n66pdxrq3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 08 Mar 2017 08:28:45 +0100 schrieb Thomas Petazzoni:

>         i586 |     xserver_xorg-server-1.19.2 | NOK |
>         http://autobuild.buildroot.net/
results/5890c4b6397326faadecc49fdbe21875fbb20c65

Hi,

the build error

/home/peko/autobuild/instance-2/output/host/usr/i586-buildroot-linux-musl/
sysroot/usr/lib/libunwind.so: undefined reference to `setcontext'
/home/peko/autobuild/instance-2/output/host/usr/i586-buildroot-linux-musl/
sysroot/usr/lib/libunwind.so: undefined reference to `sigreturn'

comes from libunwind, which, according to package/libunwind/Config.in, is 
supported on musl at x86 contrary to
http://www.openwall.com/lists/musl/2012/12/31/11
http://wiki.musl-libc.org/wiki/Open_Issues#ucontext.h

I do not claim that I understand what libunwind is all about, therefore I 
will not send patches for libunwind, but it looks to me that the fix for 
the xserver_xorg-server build error should be made in 
BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS.

Patching package/x11r7/xserver_xorg-server/xserver_xorg-server.mk

-ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL)$(BR2_PACKAGE_LIBUNWIND),ny)

also worked, but it is only a workaround.

Btw, libunwind-1.2 was released Jan 13, 2017, a version bump did not fix 
the xserver_xorg-server build error.

Regards, Bernd
