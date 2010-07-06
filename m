From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Jul 2010 14:19:36 +0200
Subject: [Buildroot] [git commit master 1/1] uClibc: workaround 0.9.31 / GCC
	PR32219 issue with static linking
Message-ID: <20100706122522.C50B08257D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e09aa60493236ae7d6ace467c08bbbd3ab82f53e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2143

Fixes crash on static linking without stdio / x86. Both patches are from
upstream uClibc.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 ...Clibc-0.9.31-more-workarounds-GCC-PR32219.patch |   40 ++++++++++++++
 .../uClibc-0.9.31-workaround-GCC-PR32219.patch     |   57 ++++++++++++++++++++
 3 files changed, 98 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-more-workarounds-GCC-PR32219.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-workaround-GCC-PR32219.patch

diff --git a/CHANGES b/CHANGES
index 3222e7a..02edf36 100644
--- a/CHANGES
+++ b/CHANGES
@@ -54,6 +54,7 @@
 	#2095: make gconfig: undefined reference to symbol 'dlsym@@GLIBC_2.2.5'
 	#2101: blackbox depends on locale support
 	#2119: Tries to build kernel, although disabled in config
+	#2143: buildroot compiler generates segfaulting statically linked exe..
 	#2155: Compression lzo don't set for ubifs
 
 2010.05, Released May 30th, 2010:
diff --git a/toolchain/uClibc/uClibc-0.9.31-more-workarounds-GCC-PR32219.patch b/toolchain/uClibc/uClibc-0.9.31-more-workarounds-GCC-PR32219.patch
new file mode 100644
index 0000000..9e69532
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31-more-workarounds-GCC-PR32219.patch
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
diff --git a/toolchain/uClibc/uClibc-0.9.31-workaround-GCC-PR32219.patch b/toolchain/uClibc/uClibc-0.9.31-workaround-GCC-PR32219.patch
new file mode 100644
index 0000000..242a526
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31-workaround-GCC-PR32219.patch
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
-- 
1.7.1
