From: Davide Viti <zinosat@tiscali.it>
Date: Tue, 18 Mar 2014 21:18:14 +0100
Subject: [Buildroot] [PATCH] eigen: (optionally) install unsupported modules
In-Reply-To: <1395173894-4811-1-git-send-email-zinosat@tiscali.it>
References: <1395173894-4811-1-git-send-email-zinosat@tiscali.it>
Message-ID: <1395173894-4811-2-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Davide Viti <d.viti@infosolution.it>


Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 package/eigen/Config.in |    8 ++++++++
 package/eigen/eigen.mk  |    8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/package/eigen/Config.in b/package/eigen/Config.in
index e94f9a3..a653e37 100644
--- a/package/eigen/Config.in
+++ b/package/eigen/Config.in
@@ -13,5 +13,13 @@ config BR2_PACKAGE_EIGEN
 
 	  http://eigen.tuxfamily.org/
 
+if BR2_PACKAGE_EIGEN
+
+config BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES
+        bool "unsupported modules"
+	help
+	  Install eigen unsupported modules
+endif
+
 comment "eigen needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 5abd464..388dd63 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -13,6 +13,14 @@ EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
 EIGEN_INSTALL_STAGING = YES
 EIGEN_INSTALL_TARGET = NO
 
+define EIGEN_INSTALL_UNSUPPORTED_MODULES
+	cp -a $(@D)/unsupported $(STAGING_DIR)/usr/include/
+endef
+
+ifeq ($(BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES),y)
+	EIGEN_POST_INSTALL_STAGING_HOOKS += EIGEN_INSTALL_UNSUPPORTED_MODULES
+endif
+
 # This package only consists of headers that need to be
 # copied over to the sysroot for compile time use
 define EIGEN_INSTALL_STAGING_CMDS
-- 
1.7.10.4
