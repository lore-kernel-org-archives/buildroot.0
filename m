From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 Feb 2020 18:47:14 +0100
Subject: [Buildroot] [PATCH/next 6/6] package/linphone: bump to version 4.3.1
In-Reply-To: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
References: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
Message-ID: <20200227174714.3727844-6-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update site to get latest release
- License is GPL-3.0+ since version 4.3.0 and
  https://gitlab.linphone.org/BC/public/liblinphone/commit/2bc924c184e2f00f1be3f82a736bccaeacce106e
- Switch to cmake-infrastructure
- Remove most of the existing dependencies (alsa, speex, libupnp, ...)
  as they are now only managed in mediatreamer
- Add external dependencies: belr, belle-sip, libxml2, mediastreamer,
  sqlite
- This bump is needed as current linphone does not build with latest
  libeXosip2

Fixes:
 - http://autobuild.buildroot.org/results/ed8bdcbfb7d453ed7d436bada35417ee305e6ac9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linphone/Config.in     | 26 +++++++++----
 package/linphone/linphone.hash |  4 +-
 package/linphone/linphone.mk   | 71 +++++++++++++++-------------------
 3 files changed, 52 insertions(+), 49 deletions(-)

diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index 06eb059cfd..c7683b829e 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -1,11 +1,17 @@
 config BR2_PACKAGE_LINPHONE
 	bool "linphone"
-	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer (bundled)
-	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp (bundled)
-	depends on BR2_USE_MMU # libeXosip2
-	select BR2_PACKAGE_LIBEXOSIP2
-	select BR2_PACKAGE_SPEEX
-	select BR2_PACKAGE_SPEEXDSP
+	depends on BR2_USE_MMU
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # belle-sip, mediastreamer
+	depends on BR2_TOOLCHAIN_HAS_THREADS # belr, belle-sip, mediastreamer
+	# belr, belle-sip, mediastreamer
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	depends on BR2_USE_WCHAR # belle-sip
+	select BR2_PACKAGE_BELLE_SIP
+	select BR2_PACKAGE_BELR
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_MEDIASTREAMER
+	select BR2_PACKAGE_SQLITE
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
 
@@ -24,6 +30,10 @@ config BR2_PACKAGE_LINPHONE
 
 	  http://www.linphone.org/
 
-comment "linphone needs a toolchain w/ threads, C++"
+comment "linphone needs a toolchain w/ threads, C++, dynamic library, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+
+comment "linphone needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/linphone/linphone.hash b/package/linphone/linphone.hash
index e5b9015ae5..9aa03078d2 100644
--- a/package/linphone/linphone.hash
+++ b/package/linphone/linphone.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  05ba81223e9378c3bce8d33080213b9925af49bd9623cd9004eb3dd22ca9d2a0  linphone-3.6.1.tar.gz
+sha256  bfb195845ae23311667d5631c470310a63818fe46029cea2f1b77a5ed84e6e21  linphone-4.3.1.tar.gz
 # Locally computed
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index 4129c2a9e3..484cc356fa 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -4,52 +4,45 @@
 #
 ################################################################################
 
-LINPHONE_VERSION_MAJOR = 3.6
-LINPHONE_VERSION = $(LINPHONE_VERSION_MAJOR).1
-LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/$(LINPHONE_VERSION_MAJOR).x/sources
+LINPHONE_VERSION = 4.3.1
+LINPHONE_SITE = \
+	https://gitlab.linphone.org/BC/public/liblinphone/-/archive/$(LINPHONE_VERSION)
 LINPHONE_CONF_OPTS = \
-	--disable-strict --disable-video
-# configure is out of sync causing deplibs linking issues
-LINPHONE_AUTORECONF = YES
+	-DENABLE_ADVANCED_IM=OFF \
+	-DENABLE_CXX_WRAPPER=OFF \
+	-DENABLE_DB_STORAGE=OFF \
+	-DENABLE_LIME=OFF \
+	-DENABLE_LIME_X3DH=OFF \
+	-DENABLE_STRICT=OFF \
+	-DENABLE_TOOLS=OFF \
+	-DENABLE_TUTORIALS=OFF \
+	-DENABLE_UNIT_TESTS=OFF \
+	-DENABLE_VCARD=OFF \
+	-DENABLE_VIDEO=OFF
 LINPHONE_INSTALL_STAGING = YES
-LINPHONE_DEPENDENCIES = host-pkgconf libeXosip2 speex
-LINPHONE_LICENSE = GPL-2.0+
-LINPHONE_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_arc),y)
-# toolchain __arc__ define conflicts with libosip2 source
-LINPHONE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -U__arc__"
-endif
+LINPHONE_DEPENDENCIES = \
+	belle-sip \
+	belr \
+	libxml2 \
+	mediastreamer \
+	sqlite \
+	$(if $(BR2_PACKAGE_ZLIB),zlib)
+LINPHONE_LICENSE = GPL-3.0+
+LINPHONE_LICENSE_FILES = LICENSE.txt
 
 ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
-LINPHONE_CONF_OPTS += --enable-gtk_ui
+LINPHONE_CONF_OPTS += -DENABLE_GTK_UI=ON
 LINPHONE_DEPENDENCIES += libgtk2
 else
-LINPHONE_CONF_OPTS += --disable-gtk_ui
-endif
-
-# needed for bundled mediastreamer2
-LINPHONE_DEPENDENCIES += host-intltool host-gettext
-
-ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
-LINPHONE_CONF_OPTS += --enable-alsa
-LINPHONE_DEPENDENCIES += alsa-lib
-else
-LINPHONE_CONF_OPTS += --disable-alsa
+LINPHONE_CONF_OPTS += -DENABLE_GTK_UI=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBV4L),y)
-LINPHONE_CONF_OPTS += --enable-libv4l1 --enable-libv4l2
-LINPHONE_DEPENDENCIES += libv4l
-else
-LINPHONE_CONF_OPTS += --disable-libv4l1 --disable-libv4l2
-endif
-
-ifeq ($(BR2_PACKAGE_LIBUPNP),y)
-LINPHONE_DEPENDENCIES += libupnp
-LINPHONE_CONF_OPTS += --enable-upnp
-else
-LINPHONE_CONF_OPTS += --disable-upnp
+ifeq ($(BR2_STATIC_LIBS),y)
+LINPHONE_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LINPHONE_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+LINPHONE_CONF_OPTS += -DENABLE_STATIC=OFF -DENABLE_SHARED=ON
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.25.0
