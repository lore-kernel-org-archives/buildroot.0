From: Simon Pasch <fpasch@googlemail.com>
Date: Wed, 29 Aug 2007 10:33:04 +0200
Subject: [Buildroot] mplayer-package doesn't build for other architectures
	than avr32
Message-ID: <f90898420708290133i7ac1f31dkbdd53649945091b3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's the same issues as in libmad-package:
There are architecture-specific patches. (by the way...one should be
removed, as they can't be used both at the same time.
AVR32-Users...tell us which one is the good one!)

I added an extra command to the Makefile, because the build fails on
my x86. Don't know if this breaks the build on other architectures.
So either a sed-command can be used inside the Makefile or an extra
architecture-specific patch (but it's not that simple with $(ARCH),
because then you need patches for i386, i686, etc).

This is my sed-command approach. (you have to manually rename the avr-patches):

--- buildroot/package/mplayer/mplayer.mk.old	2007-08-28 09:15:43.000000000 +0200
+++ buildroot/package/mplayer/mplayer.mk	2007-08-29 10:02:07.000000000 +0200
@@ -22,7 +22,9 @@

 $(MPLAYER_DIR)/.unpacked: $(DL_DIR)/$(MPLAYER_SOURCE)
 	$(MPLAYER_CAT) $(DL_DIR)/$(MPLAYER_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(MPLAYER_DIR) package/mplayer/
mplayer-$(MPLAYER_VERSION)\*.patch\*
+	toolchain/patch-kernel.sh $(MPLAYER_DIR) package/mplayer/
mplayer-$(MPLAYER_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(MPLAYER_DIR) package/mplayer/
mplayer-$(MPLAYER_VERSION)\*.patch.$(ARCH)
+	$(SED) '/^CFLAGS/s/$$/ -fomit-frame-pointer/'
$(MPLAYER_DIR)/libavcodec/Makefile
 	touch $@

 $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
