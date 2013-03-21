From: Will Moore <will.moore@beraninstruments.com>
Date: Thu, 21 Mar 2013 14:14:18 -0000
Subject: [Buildroot] dosfstools build failure
In-Reply-To: <3BFE71B30B4443209F36B91169D3F5ED@beraninstruments.com.local>
References: <3BFE71B30B4443209F36B91169D3F5ED@beraninstruments.com.local>
Message-ID: <D9D85E8464CD4C59B4A615AC68F77046@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Will Moore
> Sent: 21 March 2013 11:09
> 
> Working in buildroot 2013.02, I get the following build failure with
> dosfstools
> selected:

Sorry for the noise, this is already fixed in master - thanks Gustavo!

> 
> make[1]: Entering directory
> `/home/apmdev/buildroot-2013.02/output/build/dosfstools-3.0.12'
> /home/apmdev/buildroot-2013.02/output/host/usr/bin/i486-linux-gcc
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
> -c -o charconv.o src/charconv.c
> /home/apmdev/buildroot-2013.02/output/host/usr/bin/i486-linux-gcc
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
> -c -o dosfslabel.o src/dosfslabel.c
> src/charconv.c:2:19: fatal error: iconv.h: No such file or directory
> compilation terminated.
> /home/apmdev/buildroot-2013.02/output/host/usr/bin/i486-linux-gcc
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os
> -c -o mkdosfs.o src/mkdosfs.c
> 
> I built a buildroot internal toolchain out of tree with the following
> configuration extracted by:
> 
> make savedefconfig O=/home/apmdev/toolchain/buildroot-2013.02
> 
> BR2_x86_i486=y
> BR2_STRIP_none=y
> BR2_PACKAGE_GDB_SERVER=y
> BR2_PACKAGE_GDB_HOST=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> 
> And built dosfstools with the above toolchain included as an external
> toolchain
> with the following configuration extracted by:
> 
> make savedefconfig
> 
> BR2_x86_i486=y
> BR2_STRIP_none=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_PATH="/home/apmdev/toolchain/buildroot-
> 2013.02/host/usr"
> BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
> BR2_TOOLCHAIN_EXTERNAL_WCHAR=y
> # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
> BR2_PACKAGE_DOSFSTOOLS=y
> BR2_PACKAGE_DOSFSTOOLS_MKDOSFS=y
> 
> I can see that the dosfstools.mk has:
> 
> ifneq ($(BR2_ENABLE_LOCALE),y)
> DOSFSTOOLS_DEPENDENCIES += libiconv
> DOSFSTOOLS_LDFLAGS += -liconv
> endif
> 
> I am sure I could fiddle about and fix my build but also quite sure that I
> could
> break it for somebody else in my ignorance ... so suggestions as to how to fix
> this correctly would be appreciated.
> 
> TIA,
> 
> 
> 
> Will
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
