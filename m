From: Noam Camus <noamc@ezchip.com>
Date: Sun, 15 Jun 2014 18:00:18 +0300
Subject: [Buildroot] [PATCH 1/1] toolchain-buildroot: create a relocatable
	one
Message-ID: <1402844418-28987-1-git-send-email-noamc@ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tal Zilcer <talz@ezchip.com>

This adds ability so that pre built buildroot toolchain and GDB can be used
by others in different computers without the need to build them again.

Note: the toolchain/GDB is still depended on native libraries.

Signed-off-by: Tal Zilcer <talz@ezchip.com>
Signed-off-by: Noam Camus <noamc@ezchip.com>
---
 package/expat/expat.mk                  |    4 ++++
 package/gmp/gmp.mk                      |    4 ++++
 package/mpc/mpc.mk                      |    4 ++++
 package/mpfr/mpfr.mk                    |    4 ++++
 toolchain/toolchain-buildroot/Config.in |    8 ++++++++
 5 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 4c37ba2..c9af121 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -13,5 +13,9 @@ EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_STATIC),y)
+HOST_EXPAT_CONF_OPT = --disable-shared
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index f71a210..12502da 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -12,5 +12,9 @@ GMP_LICENSE = LGPLv3+
 GMP_LICENSE_FILES = COPYING.LESSERv3
 GMP_DEPENDENCIES = host-m4
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_STATIC),y)
+HOST_GMP_CONF_OPT = --disable-shared
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 81ee5f0..436e86a 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -11,5 +11,9 @@ MPC_LICENSE_FILES = COPYING.LESSER
 MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_STATIC),y)
+HOST_MPC_CONF_OPT = --disable-shared
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 52d88fe..7093cf6 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -13,5 +13,9 @@ MPFR_INSTALL_STAGING = YES
 MPFR_DEPENDENCIES = gmp
 MPFR_MAKE_OPT = RANLIB=$(TARGET_RANLIB)
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_STATIC),y)
+HOST_MPFR_CONF_OPT = --disable-shared
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index eef9f9c..a66f816 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -18,6 +18,14 @@ config BR2_TOOLCHAIN_BUILDROOT_VENDOR
 
 	  If you're not sure, just leave the default "buildroot" value.
 
+config BR2_TOOLCHAIN_BUILDROOT_STATIC
+	bool "static toolchain"
+	help
+	  This option builds toolchain and gdb with static libraries
+	  of mpc,mpfr,gmp, and expat.
+	  It enable one to copy toolchain around to different directory
+	  and even to another machine. Now toolchain is relocatable, enjoy.
+
 source "package/linux-headers/Config.in.host"
 
 choice
-- 
1.7.1
