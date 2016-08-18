From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 18 Aug 2016 22:34:09 +0530
Subject: [Buildroot] [PATCH 2/2] logrotate: fix up build error with gcc 6
In-Reply-To: <1471539849-3766-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1471539849-3766-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1471539849-3766-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With gcc version 6, we see following warning.

  config.c: In function 'strndup':
  config.c:87:10: error: nonnull argument 's' compared to NULL [-Werror=nonnull-compare]
          if(!s)
            ^
  cc1: all warnings being treated as errors

strndup is declared with nonnull attribute for first parameter. In such
cases, gcc 6 warns when we check for nonnull explicitly. So drop the
check for nonnull.

Fixes:

  http://autobuild.buildroot.net/results/6dc/6dc2eb22104076920d77425b1e608ef9b9e01c94/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 .../logrotate/0002-fix-up-warning-with-gcc6.patch  | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/logrotate/0002-fix-up-warning-with-gcc6.patch

diff --git a/package/logrotate/0002-fix-up-warning-with-gcc6.patch b/package/logrotate/0002-fix-up-warning-with-gcc6.patch
new file mode 100644
index 0000000..4226984
--- /dev/null
+++ b/package/logrotate/0002-fix-up-warning-with-gcc6.patch
@@ -0,0 +1,31 @@
+fix up warning with gcc6
+
+With gcc version 6, we see following warning.
+
+  config.c: In function 'strndup':
+  config.c:87:10: error: nonnull argument 's' compared to NULL [-Werror=nonnull-compare]
+          if(!s)
+            ^
+  cc1: all warnings being treated as errors
+
+strndup is declared with nonnull attribute for first parameter. In such
+cases, gcc 6 warns when we check for nonnull explicitly. So drop the
+check for nonnull.
+
+This build is found by Buildroot autobuilder.
+http://autobuild.buildroot.net/results/6dc/6dc2eb22104076920d77425b1e608ef9b9e01c94/
+
+Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
+
+--- logrotate-3.10.0/config.c.old	2016-08-18 22:11:53.881100685 +0530
++++ logrotate-3.10.0/config.c	2016-08-18 22:12:58.913100548 +0530
+@@ -84,9 +84,6 @@ char *strndup(const char *s, size_t n)
+        size_t nAvail;
+        char *p;
+ 
+-       if(!s)
+-               return NULL;
+-
+        /* min() */
+        nAvail = strlen(s) + 1;
+        if ( (n + 1) < nAvail)
-- 
2.6.2
