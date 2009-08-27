From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 27 Aug 2009 09:49:57 +0200
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901C554E3@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA86D@mi8nycmail19.Mi8.com>
	<20090823081702.445b1b5a@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901C550E7@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C55101@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C551E6@mi8nycmail19.Mi8.com>
	<BD79186B4FD85F4B8E60E381CAEE190901C552DE@mi8nycmail19.Mi8.com>
	<20090825190153.GA29206@mx.loc>
	<BD79186B4FD85F4B8E60E381CAEE190901C55435@mi8nycmail19.Mi8.com>
	<87fxbemhjh.fsf@macbook.be.48ers.dk>
	<BD79186B4FD85F4B8E60E381CAEE190901C554E3@mi8nycmail19.Mi8.com>
Message-ID: <20090827074957.GB19075@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 26, 2009 at 05:50:55PM -0400, H Hartley Sweeten wrote:
>diff a/toolchain/external-toolchain/ext-tool.mk b/toolchain/external-toolchain/ext-tool.mk
>--- a/toolchain/external-toolchain/ext-tool.mk
>+++ b/toolchain/external-toolchain/ext-tool.mk
>@@ -205,12 +205,26 @@
> EXTERNAL_LIBS+=libstdc++.so
> endif
> 
>-SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)
>+# We need to pass the -march= option in order to get the correct
>+# multilib sysroot with CROSS-gcc -print-sysroot.
>+ifneq ($(CC_TARGET_ARCH_),)
>+SYSROOT_CFLAGS=-march=$(CC_TARGET_ARCH_)
>+endif

Not that i'd care, but you should always check against (and of course
use) the full set of flags anyway.

>Every time I press Enter after that I get:
>
>sh (441): undefined instruction: pc=0007514c
>Code: e1530001 9a00006f e1110002 0a000071 (e16f2f13)
>
>Please press Enter to activate this console.
>
>I'm not sure how to figure out what the undefined instruction was but my
>guess is it's an ARMv5T instruction.  It seems like something in the busybox
>build did not honor the TARGET_CFLAGS that were setup for my build.
>
>TARGET_CFLAGS= -Os -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 --sysroot /home/bigguiness/buildroot/build_arm/staging_dir/
>
>Does anyone have any ideas on this?

see above. Sounds most likely like an incorrectly used toolchain. I'd
usually say that you should go bug the people who provide that
toolchain (or use the internal toolchain ;), but i'm pretty sure that
in this particular case you just use it incorrectly.
