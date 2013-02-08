From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 22:06:41 +0100
Subject: [Buildroot] [git commit] docs/manual: slightly reword the solutions
	to customize rootfs
Message-ID: <20130208210652.385FB800DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd86e4ff737d271e1051f899596e0e717e02ac13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The order of the solutions to customize the root filesystem is
changed: we now mention the post-build script mechanism *before* the
custom root filesystem skeleton mechanism, because the former is
preferred over the latter.

In addition to this, we give a few more details about direct
customization of the root filesystem in output/target, and about the
custom target skeleton solution.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/customize-rootfs.txt |   29 ++++++++++++++++++-----------
 1 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 5692887..3cdbaa1 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -12,17 +12,11 @@ there are a few ways to customize the resulting target filesystem.
   simply make your changes here and run make afterwards - this will
   rebuild the target filesystem image. This method allows you to do
   anything to the target filesystem, but if you decide to completely
-  rebuild your toolchain and tools, these changes will be lost.
-  _Changes do not survive the +make clean+ command_.
-
-* Create your own 'target skeleton'. You can start with the default
-  skeleton available under +system/skeleton+ and then customize it to
-  suit your needs. The +BR2_ROOTFS_SKELETON_CUSTOM+ and
-  +BR2_ROOTFS_SKELETON_CUSTOM_PATH+ will allow you to specify the
-  location of your custom skeleton. These options can be found in the
-  +System configuration+ menu. At build time, the contents of the
-  skeleton are copied to output/target before any package
-  installation.
+  rebuild your toolchain and tools, these changes will be lost. This
+  solution is therefore only useful for quick tests only: _changes do
+  not survive the +make clean+ command_. Once you have validated your
+  changes, you should make sure that they will persist after a +make
+  clean+ by using one of the following methods.
 
 * Create a filesystem overlay: a tree of files that are copied directly
   over the target filesystem after it has been built.  Set
@@ -50,6 +44,19 @@ there are a few ways to customize the resulting target filesystem.
       stored
     - +BASE_DIR+: the base output directory
 
+* Create your own 'target skeleton'. You can start with the default
+  skeleton available under +system/skeleton+ and then customize it to
+  suit your needs. The +BR2_ROOTFS_SKELETON_CUSTOM+ and
+  +BR2_ROOTFS_SKELETON_CUSTOM_PATH+ will allow you to specify the
+  location of your custom skeleton. These options can be found in the
+  +System configuration+ menu. At build time, the contents of the
+  skeleton are copied to output/target before any package
+  installation. Note that this method is *not recommended*, as it
+  duplicates the entire skeleton, which prevents from taking advantage
+  of the fixes or improvements brought to the default Buildroot
+  skeleton. The recommended method is to use the _post-build script_
+  mechanism described in the previous item.
+
 Note also that if you want to perform some specific actions *after*
 all filesystem images have been created (for example to automatically
 extract your root filesystem tarball in a location exported by your
