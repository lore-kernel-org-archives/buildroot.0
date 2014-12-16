From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 16 Dec 2014 22:40:53 +0100
Subject: [Buildroot] [PATCH RFC 1/1] package/xfsprogs: fix shared-only build
Message-ID: <1418766053-31581-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The shared-only build is not supported by xfsprogs because
without --enable-static, the buildin libraries (libxfs, libxcmd ...)
are only build as shared libraries and xfs tools requires the static
one.

Also, we needs to replaces -static with -static-libtool-libs for the
shared-only case, in order to allow the fallback to the linking with
the shared version of libuuid library.

Fixes:
http://autobuild.buildroot.net/results/139/139fa30756d35a24209136068c818802074908de/
http://autobuild.buildroot.net/results/e2e/e2eef5dbadec555756a912a24978c78c0013ee70/
http://autobuild.buildroot.net/results/08c/08c4bc5037379a8ca312e3e7574067235da74030/

And many more.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...-replaces-static-with-static-libtool-libs.patch | 129 +++++++++++++++++++++
 package/xfsprogs/xfsprogs.mk                       |   3 +-
 2 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 package/xfsprogs/0001-xfsprogs-replaces-static-with-static-libtool-libs.patch

diff --git a/package/xfsprogs/0001-xfsprogs-replaces-static-with-static-libtool-libs.patch b/package/xfsprogs/0001-xfsprogs-replaces-static-with-static-libtool-libs.patch
new file mode 100644
index 0000000..3cfc4e9
--- /dev/null
+++ b/package/xfsprogs/0001-xfsprogs-replaces-static-with-static-libtool-libs.patch
@@ -0,0 +1,129 @@
+From 837e0a3bfe4b414a48c77aaf930b5e04b4e2c5e5 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Tue, 16 Dec 2014 22:06:26 +0100
+Subject: [PATCH 1/1] xfsprogs: replaces -static with -static-libtool-libs
+
+xfsprogs rely on the original behaviour of -static which was modified by [1].
+But since commit [2] the build of xfsprogs tools is broken because they try
+to link statically with the static libuuid library (util-linux), which is not
+build for shared only build.
+
+The use of -static-libtool-libs allows to fallback to the dynamic linking for
+libuuid only:
+
+LD_TRACE_LOADED_OBJECTS=1 xfs_copy
+	linux-gate.so.1 =>  (0xf7793000)
+	libuuid.so.1 => /lib/libuuid.so.1 (0x465e1000)
+	libpthread.so.0 => /lib/libpthread.so.0 (0x46db1000)
+	librt.so.1 => /lib/librt.so.1 (0x46f21000)
+	libc.so.6 => /lib/libc.so.6 (0x46bf1000)
+	/lib/ld-linux.so.2 (0x46bce000)
+
+[1] http://git.buildroot.net/buildroot/commit/?id=97703978ac870ce2b14ad144f8e082de82aa2c64
+[2] http://git.buildroot.net/buildroot/commit/?id=f1d3e09895b245da9d54bbaef36e5de95269034e
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ copy/Makefile     | 2 +-
+ db/Makefile       | 2 +-
+ growfs/Makefile   | 2 +-
+ io/Makefile       | 2 +-
+ logprint/Makefile | 2 +-
+ mkfs/Makefile     | 2 +-
+ repair/Makefile   | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/copy/Makefile b/copy/Makefile
+index 54f6dfb..beabbd4 100644
+--- a/copy/Makefile
++++ b/copy/Makefile
+@@ -11,7 +11,7 @@ HFILES = xfs_copy.h
+ 
+ LLDLIBS = $(LIBXFS) $(LIBUUID) $(LIBPTHREAD) $(LIBRT)
+ LTDEPENDENCIES = $(LIBXFS)
+-LLDFLAGS = -static
++LLDFLAGS = -static-libtool-libs
+ 
+ default: depend $(LTCOMMAND)
+ 
+diff --git a/db/Makefile b/db/Makefile
+index 5c7d054..b4c49c6 100644
+--- a/db/Makefile
++++ b/db/Makefile
+@@ -18,7 +18,7 @@ LSRCFILES = xfs_admin.sh xfs_check.sh xfs_ncheck.sh xfs_metadump.sh
+ 
+ LLDLIBS	= $(LIBXFS) $(LIBXLOG) $(LIBUUID) $(LIBRT) $(LIBPTHREAD)
+ LTDEPENDENCIES = $(LIBXFS) $(LIBXLOG)
+-LLDFLAGS += -static
++LLDFLAGS += -static-libtool-libs
+ 
+ ifeq ($(ENABLE_READLINE),yes)
+ LLDLIBS += $(LIBREADLINE) $(LIBTERMCAP)
+diff --git a/growfs/Makefile b/growfs/Makefile
+index 88cbf4f..19616de 100644
+--- a/growfs/Makefile
++++ b/growfs/Makefile
+@@ -19,7 +19,7 @@ LLDLIBS += $(LIBEDITLINE) $(LIBTERMCAP)
+ endif
+ 
+ LTDEPENDENCIES = $(LIBXFS) $(LIBXCMD)
+-LLDFLAGS = -static
++LLDFLAGS = -static-libtool-libs
+ LSRCFILES = xfs_info.sh
+ 
+ default: depend $(LTCOMMAND)
+diff --git a/io/Makefile b/io/Makefile
+index 50edf91..89b465b 100644
+--- a/io/Makefile
++++ b/io/Makefile
+@@ -14,7 +14,7 @@ CFILES = init.c \
+ 
+ LLDLIBS = $(LIBXCMD) $(LIBHANDLE)
+ LTDEPENDENCIES = $(LIBXCMD) $(LIBHANDLE)
+-LLDFLAGS = -static
++LLDFLAGS = -static-libtool-libs
+ 
+ ifeq ($(HAVE_FADVISE),yes)
+ CFILES += fadvise.c
+diff --git a/logprint/Makefile b/logprint/Makefile
+index 2d656a4..7bcf27f 100644
+--- a/logprint/Makefile
++++ b/logprint/Makefile
+@@ -14,7 +14,7 @@ CFILES = logprint.c \
+ 
+ LLDLIBS	= $(LIBXFS) $(LIBXLOG) $(LIBUUID) $(LIBRT) $(LIBPTHREAD)
+ LTDEPENDENCIES = $(LIBXFS) $(LIBXLOG)
+-LLDFLAGS = -static
++LLDFLAGS = -static-libtool-libs
+ 
+ default: depend $(LTCOMMAND)
+ 
+diff --git a/mkfs/Makefile b/mkfs/Makefile
+index 75da633..fd1f615 100644
+--- a/mkfs/Makefile
++++ b/mkfs/Makefile
+@@ -21,7 +21,7 @@ endif
+ 
+ LLDLIBS += $(LIBXFS) $(LIBUUID) $(LIBRT) $(LIBPTHREAD)
+ LTDEPENDENCIES += $(LIBXFS)
+-LLDFLAGS = -static
++LLDFLAGS = -static-libtool-libs
+ 
+ LSRCFILES = $(FSTYP).c
+ LDIRT = $(FSTYP)
+diff --git a/repair/Makefile b/repair/Makefile
+index b0e03f8..e9db30f 100644
+--- a/repair/Makefile
++++ b/repair/Makefile
+@@ -22,7 +22,7 @@ CFILES = agheader.c attr_repair.c avl.c avl64.c bmap.c btree.c \
+ 
+ LLDLIBS = $(LIBXFS) $(LIBXLOG) $(LIBUUID) $(LIBRT) $(LIBPTHREAD)
+ LTDEPENDENCIES = $(LIBXFS) $(LIBXLOG)
+-LLDFLAGS = -static
++LLDFLAGS = -static-libtool-libs
+ 
+ default: depend $(LTCOMMAND)
+ 
+-- 
+1.9.3
+
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index dd3767a..209a49b 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -14,7 +14,8 @@ XFSPROGS_CONF_OPTS = \
 	--enable-lib64=no \
 	--enable-gettext=no \
 	INSTALL_USER=root \
-	INSTALL_GROUP=root
+	INSTALL_GROUP=root \
+	--enable-static
 
 XFSPROGS_INSTALL_TARGET_OPTS = DIST_ROOT=$(TARGET_DIR) install
 
-- 
1.9.3
