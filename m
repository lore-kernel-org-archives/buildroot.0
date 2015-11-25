From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Nov 2015 12:38:53 +0100
Subject: [Buildroot] [git commit] xfsprogs: bump version to 4.3.0
Message-ID: <20151201232122.8F24A8194A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfcbcce4d086a2d220275646870f8119f6aa7e48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 4.3.0
- Update hash value
- Add new mandatory blkid dependency
- Remove upstreamed patch:
  0001-xfsprogs-replaces-static-with-static-libtool-libs.patch
- Add new patch which has been sent upstream:
  0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...o-not-do-dynamic-linking-of-libtool-libra.patch |  40 +++++++
 ...-replaces-static-with-static-libtool-libs.patch | 129 ---------------------
 package/xfsprogs/Config.in                         |   1 +
 package/xfsprogs/xfsprogs.hash                     |   4 +-
 package/xfsprogs/xfsprogs.mk                       |   2 +-
 5 files changed, 44 insertions(+), 132 deletions(-)

diff --git a/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
new file mode 100644
index 0000000..3f79dbb
--- /dev/null
+++ b/package/xfsprogs/0001-mdrestore-do-not-do-dynamic-linking-of-libtool-libra.patch
@@ -0,0 +1,40 @@
+mdrestore: do not do dynamic linking of libtool libraries
+
+This patch has been sent upstream:
+
+  http://oss.sgi.com/pipermail/xfs/2015-November/045136.html
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From a406326f724006d62085a0aeae1072b4145caa9d Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 25 Nov 2015 10:50:00 +0000
+Subject: [PATCH] mdrestore: do not do dynamic linking of libtool libraries
+
+As explained in commit ece49daeff1a3cad765e106d678c608925c9d768, use
+-static-libtool-libs instead of -static to allow fallback to the dynamic
+linking for libuuid only. Otherwise the build will fail like this:
+
+ld: attempted static link of dynamic object `/usr/lib/libuuid.so'
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ mdrestore/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mdrestore/Makefile b/mdrestore/Makefile
+index 5171306..1b34a0e 100644
+--- a/mdrestore/Makefile
++++ b/mdrestore/Makefile
+@@ -10,7 +10,7 @@ CFILES = xfs_mdrestore.c
+ 
+ LLDLIBS = $(LIBXFS) $(LIBRT) $(LIBPTHREAD) $(LIBUUID)
+ LTDEPENDENCIES = $(LIBXFS)
+-LLDFLAGS = -static
++LLDFLAGS = -static-libtool-libs
+ 
+ default: depend $(LTCOMMAND)
+ 
+-- 
+2.4.10
+
diff --git a/package/xfsprogs/0001-xfsprogs-replaces-static-with-static-libtool-libs.patch b/package/xfsprogs/0001-xfsprogs-replaces-static-with-static-libtool-libs.patch
deleted file mode 100644
index 53bd96c..0000000
--- a/package/xfsprogs/0001-xfsprogs-replaces-static-with-static-libtool-libs.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From 837e0a3bfe4b414a48c77aaf930b5e04b4e2c5e5 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Tue, 16 Dec 2014 22:06:26 +0100
-Subject: [PATCH 1/1] xfsprogs: replaces -static with -static-libtool-libs
-
-xfsprogs relies on the original behaviour of -static which was
-modified by [1]. But since commit [2] the build of xfsprogs tools is
-broken because they try to link statically with the static libuuid
-library (util-linux), which is not built for shared only builds.
-
-The use of -static-libtool-libs allows to fallback to the dynamic
-linking for libuuid only:
-
-LD_TRACE_LOADED_OBJECTS=1 xfs_copy
-	linux-gate.so.1 =>  (0xf7793000)
-	libuuid.so.1 => /lib/libuuid.so.1 (0x465e1000)
-	libpthread.so.0 => /lib/libpthread.so.0 (0x46db1000)
-	librt.so.1 => /lib/librt.so.1 (0x46f21000)
-	libc.so.6 => /lib/libc.so.6 (0x46bf1000)
-	/lib/ld-linux.so.2 (0x46bce000)
-
-[1] http://git.buildroot.net/buildroot/commit/?id=97703978ac870ce2b14ad144f8e082de82aa2c64
-[2] http://git.buildroot.net/buildroot/commit/?id=f1d3e09895b245da9d54bbaef36e5de95269034e
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- copy/Makefile     | 2 +-
- db/Makefile       | 2 +-
- growfs/Makefile   | 2 +-
- io/Makefile       | 2 +-
- logprint/Makefile | 2 +-
- mkfs/Makefile     | 2 +-
- repair/Makefile   | 2 +-
- 7 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/copy/Makefile b/copy/Makefile
-index 54f6dfb..beabbd4 100644
---- a/copy/Makefile
-+++ b/copy/Makefile
-@@ -11,7 +11,7 @@ HFILES = xfs_copy.h
- 
- LLDLIBS = $(LIBXFS) $(LIBUUID) $(LIBPTHREAD) $(LIBRT)
- LTDEPENDENCIES = $(LIBXFS)
--LLDFLAGS = -static
-+LLDFLAGS = -static-libtool-libs
- 
- default: depend $(LTCOMMAND)
- 
-diff --git a/db/Makefile b/db/Makefile
-index 5c7d054..b4c49c6 100644
---- a/db/Makefile
-+++ b/db/Makefile
-@@ -18,7 +18,7 @@ LSRCFILES = xfs_admin.sh xfs_check.sh xfs_ncheck.sh xfs_metadump.sh
- 
- LLDLIBS	= $(LIBXFS) $(LIBXLOG) $(LIBUUID) $(LIBRT) $(LIBPTHREAD)
- LTDEPENDENCIES = $(LIBXFS) $(LIBXLOG)
--LLDFLAGS += -static
-+LLDFLAGS += -static-libtool-libs
- 
- ifeq ($(ENABLE_READLINE),yes)
- LLDLIBS += $(LIBREADLINE) $(LIBTERMCAP)
-diff --git a/growfs/Makefile b/growfs/Makefile
-index 88cbf4f..19616de 100644
---- a/growfs/Makefile
-+++ b/growfs/Makefile
-@@ -19,7 +19,7 @@ LLDLIBS += $(LIBEDITLINE) $(LIBTERMCAP)
- endif
- 
- LTDEPENDENCIES = $(LIBXFS) $(LIBXCMD)
--LLDFLAGS = -static
-+LLDFLAGS = -static-libtool-libs
- LSRCFILES = xfs_info.sh
- 
- default: depend $(LTCOMMAND)
-diff --git a/io/Makefile b/io/Makefile
-index 50edf91..89b465b 100644
---- a/io/Makefile
-+++ b/io/Makefile
-@@ -14,7 +14,7 @@ CFILES = init.c \
- 
- LLDLIBS = $(LIBXCMD) $(LIBHANDLE)
- LTDEPENDENCIES = $(LIBXCMD) $(LIBHANDLE)
--LLDFLAGS = -static
-+LLDFLAGS = -static-libtool-libs
- 
- ifeq ($(HAVE_FADVISE),yes)
- CFILES += fadvise.c
-diff --git a/logprint/Makefile b/logprint/Makefile
-index 2d656a4..7bcf27f 100644
---- a/logprint/Makefile
-+++ b/logprint/Makefile
-@@ -14,7 +14,7 @@ CFILES = logprint.c \
- 
- LLDLIBS	= $(LIBXFS) $(LIBXLOG) $(LIBUUID) $(LIBRT) $(LIBPTHREAD)
- LTDEPENDENCIES = $(LIBXFS) $(LIBXLOG)
--LLDFLAGS = -static
-+LLDFLAGS = -static-libtool-libs
- 
- default: depend $(LTCOMMAND)
- 
-diff --git a/mkfs/Makefile b/mkfs/Makefile
-index 75da633..fd1f615 100644
---- a/mkfs/Makefile
-+++ b/mkfs/Makefile
-@@ -21,7 +21,7 @@ endif
- 
- LLDLIBS += $(LIBXFS) $(LIBUUID) $(LIBRT) $(LIBPTHREAD)
- LTDEPENDENCIES += $(LIBXFS)
--LLDFLAGS = -static
-+LLDFLAGS = -static-libtool-libs
- 
- LSRCFILES = $(FSTYP).c
- LDIRT = $(FSTYP)
-diff --git a/repair/Makefile b/repair/Makefile
-index b0e03f8..e9db30f 100644
---- a/repair/Makefile
-+++ b/repair/Makefile
-@@ -22,7 +22,7 @@ CFILES = agheader.c attr_repair.c avl.c avl64.c bmap.c btree.c \
- 
- LLDLIBS = $(LIBXFS) $(LIBXLOG) $(LIBUUID) $(LIBRT) $(LIBPTHREAD)
- LTDEPENDENCIES = $(LIBXFS) $(LIBXLOG)
--LLDFLAGS = -static
-+LLDFLAGS = -static-libtool-libs
- 
- default: depend $(LTCOMMAND)
- 
--- 
-1.9.3
-
diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 0998637..2c24cbb 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_XFSPROGS
 	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	help
 	  The XFS file system utilities and libraries
 
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index 3fb02df..d0ff1f3 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature:
-#   ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs-3.1.11.tar.gz.sig
-sha256 adf4980177b5c890c1ca86b9c0e3e4d69a3f95bfc01746844280c2393cf4d6be xfsprogs-3.1.11.tar.gz
+#   ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs-4.3.0.tar.gz.sig
+sha256 3e570ad51153e4be3792f42b2c805ddbd46b55d166eba3102ec87d5006d4cb5c  xfsprogs-4.3.0.tar.gz
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 209a49b..30c4777 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 3.1.11
+XFSPROGS_VERSION = 4.3.0
 XFSPROGS_SITE = ftp://oss.sgi.com/projects/xfs/cmd_tars
 
 XFSPROGS_DEPENDENCIES = util-linux
