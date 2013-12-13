From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 13 Dec 2013 04:09:21 -0600
Subject: [Buildroot] [PATCH v3 2/2] manual: update for multiple global patch
	dirs
In-Reply-To: <1386929361-21376-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1386929361-21376-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1386929361-21376-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updating the documentation to reflect that multiple directories can
now be specified for BR2_GLOBAL_PATCH_DIR. Along with giving an
example use case of how to use multiple global patch directories.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

---
Changes v2 -> v3:
  - None

Changes v1 -> v2:
  - Fixed minor spelling mistakes and wording (suggested by Thomas D)
---
 docs/manual/customize-packages.txt |   70 +++++++++++++++++++++++++++++++-----
 docs/manual/patch-policy.txt       |   13 ++++---
 2 files changed, 70 insertions(+), 13 deletions(-)

diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
index 1820c54..8955756 100644
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-packages.txt
@@ -8,16 +8,68 @@ It is sometimes useful to apply 'extra' patches to packages - over and
 above those provided in Buildroot. This might be used to support custom
 features in a project, for example, or when working on a new architecture.
 
-The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
-used to specify a directory containing global package patches.
+The +BR2_GLOBAL_PATCH_DIR+ configuration option can be used to specify
+a space separated list of one or more directories containing global
+package patches. By specifying multiple global patch directories, a
+user could implement a layered approach to patches. This could be
+useful when a user has multiple boards that share a common processor
+architecture. It is often the case that a subset of patches for a
+package need to be shared between the different boards a user has.
+However, each board may require specific patches for the package
+that build on top of the common subset of patches.
 
-For a specific version <packageversion> of a specific package <packagename>,
-patches are applied as follows.
+For a specific version +<packageversion>+ of a specific package
++<packagename>+, patches are applied as follows:
 
-First, the default Buildroot patch set for the package is applied.
+. First, the default Buildroot patch set for the package is applied.
 
-If the directory +$(BR2_GLOBAL_PATCH_DIR)/<packagename>/<packageversion>+
-exists, then all +*.patch+ files in the directory will be applied.
+. Then for every directory - +<global-patch-dir>+ - that exists in
+  +BR2_GLOBAL_PATCH_DIR+, the following will be done:
++
+* If the directory
+  +<global-patch-dir>/<packagename>/<packageversion>/+ exists, then
+  all *.patch files in this directory will be applied.
++
+* Otherwise, if the directory +<global-patch-dir>/<packagename>+ exists,
+  then all *.patch files in the directory will be applied.
 
-Otherwise, if the directory +$(BR2_GLOBAL_PATCH_DIR)/<packagename>+
-exists, then all +*.patch+ files in the directory will be applied.
+The +BR2_GLOBAL_PATCH_DIR+ option is the preferred method for
+specifying a custom patch directory for packages. It can be used to
+specify a patch directory for any package in buildroot. It should also
+be used in place of the custom patch directory options for Linux,
+U-Boot, and other packages that already haved custom patch directory
+options available to them. By doing this, it will allow a user to
+manage their patches from one top-level directory.
+
+An example directory structure for where a user has multiple
+directories specified for +BR2_GLOBAL_PATCH_DIR+ may look like this:
+
+-----
+board/
++-- common-fooarch
+|   +-- patches
+|       +-- linux
+|       |   +-- linux-patch1.patch
+|       |   +-- linux-patch2.patch
+|       +-- u-boot
+|       +-- foopkg
++-- fooarch-board
+    +-- patches
+        +-- linux
+        |   +-- linux-patch3.patch
+        +-- u-boot
+        +-- foopkg
+-----
+
+If the user has the +BR2_GLOBAL_PATCH_DIR+ configuration option set as
+follows:
+
+-----
+BR2_GLOBAL_PATCH_DIR="board/common-fooarch board/fooarch-board"
+-----
+
+Then the patches would applied as follows for the Linux kernel:
+
+. board/common-fooarch/patches/linux/linux-patch1.patch
+. board/common-fooarch/patches/linux/linux-patch2.patch
+. board/fooarch-board/patches/linux/linux-patch1.patch
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index d9bc8ca..26586ad 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -50,8 +50,9 @@ Global patch directory
 ^^^^^^^^^^^^^^^^^^^^^^
 
 The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
-used to specify a directory containing global package patches. See
-xref:packages-custom[] for details.
+used to specify a space separated list of one or more directories
+containing global package patches. See xref:packages-custom[] for
+details.
 
 
 How patches are applied
@@ -72,11 +73,15 @@ How patches are applied
 +
 * Otherwise, patch files matching +<packagename>-*.patch+
   are applied in alphabetical order.
-  So, to ensure they are applied in the right order, it is hightly
-  recommended to named the patch files like this:
+  So, to ensure they are applied in the right order, it is highly
+  recommended to name the patch files like this:
   +<packagename>-<number>-<description>.patch+, where +<number>+
   refers to the 'apply order'.
 
+. If +BR2_GLOABL_PATCH_DIR+ is defined, the directories will be
+  enumerated in the order they are specified for patches. The patches
+  are applied as described in the previous step.
+
 . Run the +<packagename>_POST_PATCH_HOOKS+ commands if defined.
 
 If something goes wrong in the steps _3_ or _4_, then the build fails.
-- 
1.7.9.5
