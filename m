From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Date: Tue, 29 Mar 2016 17:41:07 +0530
Subject: [Buildroot] [PATCH] powerpc-utils: Bump powerpc-utils to v1.3.0
Message-ID: <20160329121047.3804.35383.stgit@hegdevasant.in.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes below changes to powerpc-utils package:
  - Update to latest upstream version (v1.3.0)
  - Update License (from CPL to GPLv2)
  - Update source link (from SF to github)
  - Disable librtas by default
  - Finally make necessary adjustment to compile the source
    (run autogen.sh before ./configure as we don't have configure in new tarball).

Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
Resending patch after subscribing to mailing list.

-Vasant

 package/powerpc-utils/Config.in          |    4 ++--
 package/powerpc-utils/powerpc-utils.hash |    6 +++---
 package/powerpc-utils/powerpc-utils.mk   |   14 ++++++++++----
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index e18254c..5fc9ea9 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_POWERPC_UTILS
 	help
 	  System utilities for PowerPC machines.
 
-	  http://sourceforge.net/projects/powerpc-utils/
+	  https://github.com/nfont/powerpc-utils
 
 if BR2_PACKAGE_POWERPC_UTILS
 
@@ -18,7 +18,7 @@ config BR2_PACKAGE_POWERPC_UTILS_RTAS
 	bool "RTAS support"
 	select BR2_PACKAGE_LIBRTAS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	default y
+	default n
 	help
 	  Enable support for functions that require RTAS.
 
diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index d02f16a..2d9591f 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/powerpc-utils/files/powerpc-utils/
-sha1	975c668e8eaedd5222a7870e82ce295d06dfe649	powerpc-utils-1.2.24.tar.gz
-md5	f492a72f2d4522eba5d9b329c84b3ed3	powerpc-utils-1.2.24.tar.gz
+# From https://github.com/nfont/powerpc-utils/archive/v1.3.0.tar.gz
+sha1	33d49885588373e9bb9444af41a031c3a651a5ec	v1.3.0.tar.gz
+md5	ceed76fa882ea02d78e574691e167834		v1.3.0.tar.gz
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index ae4d662..61b0fbe 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,15 +4,21 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = 1.2.24
-POWERPC_UTILS_SITE = http://downloads.sourceforge.net/project/powerpc-utils/powerpc-utils
+POWERPC_UTILS_VERSION = 1.3.0
+POWERPC_UTILS_SITE = https://github.com/nfont/powerpc-utils/archive/
+POWERPC_UTILS_SOURCE = v$(POWERPC_UTILS_VERSION).tar.gz
 POWERPC_UTILS_DEPENDENCIES = zlib
-POWERPC_UTILS_LICENSE = Common Public License Version 1.0
-POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
+POWERPC_UTILS_LICENSE = GPLv2
+POWERPC_UTILS_LICENSE_FILES = COPYING
 
 POWERPC_UTILS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
+define POWERPC_UTILS_AUTOGEN
+	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
+endef
+POWERPC_UTILS_PRE_CONFIGURE_HOOKS += POWERPC_UTILS_AUTOGEN
+
 ifeq ($(BR2_PACKAGE_POWERPC_UTILS_RTAS),y)
 POWERPC_UTILS_DEPENDENCIES += librtas
 POWERPC_UTILS_CONF_OPTS = --with-librtas
