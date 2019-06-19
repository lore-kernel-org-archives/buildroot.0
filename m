From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 14:44:54 +0200
Subject: [Buildroot] [git commit] package/bullet: re-enable package when gcc
 bug 85180 is present
Message-ID: <20190619124503.39D0C826AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28a9aec0184cb40a262ea7755b22b2f60f7bf176
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This
package has been excluded from building on Microblaze due to this.

To be consistent with how we deal with this issue in other packages,
we re-enable the package and instead work around the issue by building
with -O0, since gcc bug 85180 manifests itself only when optimization
is enabled.

To achieve this pass -O0 in CMAKE_CXX_FLAGS and remove 'depends on
!BR2_microblaze' and its comment if not available from Config.in.

Note that the comment was talking about gcc bug 68476, but this gcc
bug is a duplicate of 85180. Since all Buildroot packages now use the
reference to gcc bug 85180 and the option is named
BR2_TOOLCHAIN_HAS_GCC_BUG_85180, we use this naming as well for
bullet.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bullet/Config.in | 4 ----
 package/bullet/bullet.mk | 8 ++++++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/bullet/Config.in b/package/bullet/Config.in
index d4d69d2c9e..fc285ab33a 100644
--- a/package/bullet/Config.in
+++ b/package/bullet/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_BULLET
 	bool "bullet"
 	depends on BR2_INSTALL_LIBSTDCPP
-	# Affected by
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68476
-	depends on !BR2_microblaze
 	help
 	  Bullet is a Collision Detection and Rigid Body Dynamics
 	  Library.
@@ -12,4 +9,3 @@ config BR2_PACKAGE_BULLET
 
 comment "bullet needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_microblaze
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 36aaa157e1..f343213702 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -23,4 +23,12 @@ else
 BULLET_CONF_OPTS += -DBUILD_EXTRAS=OFF
 endif
 
+BULLET_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+BULLET_CXXFLAGS += -O0
+endif
+
+BULLET_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(BULLET_CXXFLAGS)"
+
 $(eval $(cmake-package))
