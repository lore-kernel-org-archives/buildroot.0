From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Tue, 29 Jul 2014 16:54:37 +0400
Subject: [Buildroot] [PATCH v2] binutils: gdb: Support unified binutils-gdb
	git repository
In-Reply-To: <da75c405-7171-4d8a-883c-19b2b24863ee@email.android.com>
References: <da75c405-7171-4d8a-883c-19b2b24863ee@email.android.com>
Message-ID: <1406638477-30555-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If Binutils and/or GDB are fetched from the unified bintuils-gdb repository,
then tarball will contain both Binutils and GDB sources, unlike the "normal"
tarballs that contain only the titular package. To keep packages separated
in Buildroot we need to disable undesired components when configuring.

Binutils and GDB migrated to a common Git repository in the October 2013
[1]. Previous Git repositories were incomplete copies of CVS repository
which copied only the relevant files (no binutils files in GDB, and vice
versa). In the new binutils-gdb repository there is no such separation and
a result all files exist in directory after checkout. So if "configure" and
"make" are used without explicit targets, all projects will be built:
binutils, ld, gas, bfd, opcodes, gdb, etc. In case of Buildroot this would
mean that selecting Binutils only, still will build both Binutils and GDB.
And if GDB is selected as well, then both packages will be built two times,
and Binutils from GDB directory will overwrite initial build of Binutils (or
vice versa if Binutils will be built after the GDB). This is a serious
problem, because binutils and GDB use separate branches in this common
repository. In case of Buildroot this means that separate Git commits (or
tags) should be used when downloading source from Git.

This affects only Git repositories, because GNU release tarballs still
contain only relevant packages.

This change is backward compatible, because if "normal" tarball is used
(without extra directories), than --disable-* configure options are just
ignored by configure.

[1] https://sourceware.org/ml/gdb/2013-10/msg00071.html

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
---
 package/binutils/binutils.mk | 2 ++
 package/gdb/gdb.mk           | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 77d0751..2beb5e0 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -47,6 +47,7 @@ BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 		--host=$(GNU_TARGET_NAME) \
 		--target=$(GNU_TARGET_NAME) \
 		--enable-install-libiberty \
+		--disable-sim --disable-gdb \
 		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # Don't build documentation. It takes up extra space / build time,
@@ -65,6 +66,7 @@ HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 			--target=$(GNU_TARGET_NAME) \
 			--disable-shared --enable-static \
 			--with-sysroot=$(STAGING_DIR) \
+			--disable-sim --disable-gdb \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # We just want libbfd and libiberty, not the full-blown binutils in staging
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 6640d2c..c58ad21 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -67,6 +67,9 @@ GDB_CONF_OPT = \
 	--disable-gdbtk \
 	--without-x \
 	--disable-sim \
+	--disable-binutils \
+	--disable-ld \
+	--disable-gas \
 	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver) \
 	--with-curses \
 	--without-included-gettext \
@@ -111,6 +114,9 @@ HOST_GDB_CONF_OPT = \
 	--enable-threads \
 	--disable-werror \
 	--without-included-gettext \
+	--disable-binutils \
+	--disable-ld \
+	--disable-gas \
 	--disable-sim
 
 ifeq ($(GDB_FROM_GIT),y)
-- 
1.8.4.1
