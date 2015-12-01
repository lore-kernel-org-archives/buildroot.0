From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue,  1 Dec 2015 19:54:11 -0200
Subject: [Buildroot] [PATCH v2 2/2] vnstat: add upstream patch to fix build
	with musl
In-Reply-To: <1449006851-20917-1-git-send-email-rprebello@gmail.com>
References: <1449006851-20917-1-git-send-email-rprebello@gmail.com>
Message-ID: <1449006851-20917-2-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The header file 'fcntl.h' was missing from 'src/common.h', which caused
the build with musl to fail with undeclared symbol errors like the
following:

  dbaccess.c: In function ?backupdb?:
  dbaccess.c:268:25: error: ?O_RDONLY? undeclared (first use in this function)
    if ((c = open(current, O_RDONLY)) == -1) {
                           ^
This has already been fixed upstream, so the included patch must be
dropped on the next version bump.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 ...-fcntl.h-include-needed-by-open-closes-21.patch | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/vnstat/0001-add-missing-fcntl.h-include-needed-by-open-closes-21.patch

diff --git a/package/vnstat/0001-add-missing-fcntl.h-include-needed-by-open-closes-21.patch b/package/vnstat/0001-add-missing-fcntl.h-include-needed-by-open-closes-21.patch
new file mode 100644
index 0000000..5489580
--- /dev/null
+++ b/package/vnstat/0001-add-missing-fcntl.h-include-needed-by-open-closes-21.patch
@@ -0,0 +1,28 @@
+From a222434e096ce42c7937839f9666691f2b8a612f Mon Sep 17 00:00:00 2001
+From: Teemu Toivola <git@humdi.net>
+Date: Sat, 27 Jun 2015 18:29:22 +0300
+Subject: [PATCH] add missing fcntl.h include needed by open(), closes #21
+
+[Backport from upstream commit 964d7cd62b8626d51bf7ce06564aa9bd1d2b4d4c.
+Fixes undeclared symbol issues when building with musl.]
+
+Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
+---
+ src/common.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common.h b/src/common.h
+index 7616e55..eb0b61f 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -22,6 +22,7 @@
+ #include <pwd.h>
+ #include <grp.h>
+ #include <libgen.h>
++#include <fcntl.h>
+ 
+ #if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__APPLE__) || defined(__FreeBSD_kernel__)
+ #include <sys/param.h>
+-- 
+2.1.4
+
-- 
2.1.4
