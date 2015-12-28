From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 21:58:14 +0100
Subject: [Buildroot] [git commit] package/eigen: install .pc file
Message-ID: <20151228205818.BB05582531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad366b357bc224e82a04c0b0ded6289c4d938969
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other packages will look for eigen3.pc to detect the presence of eigen3.

eigen3.pc is usually installed by eigen's cmake buildsystem, but we do a
manual install to not depend on host-cmake just to install header files.
But in doing so, we forgot to install the .pc file.

Manually sed the source .pc.in to generate the final .pc file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
