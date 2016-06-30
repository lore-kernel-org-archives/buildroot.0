From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:17:49 +0200
Subject: [Buildroot] [git commit] package/grantlee: upgrade to 5.1.0,
	remove obsolete Qt4 build option
Message-ID: <20160630224148.B6B3582190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=969285033b0fc6930b267263fc0b90241b9c053f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grantlee/Config.in     | 21 +++------------------
 package/grantlee/grantlee.hash |  3 +--
 package/grantlee/grantlee.mk   | 14 ++------------
 3 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 7895c7e..779306b 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -1,24 +1,9 @@
 config BR2_PACKAGE_GRANTLEE
 	bool "grantlee"
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # Qt Script
-	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
-		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
-	# https://sourceware.org/bugzilla/show_bug.cgi?id=20173
-	depends on !BR2_microblaze && !BR2_nios2
-	select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_SCRIPT if BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
-	select BR2_PACKAGE_QT5SCRIPT if BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5SCRIPT
+	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Qt implementation of the Django template framework
 
 	  http://www.grantlee.org
-
-comment "grantlee needs a toolchain with NPTL not affected by Binutils bug 19405"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on !BR2_microblaze && !BR2_nios2
-	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
-		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5) || \
-		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
diff --git a/package/grantlee/grantlee.hash b/package/grantlee/grantlee.hash
index 7f02bb3..cdff778 100644
--- a/package/grantlee/grantlee.hash
+++ b/package/grantlee/grantlee.hash
@@ -1,3 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	191809bf4c9b7ef877af0fd29345061c2372edfb4506aa7d5df5c71a570fa0ac	grantlee-0.5.1.tar.gz
-sha256	eaf22ba92e53b8eb5dd8bca045fe81b734d3445445ed9e0c1af2a0a7c375b161	grantlee-5.0.0.tar.gz
+sha256  ea2e402466c74bb533eee2c7252209ec61cd93a5d236fecd625b4a0eb13a1478    grantlee-5.1.0.tar.gz
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index a300106..f921d7b 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -3,21 +3,11 @@
 # grantlee
 #
 ################################################################################
-# qt4 support dropped after 0.5.1, so we use the older version for qt4
-ifeq ($(BR2_PACKAGE_QT),y)
-GRANTLEE_VERSION = 0.5.1
-else ifeq ($(BR2_PACKAGE_QT5),y)
-GRANTLEE_VERSION = 5.0.0
-endif
+GRANTLEE_VERSION = 5.1.0
 GRANTLEE_SITE = http://downloads.grantlee.org
 GRANTLEE_INSTALL_STAGING = YES
 GRANTLEE_LICENSE = LGPLv2.1+
 GRANTLEE_LICENSE_FILES = COPYING.LIB
-
-ifeq ($(BR2_PACKAGE_QT),y)
-GRANTLEE_DEPENDENCIES = qt
-else ifeq ($(BR2_PACKAGE_QT5),y)
-GRANTLEE_DEPENDENCIES += qt5base qt5script
-endif
+GRANTLEE_DEPENDENCIES = qt5base qt5script
 
 $(eval $(cmake-package))
