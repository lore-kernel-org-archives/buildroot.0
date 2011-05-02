From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 May 2011 23:12:30 +0200
Subject: [Buildroot] [git commit] toolchain: update gcc snapshot version
Message-ID: <20110502211541.D627082BDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1db3939ad91e88d420bc8983b4708ee65d3c91e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Make mpc mandatory since we are probably building bleeding-edge
* Change snapshot naming convention to match the source

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in         |   12 +++++++++---
 toolchain/gcc/Config.in.2       |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk |   11 +++++++++++
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 437b86b..f11c80f 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -45,11 +45,17 @@ config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
-	default "20070921"
+	default "4.7-20110430"
 	depends on BR2_GCC_VERSION_SNAP
 	help
-	  Enter snapshot date to use for gcc.  Format is:
-	  YYYYMMDD
+	  Enter snapshot date to use for gcc.
+	  Format is: A.B-YYYYMMDD
+
+	  A is GCC major version, for example 4.
+	  B is GCC minor version, for example 7.
+	  YYYYMMDD is snapshot date, for example 20110430.
+
+	  This way we'd get version 4.7-20110430
 
 config BR2_GCC_VERSION
 	string
diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
index 7a49068..c76d125 100644
--- a/toolchain/gcc/Config.in.2
+++ b/toolchain/gcc/Config.in.2
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GCC_TARGET
 	depends on BR2_HAVE_DEVFILES && BR2_TOOLCHAIN_BUILDROOT
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_BINUTILS_TARGET
-	select BR2_PACKAGE_MPC if (BR2_GCC_VERSION_4_5_X || BR2_GCC_VERSION_4_6_X)
+	select BR2_PACKAGE_MPC if (BR2_GCC_VERSION_4_5_X || BR2_GCC_VERSION_4_6_X || BR2_GCC_VERSION_SNAP)
 	select BR2_PACKAGE_MPFR
 	select BR2_PACKAGE_GMP
 	help
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 9b8bf68..7123615 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -141,6 +141,17 @@ endif
 GCC_HOST_PREREQ += host-mpc
 endif
 
+# GCC snapshot prerequisites
+# Since we don't know and it can be quite new just ask for everything known
+ifneq ($(GCC_SNAP_DATE),)
+GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
+GCC_TARGET_PREREQ += mpc
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
+HOST_SOURCE += host-mpc-source
+endif
+GCC_HOST_PREREQ += host-mpc
+endif
+
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 GCC_SHARED_LIBGCC:=--enable-shared
 else
-- 
1.7.3.4
