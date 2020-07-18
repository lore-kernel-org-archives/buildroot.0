From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 18 Jul 2020 15:27:23 -0600
Subject: [Buildroot] [PATCH 1/1] package/meson: restore fix rpath patch
Message-ID: <20200718212723.3137575-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream change in d7235c5905fa98207d90f3ad34bf590493498d5b is not
sufficient to prevent rpaths from being stripped in some cases such as
those where a package has binaries that link against libraries in the
same package.

Fixes:
http://autobuild.buildroot.net/results/f2f/f2f912416ab11d454479ef3d22ed6b757207f84f/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...-RPATH-if-install_rpath-is-not-empty.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/meson/0003-Only-fix-RPATH-if-install_rpath-is-not-empty.patch

diff --git a/package/meson/0003-Only-fix-RPATH-if-install_rpath-is-not-empty.patch b/package/meson/0003-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
new file mode 100644
index 0000000000..e098c25bbe
--- /dev/null
+++ b/package/meson/0003-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
@@ -0,0 +1,36 @@
+From bb155880bd08d7c0c9ddf0264d73016a426d8579 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Sat, 14 Jul 2018 11:18:45 +0200
+Subject: [PATCH] Only fix RPATH if install_rpath is not empty
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+[Fix: remove leftover from original/unconditional code]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ mesonbuild/minstall.py | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
+index 0be01fe75..d991cf4e7 100644
+--- a/mesonbuild/minstall.py
++++ b/mesonbuild/minstall.py
+@@ -512,8 +512,14 @@ class Installer:
+             if file_copied:
+                 self.did_install_something = True
+                 try:
+-                    depfixer.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
+-                                       install_name_mappings, verbose=False)
++                    # Buildroot check-host-rpath script expects RPATH
++                    # But if install_rpath is empty, it will stripped.
++                    # So, preserve it in this case
++                    if install_rpath:
++                        depfixer.fix_rpath(outname, t.rpath_dirs_to_remove, install_rpath, final_path,
++                                           install_name_mappings, verbose=False)
++                    else:
++                        print("Skipping RPATH fixing")
+                 except SystemExit as e:
+                     if isinstance(e.code, int) and e.code == 0:
+                         pass
+-- 
+2.25.1
+
-- 
2.25.1
