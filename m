From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri,  7 Oct 2016 20:52:32 -0700
Subject: [Buildroot] [PATCH 1/1] sysklogd: add patch to fix build with glibc
	2.24
Message-ID: <20161008035232.24677-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building sysklogd with glibc 2.24 fails with the following error:

syslogd.c: In function ?reapchild?:
syslogd.c:2097:13: error: storage size of ?status? isn?t known
  union wait status;
             ^
Makefile:99: recipe for target 'syslogd.o' failed
make[2]: *** [syslogd.o] Error 1
make[2]: *** Waiting for unfinished jobs....
package/pkg-generic.mk:201: recipe for target './buildroot/output/build/sysklogd-1.5.1/.stamp_built' failed
make[1]: *** [./buildroot/output/build/sysklogd-1.5.1/.stamp_built] Error 2
Makefile:41: recipe for target '_all' failed
make: *** [_all] Error 2

union wait was marked deprecated in glibc 2.23 and removed in glibc 2.24.
The fix is to declare it as an int.

See https://sourceware.org/ml/libc-alpha/2016-02/msg00342.html

Sent upstream via their mailing list

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 ...01-replace-deprecated-union-wait-with-int.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/sysklogd/0001-replace-deprecated-union-wait-with-int.patch

diff --git a/package/sysklogd/0001-replace-deprecated-union-wait-with-int.patch b/package/sysklogd/0001-replace-deprecated-union-wait-with-int.patch
new file mode 100644
index 0000000..c9a30e9
--- /dev/null
+++ b/package/sysklogd/0001-replace-deprecated-union-wait-with-int.patch
@@ -0,0 +1,25 @@
+From 86fe87cdf097e6286e76eadcc9c11c79be6258f2 Mon Sep 17 00:00:00 2001
+From: Ryan Coe <bluemrp9@gmail.com>
+Date: Fri, 7 Oct 2016 19:42:40 -0700
+Subject: [PATCH 1/1] replace deprecated union wait with int
+
+Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
+---
+ syslogd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/syslogd.c b/syslogd.c
+index ea73ea5da5e935bb8cab328559f950cd3afc2d20..ace96c8be40f50d123120c0586a384a298212245 100644
+--- a/syslogd.c
++++ b/syslogd.c
+@@ -2094,7 +2094,7 @@ void reapchild()
+	(void) signal(SIGCHLD, reapchild);	/* reset signal handler -ASP */
+	wait ((int *)0);
+ #else
+-	union wait status;
++	int status;
+
+	while (wait3(&status, WNOHANG, (struct rusage *) NULL) > 0)
+		;
+--
+2.9.3
-- 
2.9.3
