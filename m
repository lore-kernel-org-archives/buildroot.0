From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 17 May 2020 12:28:23 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: disable feature-relocatable
Message-ID: <20200517102823.15132-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable feature-relocatable to avoid a path mismatch while searching qml
files and buildroot BR2_ROOTFS_MERGED_USR feature enabled.

As described in [1] with feature-relocatable Qt determines the search
pathes relative to the location of libQt5Core.so, with BR2_ROOTFS_MERGED_USR
enabled found first under the symlink path '/lib' instead of the install
path '/usr/lib' and searches sequentially for qml files under '/qml' instead
of the correct '/usr/qml'.

Fixes:
  - https://bugs.busybox.net/show_bug.cgi?id=12906

[1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4ac872639ed0dd3ae6627e05bdda821f7d128500

Reported-by: Joonas Harjum?ki <jharjuma@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qt5base.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 97315496b9..374285a825 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -18,6 +18,9 @@ QT5BASE_INSTALL_STAGING = YES
 #     want to use the Buildroot packaged zlib
 #  * -system-pcre because pcre is mandatory to build Qt, and we
 #    want to use the one packaged in Buildroot
+#  * -no-feature-relocatable to work around path mismatch
+#     while searching qml files and buildroot BR2_ROOTFS_MERGED_USR
+#     feature enabled 
 QT5BASE_CONFIGURE_OPTS += \
 	-optimized-qmake \
 	-no-cups \
@@ -25,7 +28,8 @@ QT5BASE_CONFIGURE_OPTS += \
 	-system-zlib \
 	-system-pcre \
 	-no-pch \
-	-shared
+	-shared \
+	-no-feature-relocatable
 
 # starting from version 5.9.0, -optimize-debug is enabled by default
 # for debug builds and it overrides -O* with -Og which is not what we
-- 
2.26.2
