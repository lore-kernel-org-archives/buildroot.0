From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Feb 2018 14:32:00 +0100
Subject: [Buildroot] [PATCH 1/2] python-watchdog: add support for uClibc
Message-ID: <1518787921-32089-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

This patch fixes uClibc detection.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...dd-a-workaround-to-support-uClibc-library.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch

diff --git a/package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch b/package/python-watchdog/0001-Add-a-workaround-to-support-uClibc-library.patch
new file mode 100644
index 0000000..c21e6cd
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
-- 
2.1.4
