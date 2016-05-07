From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 09:17:00 +0200
Subject: [Buildroot] [git commit] taskd: add patch to fix musl build issue
Message-ID: <20160507071838.BB2F8817CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54aa927a42eba7d0ceacce25f699c6b2ae2479dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

taskd checks for `get_current_dir_name` but forgets to add a `cmakedefine`
in cmake.h.in, so `HAVE_GET_CURRENT_DIR_NAME` is always undefined.

CMake detects correctly that the musl C library defines `get_current_dir_name`.
However, as `HAVE_GET_CURRENT_DIR_NAME` is not set, the block of code evaluated
cannot be compiled as musl does not define `PATH_MAX`.

Reported upstream:
https://bug.tasktools.org/browse/TD-120

Fixes:
http://autobuild.buildroot.net/results/121/121aa15235e06c80d65428626da5a2da9d11c9ba/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch b/package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch
new file mode 100644
index 0000000..960c71b
--- /dev/null
+++ b/package/taskd/0001-Fix-missing-cmakedefine-HAVE_GET_CURRENT_DIR_NAME.patch
@@ -0,0 +1,28 @@
+From b067ab9bf667bb9257bb9eeaa6bf25f9a1a17f06 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Fri, 6 May 2016 23:35:42 +0200
+Subject: [PATCH] Fix missing cmakedefine HAVE_GET_CURRENT_DIR_NAME
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ cmake.h.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cmake.h.in b/cmake.h.in
+index 4124ce9..0b8f9d0 100644
+--- a/cmake.h.in
++++ b/cmake.h.in
+@@ -51,6 +51,7 @@
+ #cmakedefine HAVE_ST_BIRTHTIME
+ 
+ /* Functions */
++#cmakedefine HAVE_GET_CURRENT_DIR_NAME
+ #cmakedefine HAVE_TIMEGM
+ #cmakedefine HAVE_UUID_UNPARSE_LOWER
+ 
+-- 
+2.8.2
+
