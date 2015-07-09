From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 9 Jul 2015 11:31:40 +0200
Subject: [Buildroot] [PATCH] empty: fix compile with toolchain w/o threads
Message-ID: <20150709093140.GA8600@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As found via autobuilders and discussed on the list, the
ifdef is wrong, as empty uses SysV semaphores and not POSIX
semaphores.

Tested with glibc/uclibc-ng builds. And with uclibc-ng without
threads.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/empty/0002-fix-non-thread-build.patch |   49 +++++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/empty/0002-fix-non-thread-build.patch

diff --git a/package/empty/0002-fix-non-thread-build.patch b/package/empty/0002-fix-non-thread-build.patch
new file mode 100644
index 0000000..4854d86
--- /dev/null
+++ b/package/empty/0002-fix-non-thread-build.patch
@@ -0,0 +1,49 @@
+empty uses SysV semaphores, so the ifdef is wrong here.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+--- empty-0.6.19b.orig/empty.c	2012-09-19 13:24:05.000000000 +0200
++++ empty-0.6.19b/empty.c	2015-07-09 02:00:09.000000000 +0200
+@@ -179,25 +179,23 @@ int main (int argc, char *argv[]) {
+ 					   2 - unknown */
+ 	
+ /* semaphores */
+-#ifdef _POSIX_SEMAPHORES
+-	#if defined(__linux__) && defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED)
+-		/* union semun is defined by including <sys/sem.h> */
+-	#else
+-		union semun {
+-			int val;
+-			struct semid_ds *buf;
+-		#ifdef __SVR4
+-			ushort_t	*array;
+-		#endif
+-		#ifdef __hpux__
+-			ushort		*array;
+-		#endif
+-		#ifdef __linux__
+-			unsigned short *array;
+-			struct seminfo *__buf;		/* buffer for IPC_INFO */
+-		#endif
+-		};
+-  	#endif
++#if defined(__linux__) && defined(__GNU_LIBRARY__) && !defined(_SEM_SEMUN_UNDEFINED)
++	/* union semun is defined by including <sys/sem.h> */
++#else
++	union semun {
++		int val;
++		struct semid_ds *buf;
++	#ifdef __SVR4
++		ushort_t	*array;
++	#endif
++	#ifdef __hpux__
++		ushort		*array;
++	#endif
++	#ifdef __linux__
++		unsigned short *array;
++		struct seminfo *__buf;		/* buffer for IPC_INFO */
++	#endif
++	};
+ #endif
+ 	union semun semu;
+ 	
-- 
1.7.10.4
