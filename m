From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 16:36:02 +0200
Subject: [Buildroot] [PATCH/RFC v2 03/44] package/libcec: bump to version
	3.0.0
In-Reply-To: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434292603-12052-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434292603-12052-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in                     |    2 ++
 package/libcec/0001-remove-Wno-psabi.patch |   21 ---------------------
 package/libcec/Config.in                   |    4 ++++
 package/libcec/libcec.mk                   |   23 +++++++++++++++--------
 4 files changed, 21 insertions(+), 29 deletions(-)
 delete mode 100644 package/libcec/0001-remove-Wno-psabi.patch

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index ea4b449..bc845f8 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -161,6 +161,7 @@ comment "rsxs needs an OpenGL backend"
 config BR2_PACKAGE_KODI_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_STATIC_LIBS # libcec
+	depends on !BR2_GCC_VERSION_4_5_X # libcec
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBCEC
 	help
@@ -168,6 +169,7 @@ config BR2_PACKAGE_KODI_LIBCEC
 	  Select this if you want Kodi to support HDMI CEC.
 
 comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
+	depends on !BR2_GCC_VERSION_4_5_X
 	depends on BR2_STATIC_LIBS || !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_KODI_LIBMICROHTTPD
diff --git a/package/libcec/0001-remove-Wno-psabi.patch b/package/libcec/0001-remove-Wno-psabi.patch
deleted file mode 100644
index 4956c14..0000000
--- a/package/libcec/0001-remove-Wno-psabi.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Do not use -Wno-psabi option
-
-This option was added in gcc 4.5, and Buildroot still uses gcc 4.3 on
-some architectures. Since it's non essential (only disables some
-warning), let's get rid of it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -137,7 +137,7 @@
- use_udev="no"
- use_adapter_detection="yes"
- use_lockdev="no"
--SUPPRESS_MANGLING_WARNINGS=" -Wno-psabi"
-+SUPPRESS_MANGLING_WARNINGS=""
- case "${host}" in
-   *-*-linux*)
-     ## search for udev if pkg-config was found
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index e5fa9c8..c435047 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -4,6 +4,9 @@ config BR2_PACKAGE_LIBCEC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
+	# https://github.com/Pulse-Eight/libcec/issues/78#issuecomment-91578591
+	depends on !BR2_GCC_VERSION_4_5_X
+	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  libcec allows you in combination with the right hardware to
 	  control your home theater devices with your TV remote
@@ -12,5 +15,6 @@ config BR2_PACKAGE_LIBCEC
 	  http://libcec.pulse-eight.com
 
 comment "libcec needs a toolchain w/ C++, wchar, threads, dynamic library"
+	depends on !BR2_GCC_VERSION_4_5_X
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 8bdc9ea..4341ca8 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = libcec-2.2.0-repack
+LIBCEC_VERSION = 185559110dc88aeca0915a90b3b369d2d42c0f7c
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
@@ -12,7 +12,7 @@ LIBCEC_LICENSE_FILES = COPYING
 # Autoreconf required due to being a dev tarball and not a release tarball.
 LIBCEC_AUTORECONF = YES
 LIBCEC_INSTALL_STAGING = YES
-LIBCEC_DEPENDENCIES = host-pkgconf
+LIBCEC_DEPENDENCIES = host-pkgconf libplatform
 
 ifeq ($(BR2_PACKAGE_LOCKDEV),y)
 LIBCEC_DEPENDENCIES += lockdev
@@ -22,13 +22,20 @@ ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCEC_DEPENDENCIES += udev
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+LIBCEC_DEPENDENCIES += host-swig $(if $(BR2_PACKAGE_PYTHON3),python3,python)
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBCEC_CONF_OPTS = --enable-rpi \
-	--with-rpi-include-path=$(STAGING_DIR)/usr/include
 LIBCEC_DEPENDENCIES += rpi-userland
-LIBCEC_CONF_ENV += LIBS="-lvcos -lvchostif"
-else
-LIBCEC_CONF_OPTS = --disable-rpi
+LIBCEC_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="-lvcos -lvchiq_arm" \
+	-DCMAKE_CXX_FLAGS="-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
+		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads"
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+LIBCEC_DEPENDENCIES += xlib_libXrandr
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
1.7.10.4
