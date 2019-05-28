From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 28 May 2019 14:35:43 +0200
Subject: [Buildroot] [PATCH] package/bullet: re-enable package when gcc bug
 85180 is present
Message-ID: <20190528123543.43882-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x the build hangs to gcc bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This package has
been excluded from building if the toolchain is affected by gcc bug
85180. To be consistent with how we deal with this issue in other
packages, we re-enable the package and instead work around the issue
by building with -O0, since gcc bug 85180 manifests itself only when
optimization is enabled.

To achieve this pass -O0 to CMAKE_CXX_FLAGS in CONF_OPT and remove
'depends on !BR2_microblaze' and its comment if not available from
Config.in.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/bullet/Config.in | 4 ----
 package/bullet/bullet.mk | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index 36aaa157e1..7cde20ee58 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -23,4 +23,8 @@ else
 BULLET_CONF_OPTS += -DBUILD_EXTRAS=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+BULLET_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O0"
+endif
+
 $(eval $(cmake-package))
-- 
2.17.1
