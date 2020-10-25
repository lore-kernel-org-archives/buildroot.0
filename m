From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Oct 2020 17:41:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/sshfs: fix uclibc build
Message-ID: <20201025164108.1837152-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build of sshfs 3.7.0 with uclibc

Fixes:
 - http://autobuild.buildroot.org/results/f93972515ad09ab2ccbdc4cd976ed60702c5974a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-target-libfuse-version-30.patch      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/sshfs/0001-target-libfuse-version-30.patch

diff --git a/package/sshfs/0001-target-libfuse-version-30.patch b/package/sshfs/0001-target-libfuse-version-30.patch
new file mode 100644
index 0000000000..d83ebcf13b
--- /dev/null
+++ b/package/sshfs/0001-target-libfuse-version-30.patch
@@ -0,0 +1,35 @@
+From 7315b0c2f7e04353fefb9734da60884e9b382e51 Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Tue, 28 Jul 2020 15:40:39 -0700
+Subject: [PATCH] target libfuse version 30
+
+libfuse only defines fuse_new_30 when FUSE_USE_VERSION == 30. It does not
+define fuse_new_31 in the headers.
+
+fuse_new_31 and _32 seem to be internal only.
+
+Fixes a linking issue:
+ld: sshfs.p/sshfs.c.o: in function `main':
+sshfs.c:(.text.startup+0x506): undefined reference to `fuse_new'
+ld: sshfs.c:(.text.startup+0x506): undefined reference to `fuse_new'
+
+[Retrieved from:
+https://github.com/libfuse/sshfs/pull/221/commits/7315b0c2f7e04353fefb9734da60884e9b382e51]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index f6bbe51..dc40313 100644
+--- a/meson.build
++++ b/meson.build
+@@ -51,7 +51,7 @@ sshfs_deps = [ dependency('fuse3', version: '>= 3.1.0'),
+ executable('sshfs', sshfs_sources,
+            include_directories: include_dirs,
+            dependencies: sshfs_deps,
+-           c_args: ['-DFUSE_USE_VERSION=31'],
++           c_args: ['-DFUSE_USE_VERSION=30'],
+            install: true,
+            install_dir: get_option('bindir'))
+ 
-- 
2.28.0
