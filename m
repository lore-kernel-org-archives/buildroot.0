From: Norbert Lange <nolange79@gmail.com>
Date: Wed,  3 Feb 2021 12:14:15 +0100
Subject: [Buildroot] [PATCH] package/systemd: bump to version 247.3
Message-ID: <20210203111416.239560-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Use the new mode=release switch, this should automatically
disable features deemed not ready for use.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...o-not-fail-with-read-only-etc-or-var.patch | 34 -------------------
 package/systemd/systemd.hash                  |  4 +--
 package/systemd/systemd.mk                    |  4 ++-
 3 files changed, 5 insertions(+), 37 deletions(-)
 delete mode 100644 package/systemd/0001-update-done-Do-not-fail-with-read-only-etc-or-var.patch

diff --git a/package/systemd/0001-update-done-Do-not-fail-with-read-only-etc-or-var.patch b/package/systemd/0001-update-done-Do-not-fail-with-read-only-etc-or-var.patch
deleted file mode 100644
index 01e7f1e906..0000000000
--- a/package/systemd/0001-update-done-Do-not-fail-with-read-only-etc-or-var.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e2a23672a1bbf4d3411dce0289051b5a72bd4a67 Mon Sep 17 00:00:00 2001
-From: Felix Riemann <felix.riemann@sma.de>
-Date: Mon, 19 Oct 2020 18:54:53 +0200
-Subject: [PATCH] update-done: Do not fail with read-only /etc or /var
-
-With the switch from log_debug() to log_debug_errno() in commit c413bb28df
-systemd-update-done would fail without any error message if /etc
-or /var were read-only. This restores the previous behaviour to
-silently ignore these directories again.
-
-[Romain: backport from 1eee15c3885fcc9f6a40df7e42347cb8fca71280]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/update-done/update-done.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/update-done/update-done.c b/src/update-done/update-done.c
-index e9d589e0e5..92c348d83b 100644
---- a/src/update-done/update-done.c
-+++ b/src/update-done/update-done.c
-@@ -31,8 +31,8 @@ static int apply_timestamp(const char *path, struct timespec *ts) {
- 
-         r = write_string_file_atomic_label_ts(path, message, ts);
-         if (r == -EROFS)
--                return log_debug_errno(r, "Cannot create \"%s\", file system is read-only.", path);
--        if (r < 0)
-+                log_debug_errno(r, "Cannot create \"%s\", file system is read-only.", path);
-+        else if (r < 0)
-                 return log_error_errno(r, "Failed to write \"%s\": %m", path);
-         return 0;
- }
--- 
-2.25.4
-
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index cad249199c..20cd922259 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,6 +1,6 @@
 # sha256 locally computed
-sha256  f45c5a98d3be7dd05ed7f1e1a0ab00c7ba52602aa2dc42615bf74be61fcbe178  systemd-246.5.tar.gz
+sha256  2869986e219a8dfc96cc0dffac66e0c13bb70a89e16b85a3948876c146cfa3e0  systemd-247.3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
-sha256  b142af99a3d950fb465326d6fd5a49d348523dc0d216682880527264d0a011e9  README
+sha256  6f22d19d35b00f35e0444e0bc9139e6d3bdf7277978f89c4e175e37b18c43f3d  README
 sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  tools/chromiumos/LICENSE
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1d5d04fe3d..80ffc89086 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 246.5
+SYSTEMD_VERSION = 247.3
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
@@ -32,6 +32,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dloadkeys-path=/usr/bin/loadkeys \
 	-Dman=false \
 	-Dmount-path=/usr/bin/mount \
+	-Dmode=release \
 	-Dnss-systemd=true \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
@@ -691,6 +692,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	--libdir=lib \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
+	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
 	-Dldconfig=false \
-- 
2.30.0
