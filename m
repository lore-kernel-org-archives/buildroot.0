From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Jul 2018 21:16:02 +0200
Subject: [Buildroot] [RFC v2 1/4] meson: bump version to 0.47.1
Message-ID: <20180717191605.19263-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
Hash not checked against the pgp signature, tried
	$ gpg --verify meson-0.47.1.tar.gz.asc meson-0.47.1.tar.gz
  gpg: Signature made Di 10 Jul 2018 23:28:12 CEST
  gpg:                using RSA key 95181F4EED14FDF4E41B518D3BF4693BFEEB9428
  gpg: Can't check signature: No public key

Any advice which public key is used to sign the meson package?

Changes v1 -> v2:
  - new patch
---
 ...-RPATH-if-install_rpath-is-not-empty.patch | 32 -------------------
 package/meson/meson.hash                      |  5 ++-
 package/meson/meson.mk                        |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch

diff --git a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch b/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
deleted file mode 100644
index 03c1944258..0000000000
--- a/package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 53e4920038d5562b7b672fec8b9469fc02eef4ad Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Thu, 10 May 2018 21:57:49 +0200
-Subject: [PATCH] Only fix RPATH if install_rpath is not empty
-
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- mesonbuild/scripts/meson_install.py | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/mesonbuild/scripts/meson_install.py b/mesonbuild/scripts/meson_install.py
-index 013f2a00..f7ff1dcc 100644
---- a/mesonbuild/scripts/meson_install.py
-+++ b/mesonbuild/scripts/meson_install.py
-@@ -368,7 +368,13 @@ def install_targets(d):
-                     printed_symlink_error = True
-         if os.path.isfile(outname):
-             try:
--                depfixer.fix_rpath(outname, install_rpath, False)
-+                # Buildroot check-host-rpath script expects RPATH
-+                # But if install_rpath is empty, it will stripped.
-+                # So, preserve it in this case
-+                if install_rpath:
-+                    depfixer.fix_rpath(outname, install_rpath, False)
-+                else:
-+                    print("Skipping RPATH fixing")
-             except SystemExit as e:
-                 if isinstance(e.code, int) and e.code == 0:
-                     pass
--- 
-2.14.3
-
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index bd9e4114ff..4b17744db6 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,3 @@
-# Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.46.1/meson-0.46.1.tar.gz.asc
-sha256 19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78  meson-0.46.1.tar.gz
+# Locally calculated
+sha256  d673de79f7bab064190a5ea06140eaa8415efb386d0121ba549f6d66c555ada6	meson-0.47.1.tar.gz
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 28c9e6f202..d110e594f5 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.46.1
+MESON_VERSION = 0.47.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.18.0
