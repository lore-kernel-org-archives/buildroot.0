From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Feb 2017 18:57:31 +0100
Subject: [Buildroot] [PATCH] package/libplatform: rename to new upstream name
Message-ID: <1486749451-14259-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libplatform now goes by the nickname libp8platform.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                                            |  8 ++++++++
 DEVELOPERS                                                  |  2 +-
 package/Config.in                                           |  2 +-
 package/kodi-adsp-basic/Config.in                           |  2 +-
 package/kodi-adsp-basic/kodi-adsp-basic.mk                  |  2 +-
 package/kodi-adsp-freesurround/Config.in                    |  2 +-
 package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk    |  2 +-
 package/kodi-platform/Config.in                             |  2 +-
 package/kodi-platform/kodi-platform.mk                      |  2 +-
 package/kodi-visualisation-shadertoy/Config.in              |  2 +-
 .../kodi-visualisation-shadertoy.mk                         |  2 +-
 package/libcec/Config.in                                    |  2 +-
 package/libcec/libcec.mk                                    |  2 +-
 .../0001-p8-platform-config-fix-lookup-paths.patch          |  0
 package/{libplatform => libp8platform}/Config.in            |  2 +-
 .../libplatform.hash => libp8platform/libp8platform.hash}   |  2 +-
 package/libp8platform/libp8platform.mk                      | 13 +++++++++++++
 package/libplatform/libplatform.mk                          | 13 -------------
 18 files changed, 35 insertions(+), 27 deletions(-)
 rename package/{libplatform => libp8platform}/0001-p8-platform-config-fix-lookup-paths.patch (100%)
 rename package/{libplatform => libp8platform}/Config.in (79%)
 rename package/{libplatform/libplatform.hash => libp8platform/libp8platform.hash} (69%)
 create mode 100644 package/libp8platform/libp8platform.mk
 delete mode 100644 package/libplatform/libplatform.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 20445b8..06a894c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.02"
 
+config BR2_PACKAGE_LIBPLATFORM
+	bool "libplatform has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBP8PLATFORM
+	help
+	  libplatform has been renamed to libp8platform, the new
+	  upstream name.
+
 config BR2_PACKAGE_PERL_DB_FILE
 	bool "perl-db-file removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 94f6804..339d202 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -195,8 +195,8 @@ F:	package/libminiupnpc/
 F:	package/libnatpmp/
 F:	package/libogg/
 F:	package/libopenh264/
+F:	package/libp8platform/
 F:	package/libpciaccess/
-F:	package/libplatform/
 F:	package/libsidplay2/
 F:	package/libsilk/
 F:	package/libsndfile/
diff --git a/package/Config.in b/package/Config.in
index deff0fe..719e8e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1353,8 +1353,8 @@ menu "Other"
 	source "package/libite/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
+	source "package/libp8platform/Config.in"
 	source "package/libpfm4/Config.in"
-	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
diff --git a/package/kodi-adsp-basic/Config.in b/package/kodi-adsp-basic/Config.in
index 87bdd19..ba0b813 100644
--- a/package/kodi-adsp-basic/Config.in
+++ b/package/kodi-adsp-basic/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_ADSP_BASIC
 	bool "kodi-adsp-basic"
-	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_LIBP8PLATFORM
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  This add-on contains basic dsp related parts to handle
diff --git a/package/kodi-adsp-basic/kodi-adsp-basic.mk b/package/kodi-adsp-basic/kodi-adsp-basic.mk
index 0b1ba95..d7453ae 100644
--- a/package/kodi-adsp-basic/kodi-adsp-basic.mk
+++ b/package/kodi-adsp-basic/kodi-adsp-basic.mk
@@ -8,6 +8,6 @@ KODI_ADSP_BASIC_VERSION = cb56e0eb6530fd50a286d47ef0be529001e9d556
 KODI_ADSP_BASIC_SITE = $(call github,kodi-adsp,adsp.basic,$(KODI_ADSP_BASIC_VERSION))
 KODI_ADSP_BASIC_LICENSE = GPLv3+
 KODI_ADSP_BASIC_LICENSE_FILES = LICENSE.md
-KODI_ADSP_BASIC_DEPENDENCIES = libplatform kodi-platform
+KODI_ADSP_BASIC_DEPENDENCIES = libp8platform kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-adsp-freesurround/Config.in b/package/kodi-adsp-freesurround/Config.in
index 80aadf1..9df8e56 100644
--- a/package/kodi-adsp-freesurround/Config.in
+++ b/package/kodi-adsp-freesurround/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_ADSP_FREESURROUND
 	bool "kodi-adsp-freesurround"
-	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_LIBP8PLATFORM
 	select BR2_PACKAGE_KODI_PLATFORM
 	help
 	  FreeSurround is meant to be the KODI equivalent of your
diff --git a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
index 49cf673..1b85070 100644
--- a/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
+++ b/package/kodi-adsp-freesurround/kodi-adsp-freesurround.mk
@@ -8,6 +8,6 @@ KODI_ADSP_FREESURROUND_VERSION = 08b691d3d9a0382d2f6f789a31614fb02512036c
 KODI_ADSP_FREESURROUND_SITE = $(call github,kodi-adsp,adsp.freesurround,$(KODI_ADSP_FREESURROUND_VERSION))
 KODI_ADSP_FREESURROUND_LICENSE = GPLv3+
 KODI_ADSP_FREESURROUND_LICENSE_FILES = LICENSE.md
-KODI_ADSP_FREESURROUND_DEPENDENCIES = libplatform kodi-platform
+KODI_ADSP_FREESURROUND_DEPENDENCIES = libp8platform kodi-platform
 
 $(eval $(cmake-package))
diff --git a/package/kodi-platform/Config.in b/package/kodi-platform/Config.in
index cde1925..696e9ec 100644
--- a/package/kodi-platform/Config.in
+++ b/package/kodi-platform/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PLATFORM
 	bool
-	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_LIBP8PLATFORM
 	help
 	  Kodi add-on platform support library
 
diff --git a/package/kodi-platform/kodi-platform.mk b/package/kodi-platform/kodi-platform.mk
index 4b642f9..1a20790 100644
--- a/package/kodi-platform/kodi-platform.mk
+++ b/package/kodi-platform/kodi-platform.mk
@@ -9,6 +9,6 @@ KODI_PLATFORM_SITE = $(call github,xbmc,kodi-platform,$(KODI_PLATFORM_VERSION))
 KODI_PLATFORM_LICENSE = GPLv2+
 KODI_PLATFORM_LICENSE_FILES = src/util/XMLUtils.h
 KODI_PLATFORM_INSTALL_STAGING = YES
-KODI_PLATFORM_DEPENDENCIES = libplatform kodi
+KODI_PLATFORM_DEPENDENCIES = libp8platform kodi
 
 $(eval $(cmake-package))
diff --git a/package/kodi-visualisation-shadertoy/Config.in b/package/kodi-visualisation-shadertoy/Config.in
index ac17702..cfbe628 100644
--- a/package/kodi-visualisation-shadertoy/Config.in
+++ b/package/kodi-visualisation-shadertoy/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_KODI_VISUALISATION_SHADERTOY
 	bool "kodi-visualisation-shadertoy"
 	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_LIBP8PLATFORM
 	help
 	  Shadertoy visualiser for Kodi
 
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index e5f2d91..44602e2 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -8,7 +8,7 @@ KODI_VISUALISATION_SHADERTOY_VERSION = f9988007681bf37e6c03d6992bae30133b020608
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,notspiff,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPLv2+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = src/main.cpp
-KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libplatform
+KODI_VISUALISATION_SHADERTOY_DEPENDENCIES = kodi libp8platform
 
 ifeq ($(BR2_PACKAGE_LIBGLEW),y)
 KODI_VISUALISATION_SHADERTOY_DEPENDENCIES += libglew
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index 2dddc53..bf73ba0 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LIBCEC
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
-	select BR2_PACKAGE_LIBPLATFORM
+	select BR2_PACKAGE_LIBP8PLATFORM
 	help
 	  libcec allows you in combination with the right hardware to
 	  control your home theater devices with your TV remote
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index f00e10f..c66d402 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -10,7 +10,7 @@ LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
 
 LIBCEC_INSTALL_STAGING = YES
-LIBCEC_DEPENDENCIES = host-pkgconf libplatform
+LIBCEC_DEPENDENCIES = host-pkgconf libp8platform
 
 ifeq ($(BR2_PACKAGE_LOCKDEV),y)
 LIBCEC_DEPENDENCIES += lockdev
diff --git a/package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch b/package/libp8platform/0001-p8-platform-config-fix-lookup-paths.patch
similarity index 100%
rename from package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch
rename to package/libp8platform/0001-p8-platform-config-fix-lookup-paths.patch
diff --git a/package/libplatform/Config.in b/package/libp8platform/Config.in
similarity index 79%
rename from package/libplatform/Config.in
rename to package/libp8platform/Config.in
index 7d275b1..ee0ae08 100644
--- a/package/libplatform/Config.in
+++ b/package/libp8platform/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LIBPLATFORM
+config BR2_PACKAGE_LIBP8PLATFORM
 	bool
 	help
 	  Platform support library used by libCEC and binary add-ons for Kodi
diff --git a/package/libplatform/libplatform.hash b/package/libp8platform/libp8platform.hash
similarity index 69%
rename from package/libplatform/libplatform.hash
rename to package/libp8platform/libp8platform.hash
index e3d5ed5..a120155 100644
--- a/package/libplatform/libplatform.hash
+++ b/package/libp8platform/libp8platform.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 88711f1b949285867538a0b2e4189532778e1515325dfa1851eae9d18b6affd9  libplatform-2.1.0.tar.gz
+sha256 88711f1b949285867538a0b2e4189532778e1515325dfa1851eae9d18b6affd9  libp8platform-2.1.0.tar.gz
diff --git a/package/libp8platform/libp8platform.mk b/package/libp8platform/libp8platform.mk
new file mode 100644
index 0000000..ea97b42
--- /dev/null
+++ b/package/libp8platform/libp8platform.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libp8platform
+#
+################################################################################
+
+LIBP8PLATFORM_VERSION = 2.1.0
+LIBP8PLATFORM_SITE = $(call github,Pulse-Eight,platform,p8-platform-$(LIBP8PLATFORM_VERSION))
+LIBP8PLATFORM_LICENSE = GPLv2+
+LIBP8PLATFORM_LICENSE_FILES = src/os.h
+LIBP8PLATFORM_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
deleted file mode 100644
index d9cd582..0000000
--- a/package/libplatform/libplatform.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# libplatform
-#
-################################################################################
-
-LIBPLATFORM_VERSION = 2.1.0
-LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,p8-platform-$(LIBPLATFORM_VERSION))
-LIBPLATFORM_LICENSE = GPLv2+
-LIBPLATFORM_LICENSE_FILES = src/os.h
-LIBPLATFORM_INSTALL_STAGING = YES
-
-$(eval $(cmake-package))
-- 
2.7.4
