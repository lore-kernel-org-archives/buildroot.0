From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 16:30:31 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/Makefile.in:
 expose CONFIG_DIR to post-build/post-image scripts
Message-ID: <20210508140507.4A90086BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8650a3c05ee8b753fae91238202d22d7d3c02911
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Sometimes, post-build or post-image scripts need to reinvoke
Buildroot's make, for example to execute "make printvars".

However, so far post-build/image/fakeroot can't trivially run printvars
in a way that worked for both in-tree and out-of-tree builds. Indeed:

 * "make printvars" would work for in-tree builds, but not out of tree
   builds

 * "make -C ${O} printvars" would work for out-of-tree builds, but not
   in-tree builds

 * "make -C ${BR2_CONFIG%/*} printvars" works in both cases, but it is
   a bit cryptic, and two maintainers did not even immediately think of
   it

In order to solve this, this commit exposes $(CONFIG_DIR) to
post-build/image/fakeroot scripts, through the EXTRA_ENV variable.

The documentation is updated accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - reference BR2_CONFIG as an exemple
  - slightly reword the commit log accordingly
  - move the doc for CONFIG_DIR next to that of BR2_CONFIG
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit efdcd651bf8fe8e9a291932397eca8731483d17c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index e1dbadda5b..e46306fd2a 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -60,6 +60,9 @@ The post-build scripts are run with the main Buildroot tree as current
 In addition, you may also use these environment variables:
 
   - +BR2_CONFIG+: the path to the Buildroot .config file
+  - +CONFIG_DIR+: the directory containing the .config file, and
+    therefore the top-level Buildroot Makefile to use (which is
+    correct for both in-tree and out-of-tree builds)
   - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
     xref:generic-package-reference[]
   - +BUILD_DIR+: the directory where packages are extracted and built
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
