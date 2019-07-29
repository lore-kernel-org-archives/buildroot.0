From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jul 2019 09:13:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix redefinition of
 'struct termios'
In-Reply-To: <20190723085516.17377-1-vadim4j@gmail.com>
References: <20190723085516.17377-1-vadim4j@gmail.com>
Message-ID: <20190729091339.4aa71512@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Waldemar in Cc.

On Tue, 23 Jul 2019 11:55:16 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> Both libc and linux defines 'struct termios', in termbits.h and
> termios.h which leads to the compilation error:
> 
> In file included from custom_baud.c:23:0:
> 
> 	    /home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/asm-generic/termbits.h:12:8:
> 	error: redefinition of 'struct termios'
> 	 struct termios {
> 		^~~~~~~
> 	In file included from
> 	/home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/termios.h:39:0,
> 			 from
> 	/home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/bits/ioctl-types.h:5,
> 			 from
> 	/home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/sys/ioctl.h:29,
> 			 from custom_baud.c:21:
> 	/home/buildroot/autobuild/instance-3/output/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/bits/termios.h:33:8:
> 	note: originally defined here
> 	 struct termios {
> 		^~~~~~~
> 
> So fix it by renaming 'termios' to 'asmtermios' before termbits.h only,
> because 'struct termios2' is used only.

This issue only happens on PowerPC/uClibc, and on no other
architecture. Do we have any idea why ? Couldn't this issue instead be
a problem in uClibc headers ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
