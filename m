From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 May 2013 13:57:10 +0200
Subject: [Buildroot] [PATCH 2/3] libglib2: fix build when toolchain has no
	thread support
In-Reply-To: <1368532631-12983-1-git-send-email-s.martin49@gmail.com>
References: <1368532631-12983-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1368532631-12983-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...ib2-0004-fix-build-when-no-thread-support.patch | 40 ++++++++++++++++++++++
 package/libglib2/libglib2.mk                       |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 package/libglib2/libglib2-0004-fix-build-when-no-thread-support.patch

diff --git a/package/libglib2/libglib2-0004-fix-build-when-no-thread-support.patch b/package/libglib2/libglib2-0004-fix-build-when-no-thread-support.patch
new file mode 100644
index 0000000..e1de20a
--- /dev/null
+++ b/package/libglib2/libglib2-0004-fix-build-when-no-thread-support.patch
@@ -0,0 +1,40 @@
+Fix gio/gcancellable.c build when thread support is disabled
+
+Signed-off-by: "Samuel Martin" <s.martin49@gmail.com>
+---
+--- a/gio/gcancellable.c	2013-05-14 10:49:10.656384566 +0200
++++ b/gio/gcancellable.c	2013-05-14 12:38:46.339432786 +0200
+@@ -263,6 +263,7 @@ g_cancellable_reset (GCancellable *cance
+ 
+   g_return_if_fail (G_IS_CANCELLABLE (cancellable));
+ 
++#ifdef G_THREADS_ENABLED
+   G_LOCK(cancellable);
+ 
+   priv = cancellable->priv;
+@@ -282,6 +283,7 @@ g_cancellable_reset (GCancellable *cance
+       priv->cancelled = FALSE;
+     }
+   G_UNLOCK(cancellable);
++#endif
+ }
+ 
+ /**
+@@ -612,6 +614,9 @@ g_cancellable_disconnect (GCancellable
+   if (handler_id == 0 ||  cancellable == NULL)
+     return;
+ 
++  g_return_if_fail (G_IS_CANCELLABLE (cancellable));
++
++#ifdef G_THREADS_ENABLED
+   G_LOCK (cancellable);
+ 
+   priv = cancellable->priv;
+@@ -625,6 +630,7 @@ g_cancellable_disconnect (GCancellable
+ 
+   g_signal_handler_disconnect (cancellable, handler_id);
+   G_UNLOCK (cancellable);
++#endif
+ }
+ 
+ typedef struct {
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
 
-- 
1.8.2.3
