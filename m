From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 16:53:04 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/assimp: re-enable
 package on Microblaze
Message-ID: <20190606154047.64BA281922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c64c2c362ccf991edb853044c7725aaa1d0fe90e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Microblaze ccc version < 8.x the build hangs due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. To avoid this, the
assimp package has a !BR2_microblaze dependency. However, gcc bug
85180 only triggers when optimization is enabled, so we can work
around the issue by passing -O0, which is what we do in other
Buildroot packages to work around this bug.

So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_85180, and
re-enables assimp on Microblaze.

Note that the comment was talking about gcc bug 71124, but this gcc
bug is a duplicate of 85180. Since all Buildroot packages now use the
reference to gcc bug 85180 and the option is named
BR2_TOOLCHAIN_HAS_GCC_BUG_85180, we use this naming as well for
assimp.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b7c9a7d60261c5836ac707835c8e98f81655106e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/assimp/Config.in | 5 -----
 package/assimp/assimp.mk | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 41c1bb348b..630758f3e7 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_ASSIMP
 	bool "assimp"
-	# All gcc versions affected by
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124, that
-	# cause an infinite loop in gcc when building this package.
-	depends on !BR2_microblaze
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ZLIB
 	help
@@ -16,5 +12,4 @@ config BR2_PACKAGE_ASSIMP
 	  http://www.assimp.org
 
 comment "assimp needs a toolchain w/ C++"
-	depends on !BR2_microblaze
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 1316720423..5720f9793f 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -24,6 +24,10 @@ ifeq ($(BR2_sh):$(BR2_STATIC_LIBS):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:y:)
 ASSIMP_CXXFLAGS += -O2
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+ASSIMP_CXXFLAGS += -O0
+endif
+
 ASSIMP_CONF_OPTS += -DASSIMP_BUILD_TESTS=OFF \
 	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(ASSIMP_CXXFLAGS)"
 
