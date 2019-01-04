From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  4 Jan 2019 20:32:33 +0100
Subject: [Buildroot] [PATCH v1] meson: fix RPATH patch
Message-ID: <20190104193233.27527-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The re-added ([1]) patch missed to remove two lines of the
original unconditional code.

[1] https://git.buildroot.net/buildroot/commit/?id=5c939246a802c0ad9704dac1505105037542a1d3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-RPATH-if-install_rpath-is-not-empty.patch | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
index 0e59907a05..a7b66c1067 100644
--- a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
+++ b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
@@ -1,21 +1,25 @@
-From 649140f09d8a8805125830cd7b2327d35447ffe8 Mon Sep 17 00:00:00 2001
+From 4db4fd79d9bb2b98cea1117f22b6c97942ab2ecd Mon Sep 17 00:00:00 2001
 From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 Date: Sat, 14 Jul 2018 11:18:45 +0200
 Subject: [PATCH] Only fix RPATH if install_rpath is not empty
 
 Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+[Fix: remove leftover from original/unconditional code]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 ---
- mesonbuild/minstall.py | 8 ++++++++
- 1 file changed, 8 insertions(+)
+ mesonbuild/minstall.py | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
-index 1d721795..e04e1f6a 100644
+index 8ac6aab1..7ef04116 100644
 --- a/mesonbuild/minstall.py
 +++ b/mesonbuild/minstall.py
-@@ -495,6 +495,14 @@ class Installer:
+@@ -478,8 +478,14 @@ class Installer:
+                         printed_symlink_error = True
+             if os.path.isfile(outname):
                  try:
-                     depfixer.fix_rpath(outname, install_rpath, final_path,
-                                        install_name_mappings, verbose=False)
+-                    depfixer.fix_rpath(outname, install_rpath, final_path,
+-                                       install_name_mappings, verbose=False)
 +                    # Buildroot check-host-rpath script expects RPATH
 +                    # But if install_rpath is empty, it will stripped.
 +                    # So, preserve it in this case
@@ -28,5 +32,5 @@ index 1d721795..e04e1f6a 100644
                      if isinstance(e.code, int) and e.code == 0:
                          pass
 -- 
-2.14.4
+2.20.1
 
-- 
2.20.1
