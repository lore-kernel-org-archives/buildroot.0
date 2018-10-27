From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 27 Oct 2018 19:59:22 +0200
Subject: [Buildroot] [PATCH] meson: re-add patch for skipping RPATH fixing
Message-ID: <20181027175922.26750-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch to skip RPATH fixing performed by Meson was removed in commit
a03f46ca6e9f43028003aedc92f1a1204ae7480f, as the script
support/scripts/check-host-rpath was not complaining anymore.

But without it, the problem still occurs for host packages [1].

So, restore this patch to fix build of host packages with Meson.

[1] http://lists.busybox.net/pipermail/buildroot/2018-October/232956.html

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...y-fix-RPATH-if-install_rpath-is-not-empty.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch

diff --git a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
new file mode 100644
index 0000000000..0e59907a05
--- /dev/null
+++ b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
@@ -0,0 +1,32 @@
+From 649140f09d8a8805125830cd7b2327d35447ffe8 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Sat, 14 Jul 2018 11:18:45 +0200
+Subject: [PATCH] Only fix RPATH if install_rpath is not empty
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ mesonbuild/minstall.py | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
+index 1d721795..e04e1f6a 100644
+--- a/mesonbuild/minstall.py
++++ b/mesonbuild/minstall.py
+@@ -495,6 +495,14 @@ class Installer:
+                 try:
+                     depfixer.fix_rpath(outname, install_rpath, final_path,
+                                        install_name_mappings, verbose=False)
++                    # Buildroot check-host-rpath script expects RPATH
++                    # But if install_rpath is empty, it will stripped.
++                    # So, preserve it in this case
++                    if install_rpath:
++                        depfixer.fix_rpath(outname, install_rpath, final_path,
++                                           install_name_mappings, verbose=False)
++                    else:
++                        print("Skipping RPATH fixing")
+                 except SystemExit as e:
+                     if isinstance(e.code, int) and e.code == 0:
+                         pass
+-- 
+2.14.4
+
-- 
2.14.4
