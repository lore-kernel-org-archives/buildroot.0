From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 11:37:24 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/opencv3: security
 bump to version 3.4.9
Message-ID: <20200112104514.58AF188933@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4690339f2af34b3e57c7cda4b3e4a090f96ada0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Fix CVE-2019-14491: An issue was discovered in OpenCV before 3.4.7
  and 4.x before 4.1.1. There is an out of bounds read in the function
  cv::predictOrdered<cv::HaarEvaluator> in
  modules/objdetect/src/cascadedetect.hpp, which leads to denial of service.
- Fix CVE-2019-14492: An issue was discovered in OpenCV before 3.4.7
  and 4.x before 4.1.1. There is an out of bounds read/write in the
  function HaarEvaluator::OptFeature::calc in
  modules/objdetect/src/cascadedetect.hpp, which leads to denial of service.
- atomic workaround is not needed since version 3.4.8 and
  https://github.com/opencv/opencv/commit/464972855e25f71667009b8fe88092d11aab0297
- Update hash of license file (Xperience.AI added:
  https://github.com/opencv/opencv/commit/766465ce9483c20d54bfce422d285c077f6502bd)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f6fb2cae0691d25b034b12a16261ee26096db7d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.hash | 4 ++--
 package/opencv3/opencv3.mk   | 7 +------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 0b88b52da5..4953d01a1c 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 e7d311ff97f376b8ee85112e2b536dbf4bdf1233673500175ed7cf21a0089f6d  opencv3-3.4.6.tar.gz
-sha256 488b640f88bc72a1f9bbb985bde8352ed8826b863f0b3e14f7038c44bf95d6bc  LICENSE
+sha256 b7ea364de7273cfb3b771a0d9c111b8b8dfb42ff2bcd2d84681902fb8f49892a  opencv3-3.4.9.tar.gz
+sha256 c3596f2f886631ac49af2c9a201ca559f850bb5726bdc25eacbe2369a70caad9  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 8fb97b5135..a6d795bd85 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.6
+OPENCV3_VERSION = 3.4.9
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
@@ -13,11 +13,6 @@ OPENCV3_SUPPORTS_IN_SOURCE_BUILD = NO
 
 OPENCV3_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-# Uses __atomic_fetch_add_4
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-OPENCV3_CXXFLAGS += -latomic
-endif
-
 # Fix c++11 build with missing std::exception_ptr
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
 OPENCV3_CXXFLAGS += -DCV__EXCEPTION_PTR=0
