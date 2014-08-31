From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 31 Aug 2014 14:06:49 +0200
Subject: [Buildroot] [PATCH for 2014.08] Manual improvements part 5
Message-ID: <719dc9b97304bf8fdfbd.1409486809@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch reworks the section on root filesystem customization as follows:
- use labeled list instead of bulleted list to clarify the different methods
- move rootfs overlay and post-build scripts to the top and label them as
  recommended.
- split post-image to a separate section, as it is not related to the target
  filesystem customization
- line up post-build and post-image explanations, for example regarding
  working directory of the script
- general expansion of some of the explanation
- general rewording

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/customize-rootfs.txt |  153 ++++++++++++++++--------------
 docs/manual/customize.txt        |    2 +
 2 files changed, 84 insertions(+), 71 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -4,85 +4,96 @@
 [[rootfs-custom]]
 === Customizing the generated target filesystem
 
-Besides changing one or another configuration through +make *config+,
-there are a few ways to customize the resulting target filesystem.
+Besides changing the configuration through +make *config+,
+there are a few other ways to customize the resulting target filesystem.
 
-* Customize the target filesystem directly and rebuild the image.  The
-  target filesystem is available under +output/target/+.  You can
-  simply make your changes here and run make afterwards - this will
-  rebuild the target filesystem image. This method allows you to do
-  anything to the target filesystem, but if you decide to completely
-  rebuild your toolchain and tools, these changes will be lost. This
-  solution is therefore only useful for quick tests only: _changes do
-  not survive the +make clean+ command_. Once you have validated your
-  changes, you should make sure that they will persist after a +make
-  clean+ by using one of the following methods.
+The two recommended methods, which can co-exist, are root filesystem
+overlay(s) and post build script(s).
 
-* Create a filesystem overlay: a tree of files that are copied directly
-  over the target filesystem after it has been built.  Set
-  +BR2_ROOTFS_OVERLAY+ to the top of the tree.  +.git+, +.svn+, +.hg+
-  directories, +.empty+ files and files ending with +~+ are excluded.
-  _Among these first 3 methods, this one should be preferred_.
+Root filesystem overlays (+BR2_ROOTFS_OVERLAY+)::
++
+A filesystem overlay is a tree of files that is copied directly
+  over the target filesystem after it has been built. To enable this
+  feature, set config option +BR2_ROOTFS_OVERLAY+ (in the +System
+  configuration+ menu) to the root of the overlay. You can even specify
+  multiple overlays, space-separated. If you specify a relative path,
+  it will be relative to the root of the Buildroot tree. Hidden
+  directories of version control systems, like +.git+, +.svn+, +.hg+,
+  etc., files called +.empty+ and files ending in +~+ are excluded from
+  the copy.
 
-* In the Buildroot configuration, you can specify the paths to one or
-  more *post-build scripts*. These scripts are called in the given order,
-  'after' Buildroot builds all the selected software, but 'before' the
-  rootfs images are assembled. The +BR2_ROOTFS_POST_BUILD_SCRIPT+ allows
-  you to specify the location of your post-build scripts. This option can be
-  found in the +System configuration+ menu. The destination root
-  filesystem folder is given as the first argument to these scripts,
-  and these scripts can then be used to remove or modify any file in your
+Post-build scripts (+BR2_ROOTFS_POST_BUILD_SCRIPT+)::
++
+Post-build scripts are shell scripts called 'after' Buildroot builds
+  all the selected software, but 'before' the rootfs images are
+  assembled. To enable this feature, specify a space-separated list of
+  post-build scripts in config option +BR2_ROOTFS_POST_BUILD_SCRIPT+ (in
+  the +System configuration+ menu). If you specify a relative path, it
+  will be relative to the root of the Buildroot tree.
++
+Using post-build scripts, you can remove or modify any file in your
   target filesystem. You should, however, use this feature with care.
   Whenever you find that a certain package generates wrong or unneeded
   files, you should fix that package rather than work around it with some
   post-build cleanup scripts.
-  You may also use these variables in your post-build script:
-    - +BR2_CONFIG+: the path to the Buildroot .config file
-    - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
-      xref:generic-package-reference[]
-    - +BUILD_DIR+: the directory where packages are extracted and built
-    - +BINARIES_DIR+: the place where all binary files (aka images) are
-      stored
-    - +BASE_DIR+: the base output directory
++
+The post-build scripts are run with the main Buildroot tree as current
+  working directory. The path to the target filesystem is passed as the
+  first argument to each script. If the config option
+  +BR2_ROOTFS_POST_SCRIPT_ARGS+ is not empty, these arguments will be
+  passed to the script too. All the scripts will be passed the exact
+  same set of arguments, it is not possible to pass different sets of
+  arguments to each script.
++
+In addition, you may also use these environment variables:
 
-* Create your own 'target skeleton'. You can start with the default
-  skeleton available under +system/skeleton+ and then customize it to
-  suit your needs. The +BR2_ROOTFS_SKELETON_CUSTOM+ and
-  +BR2_ROOTFS_SKELETON_CUSTOM_PATH+ will allow you to specify the
-  location of your custom skeleton. These options can be found in the
-  +System configuration+ menu. At build time, the contents of the
-  skeleton are copied to output/target before any package
-  installation. Note that this method is *not recommended*, as it
-  duplicates the entire skeleton, which prevents from taking advantage
-  of the fixes or improvements brought to the default Buildroot
-  skeleton. The recommended method is to use the _post-build scripts_
-  mechanism described in the previous item.
+  - +BR2_CONFIG+: the path to the Buildroot .config file
+  - +HOST_DIR+, +STAGING_DIR+, +TARGET_DIR+: see
+    xref:generic-package-reference[]
+  - +BUILD_DIR+: the directory where packages are extracted and built
+  - +BINARIES_DIR+: the place where all binary files (aka images) are
+    stored
+  - +BASE_DIR+: the base output directory
 
-Note also that you can use the *post-image scripts*
-if you want to perform some specific actions 'after' all
-filesystem images have been created (for example to automatically
-extract your root filesystem tarball in a location exported by your
-NFS server, or to create a special firmware image that bundles your
-root filesystem and kernel image, or any other custom action), you can
-specify a space-separated list of scripts in the
-+BR2_ROOTFS_POST_IMAGE_SCRIPT+ configuration option. This option can be
-found in the +System configuration+ menu as well.
+Below two more methods of customizing the target filesystem are
+described, but they are not recommended.
 
-Each of those scripts will be called with the path to the +images+
-output directory as first argument, and will be executed with the main
-Buildroot source directory as the current directory. Those scripts will
-be executed as the user that executes Buildroot, which should normally
-not be the root user. Therefore, any action requiring root permissions
-in one of these _post-image scripts_ will require special handling
-(usage of fakeroot or sudo), which is left to the script developer.
+Direct modification of the target filesystem::
++
+For temporary modifications, you can modify the target filesystem
+  directly and rebuild the image. The target filesystem is available
+  under +output/target/+. After making your changes, run +make+ to
+  rebuild the target filesystem image.
++
+This method allows you to do anything to the target filesystem, but if
+  you need to clean your Buildroot tree using +make clean+, these
+  changes will be lost. Such cleaning is necessary in several cases,
+  refer to xref:full-rebuild[] for details. This solution is therefore
+  only useful for quick tests: _changes do not survive the +make clean+
+  command_. Once you have validated your changes, you should make sure
+  that they will persist after a +make clean+, using a root filesystem
+  overlay or a post-build script.
 
-Just like for the _post-build scripts_ mentioned above, you also have
-access to the following environment variables from your _post-image
-scripts_: +BR2_CONFIG+, +BUILD_DIR+, +HOST_DIR+, +STAGING_DIR+,
-+TARGET_DIR+, +BINARIES_DIR+ and +BASE_DIR+.
-
-Additionally, each of the +BR2_ROOTFS_POST_BUILD_SCRIPT+ and
-+BR2_ROOTFS_POST_IMAGE_SCRIPT+ scripts will be passed the arguments
-specified in +BR2_ROOTFS_POST_SCRIPT_ARGS+ (if that is not empty).
-All the scripts will be passed the exact same set of arguments, it
-is not possible to pass different sets of arguments to each script.
+Custom target skeleton (+BR2_ROOTFS_SKELETON_CUSTOM+)::
++
+The root filesystem image is created from a target skeleton, on top of
+  which all packages install their files. The skeleton is copied to the
+  target directory +output/target+ before any package is built and
+  installed. The default target skeleton provides the standard Unix
+  filesystem layout and some basic init scripts and configuration files.
++
+If the default skeleton (available under +system/skeleton+) does not
+  match your needs, you would typically use a root filesystem overlay or
+  post-build script to adapt it. However, if the default skeleton is
+  entirely different than what you need, using a custom skeleton may be
+  more suitable.
++
+To enable this feature, enable config option
+  +BR2_ROOTFS_SKELETON_CUSTOM+ and set +BR2_ROOTFS_SKELETON_CUSTOM_PATH+
+  to the path of your custom skeleton. Both options are available in the
+  +System configuration+ menu. If you specify a relative path, it will
+  be relative to the root of the Buildroot tree.
++
+This method is not recommended because it duplicates the entire
+  skeleton, which prevents taking advantage of the fixes or improvements
+  brought to the default skeleton in later Buildroot releases.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -40,6 +40,8 @@
 
 include::customize-rootfs.txt[]
 
+include::customize-post-image.txt[]
+
 include::customize-store.txt[]
 
 include::customize-packages.txt[]
