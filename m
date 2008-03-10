From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Mon, 10 Mar 2008 12:27:44 +0530
Subject: [Buildroot] Add SDL_mixer to buildroot/package
References: <15514999.post@talk.nabble.com>
	<87hcfiacn1.fsf@macbook.be.48ers.dk>
Message-ID: <5BF78BCE8D9BF14A83F836BD9E3916BA053FF9@blrms.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

Thanks for adding the sdl_mixer. 

I would like to submit sdl_image & sdl_net package for the buildroot.

below is the patch to add sdl_image.

sdl_net patch will follow.

Thanks in advance

Regards
Gururaja



buildroot: SDL_image package

Added:
   trunk/buildroot/package/sdl_image/
   trunk/buildroot/package/sdl_image/Config.in
   trunk/buildroot/package/sdl_image/sdl_image.mk

Modified:
   trunk/buildroot/package/Config.in

diff -purN buildroot/package/Config.in
buildroot_patched/package/Config.in
--- buildroot/package/Config.in	2008-03-04 03:15:13.000000000 -0500
+++ buildroot_patched/package/Config.in	2008-03-04 17:01:35.000000000
-0500
@@ -316,6 +312,10 @@ source "package/jpeg/Config.in"
+ source "package/libpng/Config.in"
+ source "package/libungif/Config.in"
+ source "package/sdl/Config.in"
++source "package/sdl_image/Config.in"
+ source "package/sdl_ttf/Config.in"
+ source "package/tiff/Config.in"
+
diff -purN buildroot/package/sdl_image/Config.in
buildroot_patched/package/sdl_image/Config.in
--- buildroot/package/sdl_image/Config.in	1969-12-31
19:00:00.000000000 -0500
+++ buildroot_patched/package/sdl_image/Config.in	2008-02-22
21:17:28.000000000 -0500
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SDL_IMAGE
+	bool "SDL_image"
+	default n
+	depends on BR2_PACKAGE_SDL
+	help
+	  SDL_image is an image file loading library. 
+	  It loads images as SDL surfaces, and supports the following 
+	  formats: BMP, GIF, JPEG, LBM, PCX, PNG, PNM, TGA, TIFF, XCF,
XPM, XV.
+
+	  http://www.libsdl.org/projects/SDL_image/
diff -purN buildroot/package/sdl_image/sdl_image.mk
buildroot_patched/package/sdl_image/sdl_image.mk
--- buildroot/package/sdl_image/sdl_image.mk	1969-12-31
19:00:00.000000000 -0500
+++ buildroot_patched/package/sdl_image/sdl_image.mk	2008-03-04
15:04:24.000000000 -0500
@@ -0,0 +1,86 @@
+#############################################################
+#
+# SDL_image
+#
+#############################################################
+SDL_IMAGE_VERSION:=1.2.6
+SDL_IMAGE_SOURCE:=SDL_image-$(SDL_IMAGE_VERSION).tar.gz
+SDL_IMAGE_SITE:=http://www.libsdl.org/projects/SDL_image/release
+SDL_IMAGE_CAT:=$(ZCAT)
+SDL_IMAGE_DIR:=$(BUILD_DIR)/SDL_image-$(SDL_IMAGE_VERSION)
+
+$(DL_DIR)/$(SDL_IMAGE_SOURCE):
+	$(WGET) -P $(DL_DIR) $(SDL_IMAGE_SITE)/$(SDL_IMAGE_SOURCE)
+
+sdl_image-source: $(DL_DIR)/$(SDL_IMAGE_SOURCE)
+
+$(SDL_IMAGE_DIR)/.unpacked: $(DL_DIR)/$(SDL_IMAGE_SOURCE)
+	$(SDL_IMAGE_CAT) $(DL_DIR)/$(SDL_IMAGE_SOURCE) | tar -C
$(BUILD_DIR) $(TAR_OPTIONS) -
+	$(CONFIG_UPDATE) $(SDL_IMAGE_DIR)
+	touch $@
+
+$(SDL_IMAGE_DIR)/.configured: $(SDL_IMAGE_DIR)/.unpacked
$(STAGING_DIR)/usr/lib/libSDL.so
+	(cd $(SDL_IMAGE_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+		--localstatedir=/var \
+		--without-x \
+		--with-freetype-prefix=$(STAGING_DIR)/usr \
+		--with-sdl-prefix=$(STAGING_DIR)/usr \
+		)
+	touch $@
+
+$(SDL_IMAGE_DIR)/.compiled: $(SDL_IMAGE_DIR)/.configured
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(SDL_IMAGE_DIR)
+	touch $@
+
+$(STAGING_DIR)/usr/lib/libSDL_image.so: $(SDL_IMAGE_DIR)/.compiled
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_IMAGE_DIR) install
+	touch -c $@
+
+$(TARGET_DIR)/usr/lib/libSDL_image.so:
$(STAGING_DIR)/usr/lib/libSDL_image.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libSDL_image*.so*
$(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED)
$(TARGET_DIR)/usr/lib/libSDL_image.so
+
+sdl_image: uclibc $(TARGET_DIR)/usr/lib/libSDL_image.so
+
+sdl_image-clean:
+	rm -f $(TARGET_DIR)/usr/lib/libSDL_image*.so* 
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(SDL_IMAGE_DIR) uninstall
+	-$(MAKE) -C $(SDL_IMAGE_DIR) clean
+
+sdl_image-dirclean:
+	rm -rf $(SDL_IMAGE_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_SDL_IMAGE)),y)
+TARGETS+=sdl_image
+endif

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
Sent: Friday, March 07, 2008 5:26 AM
To: Gururaja Hebbar K R
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] Add SDL_mixer to buildroot/package

>>>>> "Hebbar" == Hebbar  <gururajakr@sanyo.co.in> writes:

Hi,

 Hebbar> Below is a patch to add sdl_mixer package to buildroot. I
Hebbar> have tested it for arm926ejs toolchain with buildroot 4th feb
Hebbar> Snapshot.

 Hebbar> Kindly add it to buildroot trunk.

I've committed a cleaned up version - Thanks!

--
Bye, Peter Korsgaard
