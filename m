From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 15 Dec 2019 20:42:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/xdg-dbus-proxy: add patch to
 support building with musl
Message-ID: <20191215184246.3600021-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Import "0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch"
from the upstream repository, which allows building against the musl
libc (or any other which does not define the TEMP_FAILURE_RETRY macro).
The patch has been accepted upstream, but no releases have been made yet
which include the fix.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 ...ilation-by-adding-TEMP_FAILURE_RETRY.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/xdg-dbus-proxy/0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch

diff --git a/package/xdg-dbus-proxy/0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch b/package/xdg-dbus-proxy/0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch
new file mode 100644
index 0000000000..e531f58923
--- /dev/null
+++ b/package/xdg-dbus-proxy/0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch
@@ -0,0 +1,36 @@
+From 645c45f0334bb1d6e31b5927cece5e446f129cbb Mon Sep 17 00:00:00 2001
+From: Danilo Spinella <danyspin97@protonmail.com>
+Date: Sat, 7 Dec 2019 00:05:21 +0100
+Subject: [PATCH] Fix musl compilation by adding TEMP_FAILURE_RETRY
+
+Fetch from: https://github.com/flatpak/xdg-dbus-proxy/pull/13
+Upstream-Status: Accepted
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+
+---
+ dbus-proxy.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/dbus-proxy.c b/dbus-proxy.c
+index 163df21..4b07931 100644
+--- a/dbus-proxy.c
++++ b/dbus-proxy.c
+@@ -30,6 +30,15 @@
+ #include <errno.h>
+ 
+ #include "flatpak-proxy.h"
++// Taken from glibc unistd.h
++#ifndef TEMP_FAILURE_RETRY
++# define TEMP_FAILURE_RETRY(expression) \
++  (__extension__                                                              \
++    ({ long int __result;                                                     \
++       do __result = (long int) (expression);                                 \
++       while (__result == -1L && errno == EINTR);                             \
++       __result; }))
++#endif
+ 
+ static const char *argv0;
+ static GList *proxies;
+-- 
+2.24.1
+
-- 
2.24.1
