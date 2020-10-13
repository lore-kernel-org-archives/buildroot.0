From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue, 13 Oct 2020 17:36:02 -0500
Subject: [Buildroot] [PATCH v2 2/5] docs/manual: add section about
 br2-external skeleton
In-Reply-To: <20201013194149.171518-1-brandon.maier@rockwellcollins.com>
References: <20201013194149.171518-1-brandon.maier@rockwellcollins.com>
Message-ID: <20201013223605.188920-2-brandon.maier@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
---
 docs/manual/customize-outside-br.txt | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 5f7d623aea..c24516680c 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -202,6 +202,7 @@ a set of files that define those alternatives:
   will then be listed in the toolchain selection;
 * +provides/jpeg.in+ defines the alternative libjpeg implementations;
 * +provides/openssl.in+ defines the alternative openssl implementations.
+* +provides/skeleton.in+ defines the alternative skeleton implementations.
 
 ===== Free-form content
 
@@ -321,6 +322,27 @@ illustration, of course):
   |     |$(eval $(toolchain-external-package))
   |     `----
   |
+  |- provides/skeleton.in
+  |     |config BR2_ROOTFS_SKELETON_MINE
+  |     |    bool "my custom skeleton"
+  |     |    select BR2_PACKAGE_SKELETON_MINE
+  |     `----
+  |- package/skeleton-mine/Config.in
+  |     |config BR2_PACKAGE_SKELETON_MINE
+  |     |    bool
+  |     |    select BR2_PACKAGE_HAS_SKELETON
+  |     |
+  |     |config BR2_PACKAGE_PROVIDES_SKELETON
+  |     |    default "skeleton-mine" if BR2_PACKAGE_SKELETON_MINE
+  |     `----
+  |- package/skeleton-mine/skeleton-mine.mk
+  |     |SKELETON_MINE_ADD_TOOLCHAIN_DEPENDENCY = NO
+  |     |SKELETON_MINE_ADD_SKELETON_DEPENDENCY = NO
+  |     |SKELETON_MINE_PROVIDES = skeleton
+  |     |SKELETON_MINE_INSTALL_STAGING = YES
+  |     |$(eval $(generic-package))
+  |     `----
+  |
   |- linux/Config.ext.in
   |     |config BR2_LINUX_KERNEL_EXT_EXAMPLE_DRIVER
   |     |    bool "example-external-driver"
-- 
2.28.0
