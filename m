From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 19:23:49 +0200
Subject: [Buildroot] [git commit] binutils,
	gdb: support unified binutils-gdb git repository
Message-ID: <20140730172450.9DECC9D34A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b737b12dadd321858f20efcb6b504c8ccbd21fcf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If Binutils and/or GDB are fetched from the unified binutils-gdb
repository, then the tarball will contain both Binutils and GDB
sources, unlike the "normal" tarballs that contain only the titular
package. To keep packages separated in Buildroot we need to disable
undesired components when configuring.

Binutils and GDB migrated to a common Git repository in the October
2013 [1]. Previous Git repositories were incomplete copies of CVS
repository which copied only the relevant files (no binutils files in
GDB, and vice versa). In the new binutils-gdb repository there is no
such separation and a result all files exist in directory after
checkout. So if "configure" and "make" are used without explicit
targets, all projects will be built: binutils, ld, gas, bfd, opcodes,
gdb, etc. In case of Buildroot this would mean that selecting Binutils
only, still will build both Binutils and GDB.  And if GDB is selected
as well, then both packages will be built two times, and Binutils from
GDB directory will overwrite initial build of Binutils (or vice versa
if Binutils will be built after the GDB). This is a serious problem,
because binutils and GDB use separate branches in this common
repository. In case of Buildroot this means that separate Git commits
(or tags) should be used when downloading source from Git.

This affects only Git repositories, because GNU release tarballs still
contain only relevant packages.

This change is backward compatible, because if "normal" tarball is
used (without extra directories), than --disable-* configure options
are just ignored by configure.

[1] https://sourceware.org/ml/gdb/2013-10/msg00071.html

[Thomas: use variables to factorize options, and add comments in the
relevant .mk files to explain what's going on.]

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk |    8 ++++++++
 package/gdb/gdb.mk           |   10 ++++++++++
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 77d0751..4888eeb 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -42,11 +42,18 @@ BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
 HOST_BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
 endif
 
+# When binutils sources are fetched from the binutils-gdb repository,
+# they also contain the gdb sources, but gdb shouldn't be built, so we
+# disable it.
+BINUTILS_DISABLE_GDB_CONF_OPT = \
+	--disable-sim --disable-gdb
+
 # We need to specify host & target to avoid breaking ARM EABI
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 		--host=$(GNU_TARGET_NAME) \
 		--target=$(GNU_TARGET_NAME) \
 		--enable-install-libiberty \
+		$(BINUTILS_DISABLE_GDB_CONF_OPT) \
 		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # Don't build documentation. It takes up extra space / build time,
@@ -65,6 +72,7 @@ HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 			--target=$(GNU_TARGET_NAME) \
 			--disable-shared --enable-static \
 			--with-sysroot=$(STAGING_DIR) \
+			$(BINUTILS_DISABLE_GDB_CONF_OPT) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
 # We just want libbfd and libiberty, not the full-blown binutils in staging
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 6640d2c..063a7ac 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -50,6 +50,14 @@ GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
+# When gdb sources are fetched from the binutils-gdb repository, they
+# also contain the binutils sources, but binutils shouldn't be built,
+# so we disable it.
+GDB_DISABLE_BINUTILS_CONF_OPT = \
+	--disable-binutils \
+	--disable-ld \
+	--disable-gas
+
 GDB_CONF_ENV = \
 	ac_cv_type_uintptr_t=yes \
 	gt_cv_func_gettext_libintl=yes \
@@ -67,6 +75,7 @@ GDB_CONF_OPT = \
 	--disable-gdbtk \
 	--without-x \
 	--disable-sim \
+	$(GDB_DISABLE_BINUTILS_CONF_OPT) \
 	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver) \
 	--with-curses \
 	--without-included-gettext \
@@ -111,6 +120,7 @@ HOST_GDB_CONF_OPT = \
 	--enable-threads \
 	--disable-werror \
 	--without-included-gettext \
+	$(GDB_DISABLE_BINUTILS_CONF_OPT) \
 	--disable-sim
 
 ifeq ($(GDB_FROM_GIT),y)
