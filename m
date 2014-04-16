From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Wed, 16 Apr 2014 15:27:52 +0530
Subject: [Buildroot] [PATCH v3] LT.old: Make
	__errno_location/__h_errno_location thread safe
Message-ID: <1397642272-13260-1-git-send-email-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WHY: errno in uClibc is not thread safe

HOW: __errno_location and it's sibling __h_errno_location need to be called
     via PLT - even from within libc. That way when linked with pthread,
     intra-uClibc callers will also use the thread safe version.

     This is achieved by removing the GI alias for these functions,
     ensuring that they get called normally (via PLT)

Verified with ARC LT.old and ARM cubieboard2 buildroot (LT.old)
NPTL is unaffected by this bug.

------------ History behind this patch ---------------------

This is a long standing bug (https://bugs.busybox.net/show_bug.cgi?id=2089)

Others have tried to fix it in past (alteast Peter Korsgaard's patch in 2010),
but somehow failed to be merged (or were backed out afterwards).
http://lists.uclibc.org/pipermail/uclibc/2010-July/044176.html

One of the causes could be side effect of atleast one more bug related to
pthreads and static link which has now been fixed.
http://lists.uclibc.org/pipermail/uclibc/2013-October/047958.html

I have solved this w/o looking at other pacthes but would like to give
credit to Peter and others for confirming that it makes sense.

Cc: Christian Ruppert <christian.ruppert@abilis.com>
CC: Francois Bedard <Francois.Bedard@synopsys.com>
Cc: Joern Rennecke  <joern.rennecke@embecosm.com>
Cc: Jeremy Bennett <jeremy.bennett@embecosm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: buildroot at busybox.net
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
Changes since v2
   No code changes, added couple more lines to changelog

Changes since v1
(http://lists.uclibc.org/pipermail/uclibc/2014-March/048273.html

- Rebased to trunk
- Added handling for h_errno_location

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 include/netdb.h                          | 3 ---
 libc/misc/internals/__errno_location.c   | 1 -
 libc/misc/internals/__h_errno_location.c | 1 -
 libc/sysdeps/linux/common/bits/errno.h   | 3 ---
 4 files changed, 8 deletions(-)

diff --git a/include/netdb.h b/include/netdb.h
index 8fdfa0fccc7d..0f361bb6f662 100644
--- a/include/netdb.h
+++ b/include/netdb.h
@@ -59,11 +59,8 @@ __BEGIN_DECLS
 /* Function to get address of global `h_errno' variable.  */
 extern int *__h_errno_location (void) __THROW __attribute__ ((__const__));
 #ifdef _LIBC
-# if !defined(__UCLIBC_HAS_TLS__) && !defined(__UCLIBC_HAS_THREADS__)
 extern int weak_const_function *__h_errno_location(void);
-# endif
 #endif
-libc_hidden_proto(__h_errno_location)
 
 /* Macros for accessing h_errno from inside libc.  */
 #ifdef _LIBC
diff --git a/libc/misc/internals/__errno_location.c b/libc/misc/internals/__errno_location.c
index be7a9093efa3..9bbc2d779653 100644
--- a/libc/misc/internals/__errno_location.c
+++ b/libc/misc/internals/__errno_location.c
@@ -16,4 +16,3 @@ int *__errno_location(void)
 {
     return &errno;
 }
-libc_hidden_weak(__errno_location)
diff --git a/libc/misc/internals/__h_errno_location.c b/libc/misc/internals/__h_errno_location.c
index 6653681cbf09..b30859e81f19 100644
--- a/libc/misc/internals/__h_errno_location.c
+++ b/libc/misc/internals/__h_errno_location.c
@@ -16,4 +16,3 @@ int *__h_errno_location(void)
 {
     return &h_errno;
 }
-libc_hidden_weak(__h_errno_location)
diff --git a/libc/sysdeps/linux/common/bits/errno.h b/libc/sysdeps/linux/common/bits/errno.h
index 777338fb1e0a..611b8359001a 100644
--- a/libc/sysdeps/linux/common/bits/errno.h
+++ b/libc/sysdeps/linux/common/bits/errno.h
@@ -43,11 +43,8 @@
 /* Function to get address of global `errno' variable.  */
 extern int *__errno_location (void) __THROW __attribute__ ((__const__));
 #  ifdef _LIBC
-#   if !defined(__UCLIBC_HAS_TLS__) && !defined(__UCLIBC_HAS_THREADS__)
 extern int weak_const_function *__errno_location(void);
-#   endif
 #  endif
-libc_hidden_proto(__errno_location)
 
 #  ifdef __UCLIBC_HAS_THREADS__
 /* When using threads, errno is a per-thread value.  */
-- 
1.8.3.2
