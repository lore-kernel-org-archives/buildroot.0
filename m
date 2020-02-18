From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2020 23:16:15 +0100
Subject: [Buildroot] [git commit] package/apache: fix build with per-package
 directory support
Message-ID: <20200218221040.262008E460@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b747c29c4e8eb89b7b99658dfd34f4a6b6b0744d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When APR_INCLUDEDIR and APU_INCLUDEDIR point to the same directory,
Apache builds properly. However, with per-package directory support,
they point to different directories, and APU_INCLUDEDIR contains both
the APR headers and the APU headers.

Due to this, the Apache Makefile logic to generate its exports.c file
leads to duplicate definitions, because the APR headers are considered
twice: once from APR_INCLUDEDIR, once from APU_INCLUDEDIR.

We fix this by introducing a patch to the Apache build system.

In addition, apr provides a special libtool script that gets used by
apr-util and apache. apr-util already had a fixup for this, but apache
did not, which was causing the gcc from apr-util per-package
directories be used during the apache build, causing build failures.

To fix this, we adjust this libtool script to point to the correct
tools in apache's per-package directories.

There are no autobuilder failures for this, because Apache needs
apr-util, and apr-util currently fails to build when
BR2_PER_PACKAGE_DIRECTORIES=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...file.in-handle-separate-APR_INCLUDE_DIR-A.patch | 48 ++++++++++++++++++++++
 package/apache/apache.mk                           |  8 ++++
 2 files changed, 56 insertions(+)

diff --git a/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch b/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
new file mode 100644
index 0000000000..b4ad128677
--- /dev/null
+++ b/package/apache/0003-server-Makefile.in-handle-separate-APR_INCLUDE_DIR-A.patch
@@ -0,0 +1,48 @@
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
+Upstream: https://bz.apache.org/bugzilla/show_bug.cgi?id=62930
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
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 22e7be8832..5fcb9e5371 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -16,6 +16,14 @@ APACHE_INSTALL_STAGING = YES
 APACHE_AUTORECONF = YES
 APACHE_DEPENDENCIES = apr apr-util pcre
 
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define APACHE_FIXUP_APR_LIBTOOL
+	$(SED) "s@$(PER_PACKAGE_DIR)/[^/]\+/@$(PER_PACKAGE_DIR)/apache/@g" \
+		$(STAGING_DIR)/usr/build-1/libtool
+endef
+APACHE_POST_CONFIGURE_HOOKS += APACHE_FIXUP_APR_LIBTOOL
+endif
+
 APACHE_CONF_ENV= \
 	ap_cv_void_ptr_lt_long=no \
 	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config
