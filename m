From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Mar 2015 13:05:27 -0300
Subject: [Buildroot] [PATCH] strace: bump to version 4.10
Message-ID: <1426003527-13151-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch upstream so remove.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...rap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch | 107 ---------------------
 package/strace/strace.hash                         |   5 +-
 package/strace/strace.mk                           |   2 +-
 3 files changed, 4 insertions(+), 110 deletions(-)
 delete mode 100644 package/strace/0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch

diff --git a/package/strace/0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch b/package/strace/0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch
deleted file mode 100644
index cd2e31b..0000000
--- a/package/strace/0001-sigaction-wrap-sa_restorer-in-ifdef-SA_RESTORER-cons.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-Add a patch to fix the sa_restorer problems in strace.
-
-This patch has been applied upstream:
-  https://sourceforge.net/p/strace/code/ci/c3a5c01051ba29a9f421f4d45d96bbc32df2b796/
-
-Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
-
-From c3a5c01051ba29a9f421f4d45d96bbc32df2b796 Mon Sep 17 00:00:00 2001
-From: Vicente Olivert Riera <vincent@gentoo.org>
-Date: Thu, 11 Sep 2014 20:05:18 +0100
-Subject: [PATCH] sigaction: wrap sa_restorer in #ifdef SA_RESTORER consistently
-
-Wrap sa_restorer member definitions in #ifdef SA_RESTORER to be
-consistent with their use.
-If an architecture does not provide sa_restorer members but still
-defines SA_RESTORER macro, the latter has to be explicitly undefined.
-
-This change fixes compilation failures like this one:
-signal.c: In function 'decode_old_sigaction':
-signal.c:631:21: error: 'struct old_sigaction' has no member named 'sa_restorer'
-signal.c: In function 'decode_new_sigaction':
-signal.c:1224:21: error: 'struct new_sigaction' has no member named 'sa_restorer'
-
-* signal.c (struct old_sigaction, struct old_sigaction32,
-struct new_sigaction, struct new_sigaction32):
-Wrap sa_restorer member in #ifdef SA_RESTORER.
-(decode_old_sigaction, decode_new_sigaction):
-Wrap use of sa32.sa_restorer in #ifdef SA_RESTORER.
-
-Signed-off-by: Vicente Olivert Riera <vincent.riera@imgtec.com>
----
- signal.c |   18 ++++++++++++++----
- 1 files changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/signal.c b/signal.c
-index 74e0fd9..5855d13 100644
---- a/signal.c
-+++ b/signal.c
-@@ -559,8 +559,10 @@ struct old_sigaction {
- 	void (*__sa_handler)(int);
- 	unsigned long sa_mask;
- 	unsigned long sa_flags;
--	void (*sa_restorer)(void);
- #endif /* !MIPS */
-+#ifdef SA_RESTORER
-+	void (*sa_restorer)(void);
-+#endif
- };
- 
- struct old_sigaction32 {
-@@ -568,7 +570,9 @@ struct old_sigaction32 {
- 	uint32_t __sa_handler;
- 	uint32_t sa_mask;
- 	uint32_t sa_flags;
-+#ifdef SA_RESTORER
- 	uint32_t sa_restorer;
-+#endif
- };
- 
- static void
-@@ -594,7 +598,9 @@ decode_old_sigaction(struct tcb *tcp, long addr)
- 			memset(&sa, 0, sizeof(sa));
- 			sa.__sa_handler = (void*)(uintptr_t)sa32.__sa_handler;
- 			sa.sa_flags = sa32.sa_flags;
-+#ifdef SA_RESTORER
- 			sa.sa_restorer = (void*)(uintptr_t)sa32.sa_restorer;
-+#endif
- 			sa.sa_mask = sa32.sa_mask;
- 		}
- 	} else
-@@ -1138,10 +1144,10 @@ struct new_sigaction
- #else
- 	void (*__sa_handler)(int);
- 	unsigned long sa_flags;
--# if !defined(ALPHA) && !defined(HPPA) && !defined(IA64)
--	void (*sa_restorer)(void);
--# endif /* !ALPHA && !HPPA && !IA64 */
- #endif /* !MIPS */
-+#ifdef SA_RESTORER
-+	void (*sa_restorer)(void);
-+#endif
- 	/* Kernel treats sa_mask as an array of longs. */
- 	unsigned long sa_mask[NSIG / sizeof(long) ? NSIG / sizeof(long) : 1];
- };
-@@ -1150,7 +1156,9 @@ struct new_sigaction32
- {
- 	uint32_t __sa_handler;
- 	uint32_t sa_flags;
-+#ifdef SA_RESTORER
- 	uint32_t sa_restorer;
-+#endif
- 	uint32_t sa_mask[2 * (NSIG / sizeof(long) ? NSIG / sizeof(long) : 1)];
- };
- 
-@@ -1176,7 +1184,9 @@ decode_new_sigaction(struct tcb *tcp, long addr)
- 			memset(&sa, 0, sizeof(sa));
- 			sa.__sa_handler = (void*)(unsigned long)sa32.__sa_handler;
- 			sa.sa_flags     = sa32.sa_flags;
-+#ifdef SA_RESTORER
- 			sa.sa_restorer  = (void*)(unsigned long)sa32.sa_restorer;
-+#endif
- 			/* Kernel treats sa_mask as an array of longs.
- 			 * For 32-bit process, "long" is uint32_t, thus, for example,
- 			 * 32th bit in sa_mask will end up as bit 0 in sa_mask[1].
--- 
-1.7.1
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index c68eeda..a2a1081 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  095bfea5c540b91d297ccac73b21b92fd54a24599fd70395db87ff9eb7fd6f65  strace-4.9.tar.xz
+# From http://sourceforge.net/projects/strace/files/strace/4.10/
+md5	107a5be455493861189e9b57a3a51912	strace-4.10.tar.xz
+sha1	5c3ec4c5a9eeb440d7ec70514923c2e7e7f9ab6c	strace-4.10.tar.xz
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index e1299aa..2df2ec6 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.9
+STRACE_VERSION = 4.10
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
-- 
2.0.5
