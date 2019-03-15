From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:58:58 +0100
Subject: [Buildroot] [git commit] package/python-watchdog: bump to version
 0.9.0
Message-ID: <20190315205605.A706880F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5a2b7c241441566edeeaecc6659947c8a5ad760
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version:
  https://github.com/gorakhargosh/watchdog/commit/268a46dabc10ff8dcc5a123ca8c8ceb2e9189f2a)
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...dd-a-workaround-to-support-uClibc-library.patch | 43 ----------------------
 package/python-watchdog/python-watchdog.hash       | 11 ++++--
 package/python-watchdog/python-watchdog.mk         |  4 +-
 3 files changed, 9 insertions(+), 49 deletions(-)

diff --git a/package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch b/package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch
deleted file mode 100644
index c21e6cd089..0000000000
--- a/package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c3b3c4581b25d7e62f5c2ce1484133229d5e657a Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Fri, 16 Feb 2018 13:26:23 +0100
-Subject: [PATCH] Add a workaround to support uClibc library
-
-uClibc based systems provide only libc.so.0 and libc.so.1
-symlinks.
-
-So try to find libc.so.0 if neither libc.so nor libc.so.6
-could be found.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
----
- src/watchdog/observers/inotify_c.py | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/watchdog/observers/inotify_c.py b/src/watchdog/observers/inotify_c.py
-index 5f208b6..0dc7b50 100644
---- a/src/watchdog/observers/inotify_c.py
-+++ b/src/watchdog/observers/inotify_c.py
-@@ -45,7 +45,19 @@ def _load_libc():
-     try:
-         return ctypes.CDLL('libc.so')
-     except (OSError, IOError):
-+        pass
-+
-+    try:
-         return ctypes.CDLL('libc.so.6')
-+    except (OSError, IOError):
-+        pass
-+
-+    # uClibc
-+    try:
-+        return ctypes.CDLL('libc.so.0')
-+    except (OSError, IOError) as err:
-+        raise err
-+
- 
- libc = _load_libc()
- 
--- 
-2.1.4
-
diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 9da2b37a7b..701c7991a5 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,4 +1,7 @@
-# md5 from https://pypi.python.org/pypi/watchdog/json
-md5	bb16926bccc98eae2a04535e4512ddf1  watchdog-0.8.3.tar.gz
-# sha256 calculated by scanpypi
-sha256	7e65882adb7746039b6f3876ee174952f8eaaa34491ba34333ddf1fe35de4162  watchdog-0.8.3.tar.gz
+# md5, sha256 from https://pypi.python.org/pypi/watchdog/json
+md5	7cdc103f607e72fc32c206301a72d1b2  watchdog-0.9.0.tar.gz
+sha256	965f658d0732de3188211932aeb0bb457587f04f63ab4c1e33eab878e9de961d  watchdog-0.9.0.tar.gz
+
+# Hash for license files
+sha256  14e636faf5889138a1bb7a8498ccbb0266aee31d2dc475201a10448e56ed3d96  COPYING
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 3dd92e3a3d..44929a65ac 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 0.8.3
+PYTHON_WATCHDOG_VERSION = 0.9.0
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://pypi.python.org/packages/54/7d/c7c0ad1e32b9f132075967fc353a244eb2b375a3d2f5b0ce612fd96e107e
+PYTHON_WATCHDOG_SITE = https://pypi.python.org/packages/bb/e3/5a55d48a29300160779f0a0d2776d17c1b762a2039b36de528b093b87d5b
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
