From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jul 2016 15:22:57 +0200
Subject: [Buildroot] [git commit] docs/manual: document
	BR2_ROOTFS_POST_FAKEROOT_SCRIPT
Message-ID: <20160704132446.2EBF582135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14463d9319731b13aa0a7dc25207fb545eb23ee4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-rootfs.txt | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 558bd72..44fc460 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -61,7 +61,7 @@ In addition, you may also use these environment variables:
     stored
   - +BASE_DIR+: the base output directory
 
-Below two more methods of customizing the target filesystem are
+Below three more methods of customizing the target filesystem are
 described, but they are not recommended.
 
 Direct modification of the target filesystem::
@@ -104,4 +104,35 @@ This method is not recommended because it duplicates the entire
   skeleton, which prevents taking advantage of the fixes or improvements
   brought to the default skeleton in later Buildroot releases.
 
+Post-fakeroot scripts (+BR2_ROOTFS_POST_FAKEROOT_SCRIPT+)::
++
+When aggregating the final images, some parts of the process requires
+  root rights: creating device nodes in `/dev`, setting permissions or
+  ownership to files and directories... To avoid requiring actual root
+  rights, Buildroot uses +fakeroot+ to simulate root rights. This is not
+  a complete substitute for actually being root, but is enough for what
+  Buildroot needs.
++
+Post-fakeroot scripts are shell scripts that are called at the 'end' of
+  the fakeroot phase, 'right before' the filesystem image generator is
+  called. As such, they are called in the fakeroot context.
++
+Post-fakeroot scripts can be useful in case you need to tweak the
+  filesystem to do modifications that are usually only available to the
+  root user.
++
+.Note:
+It is recommended to use the existing mechanisms to set file permissions
+  or create entries in `/dev` (see xref:customize-device-permission[]) or
+  to create users (see xref:customize-users[])
++
+.Note:
+The difference between post-build scripts (above) and fakeroot scripts,
+  is that post-build scripts are not called in the fakeroot context.
++
+.Note;
+Using `fakeroot` is not an absolute substitute for actually being root.
+  `fakeroot` only ever fakes the file access rights and types (regular,
+  block-or-char device...) and uid/gid; these are emulated in-memory.
+
 include::customize-device-permission-tables.txt[]
