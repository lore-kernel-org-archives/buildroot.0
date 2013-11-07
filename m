From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Nov 2013 12:20:27 +0100
Subject: [Buildroot] [git commit] uclibc: reinstate support for version
	0.9.31
Message-ID: <20131107112412.B6F0F9BAE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fc19cdfc0c03cc7e96d1faac5b9f23204ff91f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch reinstates support for uClibc version 0.9.31, which was removed
from Buildroot in commit 8abb5b33c1aae035cf48b1c81104b433ff884c64

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libglib2/libglib2.mk                       |    2 +-
 .../uClibc-0001-add-bsd-endian-conversions.patch   |   64 +++++
 .../0.9.31.1/uClibc-0002-add-inotify-init1.patch   |   64 +++++
 .../0.9.31.1/uClibc-0003-add-sock-cloexec.patch    |   43 ++++
 .../0.9.31.1/uClibc-0004-export-strverscmp.patch   |   30 +++
 ...bc-0005-fix-daylight-saving-time-handling.patch |   36 +++
 .../uClibc-0006-fix-error-locale-utf-8.patch       |   17 ++
 .../uClibc-0007-linuxthreads-errno-fix.patch       |   98 ++++++++
 .../uClibc-0008-more-workarounds-GCC-PR32219.patch |   40 +++
 package/uclibc/0.9.31.1/uClibc-0009-unshare.patch  |   74 ++++++
 .../uClibc-0010-workaround-GCC-PR32219.patch       |   57 +++++
 .../uClibc-0011-startfiles-Make-targets.patch      |   60 +++++
 package/uclibc/Config.in                           |    8 +-
 package/uclibc/uClibc-0.9.31.config                |  259 ++++++++++++++++++++
 14 files changed, 850 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 51b2fc1..f770d3a 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -51,7 +51,7 @@ LIBGLIB2_CONF_ENV = \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
-ifeq ($(BR2_UCLIBC_VERSION_0_9_32)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
+ifeq ($(BR2_UCLIBC_VERSION_0_9_31)$(BR2_UCLIBC_VERSION_0_9_32)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2)$(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=no
 else
 LIBGLIB2_CONF_ENV += glib_cv_have_qsort_r=yes
diff --git a/package/uclibc/0.9.31.1/uClibc-0001-add-bsd-endian-conversions.patch b/package/uclibc/0.9.31.1/uClibc-0001-add-bsd-endian-conversions.patch
new file mode 100644
index 0000000..652d7c9
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0001-add-bsd-endian-conversions.patch
@@ -0,0 +1,64 @@
+From c6d6237819037168a6923ac080e348e54615422c Mon Sep 17 00:00:00 2001
+From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Date: Tue, 1 Jun 2010 23:22:57 +0400
+Subject: [PATCH] endian.h: add BSD convertions between big/little-endian byte order
+
+This patch adds support for convertion of values between host and
+big-/little-endian byte order.
+
+Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ include/endian.h |   38 ++++++++++++++++++++++++++++++++++++++
+ 1 files changed, 38 insertions(+), 0 deletions(-)
+
+diff --git a/include/endian.h b/include/endian.h
+index 2f7bce1..0ba7384 100644
+--- a/include/endian.h
++++ b/include/endian.h
+@@ -55,4 +55,42 @@
+ # define __LONG_LONG_PAIR(HI, LO) HI, LO
+ #endif
+ 
++
++#ifdef __USE_BSD
++/* Conversion interfaces.  */
++# include <byteswap.h>
++
++# if __BYTE_ORDER == __LITTLE_ENDIAN
++#  define htobe16(x) __bswap_16 (x)
++#  define htole16(x) (x)
++#  define be16toh(x) __bswap_16 (x)
++#  define le16toh(x) (x)
++
++#  define htobe32(x) __bswap_32 (x)
++#  define htole32(x) (x)
++#  define be32toh(x) __bswap_32 (x)
++#  define le32toh(x) (x)
++
++#  define htobe64(x) __bswap_64 (x)
++#  define htole64(x) (x)
++#  define be64toh(x) __bswap_64 (x)
++#  define le64toh(x) (x)
++# else
++#  define htobe16(x) (x)
++#  define htole16(x) __bswap_16 (x)
++#  define be16toh(x) (x)
++#  define le16toh(x) __bswap_16 (x)
++
++#  define htobe32(x) (x)
++#  define htole32(x) __bswap_32 (x)
++#  define be32toh(x) (x)
++#  define le32toh(x) __bswap_32 (x)
++
++#  define htobe64(x) (x)
++#  define htole64(x) __bswap_64 (x)
++#  define be64toh(x) (x)
++#  define le64toh(x) __bswap_64 (x)
++# endif
++#endif
++
+ #endif	/* endian.h */
+-- 
+1.7.3.4
+
diff --git a/package/uclibc/0.9.31.1/uClibc-0002-add-inotify-init1.patch b/package/uclibc/0.9.31.1/uClibc-0002-add-inotify-init1.patch
new file mode 100644
index 0000000..cbec426
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0002-add-inotify-init1.patch
@@ -0,0 +1,64 @@
+From a2e5630af426f85fdd8721b2820786d9bd2aa695 Mon Sep 17 00:00:00 2001
+From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Date: Tue, 1 Jun 2010 20:02:54 +0400
+Subject: [PATCH] inotify: add inotify_init1 system call support
+
+This patch introduces support for inotify_init1 system call, found
+since Linux 2.6.27.
+
+Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libc/sysdeps/linux/common/inotify.c     |    4 ++++
+ libc/sysdeps/linux/common/sys/inotify.h |   13 +++++++++++++
+ 2 files changed, 17 insertions(+), 0 deletions(-)
+
+diff --git a/libc/sysdeps/linux/common/inotify.c b/libc/sysdeps/linux/common/inotify.c
+index e5a6120..e35f043 100644
+--- a/libc/sysdeps/linux/common/inotify.c
++++ b/libc/sysdeps/linux/common/inotify.c
+@@ -15,6 +15,10 @@
+ _syscall0(int, inotify_init)
+ #endif
+ 
++#ifdef __NR_inotify_init1
++_syscall1(int, inotify_init1, int, flags)
++#endif
++
+ #ifdef __NR_inotify_add_watch
+ _syscall3(int, inotify_add_watch, int, fd, const char *, path, uint32_t, mask)
+ #endif
+diff --git a/libc/sysdeps/linux/common/sys/inotify.h b/libc/sysdeps/linux/common/sys/inotify.h
+index 0131db9..dc4e19d 100644
+--- a/libc/sysdeps/linux/common/sys/inotify.h
++++ b/libc/sysdeps/linux/common/sys/inotify.h
+@@ -22,6 +22,16 @@
+ #include <stdint.h>
+ 
+ 
++/* Flags for the parameter of inotify_init1.  */
++enum
++  {
++    IN_CLOEXEC = 02000000,
++#define IN_CLOEXEC IN_CLOEXEC
++    IN_NONBLOCK = 04000
++#define IN_NONBLOCK IN_NONBLOCK
++  };
++
++
+ /* Structure describing an inotify event.  */
+ struct inotify_event
+ {
+@@ -79,6 +89,9 @@ __BEGIN_DECLS
+ /* Create and initialize inotify instance.  */
+ extern int inotify_init (void) __THROW;
+ 
++/* Create and initialize inotify instance.  */
++extern int inotify_init1 (int __flags) __THROW;
++
+ /* Add watch of object NAME to inotify instance FD.  Notify about
+    events specified by MASK.  */
+ extern int inotify_add_watch (int __fd, const char *__name, uint32_t __mask)
+-- 
+1.7.3.4
+
diff --git a/package/uclibc/0.9.31.1/uClibc-0003-add-sock-cloexec.patch b/package/uclibc/0.9.31.1/uClibc-0003-add-sock-cloexec.patch
new file mode 100644
index 0000000..a7089a9
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0003-add-sock-cloexec.patch
@@ -0,0 +1,43 @@
+From 83333e9c873e4eca6b2c945f7770b1f5373b0427 Mon Sep 17 00:00:00 2001
+From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Date: Tue, 1 Jun 2010 20:02:39 +0400
+Subject: [PATCH] bits/socket.h: add SOCK_CLOEXEC and SOCK_NONBLOCK support
+
+This patch adds support for SOCK_CLOEXEC and SOCK_NONBLOCK socket
+descriptor flags, which are introduced since Linux 2.6.27
+
+Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libc/sysdeps/linux/common/bits/socket.h |   12 +++++++++++-
+ 1 files changed, 11 insertions(+), 1 deletions(-)
+
+diff --git a/libc/sysdeps/linux/common/bits/socket.h b/libc/sysdeps/linux/common/bits/socket.h
+index ac5a433..11f6e97 100644
+--- a/libc/sysdeps/linux/common/bits/socket.h
++++ b/libc/sysdeps/linux/common/bits/socket.h
+@@ -53,10 +53,20 @@ enum __socket_type
+   SOCK_SEQPACKET = 5,		/* Sequenced, reliable, connection-based,
+ 				   datagrams of fixed maximum length.  */
+ #define SOCK_SEQPACKET SOCK_SEQPACKET
+-  SOCK_PACKET = 10		/* Linux specific way of getting packets
++  SOCK_PACKET = 10,		/* Linux specific way of getting packets
+ 				   at the dev level.  For writing rarp and
+ 				   other similar things on the user level. */
+ #define SOCK_PACKET SOCK_PACKET
++
++  /* Flags to be ORed into the type parameter of socket and socketpair and
++     used for the flags parameter of paccept.  */
++
++  SOCK_CLOEXEC = 02000000,	/* Atomically set close-on-exec flag for the
++				   new descriptor(s).  */
++#define SOCK_CLOEXEC SOCK_CLOEXEC
++  SOCK_NONBLOCK = 04000		/* Atomically mark descriptor(s) as
++				   non-blocking.  */
++#define SOCK_NONBLOCK SOCK_NONBLOCK
+ };
+ 
+ /* Protocol families.  */
+-- 
+1.7.3.4
+
diff --git a/package/uclibc/0.9.31.1/uClibc-0004-export-strverscmp.patch b/package/uclibc/0.9.31.1/uClibc-0004-export-strverscmp.patch
new file mode 100644
index 0000000..19bc021
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0004-export-strverscmp.patch
@@ -0,0 +1,30 @@
+From 139b8f0c673fed465d27f99c98568e5d5e1b9b72 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 4 Jun 2010 13:36:30 +0200
+Subject: [PATCH] strverscmp: I forgot to export it
+
+Result was:
+
+strverscmp.o:
+000000ec T __GI_strverscmp
+
+i.e. no plain "strverscmp"!
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ libc/string/strverscmp.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/libc/string/strverscmp.c b/libc/string/strverscmp.c
+index 74ae4c6..b19e8f0 100644
+--- a/libc/string/strverscmp.c
++++ b/libc/string/strverscmp.c
+@@ -115,3 +115,4 @@ int strverscmp (const char *s1, const char *s2)
+       return state;
+   }
+ }
++libc_hidden_def(strverscmp)
+-- 
+1.7.3.4
+
diff --git a/package/uclibc/0.9.31.1/uClibc-0005-fix-daylight-saving-time-handling.patch b/package/uclibc/0.9.31.1/uClibc-0005-fix-daylight-saving-time-handling.patch
new file mode 100644
index 0000000..5a96113
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0005-fix-daylight-saving-time-handling.patch
@@ -0,0 +1,36 @@
+From 47f3da1cf49377c25772bb54d07db55225bbb142 Mon Sep 17 00:00:00 2001
+From: Guillaume Bourcier <guillaumebourcier@free.fr>
+Date: Tue, 11 Oct 2011 13:45:33 +0200
+Subject: [PATCH] libc: fix daylight saving time handling
+
+The algorithm computing daylight saving time incorrectly adds a day for
+each month after January for leap years. The clock shift from/to DST can
+be delayed if the last Sunday of a transition month is exactly seven
+days before the first of the following month.
+
+This change adds a day for the February month only.
+
+Signed-off-by: Guillaume Bourcier <guillaumebourcier@free.fr>
+Signed-off-by: Richard Braun <rbraun@sceen.net>
+Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ libc/misc/time/time.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/libc/misc/time/time.c b/libc/misc/time/time.c
+index 19d68e1..8e2ebf1 100644
+--- a/libc/misc/time/time.c
++++ b/libc/misc/time/time.c
+@@ -689,7 +689,7 @@ static int tm_isdst(register const struct tm *__restrict ptm,
+ 					++day;
+ 				}
+ 				monlen = 31 + day_cor[r->month -1] - day_cor[r->month];
+-				if (isleap && (r->month > 1)) {
++				if (isleap && (r->month == 2)) {
+ 					++monlen;
+ 				}
+ 				/* Wweekday (0 is Sunday) of 1st of the month
+-- 
+1.7.3.4
+
diff --git a/package/uclibc/0.9.31.1/uClibc-0006-fix-error-locale-utf-8.patch b/package/uclibc/0.9.31.1/uClibc-0006-fix-error-locale-utf-8.patch
new file mode 100644
index 0000000..1305add
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0006-fix-error-locale-utf-8.patch
@@ -0,0 +1,17 @@
+---
+ extra/locale/gen_wc8bit.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: uClibc-0.9.31/extra/locale/gen_wc8bit.c
+===================================================================
+--- uClibc-0.9.31.orig/extra/locale/gen_wc8bit.c
++++ uClibc-0.9.31/extra/locale/gen_wc8bit.c
+@@ -120,7 +120,7 @@
+ 		}
+ 
+  locale_failure:
+-		printf("could not find a UTF8 locale ... please enable en_US.UTF-8\n");
++		fprintf(stderr, "could not find a UTF8 locale ... please enable en_US.UTF-8\n");
+ 		return EXIT_FAILURE;
+  locale_success:
+ 		pclose(fp);
diff --git a/package/uclibc/0.9.31.1/uClibc-0007-linuxthreads-errno-fix.patch b/package/uclibc/0.9.31.1/uClibc-0007-linuxthreads-errno-fix.patch
new file mode 100644
index 0000000..c49821b
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0007-linuxthreads-errno-fix.patch
@@ -0,0 +1,98 @@
+From af8b2d71ce37b9d4d24ddbc755cdea68de02949a Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Mon, 5 Jul 2010 14:08:17 +0200
+Subject: [PATCH] don't make __errno_location / __h_errno_location hidden
+
+Closes #2089 (https://bugs.busybox.net/show_bug.cgi?id=2089)
+
+__errno_location / __h_errno_location access has to go through the PLT
+like malloc/free, so the linuxthread variants gets used instead when
+compiling with -pthread.
+
+Based on http://github.com/mat-c/uClibc/commit/328d392c54aa5dc2b8e7f398a419087de497de2b
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/netdb.h                               |    1 -
+ libc/misc/internals/__errno_location.c        |    3 ---
+ libc/misc/internals/__h_errno_location.c      |    1 -
+ libc/misc/internals/__uClibc_main.c           |    2 --
+ libc/sysdeps/linux/common/bits/errno.h        |    1 -
+ libc/sysdeps/linux/common/bits/uClibc_errno.h |    3 ---
+ 6 files changed, 0 insertions(+), 11 deletions(-)
+
+diff --git a/include/netdb.h b/include/netdb.h
+index 9d3807d..ac411ab 100644
+--- a/include/netdb.h
++++ b/include/netdb.h
+@@ -59,7 +59,6 @@ __BEGIN_DECLS
+ 
+ /* Function to get address of global `h_errno' variable.  */
+ extern int *__h_errno_location (void) __THROW __attribute__ ((__const__));
+-libc_hidden_proto(__h_errno_location)
+ 
+ /* Macros for accessing h_errno from inside libc.  */
+ #ifdef _LIBC
+diff --git a/libc/misc/internals/__errno_location.c b/libc/misc/internals/__errno_location.c
+index 487a9c2..0620860 100644
+--- a/libc/misc/internals/__errno_location.c
++++ b/libc/misc/internals/__errno_location.c
+@@ -11,6 +11,3 @@ int * weak_const_function __errno_location (void)
+ {
+     return &errno;
+ }
+-#ifdef IS_IN_libc /* not really need, only to keep in sync w/ libc_hidden_proto */
+-libc_hidden_weak(__errno_location)
+-#endif
+diff --git a/libc/misc/internals/__h_errno_location.c b/libc/misc/internals/__h_errno_location.c
+index 213d398..235df4e 100644
+--- a/libc/misc/internals/__h_errno_location.c
++++ b/libc/misc/internals/__h_errno_location.c
+@@ -10,4 +10,3 @@ int * weak_const_function __h_errno_location (void)
+ {
+     return &h_errno;
+ }
+-libc_hidden_weak(__h_errno_location)
+diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
+index 6e520fa..f4a9ebb 100644
+--- a/libc/misc/internals/__uClibc_main.c
++++ b/libc/misc/internals/__uClibc_main.c
+@@ -64,9 +64,7 @@ void internal_function _dl_aux_init (ElfW(auxv_t) *av);
+  * Prototypes.
+  */
+ extern int *weak_const_function __errno_location(void);
+-libc_hidden_proto(__errno_location)
+ extern int *weak_const_function __h_errno_location(void);
+-libc_hidden_proto(__h_errno_location)
+ 
+ extern void weak_function _stdio_init(void) attribute_hidden;
+ #ifdef __UCLIBC_HAS_LOCALE__
+diff --git a/libc/sysdeps/linux/common/bits/errno.h b/libc/sysdeps/linux/common/bits/errno.h
+index 0bf6354..de9688a 100644
+--- a/libc/sysdeps/linux/common/bits/errno.h
++++ b/libc/sysdeps/linux/common/bits/errno.h
+@@ -43,7 +43,6 @@
+ # ifndef __ASSEMBLER__
+ /* Function to get address of global `errno' variable.  */
+ extern int *__errno_location (void) __THROW __attribute__ ((__const__));
+-libc_hidden_proto(__errno_location)
+ 
+ #  ifdef __UCLIBC_HAS_THREADS__
+ /* When using threads, errno is a per-thread value.  */
+diff --git a/libc/sysdeps/linux/common/bits/uClibc_errno.h b/libc/sysdeps/linux/common/bits/uClibc_errno.h
+index 9c15618..79eb7e6 100644
+--- a/libc/sysdeps/linux/common/bits/uClibc_errno.h
++++ b/libc/sysdeps/linux/common/bits/uClibc_errno.h
+@@ -33,9 +33,6 @@ extern int *__errno_location (void) __THROW __attribute__ ((__const__))
+ ;
+ # if defined __UCLIBC_HAS_THREADS__
+ #  include <tls.h>
+-#  if defined USE___THREAD && USE___THREAD
+-libc_hidden_proto(__errno_location)
+-#  endif
+ # endif
+ 
+ #endif /* !__ASSEMBLER__ */
+-- 
+1.7.1
+
diff --git a/package/uclibc/0.9.31.1/uClibc-0008-more-workarounds-GCC-PR32219.patch b/package/uclibc/0.9.31.1/uClibc-0008-more-workarounds-GCC-PR32219.patch
new file mode 100644
index 0000000..9e69532
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0008-more-workarounds-GCC-PR32219.patch
@@ -0,0 +1,40 @@
+From aa67771881d65373da448ad5f7a8393f3a1d9469 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Timo=20Ter=C3=A4s?= <timo.teras@iki.fi>
+Date: Wed, 30 Jun 2010 14:46:37 +0300
+Subject: [PATCH] more workarounds for GCC PR32219
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 2e53dd645d5348f207cec7f8595969dc566c5a55 workarounds GCC
+bug when accessing _locale_init and _stdio_init. We need the same
+fix for __errno_location and __h_errno_location otherwise we crash
+calling null with static and non-threaded builds.
+
+Signed-off-by: Timo Ter??s <timo.teras@iki.fi>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ libc/misc/internals/__uClibc_main.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
+index 3f09ad2..58f6643 100644
+--- a/libc/misc/internals/__uClibc_main.c
++++ b/libc/misc/internals/__uClibc_main.c
+@@ -447,11 +447,11 @@ void __uClibc_main(int (*main)(int, char **, char **), int argc,
+      * have resulted in errno being set nonzero, so set it to 0 before
+      * we call main.
+      */
+-    if (likely(__errno_location!=NULL))
++    if (likely(not_null_ptr(__errno_location)))
+ 	*(__errno_location()) = 0;
+ 
+     /* Set h_errno to 0 as well */
+-    if (likely(__h_errno_location!=NULL))
++    if (likely(not_null_ptr(__h_errno_location)))
+ 	*(__h_errno_location()) = 0;
+ 
+ #if defined HAVE_CLEANUP_JMP_BUF && defined __UCLIBC_HAS_THREADS_NATIVE__
+-- 
+1.7.1
+
diff --git a/package/uclibc/0.9.31.1/uClibc-0009-unshare.patch b/package/uclibc/0.9.31.1/uClibc-0009-unshare.patch
new file mode 100644
index 0000000..ad440d9
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0009-unshare.patch
@@ -0,0 +1,74 @@
+Backport of unshare() syscall.
+From uClibc git 19dd090a0f68765db87990ef8eda9bf77bb29581
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+---
+diff -Nura uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/bits/sched.h uClibc-0.9.31.1/libc/sysdeps/linux/common/bits/sched.h
+--- uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/bits/sched.h	2011-06-08 15:58:40.000000000 -0300
++++ uClibc-0.9.31.1/libc/sysdeps/linux/common/bits/sched.h	2011-12-05 08:10:02.491978849 -0300
+@@ -58,7 +58,13 @@
+ 				      force CLONE_PTRACE on this clone.  */
+ # define CLONE_CHILD_SETTID 0x01000000 /* Store TID in userlevel buffer in
+ 					  the child.  */
+-# define CLONE_STOPPED	0x02000000 /* Start in stopped state.  */
++# define CLONE_STOPPED 0x02000000 /* Start in stopped state.  */
++# define CLONE_NEWUTS  0x04000000      /* New utsname group.  */
++# define CLONE_NEWIPC  0x08000000      /* New ipcs.  */
++# define CLONE_NEWUSER 0x10000000      /* New user namespace.  */
++# define CLONE_NEWPID  0x20000000      /* New pid namespace.  */
++# define CLONE_NEWNET  0x40000000      /* New network namespace.  */
++# define CLONE_IO      0x80000000      /* Clone I/O context.  */
+ #endif
+ 
+ /* The official definition.  */
+@@ -74,11 +80,9 @@
+ extern int clone (int (*__fn) (void *__arg), void *__child_stack,
+ 		  int __flags, void *__arg, ...) __THROW;
+ 
+-#if 0
+ /* Unshare the specified resources.  */
+ extern int unshare (int __flags) __THROW;
+ #endif
+-#endif
+ 
+ __END_DECLS
+ 
+diff -Nura uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/Makefile.in uClibc-0.9.31.1/libc/sysdeps/linux/common/Makefile.in
+--- uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/Makefile.in	2011-06-08 15:58:40.000000000 -0300
++++ uClibc-0.9.31.1/libc/sysdeps/linux/common/Makefile.in	2011-12-05 08:23:28.353757602 -0300
+@@ -31,7 +31,8 @@
+ 	remap_file_pages.c sched_getaffinity.c sched_setaffinity.c \
+ 	sendfile64.c sendfile.c setfsgid.c setfsuid.c setresuid.c \
+ 	splice.c vmsplice.c tee.c signalfd.c swapoff.c swapon.c \
+-	sync_file_range.c sysctl.c sysinfo.c timerfd.c uselib.c vhangup.c,$(CSRC))
++	sync_file_range.c sysctl.c sysinfo.c timerfd.c unshare.c uselib.c \
++	vhangup.c,$(CSRC))
+ endif
+ 
+ ifneq ($(UCLIBC_BSD_SPECIFIC),y)
+diff -Nura uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/unshare.c uClibc-0.9.31.1/libc/sysdeps/linux/common/unshare.c
+--- uClibc-0.9.31.1.orig/libc/sysdeps/linux/common/unshare.c	1969-12-31 21:00:00.000000000 -0300
++++ uClibc-0.9.31.1/libc/sysdeps/linux/common/unshare.c	2011-12-05 08:22:45.954453512 -0300
+@@ -0,0 +1,21 @@
++/* vi: set sw=4 ts=4: */
++/*
++ * unshare() for uClibc
++ *
++ * Copyright (C) 2011 Henning Heinold <heinold@inf.fu-berlin.de>
++ *
++ * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
++ */
++
++#include <sys/syscall.h>
++#include <sched.h>
++
++#if defined __NR_unshare && defined __UCLIBC_LINUX_SPECIFIC__
++_syscall1(int, unshare, int, flags)
++#else
++int unshare(int flags) 
++{   
++    __set_errno(ENOSYS);
++    return -1;
++}
++#endif
diff --git a/package/uclibc/0.9.31.1/uClibc-0010-workaround-GCC-PR32219.patch b/package/uclibc/0.9.31.1/uClibc-0010-workaround-GCC-PR32219.patch
new file mode 100644
index 0000000..242a526
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0010-workaround-GCC-PR32219.patch
@@ -0,0 +1,57 @@
+From 2e53dd645d5348f207cec7f8595969dc566c5a55 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 17 May 2010 15:56:19 +0200
+Subject: [PATCH] workaround GCC PR32219
+
+we ended up calling 0
+Fixes bug #1033
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ libc/misc/internals/__uClibc_main.c |   15 +++++++++++++--
+ 1 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
+index f9e1244..4ee4443 100644
+--- a/libc/misc/internals/__uClibc_main.c
++++ b/libc/misc/internals/__uClibc_main.c
+@@ -105,6 +105,17 @@ _pthread_cleanup_pop_restore(struct _pthread_cleanup_buffer *__buffer,
+ 
+ #endif /* !SHARED */
+ 
++/* Defeat compiler optimization which assumes function addresses are never NULL */
++static __always_inline int not_null_ptr(const void *p)
++{
++	const void *q;
++	__asm__ (""
++		: "=r" (q) /* output */
++		: "0" (p) /* input */
++	);
++	return q != 0;
++}
++
+ /*
+  * Prototypes.
+  */
+@@ -254,7 +265,7 @@ void __uClibc_init(void)
+ 
+ #ifdef __UCLIBC_HAS_LOCALE__
+     /* Initialize the global locale structure. */
+-    if (likely(_locale_init!=NULL))
++    if (likely(not_null_ptr(_locale_init)))
+ 	_locale_init();
+ #endif
+ 
+@@ -264,7 +275,7 @@ void __uClibc_init(void)
+      * Thus we get a nice size savings because the stdio functions
+      * won't be pulled into the final static binary unless used.
+      */
+-    if (likely(_stdio_init != NULL))
++    if (likely(not_null_ptr(_stdio_init)))
+ 	_stdio_init();
+ 
+ }
+-- 
+1.7.1
+
diff --git a/package/uclibc/0.9.31.1/uClibc-0011-startfiles-Make-targets.patch b/package/uclibc/0.9.31.1/uClibc-0011-startfiles-Make-targets.patch
new file mode 100644
index 0000000..9a7f304
--- /dev/null
+++ b/package/uclibc/0.9.31.1/uClibc-0011-startfiles-Make-targets.patch
@@ -0,0 +1,60 @@
+Add startfiles and install_startfiles targets to the top-level Makefile, as
+in uClibc 0.9.32 and later.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/Makefile.help b/Makefile.help
+--- a/Makefile.help	2011-06-08 19:58:40.000000000 +0100
++++ b/Makefile.help	2013-08-10 21:17:46.572104259 +0100
+@@ -14,6 +14,7 @@ help:
+ 	@echo 'Build:'
+ 	@echo '  all			- libraries and generated headers'
+ 	@echo '  pregen		- generate headers'
++	@echo '  startfiles		- build startfiles (crt)'
+ 	@echo '  utils			- build target utilities'
+ 	@echo '			  (ldd, ldconfig, locale, iconv)'
+ 	@echo '  hostutils		- build host utilities (see utils)'
+@@ -32,6 +33,7 @@ help:
+ 	@echo '  install		- install both the runtime and the headers'
+ 	@echo '  install_runtime	- install the libraries'
+ 	@echo '  install_dev		- install all headers and static libs'
++	@echo '  install_startfiles	- install startfiles (crt)'
+ 	@echo '  install_headers	- install headers excluding generated ones'
+ 	@echo '  install_utils		- install target utilities'
+ 	@echo '  install_hostutils	- install host utilities'
+diff -Nurp a/Makefile.in b/Makefile.in
+--- a/Makefile.in	2011-06-08 19:58:40.000000000 +0100
++++ b/Makefile.in	2013-08-10 21:10:55.248649101 +0100
+@@ -193,6 +193,8 @@ install: install_runtime install_dev
+ 
+ RUNTIME_PREFIX_LIB_FROM_DEVEL_PREFIX_LIB=$(shell $(top_srcdir)extra/scripts/relative_path.sh $(DEVEL_PREFIX)$(MULTILIB_DIR) $(RUNTIME_PREFIX)$(MULTILIB_DIR))
+ 
++startfiles: $(crt-y)
++
+ $(top_builddir)extra/scripts/unifdef: |$(top_builddir)extra/scripts
+ $(top_builddir)extra/scripts/unifdef: $(top_srcdir)extra/scripts/unifdef.c
+ 	$(hcompile.u)
+@@ -301,6 +303,10 @@ else
+ 	cd $(PREFIX)$(DEVEL_PREFIX)include && $(RM) -f wchar-stub.h
+ endif
+ 
++# Installs startfiles
++install_startfiles: startfiles | $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)
++	-$(INSTALL) -m 644 $(startfiles) $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)/
++
+ # Installs development library links.
+ install_dev: install_headers install_runtime | $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)
+ 	-$(INSTALL) -m 644 $(top_builddir)lib/*.[ao] $(PREFIX)$(DEVEL_PREFIX)$(MULTILIB_DIR)/
+diff -Nurp a/Makerules b/Makerules
+--- a/Makerules	2011-06-08 19:58:40.000000000 +0100
++++ b/Makerules	2013-08-10 21:24:21.287583111 +0100
+@@ -406,7 +406,8 @@ endif
+ CRTS_COMPAT :=
+ #endif
+ 
+-$(crt-y): $(CRTS) $(CTOR_TARGETS) $(CRTS_COMPAT) $(CRTRELOC)
++startfiles = $(CRTS) $(CTOR_TARGETS) $(CRTS_COMPAT) $(CRTRELOC)
++$(crt-y): $(startfiles)
+ $(CRTS) $(CTOR_TARGETS) $(CRTS_COMPAT) $(CRTRELOC): | headers
+ 
+ $(top_builddir)lib/$(NONSHARED_LIBNAME): $(libc-nonshared-y)
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 0e7ae54..2dbac12 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -8,13 +8,17 @@ choice
 	help
 	  Select the version of uClibc you wish to use.
 
+	config BR2_UCLIBC_VERSION_0_9_31
+		bool "uClibc 0.9.31.x"
+		depends on BR2_avr32
+
 	config BR2_UCLIBC_VERSION_0_9_32
 		bool "uClibc 0.9.32.x"
 		depends on !(BR2_arc || BR2_avr32 || BR2_sh || BR2_xtensa)
 
 	config BR2_UCLIBC_VERSION_0_9_33
 		bool "uClibc 0.9.33.x"
-		depends on !(BR2_arc || BR2_xtensa)
+		depends on !(BR2_arc || BR2_avr32 || BR2_xtensa)
 
 	config BR2_UCLIBC_VERSION_0_9_33_ARC
 		bool "uClibc 0.9.33.x-arc"
@@ -34,6 +38,7 @@ config BR2_USE_UCLIBC_SNAPSHOT
 
 config BR2_UCLIBC_VERSION_STRING
 	string
+	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
 	default 0.9.33-arc	if BR2_UCLIBC_VERSION_0_9_33_ARC
@@ -41,6 +46,7 @@ config BR2_UCLIBC_VERSION_STRING
 
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
+	default "package/uclibc/uClibc-0.9.31.config" if BR2_UCLIBC_VERSION_0_9_31
 	default "package/uclibc/uClibc-0.9.32.config" if BR2_UCLIBC_VERSION_0_9_32
 	default "package/uclibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
 	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_0_9_33_ARC
diff --git a/package/uclibc/uClibc-0.9.31.config b/package/uclibc/uClibc-0.9.31.config
new file mode 100644
index 0000000..e990178
--- /dev/null
+++ b/package/uclibc/uClibc-0.9.31.config
@@ -0,0 +1,259 @@
+#
+# Automatically generated make config: don't edit
+# Version: 0.9.31
+# Sun Apr  4 10:43:39 2010
+#
+# TARGET_alpha is not set
+# TARGET_arm is not set
+# TARGET_avr32 is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+# TARGET_xtensa is not set
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="none"
+FORCE_OPTIONS_FOR_ARCH=y
+# ARCH_LITTLE_ENDIAN is not set
+# ARCH_BIG_ENDIAN is not set
+# ARCH_WANTS_LITTLE_ENDIAN is not set
+# ARCH_WANTS_BIG_ENDIAN is not set
+TARGET_SUBARCH=""
+
+#
+# Using Little Endian
+#
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+# DO_XSI_MATH is not set
+# UCLIBC_HAS_FENV is not set
+UCLIBC_HAS_LONG_DOUBLE_MATH=y
+KERNEL_HEADERS="/usr/src/linux/include"
+HAVE_DOT_CONFIG=y
+
+#
+# General Library Settings
+#
+# HAVE_NO_PIC is not set
+DOPIC=y
+# ARCH_HAS_NO_SHARED is not set
+# ARCH_HAS_NO_LDSO is not set
+HAVE_SHARED=y
+# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
+LDSO_LDD_SUPPORT=y
+# LDSO_CACHE_SUPPORT is not set
+# LDSO_PRELOAD_FILE_SUPPORT is not set
+# UCLIBC_STATIC_LDCONFIG is not set
+LDSO_RUNPATH=y
+LDSO_SEARCH_INTERP_PATH=y
+UCLIBC_CTOR_DTOR=y
+# LDSO_GNU_HASH_SUPPORT is not set
+# HAS_NO_THREADS is not set
+LINUXTHREADS_OLD=y
+# LINUXTHREADS_NEW is not set
+UCLIBC_HAS_THREADS=y
+# PTHREADS_DEBUG_SUPPORT is not set
+UCLIBC_HAS_SYSLOG=y
+UCLIBC_HAS_LFS=y
+# MALLOC is not set
+# MALLOC_SIMPLE is not set
+MALLOC_STANDARD=y
+MALLOC_GLIBC_COMPAT=y
+UCLIBC_DYNAMIC_ATEXIT=y
+# COMPAT_ATEXIT is not set
+UCLIBC_SUSV3_LEGACY=y
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
+UCLIBC_SUSV4_LEGACY=y
+# UCLIBC_HAS_STUBS is not set
+UCLIBC_HAS_SHADOW=y
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+UCLIBC_HAS___PROGNAME=y
+UCLIBC_HAS_PTY=y
+ASSUME_DEVPTS=y
+UNIX98PTY_ONLY=y
+UCLIBC_HAS_GETPT=y
+UCLIBC_HAS_LIBUTIL=y
+UCLIBC_HAS_TM_EXTENSIONS=y
+UCLIBC_HAS_TZ_CACHING=y
+UCLIBC_HAS_TZ_FILE=y
+UCLIBC_HAS_TZ_FILE_READ_MANY=y
+UCLIBC_TZ_FILE_PATH="/etc/TZ"
+
+#
+# Advanced Library Settings
+#
+UCLIBC_PWD_BUFFER_SIZE=256
+UCLIBC_GRP_BUFFER_SIZE=256
+
+#
+# Support various families of functions
+#
+UCLIBC_LINUX_MODULE_24=y
+UCLIBC_LINUX_SPECIFIC=y
+UCLIBC_HAS_GNU_ERROR=y
+UCLIBC_BSD_SPECIFIC=y
+UCLIBC_HAS_BSD_ERR=y
+# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
+# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
+# UCLIBC_NTP_LEGACY is not set
+UCLIBC_SV4_DEPRECATED=y
+UCLIBC_HAS_REALTIME=y
+UCLIBC_HAS_ADVANCED_REALTIME=y
+UCLIBC_HAS_EPOLL=y
+UCLIBC_HAS_XATTR=y
+UCLIBC_HAS_PROFILING=y
+UCLIBC_HAS_CRYPT_IMPL=y
+UCLIBC_HAS_CRYPT=y
+UCLIBC_HAS_NETWORK_SUPPORT=y
+UCLIBC_HAS_SOCKET=y
+UCLIBC_HAS_IPV4=y
+# UCLIBC_HAS_IPV6 is not set
+# UCLIBC_HAS_RPC is not set
+# UCLIBC_HAS_FULL_RPC is not set
+# UCLIBC_HAS_REENTRANT_RPC is not set
+UCLIBC_USE_NETLINK=y
+UCLIBC_SUPPORT_AI_ADDRCONFIG=y
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
+UCLIBC_HAS_COMPAT_RES_STATE=y
+# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
+UCLIBC_HAS_LIBRESOLV_STUB=y
+UCLIBC_HAS_LIBNSL_STUB=y
+
+#
+# String and Stdio Support
+#
+# UCLIBC_HAS_STRING_GENERIC_OPT is not set
+UCLIBC_HAS_STRING_ARCH_OPT=y
+UCLIBC_HAS_CTYPE_TABLES=y
+UCLIBC_HAS_CTYPE_SIGNED=y
+# UCLIBC_HAS_CTYPE_UNSAFE is not set
+UCLIBC_HAS_CTYPE_CHECKED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
+# UCLIBC_HAS_WCHAR is not set
+# UCLIBC_HAS_LOCALE is not set
+UCLIBC_HAS_HEXADECIMAL_FLOATS=y
+UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
+# USE_OLD_VFPRINTF is not set
+UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
+UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
+# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
+UCLIBC_HAS_STDIO_BUFSIZ_4096=y
+# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
+UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
+# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
+# UCLIBC_HAS_STDIO_GETC_MACRO is not set
+# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
+UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
+# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
+UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
+UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
+UCLIBC_HAS_PRINTF_M_SPEC=y
+UCLIBC_HAS_ERRNO_MESSAGES=y
+# UCLIBC_HAS_SYS_ERRLIST is not set
+UCLIBC_HAS_SIGNUM_MESSAGES=y
+# UCLIBC_HAS_SYS_SIGLIST is not set
+UCLIBC_HAS_GNU_GETOPT=y
+# UCLIBC_HAS_GNU_GETSUBOPT is not set
+
+#
+# Big and Tall
+#
+UCLIBC_HAS_REGEX=y
+# UCLIBC_HAS_REGEX_OLD is not set
+UCLIBC_HAS_FNMATCH=y
+# UCLIBC_HAS_FNMATCH_OLD is not set
+# UCLIBC_HAS_WORDEXP is not set
+UCLIBC_HAS_NFTW=y
+UCLIBC_HAS_FTW=y
+UCLIBC_HAS_GLOB=y
+UCLIBC_HAS_GNU_GLOB=y
+
+#
+# Library Installation Options
+#
+RUNTIME_PREFIX="/"
+DEVEL_PREFIX="/usr/"
+MULTILIB_DIR="lib"
+HARDWIRED_ABSPATH=y
+
+#
+# Security options
+#
+# UCLIBC_BUILD_PIE is not set
+# UCLIBC_HAS_ARC4RANDOM is not set
+# HAVE_NO_SSP is not set
+UCLIBC_HAS_SSP=y
+# UCLIBC_HAS_SSP_COMPAT is not set
+# SSP_QUICK_CANARY is not set
+PROPOLICE_BLOCK_ABRT=y
+# PROPOLICE_BLOCK_SEGV is not set
+# UCLIBC_BUILD_SSP is not set
+UCLIBC_BUILD_RELRO=y
+UCLIBC_BUILD_NOW=y
+UCLIBC_BUILD_NOEXECSTACK=y
+
+#
+# uClibc development/debugging options
+#
+CROSS_COMPILER_PREFIX=""
+UCLIBC_EXTRA_CFLAGS=""
+# DODEBUG is not set
+# DODEBUG_PT is not set
+DOSTRIP=y
+# DOASSERTS is not set
+# SUPPORT_LD_DEBUG is not set
+# SUPPORT_LD_DEBUG_EARLY is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
+WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
+# UCLIBC_MJN3_ONLY is not set
+
+USE_BX=y
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_CORTEX_M3 is not set
+# CONFIG_ARM_CORTEX_M1 is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
