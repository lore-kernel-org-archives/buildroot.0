From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Date: Wed, 30 Mar 2016 11:20:38 +0530
Subject: [Buildroot] [PATCH v2] powerpc-utils: Bump powerpc-utils to v1.3.1
Message-ID: <20160330054905.13012.58031.stgit@hegdevasant.in.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes below changes to powerpc-utils package:
  - Update to latest upstream version (v1.3.1)
  - Update License (from CPL to GPLv2)
  - Update source link (from SF to github)
  - Disable librtas by default
  - Finally make necessary adjustment to compile the source
    (run autogen.sh before ./configure as we don't have configure in new tarball).

RTAS:
  This package contains few tools (like nvram, ppc64_cpu, etc) which are not
  dependent on RTAS support. Traditionally we always had RTAS support (at least
  on IBM Power system). But now a days we do have environments like PowerNV host
  where we do not have RTAS support. Instead we use OPAL for runtime service [1].
  Hence lets disable RTAS by default. If someone wants to build powerpc-utils
  with RTAS they can enable it.

[1] https://github.com/open-power/skiboot.git

Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
---
Changes in v2:
  - Updated to v1.3.1 instead of v1.3.0
  - Addressed Thomas review comments
  - Removed powerpc-utils.hash file

-Vasant



 package/powerpc-utils/Config.in          |    3 +--
 package/powerpc-utils/powerpc-utils.hash |    3 ---
 package/powerpc-utils/powerpc-utils.mk   |    9 +++++----
 3 files changed, 6 insertions(+), 9 deletions(-)
 delete mode 100644 package/powerpc-utils/powerpc-utils.hash

diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index e18254c..4037c55 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_POWERPC_UTILS
 	help
 	  System utilities for PowerPC machines.
 
-	  http://sourceforge.net/projects/powerpc-utils/
+	  https://github.com/nfont/powerpc-utils
 
 if BR2_PACKAGE_POWERPC_UTILS
 
@@ -18,7 +18,6 @@ config BR2_PACKAGE_POWERPC_UTILS_RTAS
 	bool "RTAS support"
 	select BR2_PACKAGE_LIBRTAS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-	default y
 	help
 	  Enable support for functions that require RTAS.
 
diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
deleted file mode 100644
index d02f16a..0000000
--- a/package/powerpc-utils/powerpc-utils.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From http://sourceforge.net/projects/powerpc-utils/files/powerpc-utils/
-sha1	975c668e8eaedd5222a7870e82ce295d06dfe649	powerpc-utils-1.2.24.tar.gz
-md5	f492a72f2d4522eba5d9b329c84b3ed3	powerpc-utils-1.2.24.tar.gz
diff --git a/package/powerpc-utils/powerpc-utils.mk b/package/powerpc-utils/powerpc-utils.mk
index ae4d662..3aa6c9b 100644
--- a/package/powerpc-utils/powerpc-utils.mk
+++ b/package/powerpc-utils/powerpc-utils.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-POWERPC_UTILS_VERSION = 1.2.24
-POWERPC_UTILS_SITE = http://downloads.sourceforge.net/project/powerpc-utils/powerpc-utils
+POWERPC_UTILS_VERSION = v1.3.1
+POWERPC_UTILS_SITE = $(call github,nfont,powerpc-utils,$(POWERPC_UTILS_VERSION))
 POWERPC_UTILS_DEPENDENCIES = zlib
-POWERPC_UTILS_LICENSE = Common Public License Version 1.0
-POWERPC_UTILS_LICENSE_FILES = COPYRIGHT
+POWERPC_UTILS_AUTORECONF = YES
+POWERPC_UTILS_LICENSE = GPLv2
+POWERPC_UTILS_LICENSE_FILES = COPYING
 
 POWERPC_UTILS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
