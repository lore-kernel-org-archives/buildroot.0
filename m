From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 18 Oct 2018 22:44:31 +0200
Subject: [Buildroot] [PATCH] meson: bump version to 0.48.1
Message-ID: <20181018204431.29117-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump version to 0.48.1 and re-add the RPATH patch.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 ...y-fix-RPATH-if-install_rpath-is-not-empty.patch | 31 ++++++++++++++++++++++
 package/meson/meson.hash                           |  4 +--
 package/meson/meson.mk                             |  2 +-
 3 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch

diff --git a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
new file mode 100644
index 0000000000..752042f7ec
--- /dev/null
+++ b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
@@ -0,0 +1,31 @@
+From cb5af88b1102ea8379323f95b9588c0bef71f175 Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Sat, 14 Jul 2018 11:18:45 +0200
+Subject: [PATCH] Only fix RPATH if install_rpath is not empty
+
+---
+ mesonbuild/minstall.py | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/mesonbuild/minstall.py b/mesonbuild/minstall.py
+index 4615b6dd..dd476ea8 100644
+--- a/mesonbuild/minstall.py
++++ b/mesonbuild/minstall.py
+@@ -440,6 +440,14 @@ class Installer:
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
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 4a4923bd12..656f51f01d 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.47.1/meson-0.47.1.tar.gz.asc
-sha256 d673de79f7bab064190a5ea06140eaa8415efb386d0121ba549f6d66c555ada6 meson-0.47.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.48.1/meson-0.48.1.tar.gz.asc
+sha256 425d12edbb81498314926afa93a3eb2fca4ca6929cbe0f8abeb6ab45d1d9fa8f meson-0.48.1.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 08e5c505c9..f24aef06fc 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.47.1
+MESON_VERSION = 0.48.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.14.4
