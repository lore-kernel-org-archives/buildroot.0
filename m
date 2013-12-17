From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 17 Dec 2013 08:48:50 -0600
Subject: [Buildroot] [PATCH v5 2/2] manual: update for multiple global patch
	dirs
In-Reply-To: <1387291730-6513-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1387291730-6513-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1387291730-6513-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updating the documentation to reflect that multiple directories can
now be specified for BR2_GLOBAL_PATCH_DIR. Along with giving an
example use case of how to use multiple global patch directories.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v4 -> v5:
  - Fixed minor wording issue and spelling (suggested by Thomas D)

Changes v3 -> v4:
  - Fixed minor spelling mistakes and wording (suggested by Arnout)
  - Reword section about order that patches are applied along with
    making it clearer about when to use BR2_GLOBAL_PATCH_DIR
    (suggested by Arnout)

Changes v2 -> v3:
  - None

Changes v1 -> v2:
  - Fixed minor spelling mistakes and wording (suggested by Thomas D)
---
 docs/manual/customize-packages.txt |   92 ++++++++++++++++++++++++++++++++----
 docs/manual/patch-policy.txt       |   20 +++++---
 2 files changed, 96 insertions(+), 16 deletions(-)

diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
index 1820c54..03eac4f 100644
--- a/docs/manual/customize-packages.txt
+++ b/docs/manual/customize-packages.txt
@@ -8,16 +8,90 @@ It is sometimes useful to apply 'extra' patches to packages - over and
 above those provided in Buildroot. This might be used to support custom
 features in a project, for example, or when working on a new architecture.
 
-The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
-used to specify a directory containing global package patches.
+The +BR2_GLOBAL_PATCH_DIR+ configuration option can be used to specify
+a space separated list of one or more directories containing package
+patches. By specifying multiple global patch directories, a user could
+implement a layered approach to patches. This could be useful when a
+user has multiple boards that share a common processor architecture.
+It is often the case that a subset of patches for a package need to be
+shared between the different boards a user has. However, each board
+may require specific patches for the package that build on top of the
+common subset of patches.
 
-For a specific version <packageversion> of a specific package <packagename>,
-patches are applied as follows.
+For a specific version +<packageversion>+ of a specific package
++<packagename>+, patches are applied from +BR2_GLOBAL_PATCH_DIR+ as
+follows:
 
-First, the default Buildroot patch set for the package is applied.
+. For every directory - +<global-patch-dir>+ - that exists in
+  +BR2_GLOBAL_PATCH_DIR+, a +<package-patch-dir>+ will be determined as
+  follows:
++
+* +<global-patch-dir>/<packagename>/<packageversion>/+ if the
+  directory exists.
++
+* Otherwise, +<global-patch-dir>/<packagename>+ if the directory
+  exists.
 
-If the directory +$(BR2_GLOBAL_PATCH_DIR)/<packagename>/<packageversion>+
-exists, then all +*.patch+ files in the directory will be applied.
+. Patches will then be applied from a +<package-patch-dir>+ as
+  follows:
++
+* If a +series+ file exists in the package directory, then patches are
+  applied according to the +series+ file;
++
+* Otherwise, patch files matching +<packagename>-*.patch+
+  are applied in alphabetical order.
+  So, to ensure they are applied in the right order, it is highly
+  recommended to name the patch files like this:
+  +<packagename>-<number>-<description>.patch+, where +<number>+
+  refers to the 'apply order'.
 
-Otherwise, if the directory +$(BR2_GLOBAL_PATCH_DIR)/<packagename>+
-exists, then all +*.patch+ files in the directory will be applied.
+For information about how patches are applied for a package, see
+xref:patch-apply-order[]
+
+The +BR2_GLOBAL_PATCH_DIR+ option is the preferred method for
+specifying a custom patch directory for packages. It can be used to
+specify a patch directory for any package in buildroot. It should also
+be used in place of the custom patch directory options that are
+available for packages such as U-Boot and Barebox. By doing this, it
+will allow a user to manage their patches from one top-level
+directory.
+
+The exception to +BR2_GLOBAL_PATCH_DIR+ being the preferred method for
+specifying custom patches is +BR2_LINUX_KERNEL_PATCH+.
++BR2_LINUX_KERNEL_PATCH+ should be used to specify kernel patches that
+are available at an URL. *Note:* +BR2_LINUX_KERNEL_PATCHES+ are applied
+after patches available in +BR2_GLOBAL_PATCH_DIR+ as it is a patch
+post-hook step for the Linux package.
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
+. board/fooarch-board/patches/linux/linux-patch3.patch
diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index d9bc8ca..c67d684 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -50,10 +50,11 @@ Global patch directory
 ^^^^^^^^^^^^^^^^^^^^^^
 
 The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
-used to specify a directory containing global package patches. See
-xref:packages-custom[] for details.
-
+used to specify a space separated list of one or more directories
+containing global package patches. See xref:packages-custom[] for
+details.
 
+[[patch-apply-order]]
 How patches are applied
 ~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -64,19 +65,24 @@ How patches are applied
 . If +<packagename>_PATCH+ is defined, then patches from these
   tarballs are applied;
 
-. If there are some +*.patch+ files in the package directory or in the
-  a package subdirectory named +<packageversion>+, then:
+. If there are some +*.patch+ files in the package's Buildroot
+  directory or in a package subdirectory named +<packageversion>+,
+  then:
 +
 * If a +series+ file exists in the package directory, then patches are
   applied according to the +series+ file;
 +
 * Otherwise, patch files matching +<packagename>-*.patch+
   are applied in alphabetical order.
-  So, to ensure they are applied in the right order, it is hightly
-  recommended to named the patch files like this:
+  So, to ensure they are applied in the right order, it is highly
+  recommended to name the patch files like this:
   +<packagename>-<number>-<description>.patch+, where +<number>+
   refers to the 'apply order'.
 
+. If +BR2_GLOBAL_PATCH_DIR+ is defined, the directories will be
+  enumerated in the order they are specified. The patches are applied
+  as described in the previous step.
+
 . Run the +<packagename>_POST_PATCH_HOOKS+ commands if defined.
 
 If something goes wrong in the steps _3_ or _4_, then the build fails.
-- 
1.7.9.5
