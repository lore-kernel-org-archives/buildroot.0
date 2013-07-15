From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:50 -0500
Subject: [Buildroot] [PATCH 67/67] libglib2: needs threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-68-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libglib2/Config.in                         |  5 ++--
 ...ib2-0002-fix-build-when-no-thread-support.patch | 30 ----------------------
 2 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch

diff --git a/package/libglib2/Config.in b/package/libglib2/Config.in
index 5282885..806dbbe 100644
--- a/package/libglib2/Config.in
+++ b/package/libglib2/Config.in
@@ -5,10 +5,11 @@ config BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_USE_WCHAR # gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Low-level core library that forms the basis of GTK+ and GNOME.
 
 	  http://www.gtk.org/
 
-comment "libglib2 requires a toolchain with WCHAR support"
-	depends on !BR2_USE_WCHAR
+comment "libglib2 requires a toolchain with WCHAR support and threading support"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch b/package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch
deleted file mode 100644
index 43c7e16..0000000
--- a/package/libglib2/libglib2-0002-fix-build-when-no-thread-support.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix gio/gcancellable.c build when thread support is disabled
-
-Changes:
-	Updated for 2.36.1
-
-Signed-off-by: "Samuel Martin" <s.martin49@gmail.com>
-Signed-off-by: "Spenser Gilliland" <spenser@gillilanding.com>
----
---- libglib2-2.36.1.orig/gio/gcancellable.c	2013-03-13 08:39:09.000000000 -0500
-+++ libglib2-2.36.1/gio/gcancellable.c	2013-05-26 10:49:32.366019891 -0500
-@@ -267,7 +267,9 @@
-   while (priv->cancelled_running)
-     {
-       priv->cancelled_running_waiting = TRUE;
-+#if defined(G_THREADS_ENABLED)
-       g_cond_wait (&cancellable_cond, &cancellable_mutex);
-+#endif
-     }
- 
-   if (priv->cancelled)
-@@ -620,7 +622,9 @@
-   while (priv->cancelled_running)
-     {
-       priv->cancelled_running_waiting = TRUE;
-+#if defined(G_THREADS_ENABLED)
-       g_cond_wait (&cancellable_cond, &cancellable_mutex);
-+#endif
-     }
- 
-   g_signal_handler_disconnect (cancellable, handler_id);
-- 
1.8.1.2
