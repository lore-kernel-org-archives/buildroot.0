From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 12:45:51 +0200
Subject: [Buildroot] [git commit] empty: fix compile with toolchain w/o
	threads
Message-ID: <20150808104607.B24B1817DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9dd523c48f8c9e250da8694308fe24e6bab2fdc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As found via autobuilders and discussed on the list, the
ifdef is wrong, as empty uses SysV semaphores and not POSIX
semaphores.

Tested with glibc/uclibc-ng builds. And with uclibc-ng without
threads.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/empty/0002-fix-non-thread-build.patch |   49 +++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/empty/0002-fix-non-thread-build.patch b/package/empty/0002-fix-non-thread-build.patch
new file mode 100644
index 0000000..a7e8d90
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
