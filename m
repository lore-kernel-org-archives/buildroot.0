From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 21:50:46 +0200
Subject: [Buildroot] [git commit master] aumix: convert to the autotools
	infrastructure
Message-ID: <20100413195158.A4D4A20F99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3b838d864076ebcd54565c9f91cd62b2b9729ce2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../aumix-2.8-fix-incorrect-makefile-am.patch      |   29 ++++++++++
 package/multimedia/aumix/aumix.mk                  |   60 +++-----------------
 2 files changed, 38 insertions(+), 51 deletions(-)
 create mode 100644 package/multimedia/aumix/aumix-2.8-fix-incorrect-makefile-am.patch

diff --git a/package/multimedia/aumix/aumix-2.8-fix-incorrect-makefile-am.patch b/package/multimedia/aumix/aumix-2.8-fix-incorrect-makefile-am.patch
new file mode 100644
index 0000000..8d55218
--- /dev/null
+++ b/package/multimedia/aumix/aumix-2.8-fix-incorrect-makefile-am.patch
@@ -0,0 +1,29 @@
+Aumix's src/Makefile.am incorrect adds @includedir@ to the list of
+include paths and @libdir@ to the list of libraries paths. This is
+incorrect, as @includedir@ and @libdir@ are respectively /usr/include
+and /usr/lib, even in cross-compilation mode.
+
+At the same time, use AM_CFLAGS instead of CFLAGS, as is done on the
+similar patch found in OpenEmbedded.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/Makefile.am |    5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+Index: aumix-2.8/src/Makefile.am
+===================================================================
+--- aumix-2.8.orig/src/Makefile.am
++++ aumix-2.8/src/Makefile.am
+@@ -7,9 +7,8 @@
+ 		mouse.c common.h curses.h gpm-xterm.h gtk.h interactive.h  \
+ 		mouse.h play.xpm record.xpm
+ localedir	= $(datadir)/locale
+-INCLUDES	= -I../intl -DLOCALEDIR=\"$(localedir)\" -I at includedir@
+-CFLAGS		= @CFLAGS@ @GLIB_CFLAGS@ @GTK_CFLAGS@
+-LDADD		= -L at libdir@
++INCLUDES	= -I../intl -DLOCALEDIR=\"$(localedir)\"
++AM_CFLAGS	= @CFLAGS@ @GLIB_CFLAGS@ @GTK_CFLAGS@
+ LIBS		= @LIBS@ @GTK_LIBS@ @INTLLIBS@
+ DEFS		= @DEFS@
+ 
diff --git a/package/multimedia/aumix/aumix.mk b/package/multimedia/aumix/aumix.mk
index 64fadc0..e28a720 100644
--- a/package/multimedia/aumix/aumix.mk
+++ b/package/multimedia/aumix/aumix.mk
@@ -7,57 +7,15 @@
 AUMIX_VERSION=2.8
 AUMIX_SOURCE=aumix-$(AUMIX_VERSION).tar.bz2
 AUMIX_SITE=http://jpj.net/~trevor/aumix
-AUMIX_DIR=$(BUILD_DIR)/aumix-$(AUMIX_VERSION)
-AUMIX_CAT:=$(BZCAT)
+AUMIX_AUTORECONF=YES
 
-$(DL_DIR)/$(AUMIX_SOURCE):
-	$(call DOWNLOAD,$(AUMIX_SITE),$(AUMIX_SOURCE))
+AUMIX_CONF_OPT = \
+	--without-gtk \
+	--without-gtk1 \
+	--without-alsa \
+	--without-gpm \
+	--without-sysmouse
 
-$(AUMIX_DIR)/.unpacked: $(DL_DIR)/$(AUMIX_SOURCE)
-	$(AUMIX_CAT) $(DL_DIR)/$(AUMIX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
+AUMIX_DEPENDENCIES = ncurses
 
-$(AUMIX_DIR)/.configured: $(AUMIX_DIR)/.unpacked
-	(cd $(AUMIX_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--libdir=$(STAGING_DIR)/lib \
-		--includedir=$(STAGING_DIR)/usr/include \
-		--without-gtk \
-		--without-gtk1 \
-		--without-alsa \
-		--without-gpm \
-		--without-sysmouse \
-		$(DISABLE_NLS) \
-	)
-	touch $@
-
-$(AUMIX_DIR)/src/aumix: $(AUMIX_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(AUMIX_DIR)
-
-$(TARGET_DIR)/usr/bin/aumix: $(AUMIX_DIR)/src/aumix
-	$(MAKE) -C $(AUMIX_DIR) DESTDIR=$(TARGET_DIR) install
-
-aumix: ncurses $(TARGET_DIR)/usr/bin/aumix
-
-aumix-source: $(DL_DIR)/$(AUMIX_SOURCE)
-
-aumix-clean:
-	-$(MAKE) -C $(AUMIX_DIR) clean
-
-aumix-dirclean:
-	rm -rf $(AUMIX_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_AUMIX),y)
-TARGETS+=aumix
-endif
+$(eval $(call AUTOTARGETS,package/multimedia,aumix))
-- 
1.6.3.3
