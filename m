From: Davide Viti <zinosat@tiscali.it>
Date: Thu, 20 Mar 2014 11:45:48 +0100
Subject: [Buildroot] [PATCH v5 2/2] eigen: add an option to install
	unsupported modules
In-Reply-To: <1395312348-5812-1-git-send-email-d.viti@infosolution.it>
References: <1395312348-5812-1-git-send-email-d.viti@infosolution.it>
Message-ID: <1395312348-5812-2-git-send-email-d.viti@infosolution.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Davide Viti <d.viti@infosolution.it>
---
 Changes v4 -> v5:
   - fix indentation (spaces > tabs)

Note to self: use emacs Ctrl-q TAB to force tab insertion

 package/eigen/Config.in | 8 ++++++++
 package/eigen/eigen.mk  | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/package/eigen/Config.in b/package/eigen/Config.in
index e94f9a3..03d65b1 100644
--- a/package/eigen/Config.in
+++ b/package/eigen/Config.in
@@ -13,5 +13,13 @@ config BR2_PACKAGE_EIGEN
 
 	  http://eigen.tuxfamily.org/
 
+if BR2_PACKAGE_EIGEN
+
+config BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES
+	bool "unsupported modules"
+	help
+	  Install eigen unsupported modules
+endif
+
 comment "eigen needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 9a5ce7d..ac030a9 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -14,12 +14,19 @@ EIGEN_INSTALL_STAGING = YES
 EIGEN_INSTALL_TARGET = NO
 EIGEN_DEST_DIR = $(STAGING_DIR)/usr/include/eigen3
 
+ifeq ($(BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES),y)
+define EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS
+	cp -a $(@D)/unsupported $(EIGEN_DEST_DIR)
+endef
+endif
+
 # This package only consists of headers that need to be
 # copied over to the sysroot for compile time use
 define EIGEN_INSTALL_STAGING_CMDS
 	$(RM) -r $(EIGEN_DEST_DIR)
 	mkdir -p $(EIGEN_DEST_DIR)
 	cp -a $(@D)/Eigen $(EIGEN_DEST_DIR)
+	$(EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS)
 endef
 
 $(eval $(generic-package))
-- 
1.9.0
