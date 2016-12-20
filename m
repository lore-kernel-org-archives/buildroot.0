From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 14:10:03 +0100
Subject: [Buildroot] [git commit] busybox: bump to version 1.26.0
Message-ID: <20161220131350.D441D81DFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44a563dbc04ec8e51c5262201cd1745617055b78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...op-move-free-prev_hist-out-of-signal-path.patch | 48 ----------------------
 package/busybox/busybox.hash                       |  6 +--
 package/busybox/busybox.mk                         |  2 +-
 3 files changed, 4 insertions(+), 52 deletions(-)

diff --git a/package/busybox/0003-top-move-free-prev_hist-out-of-signal-path.patch b/package/busybox/0003-top-move-free-prev_hist-out-of-signal-path.patch
deleted file mode 100644
index f5e2942..0000000
--- a/package/busybox/0003-top-move-free-prev_hist-out-of-signal-path.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From aedc3fe19fac368dc363050e0387d263b7e01cc6 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 19 Aug 2016 11:07:31 +0200
-Subject: [PATCH] top: move free(prev_hist) out of signal path
-
-It was seen being called recursively on repeated signals,
-leading to double free
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Backported-from: https://git.busybox.net/busybox/commit/?id=aedc3fe19fac368dc363050e0387d263b7e01cc6
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-
----
- procps/top.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/procps/top.c b/procps/top.c
-index 73cd285..6f7f7d3 100644
---- a/procps/top.c
-+++ b/procps/top.c
-@@ -728,12 +728,6 @@ static void reset_term(void)
- {
- 	if (!OPT_BATCH_MODE)
- 		tcsetattr_stdin_TCSANOW(&initial_settings);
--	if (ENABLE_FEATURE_CLEAN_UP) {
--		clearmems();
--# if ENABLE_FEATURE_TOP_CPU_USAGE_PERCENTAGE
--		free(prev_hist);
--# endif
--	}
- }
- 
- static void sig_catcher(int sig)
-@@ -1258,5 +1252,11 @@ int top_main(int argc UNUSED_PARAM, char **argv)
- #if ENABLE_FEATURE_USE_TERMIOS
- 	reset_term();
- #endif
-+	if (ENABLE_FEATURE_CLEAN_UP) {
-+		clearmems();
-+#if ENABLE_FEATURE_TOP_CPU_USAGE_PERCENTAGE
-+		free(prev_hist);
-+#endif
-+	}
- 	return EXIT_SUCCESS;
- }
--- 
-2.7.4
-
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 8306de9..b6f9fed 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.25.1.tar.bz2.sign
-md5	4f4c5de50b479b11ff636d7d8eb902a2	busybox-1.25.1.tar.bz2
-sha1	8b227b3efdb4c4aa94750f80cc63429aec6daa0b	busybox-1.25.1.tar.bz2
+# From http://busybox.net/downloads/busybox-1.26.0.tar.bz2.sign
+md5	362acc60bd94343aa36d98beb1f0831f	busybox-1.26.0.tar.bz2
+sha1	7e3a85b698c4d74f5fa374d3f3774b064053ae17	busybox-1.26.0.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f4a241d..d7751b5 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.25.1
+BUSYBOX_VERSION = 1.26.0
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
