From: Davide Viti <zinosat@tiscali.it>
Date: Wed, 19 Mar 2014 01:13:38 +0100
Subject: [Buildroot] [PATCHv3] eigen: add an option to install unsupported
	modules
Message-ID: <1395188018-10383-1-git-send-email-zinosat@tiscali.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Davide Viti <d.viti@infosolution.it>

Hi Thomas,
thank you very much for reviewing the patch!
Here's a new version which implements all your suggestions.

I do agree with installing the "unsupported" folder inside "Eigen"; 
too bat it now breaks compilation on the PCL package I'm working on 
which directly includes files starting from unsupported [1].

regrads,
Davide


[1] https://github.com/PointCloudLibrary/pcl/blob/master/sample_consensus/include/pcl/sample_consensus/eigen.h

Signed-off-by: Davide Viti <zinosat@tiscali.it>
---
 package/eigen/Config.in |    8 ++++++++
 package/eigen/eigen.mk  |    7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/package/eigen/Config.in b/package/eigen/Config.in
index e94f9a3..fbada98 100644
--- a/package/eigen/Config.in
+++ b/package/eigen/Config.in
@@ -13,5 +13,13 @@ config BR2_PACKAGE_EIGEN
 
 	  http://eigen.tuxfamily.org/
 
+if BR2_PACKAGE_EIGEN
+
+config BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES
+       bool "unsupported modules"
+       help
+         Install eigen unsupported modules
+endif
+
 comment "eigen needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 5abd464..96e6018 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -13,11 +13,18 @@ EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
 EIGEN_INSTALL_STAGING = YES
 EIGEN_INSTALL_TARGET = NO
 
+ifeq ($(BR2_PACKAGE_EIGEN_UNSUPPORTED_MODULES),y)
+define EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS
+	cp -a $(@D)/unsupported $(STAGING_DIR)/usr/include/Eigen
+endef
+endif
+
 # This package only consists of headers that need to be
 # copied over to the sysroot for compile time use
 define EIGEN_INSTALL_STAGING_CMDS
 	$(RM) -r $(STAGING_DIR)/usr/include/Eigen
 	cp -a $(@D)/Eigen $(STAGING_DIR)/usr/include/
+	$(EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS)
 endef
 
 $(eval $(generic-package))
-- 
1.7.10.4
