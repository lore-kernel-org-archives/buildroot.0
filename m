From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 28 Mar 2016 21:49:31 +0200
Subject: [Buildroot] [PATCH v4 05/19] package/linphone: add support for
	ffmpeg 3.0
In-Reply-To: <1459194585-12593-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459194585-12593-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459194585-12593-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linphone 3.6 is incompatible with bumped mediastreamer and ortp
packages. Like Debian we use the bundled versions instead and add the
Debian patch series to support ffmpeg 3.0

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v4: initial version

 package/linphone/Config.in     |  6 ++----
 package/linphone/linphone.hash |  4 ++++
 package/linphone/linphone.mk   | 17 ++++++++++++++---
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index 6d6ffae..2622aa4 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -2,10 +2,8 @@ config BR2_PACKAGE_LINPHONE
 	bool "linphone"
 	select BR2_PACKAGE_LIBEXOSIP2
 	select BR2_PACKAGE_SPEEX
-	select BR2_PACKAGE_ORTP
-	select BR2_PACKAGE_MEDIASTREAMER
-	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer
-	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
+	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer (bundled)
+	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp (bundled)
 	depends on BR2_USE_MMU # libeXosip2
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
diff --git a/package/linphone/linphone.hash b/package/linphone/linphone.hash
index 9ed9d37..2e202cf 100644
--- a/package/linphone/linphone.hash
+++ b/package/linphone/linphone.hash
@@ -1,2 +1,6 @@
 # Locally calculated after checking pgp signature
 sha256	05ba81223e9378c3bce8d33080213b9925af49bd9623cd9004eb3dd22ca9d2a0	linphone-3.6.1.tar.gz
+sha256	bc4ef670c0ecc1bb60bcb79374309b555c11d154bacfa363d809a26a58780933	libav9.patch
+sha256	a50a8ac2caedb389c224f81393901a029fec055ec2ec83aa18d677e1bfe7fc73	libav10.patch
+sha256	e384775c12ea93d3bc35dccfe4ea875c38b74be8af63fcb82e6b7f06e93d1593	libav11.patch
+sha256	3367a26f65f49f4101787b1821402127d29cde9b02d3873112a5001a549cc7d9	ffmpeg_2.9.patch
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index e0d4fa3..1728d20 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -8,15 +8,18 @@ LINPHONE_VERSION_MAJOR = 3.6
 LINPHONE_VERSION = $(LINPHONE_VERSION_MAJOR).1
 LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/$(LINPHONE_VERSION_MAJOR).x/sources
 LINPHONE_CONF_OPTS = \
-	--enable-external-ortp \
-	--enable-external-mediastreamer \
 	--disable-strict
 # configure is out of sync causing deplibs linking issues
 LINPHONE_AUTORECONF = YES
 LINPHONE_INSTALL_STAGING = YES
-LINPHONE_DEPENDENCIES = host-pkgconf ortp mediastreamer libeXosip2 speex
+LINPHONE_DEPENDENCIES = host-pkgconf libeXosip2 speex
 LINPHONE_LICENSE = GPLv2+
 LINPHONE_LICENSE_FILES = COPYING
+LINPHONE_PATCH = \
+	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/libav9.patch \
+	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/libav10.patch \
+	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/libav11.patch \
+	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/ffmpeg_2.9.patch
 
 ifeq ($(BR2_arc),y)
 # toolchain __arc__ define conflicts with libosip2 source
@@ -30,4 +33,12 @@ else
 LINPHONE_CONF_OPTS += --disable-gtk_ui
 endif
 
+# needed for bundled mediastreamer2
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+LINPHONE_CONF_OPTS += --enable-libv4l1 --enable-libv4l2
+LINPHONE_DEPENDENCIES += libv4l
+else
+LINPHONE_CONF_OPTS += --disable-libv4l1 --disable-libv4l2
+endif
+
 $(eval $(autotools-package))
-- 
2.8.0.rc3
