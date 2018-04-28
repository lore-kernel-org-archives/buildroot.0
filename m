From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 23:34:39 +0200
Subject: [Buildroot] [git commit] python-watchdog: add support for uClibc
Message-ID: <20180428213749.4F9B9890DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13d946cbdfcc3e2b3ed2eb11b612e381ea7053b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes uClibc detection.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...dd-a-workaround-to-support-uClibc-library.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch b/package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch
new file mode 100644
index 0000000000..c21e6cd089
--- /dev/null
+++ b/package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch
@@ -0,0 +1,43 @@
+From c3b3c4581b25d7e62f5c2ce1484133229d5e657a Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 16 Feb 2018 13:26:23 +0100
+Subject: [PATCH] Add a workaround to support uClibc library
+
+uClibc based systems provide only libc.so.0 and libc.so.1
+symlinks.
+
+So try to find libc.so.0 if neither libc.so nor libc.so.6
+could be found.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/watchdog/observers/inotify_c.py | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/watchdog/observers/inotify_c.py b/src/watchdog/observers/inotify_c.py
+index 5f208b6..0dc7b50 100644
+--- a/src/watchdog/observers/inotify_c.py
++++ b/src/watchdog/observers/inotify_c.py
+@@ -45,7 +45,19 @@ def _load_libc():
+     try:
+         return ctypes.CDLL('libc.so')
+     except (OSError, IOError):
++        pass
++
++    try:
+         return ctypes.CDLL('libc.so.6')
++    except (OSError, IOError):
++        pass
++
++    # uClibc
++    try:
++        return ctypes.CDLL('libc.so.0')
++    except (OSError, IOError) as err:
++        raise err
++
+ 
+ libc = _load_libc()
+ 
+-- 
+2.1.4
+
