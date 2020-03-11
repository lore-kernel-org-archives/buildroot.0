From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Mar 2020 11:36:01 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/moarvm: bump to version 2020.02.1
In-Reply-To: <20200311103601.6775-1-francois.perrad@gadz.org>
References: <20200311103601.6775-1-francois.perrad@gadz.org>
Message-ID: <20200311103601.6775-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

since version 2020.02, moarvm depends on libtommath 1.2.0

the patch is useless since the bump of the embedded dyncall:
https://github.com/MoarVM/dyncall/commit/4b85baf44b9cf079d55cf74d26dc749659151e11

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...unix.c-don-t-use-RTLD_DI_LINKMAP-wit.patch | 38 -------------------
 package/moarvm/moarvm.hash                    |  2 +-
 package/moarvm/moarvm.mk                      |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 package/moarvm/0001-dynload-dynload_unix.c-don-t-use-RTLD_DI_LINKMAP-wit.patch

diff --git a/package/moarvm/0001-dynload-dynload_unix.c-don-t-use-RTLD_DI_LINKMAP-wit.patch b/package/moarvm/0001-dynload-dynload_unix.c-don-t-use-RTLD_DI_LINKMAP-wit.patch
deleted file mode 100644
index 326423679..000000000
--- a/package/moarvm/0001-dynload-dynload_unix.c-don-t-use-RTLD_DI_LINKMAP-wit.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From a83f1fd053aadd2e849df80f67b69ba7298341f3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 25 Dec 2019 20:37:57 +0100
-Subject: [PATCH] dynload/dynload_unix.c: don't use RTLD_DI_LINKMAP with uclibc
-
-RTLD_DI_LINKMAP is not defined on uclibc so check that __UCLIBC__ is not
-defined before using it otherwise build fails on:
-
-dynload_unix.c:93:19: error: 'RTLD_DI_LINKMAP' undeclared (first use in this function); did you mean 'RTLD_BINDING_MASK'?
-   if(dlinfo(pLib, RTLD_DI_LINKMAP, &p) == 0) {
-                   ^~~~~~~~~~~~~~~
-                   RTLD_BINDING_MASK
-
-Fixes:
- - http://autobuild.buildroot.org/results/b88e55dde1acab967023ae49bb1722eadb9cc6ab
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/MoarVM/dyncall/pull/6]
----
- dynload/dynload_unix.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/3rdparty/dyncall/dynload/dynload_unix.c b/3rdparty/dyncall/dynload/dynload_unix.c
-index adfd351..129a1e5 100644
---- a/3rdparty/dyncall/dynload/dynload_unix.c
-+++ b/3rdparty/dyncall/dynload/dynload_unix.c
-@@ -82,7 +82,7 @@ void dlFreeLibrary(DLLib* pLib)
- /* that: check for RTLD_DI_LINKMAP (#define for dlinfo()), or if GNU C Lib */
- /* is used (where RTLD_DI_LINKMAP is an enum), or by OS (dlinfo comes from */
- /* Solaris), etc. */
--#if defined(RTLD_DI_LINKMAP) || defined(OS_SunOS) || defined(__GLIBC__) /* @@@ dlinfo() was introduced in glibc 2.3.3 (in 2003), somehow check for that, also */
-+#if defined(RTLD_DI_LINKMAP) || defined(OS_SunOS) || (defined(__GLIBC__) && !defined(__UCLIBC__)) /* @@@ dlinfo() was introduced in glibc 2.3.3 (in 2003), somehow check for that, also */
- 
- #include <link.h>
- 
--- 
-2.24.0
-
diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 908885f68..29c6ce77f 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 dcb61e44a098e8375c385eb9d52bd6394255a388697b2f6a52d88e6cf4a53587  MoarVM-2020.01.1.tar.gz
+sha256 82cb80b29ad7aebb0c0b42449d371eafa8935b07884526345f9788c8bcf4d632  MoarVM-2020.02.1.tar.gz
 sha256 c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index e554ddb6d..a0c7766bf 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2020.01.1
+MOARVM_VERSION = 2020.02.1
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
-- 
2.20.1
