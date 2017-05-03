From: Baruch Siach <baruch@tkos.co.il>
Date: Wed,  3 May 2017 15:01:03 +0300
Subject: [Buildroot] [PATCH] empty: bump to version 0.6.20b
Message-ID: <551bc33d600ea93bb2e336a6bd972a6861601daf.1493812863.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/empty/0002-fix-non-thread-build.patch | 49 ---------------------------
 package/empty/empty.hash                      |  2 +-
 package/empty/empty.mk                        |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/empty/0002-fix-non-thread-build.patch

diff --git a/package/empty/0002-fix-non-thread-build.patch b/package/empty/0002-fix-non-thread-build.patch
deleted file mode 100644
index a7e8d90a212f..000000000000
--- a/package/empty/0002-fix-non-thread-build.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-empty uses SysV semaphores, so the ifdef is wrong here.
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
---- empty-0.6.19b.orig/empty.c	2012-09-19 13:24:05.000000000 +0200
-+++ empty-0.6.19b/empty.c	2015-07-09 02:00:09.000000000 +0200
-@@ -179,25 +179,23 @@ int main (int argc, char *argv[]) {
- 					   2 - unknown */
- 	
- /* semaphores */
--#ifdef _POSIX_SEMAPHORES
--	#if defined(__linux__) && defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED)
--		/* union semun is defined by including <sys/sem.h> */
--	#else
--		union semun {
--			int val;
--			struct semid_ds *buf;
--		#ifdef __SVR4
--			ushort_t	*array;
--		#endif
--		#ifdef __hpux__
--			ushort		*array;
--		#endif
--		#ifdef __linux__
--			unsigned short *array;
--			struct seminfo *__buf;		/* buffer for IPC_INFO */
--		#endif
--		};
--  	#endif
-+#if defined(__linux__) && defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED)
-+	/* union semun is defined by including <sys/sem.h> */
-+#else
-+	union semun {
-+		int val;
-+		struct semid_ds *buf;
-+	#ifdef __SVR4
-+		ushort_t	*array;
-+	#endif
-+	#ifdef __hpux__
-+		ushort		*array;
-+	#endif
-+	#ifdef __linux__
-+		unsigned short *array;
-+		struct seminfo *__buf;		/* buffer for IPC_INFO */
-+	#endif
-+	};
- #endif
- 	union semun semu;
- 	
diff --git a/package/empty/empty.hash b/package/empty/empty.hash
index 91402889fa5e..e62939687db7 100644
--- a/package/empty/empty.hash
+++ b/package/empty/empty.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  05b7cb361ef815774abda325c09c573f8c9039ccbb71eedc743439e4637c314a  empty-0.6.19b.tgz
+sha256  7e6636e400856984c4405ce7bd0843aaa3329fa3efd20c58df8400a9eaa35f09  empty-0.6.20b.tgz
diff --git a/package/empty/empty.mk b/package/empty/empty.mk
index a1cc3c0526a3..5e3ed42befd4 100644
--- a/package/empty/empty.mk
+++ b/package/empty/empty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMPTY_VERSION = 0.6.19b
+EMPTY_VERSION = 0.6.20b
 EMPTY_SOURCE = empty-$(EMPTY_VERSION).tgz
 EMPTY_SITE = http://downloads.sourceforge.net/project/empty/empty/empty-$(EMPTY_VERSION)
 EMPTY_LICENSE = BSD-3-Clause
-- 
2.11.0
