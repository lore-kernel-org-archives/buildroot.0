From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 15:34:31 +0200
Subject: [Buildroot] [PATCH 00/47] package/kodi: bump version to 15.0
 Isengard
In-Reply-To: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150730153431.1cb277b8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Wed, 22 Jul 2015 22:30:22 +0200, Bernd Kuhls wrote:

> Kodi 15.0 Isengard was released yesterday:
> http://kodi.tv/kodi-15-0-isengard-one-release-to-rule-them-all/

Another thing: it does not build on ARM with uClibc. I get the
following error:

/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.4/libgcc.a(linux-atomic-64bit.o): In function `__check_for_sync8_kernelhelper':
/opt/toolchain-build/build/host-gcc-final-4.7.4/build/arm-buildroot-linux-uclibcgnueabi/libgcc/../../../libgcc/config/arm/linux-atomic-64bit.c:59: undefined reference to `__write'
collect2: error: ld returned 1 exit status
Makefile:486: recipe for target 'kodi.bin' failed

This is with the toolchain configuration at
http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config +
rpi-userland as the OpenGL ES backend.

This error is apparently due to the fact that we're using a 64 bits
atomic operation implemented by libgcc, which requires assistance from
the kernel. libgcc has some code to print a message when the kernel
doesn't provide the necessary syscall, and this code calls __write().
This function seems to not be provided by uClibc (while it is probably
provided by glibc).

I'm Cc'ing Waldemar, maybe he has some ideas.

However, generally speaking I believe supporting Kodi on uClibc is a
bit useless: Kodi is anyway so big that the size benefits of uClibc are
no longer significant. So if this problem pops up in the autobuilders
and isn't fixed by then, I'll mark Kodi as glibc only for the moment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
