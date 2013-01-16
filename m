From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jan 2013 20:09:52 +0100
Subject: [Buildroot] [PATCH 5/5] docs/manual: slightly reword the solutions
	to customize rootfs
In-Reply-To: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358363393-29977-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The order of the solutions to customize the root filesystem is
changed: we now mention the post-build script mechanism *before* the
custom root filesystem skeleton mechanism, because the former is
preferred over the latter.

In addition to this, we give a few more details about direct
customization of the root filesystem in output/target, and about the
custom target skeleton solution.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-rootfs.txt |   29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index ce62412..9de98f7 100644
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
 
 * In the Buildroot configuration, you can specify the path to a
   *post-build script*, that gets called 'after' Buildroot builds all the
@@ -45,6 +39,19 @@ there are a few ways to customize the resulting target filesystem.
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
 Note also that if want to perform some specific actions *after* all
 filesystem images have been created (for example to automatically
 extract your root filesystem tarball in a location exported by your
-- 
1.7.9.5
