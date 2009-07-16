From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 Jul 2009 15:07:20 +0200
Subject: [Buildroot] [git commit] libvorbis: fix tremor install into
	staging_dir
Message-ID: <20090716194800.7C2367766A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd26b5821c61dde5b1a4008497db2cf3d5394f29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #387.

When tremor is selected, the normal libvorbis shouldn't get built and
tremer should get installed into staging_dir as well.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                   |    1 +
 package/multimedia/libvorbis/libvorbis.mk |   14 +++++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7278bdf..18beb14 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,6 +12,7 @@
 	#379: update DirectFB to version 1.4.0
 	#383: gst-plugins-good: Allow soup plugin to be configured
 	#385: neon: Fix pkgconfig dependency
+	#387: Tremor not installed to toolchain
 	#391: gstreamer: Bump version to 0.10.23
 	#393: gst-plugins-base: Bump version to 0.10.23
 	#395: gst-plugins-bad: New package
diff --git a/package/multimedia/libvorbis/libvorbis.mk b/package/multimedia/libvorbis/libvorbis.mk
index e7399e0..6f90408 100644
--- a/package/multimedia/libvorbis/libvorbis.mk
+++ b/package/multimedia/libvorbis/libvorbis.mk
@@ -4,6 +4,8 @@
 #
 #############################################################
 
+ifneq ($(BR2_PACKAGE_LIBVORBIS_TREMOR),y)
+
 LIBVORBIS_VERSION = 1.2.3
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
@@ -17,6 +19,7 @@ LIBVORBIS_DEPENDENCIES = uclibc host-pkgconfig libogg
 
 $(eval $(call AUTOTARGETS,package/multimedia,libvorbis))
 
+else
 
 ############################################################
 #
@@ -67,7 +70,11 @@ $(TREMOR_DIR)/.libs: $(TREMOR_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(TREMOR_DIR)
 	touch $@
 
-$(TARGET_DIR)/usr/lib/tremor.so: $(TREMOR_DIR)/.libs
+$(STAGING_DIR)/usr/lib/tremor.so: $(TREMOR_DIR)/.libs
+	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(TREMOR_DIR) install
+	touch $@
+
+$(TARGET_DIR)/usr/lib/tremor.so: $(STAGING_DIR)/usr/lib/tremor.so
 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(TREMOR_DIR) \
 		$(if $(BR2_STRIP_none),install,install-strip)
 	touch $@
@@ -93,9 +100,6 @@ tremor-dirclean:
 # Toplevel Makefile options
 #
 ############################################################
-ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
-ifeq ($(BR2_PACKAGE_LIBVORBIS_TREMOR),y)
 TARGETS+=tremor
-endif
-TARGETS+=libvorbis
+
 endif
-- 
1.6.3.3
