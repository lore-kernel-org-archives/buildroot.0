From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Sep 2020 19:00:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/trinity: fix build with gcc 10
Message-ID: <20200910170059.907275-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/bac2cbc791e2ab1d0995c8417bd3d19cbc884e47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../trinity/0001-Fix-build-with-GCC-10.patch  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/trinity/0001-Fix-build-with-GCC-10.patch

diff --git a/package/trinity/0001-Fix-build-with-GCC-10.patch b/package/trinity/0001-Fix-build-with-GCC-10.patch
new file mode 100644
index 0000000000..5ae3735db2
--- /dev/null
+++ b/package/trinity/0001-Fix-build-with-GCC-10.patch
@@ -0,0 +1,38 @@
+From e53e25cc8dd5bdb5f7d9b4247de9e9921eec81d8 Mon Sep 17 00:00:00 2001
+From: Vinson Lee <vlee@freedesktop.org>
+Date: Thu, 30 Jan 2020 22:09:45 -0800
+Subject: [PATCH] Fix build with GCC 10.
+
+  CC	trinity
+/usr/bin/ld: debug.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
+/usr/bin/ld: log-files.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
+/usr/bin/ld: log.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
+/usr/bin/ld: main.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
+/usr/bin/ld: output.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
+/usr/bin/ld: params.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
+/usr/bin/ld: shm.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
+/usr/bin/ld: trinity.o:include/logfile.h:8: multiple definition of `mainlogfile'; child.o:include/logfile.h:8: first defined here
+
+Fixes: 13856316c259 ("reinstate the log-to-file code for now.")
+Signed-off-by: Vinson Lee <vlee@freedesktop.org>
+
+[Retrieved from:
+https://github.com/kernelslacker/trinity/commit/e53e25cc8dd5bdb5f7d9b4247de9e9921eec81d8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/logfile.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/logfile.h b/include/logfile.h
+index 90ea8b23..2305ac15 100644
+--- a/include/logfile.h
++++ b/include/logfile.h
+@@ -5,7 +5,7 @@
+ FILE *find_logfile_handle(void);
+ void synclogs(void);
+ 
+-FILE *mainlogfile;
++extern FILE *mainlogfile;
+ void open_main_logfile(void);
+ void close_logfile(FILE **handle);
+ 
-- 
2.28.0
