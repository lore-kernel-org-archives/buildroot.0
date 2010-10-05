From: Martin Banky <martin.banky@gmail.com>
Date: Tue, 5 Oct 2010 09:15:06 +0200
Subject: [Buildroot] [git commit master 1/1] imagemagick: convert to
	autotargets and bump to 6.6.4
Message-ID: <20101005071708.3EEB68B854@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=85c45df2fa58a24ab220fd454867fa16311435e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

program-transform-name='s,,,' is needed, otherwise configure defines it
as $(platform)-$(cpu)-. During install, all executables are prepended
with this variable.

[Peter: disable libtool patch, remove unneeded/wrong staging install cmd]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   28 ++--
 ....3.4-add-errno-h-if-argz-h-does-not-exist.patch |   11 --
 ....6.4-add-errno-h-if-argz-h-does-not-exist.patch |   11 ++
 package/imagemagick/imagemagick.mk                 |  147 ++------------------
 4 files changed, 37 insertions(+), 160 deletions(-)
 delete mode 100644 package/imagemagick/imagemagick-6.3.4-add-errno-h-if-argz-h-does-not-exist.patch
 create mode 100644 package/imagemagick/imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch

diff --git a/CHANGES b/CHANGES
index 96b6397..c3f8a9e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,20 +29,20 @@
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
 	fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk, gperf,
 	gtk2-themes, gtkperf, gvfs, haserl, hdparm, hostapd, hwdata,
-	ifplugd, iperf, iproute2, iptables, iw, jpeg, kexec, kismet,
-	less, libcgi, libcurl, libdaemon, libdnet, liberation,
-	libevent, libeXosip2, libglade, libgtk2, libiconv, libidn,
-	libmms, libnl, liboil, libosip2, libpcap, libpng, libtool,
-	libungif, libxml2, libxslt, lighttpd, lite, lm-sensors,
-	lockfile-progs, logrotate, m4, mdadm, mesa3d, metacity,
-	mtd-utils, mysql_client, nano, nbd, ncftp, neon, netperf,
-	netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd, openssh,
-	openvpn, oprofile, pango, patch, pcre, php, pkg-config,
-	prboom, radvd, rdesktop, ruby, qt, quagga, samba, sawman,
-	sdl_mixer, sdl_sound, setserial, shared-mime-info, speex,
-	sqlite, squashfs, strace, sylpheed, taglib, tcpdump, thttpd,
-	tiff, tn5250, udev, udpcast, usbmount, usbutils, vsftpd, vtun,
-	which, wpa_supplicant,
+	ifplugd, imagemagick, iperf, iproute2, iptables, iw, jpeg,
+	kexec, kismet, less, libcgi, libcurl, libdaemon, libdnet,
+	liberation, libevent, libeXosip2, libglade, libgtk2, libiconv,
+	libidn, libmms, libnl, liboil, libosip2, libpcap, libpng,
+	libtool, libungif, libxml2, libxslt, lighttpd, lite,
+	lm-sensors, lockfile-progs, logrotate, m4, mdadm, mesa3d,
+	metacity, mtd-utils, mysql_client, nano, nbd, ncftp, neon,
+	netperf, netsnmp, ng-spice-rework, ntfsprogs, ntp, openntpd,
+	openssh, openvpn, oprofile, pango, patch, pcre, php,
+	pkg-config, prboom, radvd, rdesktop, ruby, qt, quagga, samba,
+	sawman, sdl_mixer, sdl_sound, setserial, shared-mime-info,
+	speex, sqlite, squashfs, strace, sylpheed, taglib, tcpdump,
+	thttpd, tiff, tn5250, udev, udpcast, usbmount, usbutils,
+	vsftpd, vtun, which, wpa_supplicant,
 	xdriver_xf86-input-{acecad,aiptek,evdev,joystick,keyboard},
 	xdriver-xf86-input-{mouse,synaptics,vmmouse,void},
 	xdriver-xf86-video-{apm,ark,ast,ati,chips,cirrus,dummy,fbdev},
diff --git a/package/imagemagick/imagemagick-6.3.4-add-errno-h-if-argz-h-does-not-exist.patch b/package/imagemagick/imagemagick-6.3.4-add-errno-h-if-argz-h-does-not-exist.patch
deleted file mode 100644
index a11fdd2..0000000
--- a/package/imagemagick/imagemagick-6.3.4-add-errno-h-if-argz-h-does-not-exist.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- ImageMagick-6.3.4.old/configure	2007-05-12 05:49:25.000000000 +0200
-+++ ImageMagick-6.3.4.new/configure	2007-05-21 16:53:32.000000000 +0200
-@@ -9484,6 +9484,8 @@ cat >>conftest.$ac_ext <<_ACEOF
- /* end confdefs.h.  */
- #if HAVE_ARGZ_H
- #  include <argz.h>
-+#else
-+#  include <errno.h>
- #endif
- 
- typedef error_t ac__type_new_;
diff --git a/package/imagemagick/imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch b/package/imagemagick/imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch
new file mode 100644
index 0000000..66a6747
--- /dev/null
+++ b/package/imagemagick/imagemagick-6.6.4-add-errno-h-if-argz-h-does-not-exist.patch
@@ -0,0 +1,11 @@
+--- a/configure	2010-09-26 17:05:45.000000000 -0700
++++ b/configure	2010-09-30 23:47:09.000000000 -0700
+@@ -20354,6 +20354,8 @@ done
+ 
+ ac_fn_c_check_type "$LINENO" "error_t" "ac_cv_type_error_t" "#if defined(HAVE_ARGZ_H)
+ #  include <argz.h>
++#else
++#  include <errno.h>
+ #endif
+ "
+ if test "x$ac_cv_type_error_t" = xyes; then :
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 9eb9d69..f80fe6f 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -3,50 +3,22 @@
 # imagemagick
 #
 #############################################################
-IMAGEMAGICK_MAJOR:=6.4.8
-IMAGEMAGICK_VERSION:=$(IMAGEMAGICK_MAJOR)-4
-IMAGEMAGICK_SOURCE:=ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
-IMAGEMAGICK_SITE:=ftp://ftp.imagemagick.org/pub/ImageMagick
-IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VERSION)
-IMAGEMAGICK_CAT:=$(BZCAT)
-IMAGEMAGICK_LIB:=$(TARGET_DIR)/usr/lib/libMagickCore.so
+IMAGEMAGICK_MAJOR = 6.6.4
+IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-8
+IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
+IMAGEMAGICK_SITE = ftp://ftp.imagemagick.org/pub/ImageMagick
+IMAGEMAGICK_LIBTOOL_PATCH = NO
+IMAGEMAGICK_INSTALL_STAGING = YES
 
-IMAGEMAGICK_TARGET_BINARIES:=$(TARGET_DIR)/usr/bin/animate
-IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/compare
-IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/composite
-IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/conjure
-IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/display
-IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/import
-IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/mogrify
-IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/montage
-IMAGEMAGICK_TARGET_BINARIES+=$(TARGET_DIR)/usr/bin/convert
-
-IMAGEMAGICK_COPY:=cp -df --preserve=mode,ownership
-$(DL_DIR)/$(IMAGEMAGICK_SOURCE):
-	$(call DOWNLOAD,$(IMAGEMAGICK_SITE),$(IMAGEMAGICK_SOURCE))
-
-$(IMAGEMAGICK_DIR)/.unpacked: $(DL_DIR)/$(IMAGEMAGICK_SOURCE)
-	$(IMAGEMAGICK_CAT) $(DL_DIR)/$(IMAGEMAGICK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(IMAGEMAGICK_DIR) package/imagemagick/ imagemagick-$(IMAGEMAGICK_VERSION)\*.patch\*
-	$(CONFIG_UPDATE) $(IMAGEMAGICK_DIR)/config
-	touch $@
+IMAGEMAGICK_DEPENDENCIES = jpeg tiff
 
 ifeq ($(BR2_LARGEFILE),y)
-IMAGEMAGICK_CONF_OPTS = ac_cv_sys_file_offset_bits=64
+IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=64
 else
-IMAGEMAGICK_CONF_OPTS = ac_cv_sys_file_offset_bits=32
+IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=32
 endif
 
-$(IMAGEMAGICK_DIR)/.configured: $(IMAGEMAGICK_DIR)/.unpacked
-	(cd $(IMAGEMAGICK_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
+IMAGEMAGICK_CONF_OPT = --program-transform-name='s,,,' \
 		--without-perl \
 		--without-wmf \
 		--without-xml \
@@ -60,101 +32,6 @@ $(IMAGEMAGICK_DIR)/.configured: $(IMAGEMAGICK_DIR)/.unpacked
 		--without-gslib \
 		--without-fpx \
 		--without-freetype \
-		--without-x \
-		$(IMAGEMAGICK_CONF_OPTS) \
-	)
-	touch $@
-
-$(IMAGEMAGICK_DIR)/.compiled: $(IMAGEMAGICK_DIR)/.configured
-	$(MAKE) -C $(IMAGEMAGICK_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libMagickCore.a: $(IMAGEMAGICK_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(IMAGEMAGICK_DIR) install
-	touch -c $@
-
-$(IMAGEMAGICK_LIB): $(STAGING_DIR)/usr/lib/libMagickCore.a
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/lib/libMagickWand.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libMagickWand.so*
-	mkdir -p $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)
-	$(IMAGEMAGICK_COPY) -r $(STAGING_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR) $(TARGET_DIR)/usr/lib
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/lib/libMagickCore.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(IMAGEMAGICK_LIB)*
-	touch -c $@
-
-$(IMAGEMAGICK_DIR)/.libinstall: $(IMAGEMAGICK_LIB)
-	$(IMAGEMAGICK_DIR)/libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)/modules-Q16/coders
-	$(IMAGEMAGICK_DIR)/libtool --finish $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)/modules-Q16/filters
-	touch $@
-
-$(TARGET_DIR)/usr/bin/animate: $(IMAGEMAGICK_LIB)
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-animate $(TARGET_DIR)/usr/bin/animate
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/animate
-	touch $@
-
-$(TARGET_DIR)/usr/bin/compare: $(IMAGEMAGICK_LIB)
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-compare $(TARGET_DIR)/usr/bin/compare
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/compare
-	touch $@
-
-$(TARGET_DIR)/usr/bin/composite: $(IMAGEMAGICK_LIB)
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-composite $(TARGET_DIR)/usr/bin/composite
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/composite
-	touch $@
-
-$(TARGET_DIR)/usr/bin/conjure: $(IMAGEMAGICK_LIB)
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-conjure $(TARGET_DIR)/usr/bin/conjure
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/conjure
-	touch $@
-
-$(TARGET_DIR)/usr/bin/display: $(IMAGEMAGICK_LIB)
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-display $(TARGET_DIR)/usr/bin/display
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/display
-	touch $@
-
-$(TARGET_DIR)/usr/bin/import: $(IMAGEMAGICK_LIB)
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-import $(TARGET_DIR)/usr/bin/import
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/import
-	touch $@
+		--without-x
 
-$(TARGET_DIR)/usr/bin/mogrify: $(IMAGEMAGICK_LIB)
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-mogrify $(TARGET_DIR)/usr/bin/mogrify
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/mogrify
-	touch $@
-
-$(TARGET_DIR)/usr/bin/montage: $(IMAGEMAGICK_LIB)
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-montage $(TARGET_DIR)/usr/bin/montage
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/montage
-	touch $@
-
-$(TARGET_DIR)/usr/bin/convert: $(IMAGEMAGICK_LIB)
-	$(IMAGEMAGICK_COPY) $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-convert $(TARGET_DIR)/usr/bin/convert
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/convert
-	touch $@
-
-imagemagick: jpeg tiff $(IMAGEMAGICK_LIB) \
-		$(IMAGEMAGICK_DIR)/.libinstall \
-		$(IMAGEMAGICK_TARGET_BINARIES)
-
-imagemagick-source: $(DL_DIR)/$(IMAGEMAGICK_SOURCE)
-
-imagemagick-unpacked:$(IMAGEMAGICK_DIR)/.unpacked
-
-imagemagick-clean:
-	for target_binary in $(IMAGEMAGICK_TARGET_BINARIES); do \
-		rm -f $$target_binary; \
-	done
-	rm -rf $(TARGET_DIR)/usr/lib/libMagick*
-	rm -rf $(TARGET_DIR)/usr/lib/ImageMagick-$(IMAGEMAGICK_MAJOR)
-	-$(MAKE) -C $(IMAGEMAGICK_DIR) clean
-
-imagemagick-dirclean:
-	rm -rf $(IMAGEMAGICK_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
-TARGETS+=imagemagick
-endif
+$(eval $(call AUTOTARGETS,package,imagemagick))
-- 
1.7.1
