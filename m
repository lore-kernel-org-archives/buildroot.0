From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 23:38:25 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/flann: re-enable package on
 Microblaze
In-Reply-To: <20190527213826.114001-1-giulio.benetti@micronovasrl.com>
References: <2e2b06bc-ee6a-7d38-5c14-a79dd51685dd@micronovasrl.com>
 <20190527213826.114001-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190527213826.114001-4-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version <= 9.x build fails tue to bug 68485:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. To avoid this, the
flann package has a !BR2_microblaze dependency. However, gcc bug 68485
only triggers when optimization is enabled, so we can work around the
issue by passing -O0, which is what we do in other Buildroot packages to
work around this bug.

So, this commit passes -O0 when BR2_TOOLCHAIN_HAS_GCC_BUG_68485, and
re-enables flann on Microblaze.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/flann/Config.in | 4 ----
 package/flann/flann.mk  | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index d091ec18a0..b57a6d5f9b 100644
--- a/package/flann/flann.mk
+++ b/package/flann/flann.mk
@@ -18,4 +18,8 @@ FLANN_CONF_OPTS = \
 	-DPYTHON_EXECUTABLE=OFF \
 	-DCMAKE_DISABLE_FIND_PACKAGE_HDF5=TRUE
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+FLANN_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O0"
+endif
+
 $(eval $(cmake-package))
-- 
2.17.1
