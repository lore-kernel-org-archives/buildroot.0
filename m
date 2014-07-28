From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Jul 2014 18:57:04 +0400
Subject: [Buildroot] [PATCH] binutils: gdb: Support unified binutils-gdb git
	repository
Message-ID: <1406559424-15244-1-git-send-email-Anton.Kolesov@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If Binutils and/or GDB are fetched from the unified bintuils-gdb repository,
then tarball will contain both Binutils and GDB sources, unlike the "normal"
tarballs that contain only the titular package. To keep packages separated
in Buildroot we need to disable undesired components when configuring.

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

ARC GNU Toolchain will use a unified binutils-gdb repository starting from the
August release. I'm sending this patch in advance to ensure that it will be
sorted out before our release.
