From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  4 May 2021 22:51:32 +0200
Subject: [Buildroot] [PATCH v3 1/7] package/Makefile.in: expose CONFIG_DIR
 to post-build/post-image scripts
In-Reply-To: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210504205139.1055360-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes, post-build or post-image scripts need to reinvoke
Buildroot's make, for example to execute "make printvars".

However, so far none of the variables exposed to post-build/post-image
scripts allowed to do that in a way that worked for both in-tree and
out-of-tree builds. Indeed:

 * "make printvars" would work for in-tree builds, but not out of tree
   builds

 * "make -C ${O} printvars" would work for out-of-tree builds, but not
   in-tree builds

In order to solve this, this commit exposes $(CONFIG_DIR) to
post-build/post-image scripts, through the EXTRA_ENV variable.

The documentation is updated accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/customize-post-image.txt | 3 ++-
 docs/manual/customize-rootfs.txt     | 3 +++
 package/Makefile.in                  | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/manual/customize-post-image.txt b/docs/manual/customize-post-image.txt
index 90ea2b9328..5308093d06 100644
--- a/docs/manual/customize-post-image.txt
+++ b/docs/manual/customize-post-image.txt
@@ -28,7 +28,8 @@ different sets of arguments to each script.
 
 Again just like for the post-build scripts, the scripts have access to
 the environment variables +BR2_CONFIG+, +HOST_DIR+, +STAGING_DIR+,
-+TARGET_DIR+, +BUILD_DIR+, +BINARIES_DIR+ and +BASE_DIR+.
++TARGET_DIR+, +BUILD_DIR+, +BINARIES_DIR+, +CONFIG_DIR+ and
++BASE_DIR+.
 
 The post-image scripts will be executed as the user that executes
 Buildroot, which should normally _not_ be the root user. Therefore, any
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index e1dbadda5b..8b361f8621 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -65,6 +65,9 @@ In addition, you may also use these environment variables:
   - +BUILD_DIR+: the directory where packages are extracted and built
   - +BINARIES_DIR+: the place where all binary files (aka images) are
     stored
+  - +CONFIG_DIR+: the directory containing the .config file, and
+    therefore the top-level Buildroot Makefile to use (which is
+    correct for both in-tree and out-of-tree builds)
   - +BASE_DIR+: the base output directory
 
 Below three more methods of customizing the target filesystem are
diff --git a/package/Makefile.in b/package/Makefile.in
index 51f5cbce4f..f4028bc67c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -318,6 +318,7 @@ EXTRA_ENV = \
 	PATH=$(BR_PATH) \
 	BR2_DL_DIR=$(BR2_DL_DIR) \
 	BUILD_DIR=$(BUILD_DIR) \
+	CONFIG_DIR=$(CONFIG_DIR) \
 	O=$(CANONICAL_O)
 
 ################################################################################
-- 
2.30.2
