From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Sep 2014 21:39:36 +0200
Subject: [Buildroot] [PATCH 13 of 13] manual/user guide/customization: add
 section on layered customization
In-Reply-To: <patchbomb.1411069163@localhost>
References: <patchbomb.1411069163@localhost>
Message-ID: <725a43220424c4bcdfd8.1411069176@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inspired by some text in the 'project-specific patches' section, this patch
adds a separate section on layering customizations by providing multiple
post-build scripts, multiple rootfs overlays, etc.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/customize-directory-structure.txt |  51 +++++++++++++++++++
 docs/manual/customize-patches.txt             |  40 +--------------
 2 files changed, 52 insertions(+), 39 deletions(-)

diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
--- a/docs/manual/customize-directory-structure.txt
+++ b/docs/manual/customize-directory-structure.txt
@@ -56,3 +56,54 @@
 Note: if you choose to place this structure outside of the Buildroot
 tree using +BR2_EXTERNAL+, the <company> and possibly <boardname>
 components may be superfluous and can be left out.
+
+==== Implementing layered customizations
+
+It is quite common for a user to have several related projects that partly
+need the same customizations. Instead of duplicating these
+customizations for each project, it is recommended to use a layered
+customization approach, as explained in this section.
+
+Almost all of the customization methods available in Buildroot, like
+post-build scripts and root filesystem overlays, accept a
+space-separated list of items. The specified items are always treated in
+order, from left to right. By creating more than one such item, one for
+the common customizations and another one for the really
+project-specific customizations, you can avoid unnecessary duplication.
+Each layer is typically embodied by a separate directory inside
++board/<company>/+. Depending on your projects, you could even introduce
+more than two layers.
+
+An example directory structure for where a user has two customization
+layers 'common' and 'fooboard' is:
+
+-----
++-- board/
+    +-- <company>/
+        +-- common/
+        |   +-- post_build.sh
+        |   +-- rootfs_overlay/
+        |   |   +-- ...
+        |   +-- patches/
+        |       +-- ...
+        |
+        +-- fooboard/
+            +-- linux.config
+            +-- busybox.config
+            +-- <other configuration files>
+            +-- post_build.sh
+            +-- rootfs_overlay/
+            |   +-- ...
+            +-- patches/
+                +-- ...
+-----
+
+For example, if the user has the +BR2_GLOBAL_PATCH_DIR+ configuration
+option set as:
+
+-----
+BR2_GLOBAL_PATCH_DIR="board/<company>/common/patches board/<company>/fooboard/patches"
+-----
+
+then first the patches from the 'common' layer would be applied,
+followed by the patches from the 'fooboard' layer.
diff --git a/docs/manual/customize-patches.txt b/docs/manual/customize-patches.txt
--- a/docs/manual/customize-patches.txt
+++ b/docs/manual/customize-patches.txt
@@ -10,13 +10,7 @@
 
 The +BR2_GLOBAL_PATCH_DIR+ configuration option can be used to specify
 a space separated list of one or more directories containing package
-patches. By specifying multiple global patch directories, a user could
-implement a layered approach to patches. This could be useful when a
-user has multiple boards that share a common processor architecture.
-It is often the case that a subset of patches for a package need to be
-shared between the different boards a user has. However, each board
-may require specific patches for the package that build on top of the
-common subset of patches.
+patches.
 
 For a specific version +<packageversion>+ of a specific package
 +<packagename>+, patches are applied from +BR2_GLOBAL_PATCH_DIR+ as
@@ -63,35 +57,3 @@
 patches that are applied after patches available in +BR2_GLOBAL_PATCH_DIR+,
 as it is done from a post-patch hook of the Linux package.
 
-An example directory structure for where a user has multiple
-directories specified for +BR2_GLOBAL_PATCH_DIR+ may look like this:
-
------
-board/
-+-- common-fooarch
-|   +-- patches
-|       +-- linux
-|       |   +-- linux-patch1.patch
-|       |   +-- linux-patch2.patch
-|       +-- uboot
-|       +-- foopkg
-+-- fooarch-board
-    +-- patches
-        +-- linux
-        |   +-- linux-patch3.patch
-        +-- uboot
-        +-- foopkg
------
-
-If the user has the +BR2_GLOBAL_PATCH_DIR+ configuration option set as
-follows:
-
------
-BR2_GLOBAL_PATCH_DIR="board/common-fooarch/patches board/fooarch-board/patches"
------
-
-Then the patches would applied as follows for the Linux kernel:
-
-. board/common-fooarch/patches/linux/linux-patch1.patch
-. board/common-fooarch/patches/linux/linux-patch2.patch
-. board/fooarch-board/patches/linux/linux-patch3.patch
