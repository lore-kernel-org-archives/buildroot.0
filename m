From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 19 Aug 2016 15:52:53 +0200
Subject: [Buildroot] [PATCH] top: fix double free causing a SIGABRT storm
	after SIGPIPE
Message-ID: <1471614773-7275-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some platforms the command 'top -n1 | head' goes very often into an
infinite loop of SIGABRT and double free()s.

Fix by applying a patch from upstream.

For a detailed explanation of the bug, see
http://lists.busybox.net/pipermail/busybox/2016-August/084555.html

Thanks to Yann for the help in finding this bug.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...op-move-free-prev_hist-out-of-signal-path.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/busybox/0006-top-move-free-prev_hist-out-of-signal-path.patch

diff --git a/package/busybox/0006-top-move-free-prev_hist-out-of-signal-path.patch b/package/busybox/0006-top-move-free-prev_hist-out-of-signal-path.patch
new file mode 100644
index 0000000..f5e2942
--- /dev/null
+++ b/package/busybox/0006-top-move-free-prev_hist-out-of-signal-path.patch
@@ -0,0 +1,48 @@
+From aedc3fe19fac368dc363050e0387d263b7e01cc6 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 19 Aug 2016 11:07:31 +0200
+Subject: [PATCH] top: move free(prev_hist) out of signal path
+
+It was seen being called recursively on repeated signals,
+leading to double free
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Backported-from: https://git.busybox.net/busybox/commit/?id=aedc3fe19fac368dc363050e0387d263b7e01cc6
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+
+---
+ procps/top.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/procps/top.c b/procps/top.c
+index 73cd285..6f7f7d3 100644
+--- a/procps/top.c
++++ b/procps/top.c
+@@ -728,12 +728,6 @@ static void reset_term(void)
+ {
+ 	if (!OPT_BATCH_MODE)
+ 		tcsetattr_stdin_TCSANOW(&initial_settings);
+-	if (ENABLE_FEATURE_CLEAN_UP) {
+-		clearmems();
+-# if ENABLE_FEATURE_TOP_CPU_USAGE_PERCENTAGE
+-		free(prev_hist);
+-# endif
+-	}
+ }
+ 
+ static void sig_catcher(int sig)
+@@ -1258,5 +1252,11 @@ int top_main(int argc UNUSED_PARAM, char **argv)
+ #if ENABLE_FEATURE_USE_TERMIOS
+ 	reset_term();
+ #endif
++	if (ENABLE_FEATURE_CLEAN_UP) {
++		clearmems();
++#if ENABLE_FEATURE_TOP_CPU_USAGE_PERCENTAGE
++		free(prev_hist);
++#endif
++	}
+ 	return EXIT_SUCCESS;
+ }
+-- 
+2.7.4
+
-- 
2.7.4
