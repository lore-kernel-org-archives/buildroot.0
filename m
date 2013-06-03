From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 23:06:30 +0200
Subject: [Buildroot] [git commit] package/genext2fs: add host variant
Message-ID: <20130603211155.9C3869A8A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8286a993ac1738ef08a6b9aca03e629e5c9bb89
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

genext2fs is built only if the user selected an ext2 root filesystem.

However, some use-cases can't live with the full target/ dir on the
root filesystem, and requires separate partitions (eg. for /usr).
In this case, the user would not select an ext2 root fs in the
Buildrooot menu, and would only generate a tarball of the rootfs.
This tarball would then be used from a post-image script to build
the actual required FSes.

But then, genext2fs is not built, since the ext2 root FS was not
selected.

As for the other filesystem generators, provide a host variant of
genext2fs (genext2fs is already host-package aware, so only needs
adding a Kconfig entry).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 fs/ext2/Config.in                |    1 +
 package/Config.in.host           |    1 +
 package/genext2fs/Config.in.host |    9 +++++++++
 3 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
index e75ef54..c26482f 100644
--- a/fs/ext2/Config.in
+++ b/fs/ext2/Config.in
@@ -1,5 +1,6 @@
 config BR2_TARGET_ROOTFS_EXT2
 	bool "ext2/3/4 root filesystem"
+	select BR2_PACKAGE_HOST_GENEXT2FS
 	select BR2_PACKAGE_HOST_E2FSPROGS
 	help
 	  Build an ext2/3/4 root filesystem
diff --git a/package/Config.in.host b/package/Config.in.host
index 54178ea..5fd2570 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -3,6 +3,7 @@ menu "Host utilities"
 source "package/dfu-util/Config.in.host"
 source "package/dosfstools/Config.in.host"
 source "package/e2fsprogs/Config.in.host"
+source "package/genext2fs/Config.in.host"
 source "package/genimage/Config.in.host"
 source "package/genpart/Config.in.host"
 source "package/lpc3250loader/Config.in.host"
diff --git a/package/genext2fs/Config.in.host b/package/genext2fs/Config.in.host
new file mode 100644
index 0000000..a03e16b
--- /dev/null
+++ b/package/genext2fs/Config.in.host
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HOST_GENEXT2FS
+	bool "host genext2fs"
+	help
+	  genext2fs generates an ext2 filesystem as a normal (non-root)
+	  user.  It does not require you to mount the image file to
+	  copy files on it, nor does it require that you become the
+	  superuser to make device nodes.
+
+	  http://genext2fs.sourceforge.net/
