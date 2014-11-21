From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Nov 2014 21:45:21 +0100
Subject: [Buildroot] [git commit] package/dovecot: Fix symbol conflict in
	static build with MySQL enabled
Message-ID: <20141121205146.52B1F7FE14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=337d40e7ad985a0f52575d809f44f2e90052a61e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/9b5/9b536926b3b2bf82c683b48e9697a220f1b4bf33/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/0003-fix-static-build.patch |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/dovecot/0003-fix-static-build.patch b/package/dovecot/0003-fix-static-build.patch
new file mode 100644
index 0000000..c5dd9d1
--- /dev/null
+++ b/package/dovecot/0003-fix-static-build.patch
@@ -0,0 +1,24 @@
+Fix symbol conflict in static build with MySQL enabled
+
+Compile error log:
+http://autobuild.buildroot.net/results/9b5/9b536926b3b2bf82c683b48e9697a220f1b4bf33/build-end.log
+
+Patch suggested by Timo Sirainen:
+http://www.dovecot.org/list/dovecot/2014-November/098787.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr dovecot-2.2.15.org/src/lib/strnum.h dovecot-2.2.15/src/lib/strnum.h
+--- dovecot-2.2.15.org/src/lib/strnum.h	2014-07-02 17:21:24.000000000 +0200
++++ dovecot-2.2.15/src/lib/strnum.h	2014-11-21 19:26:42.316225982 +0100
+@@ -1,6 +1,10 @@
+ #ifndef STRNUM_H
+ #define STRNUM_H
+ 
++/* libmysqlclient really should try to keep its internal stuff internal so
++   they won't conflict with the actual programs that are trying to use it. */
++#define str_to_time str_to_time_libmysqlclient_craps_all_over
++
+ /* Return TRUE if all characters in string are numbers.
+    Stop when `end_char' is found from string. */
+ bool str_is_numeric(const char *str, char end_char) ATTR_PURE;
