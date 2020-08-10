From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 10 Aug 2020 07:18:40 +0300
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: bump to version 3.9.4
Message-ID: <20200810041840.24613-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch (already in version).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 ...op_mt-as-a-macro-on-uclibc-and-MacOS.patch | 52 -------------------
 package/libfuse3/libfuse3.hash                |  2 +-
 package/libfuse3/libfuse3.mk                  |  2 +-
 3 files changed, 2 insertions(+), 54 deletions(-)
 delete mode 100644 package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch

diff --git a/package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch b/package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch
deleted file mode 100644
index bd9181ac1d..0000000000
--- a/package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 7b3e3899157566875280a8b860eb5ad5c73eadc1 Mon Sep 17 00:00:00 2001
-From: asafkahlon <35964924+asafkahlon@users.noreply.github.com>
-Date: Sun, 9 Aug 2020 14:37:26 +0300
-Subject: [PATCH] Define fuse_session_loop_mt as a macro on uclibc and MacOS
- (#532)
-
-On uclibc and MacOS we don't use versioned symbols. Hence,
-there's no definition for fuse_session_loop_mt on those cases
-and the linker won't be able to resolve calls to fuse_session_loop_mt()
-
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
-[Retrieved from: https://github.com/libfuse/libfuse/pull/532]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998 at free.fr: update to use upstream commit]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- include/fuse_lowlevel.h | 5 +++++
- lib/fuse_versionscript  | 1 +
- 2 files changed, 6 insertions(+)
-
-diff --git a/include/fuse_lowlevel.h b/include/fuse_lowlevel.h
-index e2b4617..f2ef622 100644
---- a/include/fuse_lowlevel.h
-+++ b/include/fuse_lowlevel.h
-@@ -1982,7 +1982,12 @@ int fuse_session_loop(struct fuse_session *se);
- int fuse_session_loop_mt_31(struct fuse_session *se, int clone_fd);
- #define fuse_session_loop_mt(se, clone_fd) fuse_session_loop_mt_31(se, clone_fd)
- #else
-+#if (!defined(__UCLIBC__) && !defined(__APPLE__))
- int fuse_session_loop_mt(struct fuse_session *se, struct fuse_loop_config *config);
-+#else
-+int fuse_session_loop_mt_32(struct fuse_session *se, struct fuse_loop_config *config);
-+#define fuse_session_loop_mt(se, config) fuse_session_loop_mt_32(se, config)
-+#endif
- #endif
- 
- /**
-diff --git a/lib/fuse_versionscript b/lib/fuse_versionscript
-index 235abf4..a06f768 100644
---- a/lib/fuse_versionscript
-+++ b/lib/fuse_versionscript
-@@ -146,6 +146,7 @@ FUSE_3.2 {
- 	global:
- 		fuse_session_loop_mt;
- 		fuse_session_loop_mt_31;
-+		fuse_session_loop_mt_32;
- 		fuse_loop_mt;
- 		fuse_loop_mt_31;
- } FUSE_3.1;
--- 
-2.20.1
-
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index c7f371368a..8fd37ff47a 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  b4409255cbda6f6975ca330f5b04cb335b823a95ddd8c812c3d224ec53478fc0  libfuse3-3.9.2.tar.gz
+sha256  9e076ae757a09cac9ce1beb50b3361ae83a831e5abc0f1bf5cdf771cd1320338  libfuse3-3.9.4.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 1e959640e2..6e679fe5a8 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.9.2
+LIBFUSE3_VERSION = 3.9.4
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.26.2
