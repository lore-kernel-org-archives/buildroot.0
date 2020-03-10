From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 Mar 2020 23:31:32 +0100
Subject: [Buildroot] [PATCH 1/1] Revert "package/opencv3: bump to version
 4.2.0"
Message-ID: <20200310223132.668486-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 5e51bb2756ee5063eff9a45a46033a449e2a6195.
Indeed, version 4.x is not backward with opencv 3.x, most of the C API
has been removed as stated in https://opencv.org/opencv-4-0.

Moreover, these issues should also be fixed:
 - pkg-config file is not installed by default since
 https://github.com/opencv/opencv/commit/e755a2a6e48ae02dd5136a628cc4148566a08225
 - layout of include files and pkg-config file name are different since
 https://github.com/opencv/opencv/commit/a95673287433fc810eda2d88b94bb234298c4cd5

As a result, ffmpeg fails to build with opencv 4.2.0.

Moreover, it should be noted that -DPROTOBUF_UPDATE_FILES=ON should be
applied in a separate patch to fix existing build failure with 3.4.9 as
stated in https://patchwork.ozlabs.org/patch/1222308

Fixes:
 - http://autobuild.buildroot.org/results/ef1d09d8b234807dcd993422f9557e5c34506013

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/opencv3.hash | 4 ++--
 package/opencv3/opencv3.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index ef95f24ad3..4953d01a1c 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9ccb2192d7e8c03c58fee07051364d94ed7599363f3b0dce1c5e6cc11c1bb0ec  opencv3-4.2.0.tar.gz
-sha256  c3596f2f886631ac49af2c9a201ca559f850bb5726bdc25eacbe2369a70caad9  LICENSE
+sha256 b7ea364de7273cfb3b771a0d9c111b8b8dfb42ff2bcd2d84681902fb8f49892a  opencv3-3.4.9.tar.gz
+sha256 c3596f2f886631ac49af2c9a201ca559f850bb5726bdc25eacbe2369a70caad9  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 300631ce51..d37cd45adf 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 4.2.0
+OPENCV3_VERSION = 3.4.9
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
@@ -283,10 +283,10 @@ OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PROTOBUF),y)
-OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=ON -DPROTOBUF_UPDATE_FILES=ON
+OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=ON
 OPENCV3_DEPENDENCIES += protobuf
 else
-OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=OFF -DPROTOBUF_UPDATE_FILES=OFF
+OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT5),y)
-- 
2.25.1
