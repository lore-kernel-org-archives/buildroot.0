From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  9 Apr 2017 14:44:02 -0300
Subject: [Buildroot] [PATCH v3] atest: new package
Message-ID: <1491759842-27293-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for atest application, which is useful for testing
alsa kernel drivers and detecting if playback/capture work correct
without artifacts, such as channel swap. 

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Use select for alsa_lib and libev
- Bump to the latest version
- Use SPDX short identifier
- Add comment "Fetched from Github, with no configure script"
- Depends on !BR2_TOOLCHAIN_USES_UCLIBC as uclibc lacks wordexp

 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/atest/Config.in  | 12 ++++++++++++
 package/atest/atest.hash |  2 ++
 package/atest/atest.mk   | 21 +++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/atest/Config.in
 create mode 100644 package/atest/atest.hash
 create mode 100644 package/atest/atest.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a298669..bd30d1c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -504,6 +504,7 @@ F:	configs/mx6sx_udoo_neo_defconfig
 F:	configs/mx6udoo_defconfig
 F:	configs/wandboard_defconfig
 F:	configs/warp7_defconfig
+F:	package/atest/
 F:	package/kmscube/
 
 N:	Fabio Porcedda <fabio.porcedda@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index c12e5b5..a586663 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -5,6 +5,7 @@ menu "Target packages"
 
 menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
+	source "package/atest/Config.in"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
 	source "package/dvblast/Config.in"
diff --git a/package/atest/Config.in b/package/atest/Config.in
new file mode 100644
index 0000000..ede739e
--- /dev/null
+++ b/package/atest/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_ATEST
+	bool "atest"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_LIBEV
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # uclibc lacks wordexp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on !BR2_bfin # libev
+	help
+	  atest is a test software for checking ALSA Asoc drivers
+	  concerning the proper frame generation and capture.
+
+	  https://github.com/amouiche/atest
diff --git a/package/atest/atest.hash b/package/atest/atest.hash
new file mode 100644
index 0000000..78e3ff8
--- /dev/null
+++ b/package/atest/atest.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 91da5a6d4d0b0a8d4bae156a40e91a6dccf62863bfa7acae948efbbd2b4154ca  atest-895b0183a89c15f5e2305a6795bb1667753cd3f0.tar.gz
diff --git a/package/atest/atest.mk b/package/atest/atest.mk
new file mode 100644
index 0000000..2effda5
--- /dev/null
+++ b/package/atest/atest.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# atest
+#
+################################################################################
+
+ATEST_VERSION = 895b0183a89c15f5e2305a6795bb1667753cd3f0
+ATEST_SITE = $(call github,amouiche,atest,$(ATEST_VERSION))
+ATEST_LICENSE = GPL-2.0+
+ATEST_LICENSE_FILES = COPYING
+ATEST_DEPENDENCIES = host-pkgconf libev alsa-lib
+# Fetched from Github, with no configure script
+ATEST_AUTORECONF = YES
+
+# Autoreconf requires an existing m4 directory
+define ATEST_PATCH_M4
+	mkdir -p $(@D)/m4
+endef
+ATEST_POST_PATCH_HOOKS += ATEST_PATCH_M4
+
+$(eval $(autotools-package))
-- 
2.7.4
