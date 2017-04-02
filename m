From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  2 Apr 2017 15:09:43 -0300
Subject: [Buildroot] [PATCH v2] atest: new package
Message-ID: <1491156583-9920-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for atest application, which is useful for testing
alsa kernel drivers and detecting if playback/capture are correct
without artifacts, such as channel swap. 

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Fix license type and add COPYING entry

 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/atest/Config.in  |  9 +++++++++
 package/atest/atest.hash |  2 ++
 package/atest/atest.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/atest/Config.in
 create mode 100644 package/atest/atest.hash
 create mode 100644 package/atest/atest.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c89468b..bf64f98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -501,6 +501,7 @@ F:	configs/mx6sx_udoo_neo_defconfig
 F:	configs/mx6udoo_defconfig
 F:	configs/wandboard_defconfig
 F:	configs/warp7_defconfig
+F:	package/atest/
 F:	package/kmscube/
 
 N:	Fabio Porcedda <fabio.porcedda@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index d6d134d..226a6e1 100644
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
index 0000000..64c9e7c
--- /dev/null
+++ b/package/atest/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ATEST
+	bool "atest"
+	depends on BR2_PACKAGE_ALSA_LIB
+	depends on BR2_PACKAGE_LIBEV
+	help
+	  atest is a test software for checking ALSA Asoc drivers
+	  concerning the proper frame generation and capture.
+
+	  https://github.com/amouiche/atest
diff --git a/package/atest/atest.hash b/package/atest/atest.hash
new file mode 100644
index 0000000..16b05c9
--- /dev/null
+++ b/package/atest/atest.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 6572b42170d3ad00dfc6362501f0e41fda7e2e7d79ff1757a2050415ad3f6ee4  atest-2e2299e9949b713f3c89cf84692dc6db6ab3a2e9.tar.gz
diff --git a/package/atest/atest.mk b/package/atest/atest.mk
new file mode 100644
index 0000000..af1760d
--- /dev/null
+++ b/package/atest/atest.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# atest
+#
+################################################################################
+
+ATEST_VERSION = 2e2299e9949b713f3c89cf84692dc6db6ab3a2e9
+ATEST_SITE = $(call github,amouiche,atest,$(ATEST_VERSION))
+ATEST_LICENSE = GPLv2+
+ATEST_LICENSE_FILES = COPYING
+ATEST_DEPENDENCIES = host-pkgconf libev alsa-lib
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
