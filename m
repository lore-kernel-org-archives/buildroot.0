From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 09:38:06 +0200
Subject: [Buildroot] [git commit] uclibc: Make __SIGEV_PAD_SIZE to take
	__WORDSIZE into account
Message-ID: <20141012080244.396D1B2211@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a47d19d41055da20139d532a253108e9b17c7950
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Applying an upstream patch to make __SIGEV_PAD_SIZE to take __WORDSIZE
into account for alpha, mips and ia64 arches.

Upstream patch URL:
   http://git.uclibc.org/uClibc/commit/libc/sysdeps/linux?id=b97b4b698b023f75b54f987859c856ab4861ea00

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...EV_PAD_SIZE-takes-__WORDSIZE-into-account.patch |   70 ++++++++++++++++++++
 ...EV_PAD_SIZE-takes-__WORDSIZE-into-account.patch |   70 ++++++++++++++++++++
 2 files changed, 140 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.32.1/uclibc-0010-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch b/package/uclibc/0.9.32.1/uclibc-0010-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
new file mode 100644
index 0000000..1ad84c5
--- /dev/null
+++ b/package/uclibc/0.9.32.1/uclibc-0010-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
@@ -0,0 +1,70 @@
+siginfo.h: __SIGEV_PAD_SIZE takes __WORDSIZE into account
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From b97b4b698b023f75b54f987859c856ab4861ea00 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Thu, 02 Jan 2014 15:02:12 +0000
+Subject: siginfo.h: __SIGEV_PAD_SIZE takes __WORDSIZE into account
+
+Make __SIGEV_PAD_SIZE to take __WORDSIZE into account for alpha, mips
+and ia64 arches.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+(limited to 'libc/sysdeps/linux')
+
+diff --git a/libc/sysdeps/linux/alpha/bits/siginfo.h b/libc/sysdeps/linux/alpha/bits/siginfo.h
+index 9993f66..0a37ad0 100644
+--- a/libc/sysdeps/linux/alpha/bits/siginfo.h
++++ b/libc/sysdeps/linux/alpha/bits/siginfo.h
+@@ -257,7 +257,11 @@ enum
+ 
+ /* Structure to transport application-defined values with signals.  */
+ # define __SIGEV_MAX_SIZE	64
+-# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
++# if __WORDSIZE == 64
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
++# else
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
++# endif
+ 
+ typedef struct sigevent
+   {
+diff --git a/libc/sysdeps/linux/ia64/bits/siginfo.h b/libc/sysdeps/linux/ia64/bits/siginfo.h
+index 82cc73f..3ac988b 100644
+--- a/libc/sysdeps/linux/ia64/bits/siginfo.h
++++ b/libc/sysdeps/linux/ia64/bits/siginfo.h
+@@ -297,7 +297,11 @@ enum
+ 
+ /* Structure to transport application-defined values with signals.  */
+ # define __SIGEV_MAX_SIZE	64
+-# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
++# if __WORDSIZE == 64
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
++# else
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
++# endif
+ 
+ typedef struct sigevent
+   {
+diff --git a/libc/sysdeps/linux/mips/bits/siginfo.h b/libc/sysdeps/linux/mips/bits/siginfo.h
+index 84b08ca..a6e4135 100644
+--- a/libc/sysdeps/linux/mips/bits/siginfo.h
++++ b/libc/sysdeps/linux/mips/bits/siginfo.h
+@@ -264,8 +264,11 @@ enum
+ 
+ /* Structure to transport application-defined values with signals.  */
+ # define __SIGEV_MAX_SIZE	64
+-# define __SIGEV_HEAD_SIZE	(sizeof(long) + 2*sizeof(int))
+-# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE - __SIGEV_HEAD_SIZE) / sizeof (int))
++# if __WORDSIZE == 64
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
++# else
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
++# endif
+ 
+ /* Forward declaration of the `pthread_attr_t' type.  */
+ struct __pthread_attr_s;
+--
+cgit v0.9.1
diff --git a/package/uclibc/0.9.33.2/uclibc-0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch b/package/uclibc/0.9.33.2/uclibc-0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
new file mode 100644
index 0000000..1ad84c5
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0056-siginfo_h-__SIGEV_PAD_SIZE-takes-__WORDSIZE-into-account.patch
@@ -0,0 +1,70 @@
+siginfo.h: __SIGEV_PAD_SIZE takes __WORDSIZE into account
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From b97b4b698b023f75b54f987859c856ab4861ea00 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Thu, 02 Jan 2014 15:02:12 +0000
+Subject: siginfo.h: __SIGEV_PAD_SIZE takes __WORDSIZE into account
+
+Make __SIGEV_PAD_SIZE to take __WORDSIZE into account for alpha, mips
+and ia64 arches.
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+(limited to 'libc/sysdeps/linux')
+
+diff --git a/libc/sysdeps/linux/alpha/bits/siginfo.h b/libc/sysdeps/linux/alpha/bits/siginfo.h
+index 9993f66..0a37ad0 100644
+--- a/libc/sysdeps/linux/alpha/bits/siginfo.h
++++ b/libc/sysdeps/linux/alpha/bits/siginfo.h
+@@ -257,7 +257,11 @@ enum
+ 
+ /* Structure to transport application-defined values with signals.  */
+ # define __SIGEV_MAX_SIZE	64
+-# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
++# if __WORDSIZE == 64
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
++# else
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
++# endif
+ 
+ typedef struct sigevent
+   {
+diff --git a/libc/sysdeps/linux/ia64/bits/siginfo.h b/libc/sysdeps/linux/ia64/bits/siginfo.h
+index 82cc73f..3ac988b 100644
+--- a/libc/sysdeps/linux/ia64/bits/siginfo.h
++++ b/libc/sysdeps/linux/ia64/bits/siginfo.h
+@@ -297,7 +297,11 @@ enum
+ 
+ /* Structure to transport application-defined values with signals.  */
+ # define __SIGEV_MAX_SIZE	64
+-# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
++# if __WORDSIZE == 64
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
++# else
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
++# endif
+ 
+ typedef struct sigevent
+   {
+diff --git a/libc/sysdeps/linux/mips/bits/siginfo.h b/libc/sysdeps/linux/mips/bits/siginfo.h
+index 84b08ca..a6e4135 100644
+--- a/libc/sysdeps/linux/mips/bits/siginfo.h
++++ b/libc/sysdeps/linux/mips/bits/siginfo.h
+@@ -264,8 +264,11 @@ enum
+ 
+ /* Structure to transport application-defined values with signals.  */
+ # define __SIGEV_MAX_SIZE	64
+-# define __SIGEV_HEAD_SIZE	(sizeof(long) + 2*sizeof(int))
+-# define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE - __SIGEV_HEAD_SIZE) / sizeof (int))
++# if __WORDSIZE == 64
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 4)
++# else
++#  define __SIGEV_PAD_SIZE	((__SIGEV_MAX_SIZE / sizeof (int)) - 3)
++# endif
+ 
+ /* Forward declaration of the `pthread_attr_t' type.  */
+ struct __pthread_attr_s;
+--
+cgit v0.9.1
