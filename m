From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Nov 2018 16:21:07 +0100
Subject: [Buildroot] [PATCH next 2/2] package/apache: add patch to fix
 per-package folder build
In-Reply-To: <20181115152107.5834-1-thomas.petazzoni@bootlin.com>
References: <20181115152107.5834-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181115152107.5834-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When APR_INCLUDEDIR and APU_INCLUDEDIR point to the same directory,
Apache builds properly. However, with per-package folder support, they
point to different directories, and APU_INCLUDEDIR contains both the
APR headers and the APU headers.

Due to this, the Apache Makefile logic to generate its exports.c file
leads to duplicate definitions, because the APR headers are considered
twice: once from APR_INCLUDEDIR, once from APU_INCLUDEDIR.

We fix this by introducing a patch to the Apache build system.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...in-handle-separate-APR_INCLUDE_DIR-A.patch | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch

diff --git a/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch b/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
new file mode 100644
index 0000000000..299840bee2
--- /dev/null
+++ b/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
@@ -0,0 +1,47 @@
+From 00281390e82db18fe0de4033be4045f9391a8ee5 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 15 Nov 2018 14:04:29 +0100
+Subject: [PATCH] server/Makefile.in: handle separate
+ APR_INCLUDE_DIR/APU_INCLUDE_DIR
+
+If APR_INCLUDEDIR and APU_INCLUDEDIR point to different directories,
+but for example APU_INCLUDEDIR contains both the apr headers and apu
+headers, the "export_files" file will contain duplicate header files,
+causing the exports.c file to contain duplicate definitions, making
+the build fail.
+
+This commit fixes that by making sure we only use the apr headers from
+APR_INCLUDEDIR and the apu headers from the APU_INCLUDEDIR.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ server/Makefile.in | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/server/Makefile.in b/server/Makefile.in
+index 1fa334467d..2258f0bdf2 100644
+--- a/server/Makefile.in
++++ b/server/Makefile.in
+@@ -34,7 +34,6 @@ test_char.h: gen_test_char
+ util.lo: test_char.h
+ 
+ EXPORT_DIRS = $(top_srcdir)/include $(top_srcdir)/os/$(OS_DIR)
+-EXPORT_DIRS_APR = $(APR_INCLUDEDIR) $(APU_INCLUDEDIR)
+ 
+ # If export_files is a dependency here, but we remove it during this stage,
+ # when exports.c is generated, make will not detect that export_files is no
+@@ -60,9 +59,8 @@ export_files:
+ 	      ls $$dir/*.h ; \
+ 	  done; \
+ 	  echo "$(top_srcdir)/server/mpm_fdqueue.h"; \
+-	  for dir in $(EXPORT_DIRS_APR); do \
+-	      ls $$dir/ap[ru].h $$dir/ap[ru]_*.h 2>/dev/null; \
+-	  done; \
++	  ls $(APR_INCLUDE_DIR)/{apr.h,apr_*.h} 2>/dev/null; \
++	  ls $(APU_INCLUDE_DIR)/{apu.h,apu_*.h} 2>/dev/null; \
+ 	) | sed -e s,//,/,g | sort -u > $@
+ 
+ exports.c: export_files
+-- 
+2.19.1
+
-- 
2.19.1
