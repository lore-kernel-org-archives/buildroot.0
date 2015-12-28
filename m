From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Dec 2015 20:08:54 +0100
Subject: [Buildroot] [PATCH 1/2] package/eigen: install .pc file
In-Reply-To: <cover.1451329553.git.yann.morin.1998@free.fr>
References: <cover.1451329553.git.yann.morin.1998@free.fr>
Message-ID: <6208cd9e3ec1e0da22459393104981ab0e43d69b.1451329553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Other packages will look for eigen3.pc to detect the presence of eigen3.

eigen3.pc is usually installed by eigen's cmake buildsystem, but we do a
manual install to not depend on host-cmake just to install header files.
But in doing so, we forgot to install the .pc file.

Manually sed the source .pc.in to generate the final .pc file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/eigen/eigen.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index dd88fde..3eb858a 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -20,6 +20,13 @@ define EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS
 endef
 endif
 
+# Generate the .pc file at build time
+define EIGEN_BUILD_CMDS
+	sed -r -e 's,^Version: .*,Version: $(EIGEN_VERSION),' \
+	       -e 's,^Cflags: .*,Cflags: -I$(EIGEN_DEST_DIR),' \
+	       $(@D)/eigen3.pc.in >$(@D)/eigen3.pc
+endef
+
 # This package only consists of headers that need to be
 # copied over to the sysroot for compile time use
 define EIGEN_INSTALL_STAGING_CMDS
@@ -27,6 +34,8 @@ define EIGEN_INSTALL_STAGING_CMDS
 	mkdir -p $(EIGEN_DEST_DIR)
 	cp -a $(@D)/Eigen $(EIGEN_DEST_DIR)
 	$(EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS)
+	$(INSTALL) -D -m 0644 $(@D)/eigen3.pc \
+			      $(STAGING_DIR)/usr/lib/pkgconfig/eigen3.pc
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
