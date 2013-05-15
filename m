From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 15 May 2013 15:38:35 +0200
Subject: [Buildroot] [git commit] libglib2: fix build when toolchain has no
	thread support
Message-ID: <20130515140651.9B7029A217@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cf81029c01650bc00b713e06dc7581f3f43767a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the build failure visible at
http://autobuild.buildroot.net/results/3d3/3d3f4f0044a4b58ce3d0a3449a5f012d953d59bb

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ib2-0004-fix-build-when-no-thread-support.patch |   28 ++++++++++++++++++++
 package/libglib2/libglib2.mk                       |    3 ++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/libglib2/libglib2-0004-fix-build-when-no-thread-support.patch b/package/libglib2/libglib2-0004-fix-build-when-no-thread-support.patch
new file mode 100644
index 0000000..5563544
--- /dev/null
+++ b/package/libglib2/libglib2-0004-fix-build-when-no-thread-support.patch
@@ -0,0 +1,28 @@
+Fix gio/gcancellable.c build when thread support is disabled
+
+Signed-off-by: "Samuel Martin" <s.martin49@gmail.com>
+---
+--- a/gio/gcancellable.c	2013-05-14 23:08:25.514461348 +0200
++++ b/gio/gcancellable.c	2013-05-14 23:10:23.347789625 +0200
+@@ -270,8 +270,10 @@ g_cancellable_reset (GCancellable *cance
+   while (priv->cancelled_running)
+     {
+       priv->cancelled_running_waiting = TRUE;
++#if defined(G_THREADS_ENABLED)
+       g_cond_wait (cancellable_cond,
+                    g_static_mutex_get_mutex (& G_LOCK_NAME (cancellable)));
++#endif
+     }
+ 
+   if (priv->cancelled)
+@@ -619,8 +621,10 @@ g_cancellable_disconnect (GCancellable
+   while (priv->cancelled_running)
+     {
+       priv->cancelled_running_waiting = TRUE;
++#if defined(G_THREADS_ENABLED)
+       g_cond_wait (cancellable_cond,
+                    g_static_mutex_get_mutex (& G_LOCK_NAME (cancellable)));
++#endif
+     }
+ 
+   g_signal_handler_disconnect (cancellable, handler_id);
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d78e8ec..3ac78ba 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -67,6 +67,9 @@ HOST_LIBGLIB2_CONF_OPT = \
 		--disable-tests
 
 LIBGLIB2_CONF_OPT += --disable-tests
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+	LIBGLIB2_CONF_OPT += --with-threads=none --disable-threads
+endif
 
 LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext) host-gettext
 
