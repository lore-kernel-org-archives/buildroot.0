From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 21:52:58 +0200
Subject: [Buildroot] [git commit] package/flann: re-enable package on
 microblaze
Message-ID: <20190619195210.DCB5B81843@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=467552234da62b7c7ddfe59dd661735bd5a1eb89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With Microblaze gcc version <= 9.x, the build of flannel fails due to
gcc bug 68485: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485.

To avoid this, the flann package has a !BR2_microblaze
dependency. However, gcc bug 68485 only triggers when optimization is
enabled, so we can work around the issue by passing -O0, which is what
we do in other Buildroot packages to work around this bug.

So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_68485, and
re-enables flann on Microblaze.

Note that the comment was talking about gcc bug 69401, but this gcc
bug is a duplicate of 68485. Since all Buildroot packages now use the
reference to gcc bug 68485 and the option is named
BR2_TOOLCHAIN_HAS_GCC_BUG_68485, we use this naming as well for flann.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flann/Config.in | 4 ----
 package/flann/flann.mk  | 8 ++++++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/flann/Config.in b/package/flann/Config.in
index a2cd50c867..3725fc784f 100644
--- a/package/flann/Config.in
+++ b/package/flann/Config.in
@@ -2,9 +2,6 @@ config BR2_PACKAGE_FLANN
 	bool "flann"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
-	# all gcc versions fail to build flann on Microblaze due to
-	# gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69401
-	depends on !BR2_microblaze
 	help
 	  FLANN is a library for performing fast approximate nearest
 	  neighbor searches in high dimensional spaces. It contains a
@@ -25,5 +22,4 @@ config BR2_PACKAGE_FLANN_EXAMPLES
 endif
 
 comment "flann needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_microblaze
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/flann/flann.mk b/package/flann/flann.mk
index d091ec18a0..6c2e6a9e78 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -18,4 +18,12 @@ FLANN_CONF_OPTS = \
 	-DPYTHON_EXECUTABLE=OFF \
 	-DCMAKE_DISABLE_FIND_PACKAGE_HDF5=TRUE
 
+FLANN_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+FLANN_CXXFLAGS += -O0
+endif
+
+FLANN_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(FLANN_CXXFLAGS)"
+
 $(eval $(cmake-package))
