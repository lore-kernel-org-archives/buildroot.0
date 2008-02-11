From: Andrew Dyer <amdyer@gmail.com>
Date: Mon, 11 Feb 2008 11:27:11 -0600
Subject: [Buildroot] alsa for arm compile options & svn 20557
Message-ID: <c166aa9f0802110927n1fcade83w87c3bae4017b509a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I believe a change introduced in SVN 20557 is incorrect for some arm
kernel builds with alsa.  Here is the 20557 change:

--- trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007/10/01 16:15:31	20163
+++ trunk/buildroot/package/alsa-lib/alsa-lib.mk	2007/11/28 07:09:57	20557
@@ -24,7 +24,7 @@
 	(cd $(ALSA_LIB_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS) -mabi=aapcs-linux" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \

The root problem is that the kernel and the alsa libraries must be
compiled such that certain structure sizes work out the same, else the
ioctls used by alsa in communicating between userland and kernel will
fail.  The bug manifests itself on the target like so:

# alsamixer
alsamixer: function snd_mixer_load failed: Inappropriate ioctl for device

The problem with the 20557 change is that depending on the kernel
config used the -mabi switch can be different.  The kernel option that
controls this is CONFIG_AEABI - both settings for this seem to be used
for varying platforms defconfigs.  My platform happens to use the
wrong one :-(

Looking in linux-2.6/arch/arm/Makefile, the value of the -mabi option
can be either -maapcs-linux or -mapcs-gnu.  I am not enough of a arm
gcc guru to know if any of the other command line switches will affect
the generated structure size.

confirmed experimentally on my target by redefining aapcs-linux to
apcs-gnu, recompiling, and alsamixer does not error out any more.

-- 
Hardware, n.:
        The parts of a computer system that can be kicked.
