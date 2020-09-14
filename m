From: Michael Fischer <mf@go-sys.de>
Date: Mon, 14 Sep 2020 11:07:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: Add patch to fix
 'undefined reference to gp_read_history'
Message-ID: <20200914090759.22116-1-mf@go-sys.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/e09087f0afd323a220889e2c7827fd73c9025673

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/gnuplot/0002-without-history.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/gnuplot/0002-without-history.patch

diff --git a/package/gnuplot/0002-without-history.patch b/package/gnuplot/0002-without-history.patch
new file mode 100644
index 0000000000..6091da8415
--- /dev/null
+++ b/package/gnuplot/0002-without-history.patch
@@ -0,0 +1,17 @@
+history.c: Patch to solve the 'undefined reference to gp_read_history'
+
+Signed-off-by: Michael Fischer <mf@go-sys.de>
+
+diff -purN gnuplot-5.4.0.org/src/history.c gnuplot-5.4.0/src/history.c
+--- gnuplot-5.4.0.org/src/history.c	2019-12-10 07:22:32.000000000 +0100
++++ gnuplot-5.4.0/src/history.c	2020-09-14 10:07:36.525441702 +0200
+@@ -91,7 +91,9 @@ write_history(char *filename)
+ void
+ read_history(char *filename)
+ {
+-    gp_read_history(filename);
++#ifdef GNUPLOT_HISTORY
++    	gp_read_history(filename);
++#endif	
+ }
+ 
-- 
2.28.0
