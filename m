From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:53:15 -0300
Subject: [Buildroot] [PATCH] uclibc: drop stray patches
Message-ID: <1413283995-20305-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...9-siginfo_h-add-a-missing-function-member.patch | 66 --------------------
 ...EV_PAD_SIZE-takes-__WORDSIZE-into-account.patch | 70 ----------------------
 2 files changed, 136 deletions(-)
 delete mode 100644 package/uclibc/0.9.32.1/uclibc-0009-siginfo_h-add-a-missing-function-member.patch
 delete mode 100644 package/uclibc/0.9.32.1/uclibc-0010-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch

diff --git a/package/uclibc/0.9.32.1/uclibc-0009-siginfo_h-add-a-missing-function-member.patch b/package/uclibc/0.9.32.1/uclibc-0009-siginfo_h-add-a-missing-function-member.patch
deleted file mode 100644
index 1a837bb..0000000
--- a/package/uclibc/0.9.32.1/uclibc-0009-siginfo_h-add-a-missing-function-member.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-siginfo.h: add a missing function member on ia64, mips and sparc arches
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From b4e6e61e2f7c6fb4bf59f66efaa74591a2112912 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Thu, 02 Jan 2014 15:02:11 +0000
-Subject: siginfo.h: add a missing function member on ia64, mips and sparc arches
-
-Add "__pid_t _tid" member which is used for some packages, like rt-test
-for instance, which fails with an error like this one:
-
-src/cyclictest/cyclictest.c:638:9: error: 'union <anonymous>' has no
-member named '_tid'
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
----
-(limited to 'libc/sysdeps/linux')
-
-diff --git a/libc/sysdeps/linux/ia64/bits/siginfo.h b/libc/sysdeps/linux/ia64/bits/siginfo.h
-index f571f46..82cc73f 100644
---- a/libc/sysdeps/linux/ia64/bits/siginfo.h
-+++ b/libc/sysdeps/linux/ia64/bits/siginfo.h
-@@ -309,6 +309,10 @@ typedef struct sigevent
-       {
- 	int _pad[__SIGEV_PAD_SIZE];
- 
-+	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
-+	   thread to receive the signal.  */
-+	__pid_t _tid;
-+
- 	struct
- 	  {
- 	    void (*_function) (sigval_t);	/* Function to start.  */
-diff --git a/libc/sysdeps/linux/mips/bits/siginfo.h b/libc/sysdeps/linux/mips/bits/siginfo.h
-index 79fb15a..84b08ca 100644
---- a/libc/sysdeps/linux/mips/bits/siginfo.h
-+++ b/libc/sysdeps/linux/mips/bits/siginfo.h
-@@ -281,6 +281,10 @@ typedef struct sigevent
-       {
- 	int _pad[__SIGEV_PAD_SIZE];
- 
-+	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
-+	   thread to receive the signal.  */
-+	__pid_t _tid;
-+
- 	struct
- 	  {
- 	    void (*_function) (sigval_t);	/* Function to start.  */
-diff --git a/libc/sysdeps/linux/sparc/bits/siginfo.h b/libc/sysdeps/linux/sparc/bits/siginfo.h
-index 6f2d035..3ffeb6d 100644
---- a/libc/sysdeps/linux/sparc/bits/siginfo.h
-+++ b/libc/sysdeps/linux/sparc/bits/siginfo.h
-@@ -288,6 +288,10 @@ typedef struct sigevent
-       {
- 	int _pad[__SIGEV_PAD_SIZE];
- 
-+	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
-+	   thread to receive the signal.  */
-+	__pid_t _tid;
-+
- 	struct
- 	  {
- 	    void (*_function) (sigval_t);	/* Function to start.  */
---
-cgit v0.9.1
diff --git a/package/uclibc/0.9.32.1/uclibc-0010-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch b/package/uclibc/0.9.32.1/uclibc-0010-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
deleted file mode 100644
index 1ad84c5..0000000
--- a/package/uclibc/0.9.32.1/uclibc-0010-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-siginfo.h: __SIGEV_PAD_SIZE takes __WORDSIZE into account
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-From b97b4b698b023f75b54f987859c856ab4861ea00 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Date: Thu, 02 Jan 2014 15:02:12 +0000
-Subject: siginfo.h: __SIGEV_PAD_SIZE takes __WORDSIZE into account
-
-Make __SIGEV_PAD_SIZE to take __WORDSIZE into account for alpha, mips
-and ia64 arches.
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
----
-(limited to 'libc/sysdeps/linux')
-
-diff --git a/libc/sysdeps/linux/alpha/bits/siginfo.h b/libc/sysdeps/linux/alpha/bits/siginfo.h
-index 9993f66..0a37ad0 100644
---- a/libc/sysdeps/linux/alpha/bits/siginfo.h
-+++ b/libc/sysdeps/linux/alpha/bits/siginfo.h
-@@ -257,7 +257,11 @@ enum
- 
- /* Structure to transport application-defined values with signals.  */
- # define __SIGEV_MAX_SIZE	64
--# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
-+# if __WORDSIZE == 64
-+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
-+# else
-+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
-+# endif
- 
- typedef struct sigevent
-   {
-diff --git a/libc/sysdeps/linux/ia64/bits/siginfo.h b/libc/sysdeps/linux/ia64/bits/siginfo.h
-index 82cc73f..3ac988b 100644
---- a/libc/sysdeps/linux/ia64/bits/siginfo.h
-+++ b/libc/sysdeps/linux/ia64/bits/siginfo.h
-@@ -297,7 +297,11 @@ enum
- 
- /* Structure to transport application-defined values with signals.  */
- # define __SIGEV_MAX_SIZE	64
--# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
-+# if __WORDSIZE == 64
-+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
-+# else
-+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
-+# endif
- 
- typedef struct sigevent
-   {
-diff --git a/libc/sysdeps/linux/mips/bits/siginfo.h b/libc/sysdeps/linux/mips/bits/siginfo.h
-index 84b08ca..a6e4135 100644
---- a/libc/sysdeps/linux/mips/bits/siginfo.h
-+++ b/libc/sysdeps/linux/mips/bits/siginfo.h
-@@ -264,8 +264,11 @@ enum
- 
- /* Structure to transport application-defined values with signals.  */
- # define __SIGEV_MAX_SIZE	64
--# define __SIGEV_HEAD_SIZE	(sizeof(long) + 2*sizeof(int))
--# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE - __SIGEV_HEAD_SIZE) / sizeof (int))
-+# if __WORDSIZE == 64
-+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
-+# else
-+#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
-+# endif
- 
- /* Forward declaration of the `pthread_attr_t' type.  */
- struct __pthread_attr_s;
---
-cgit v0.9.1
-- 
2.0.4
