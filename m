From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:06:46 +0100
Subject: [Buildroot] [git commit] package/rdesktop: bump to version 1.9.0
Message-ID: <20200314135827.58B5482983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89bc5e0f2aa8e8e2b215da8864e0022a4122caed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Retrieve official tarball and so remove autoreconf
- xlib_Xcursor is a mandatory dependency since
  https://github.com/rdesktop/rdesktop/commit/6dd85edc6f8293acd100b34add1405ea5a744111
- libtasn1 is a mandatory dependency since
  https://github.com/rdesktop/rdesktop/commit/673b267e665642def474f228142e46b18d195e01
- nettle is a mandatory dependency since
  https://github.com/rdesktop/rdesktop/commit/00d9e0c4c806c1d5d21ec7865f03cafe9acbeab3
- gnutls is a mandatory dependency instead of openssl since
  https://github.com/rdesktop/rdesktop/commit/166d1bc14d34c20dd0c640571a749a6599180367
- pulseaudio is an optional dependency since
  https://github.com/rdesktop/rdesktop/commit/9b98c3b2296f07b99b94aceb2c19131f32bde476
- iconv is mandatory since
  https://github.com/rdesktop/rdesktop/commit/2ea3f69873d18d07ef79c724c656d25b9d63a114

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rdesktop/Config.in     | 12 +++++++++++-
 package/rdesktop/rdesktop.hash |  2 +-
 package/rdesktop/rdesktop.mk   | 20 ++++++++++++++------
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index 0335bee2a0..d07a1d5c7c 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -1,9 +1,15 @@
 config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # gnutls
+	depends on BR2_USE_WCHAR # gnutls
 	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_LIBTASN1
+	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_XLIB_LIBXT
 	help
 	  rdesktop is an open source client for Windows NT Terminal
@@ -12,3 +18,7 @@ config BR2_PACKAGE_RDESKTOP
 	  present the user's NT desktop.
 
 	  http://rdesktop.sf.net/
+
+comment "rdesktop needs a toolchain w/ wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/rdesktop/rdesktop.hash b/package/rdesktop/rdesktop.hash
index d42ab59be1..f9715d2a47 100644
--- a/package/rdesktop/rdesktop.hash
+++ b/package/rdesktop/rdesktop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ffb9f8e2f0b7a06e383e550698bdc9734ae33eb3ec971b0a094078434a4bba6d  rdesktop-1.8.6.tar.gz
+sha256  473c2f312391379960efe41caad37852c59312bc8f100f9b5f26609ab5704288  rdesktop-1.9.0.tar.gz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
index f40521d2b1..672d85b5c5 100644
--- a/package/rdesktop/rdesktop.mk
+++ b/package/rdesktop/rdesktop.mk
@@ -4,18 +4,26 @@
 #
 ################################################################################
 
-RDESKTOP_VERSION = 1.8.6
-RDESKTOP_SITE = $(call github,rdesktop,rdesktop,v$(RDESKTOP_VERSION))
-RDESKTOP_DEPENDENCIES = host-pkgconf openssl xlib_libX11 xlib_libXt \
+RDESKTOP_VERSION = 1.9.0
+RDESKTOP_SITE = \
+	https://github.com/rdesktop/rdesktop/releases/download/v$(RDESKTOP_VERSION)
+RDESKTOP_DEPENDENCIES = \
+	host-pkgconf \
+	gnutls \
+	libtasn1 \
+	nettle \
+	xlib_libX11 \
+	xlib_libXcursor \
+	xlib_libXt \
 	$(if $(BR2_PACKAGE_ALSA_LIB_PCM),alsa-lib) \
 	$(if $(BR2_PACKAGE_LIBAO),libao) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
+	$(if $(BR2_PACKAGE_PULSEAUDIO),pulseaudio) \
 	$(if $(BR2_PACKAGE_XLIB_LIBXRANDR),xlib_libXrandr)
-RDESKTOP_CONF_OPTS = --with-openssl=$(STAGING_DIR)/usr --disable-credssp
+RDESKTOP_CONF_OPTS = --disable-credssp
 RDESKTOP_LICENSE = GPL-3.0+
 RDESKTOP_LICENSE_FILES = COPYING
-# From git
-RDESKTOP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_PCSC_LITE),y)
 RDESKTOP_DEPENDENCIES += pcsc-lite
