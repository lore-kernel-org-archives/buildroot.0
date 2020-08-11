From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 22:39:02 +0200
Subject: [Buildroot] [git commit branch/next] package/libfuse3: bump to
 version 3.9.4
Message-ID: <20200812144329.D58C985F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1005ad6756ef82acaf365449b99130ca085c7be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch (already in version). The commit list between 3.9.2 and
3.9.4 is just made of fixes:

db9b4fa148e6c22c0d4b4c567fa65d1cd5368152 Released 3.9.4
50cbca799c1f9b010fabaa0dd4a387f29d140873 fuse_send_data_iov(): correctly calculate total buffer size.
7b3e3899157566875280a8b860eb5ad5c73eadc1 Define fuse_session_loop_mt as a macro on uclibc and MacOS (#532)
c5e8684b5a2f3400af6d7a3edcaeb3ce8ffc51b5 Fixed typo in command to compile program (#536)
e8a9e84672dcaa892d4708c163f768dc177b6d4c Doc fixes (#537)
d1deae6968c49d83334e874c33abfe15824c4548 Fix FreeBSD CI (#539)
48450411647ca0818821af7b05b819ceff92ae7c Fix: crash on failure to set locale (#529)
9e1c2a4959c16c0b50090dd822389ad9acb08111 fuse_lowlevel: Move assert for se before dereferencing it with se->debug (#530)
7471156354002c6547aa6c3a4f39a3262f435ba4 Fixed minor print alignment issue in iconv_help(), replacing tab with space (#519)
9fa4dc1661f085d4e89a54d75acc3347d52f33fa Fix the typo "filed" -> "field" in fuse manpage (#524)
717c8b8b3ed815f14e5607a995d0113446e3fb0b README: Correct the directory name from 'examples' to 'example' (#526)
032db1ab298d62c4d0c5be1f9fb2df299aec2346 docs: Replace `mesonconf` with `meson configure` (#528)
06342ca60ed822b856990915f127d8beddc0d1f6 libfuse: Assign NULL to "old" to avoid free it twice (#522)
5021d6a0a100d4987be126e87b7ee5fbfc17bbdc Typo fixed. (#520)

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...on_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch | 52 ----------------------
 package/libfuse3/libfuse3.hash                     |  2 +-
 package/libfuse3/libfuse3.mk                       |  2 +-
 3 files changed, 2 insertions(+), 54 deletions(-)

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
