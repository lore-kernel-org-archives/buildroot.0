From: Valentine Barshak <gvaxon@gmail.com>
Date: Fri,  5 Oct 2012 01:27:19 +0400
Subject: [Buildroot] [PATCH] libglib2: Fix midori save file dialog not being
	rendered
Message-ID: <1349386039-817-1-git-send-email-gvaxon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fixes the following issue, when midori
save file dialog is not rendered:
Neither the dialog nor the main window is redrawn
unless the save file dialog is closed.
The buttons can be blindly clicked though.

This is a known issue, which has been fixed in glib 2.32.2.

Backported from the commit ffb000e37be998df55d446c85edbc440fad06a17
  From: Dan Winship <danw@gnome.org>
  gmain: block child sources when blocking the parent

  When blocking a source that has child sources, we need to consider the
  children blocked as well. Otherwise they will still trigger repeatedly
  in an inner loop started from the parent source's callback.

  https://bugzilla.gnome.org/show_bug.cgi?id=669260

Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
---
 ...ck-child-sources-when-blocking-the-parent.patch | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 package/libglib2/libglib2-gmain-block-child-sources-when-blocking-the-parent.patch

diff --git a/package/libglib2/libglib2-gmain-block-child-sources-when-blocking-the-parent.patch b/package/libglib2/libglib2-gmain-block-child-sources-when-blocking-the-parent.patch
new file mode 100644
index 0000000..58671fd
--- /dev/null
+++ b/package/libglib2/libglib2-gmain-block-child-sources-when-blocking-the-parent.patch
@@ -0,0 +1,100 @@
+This should fix midori save file dialog not being displayed.
+Backported from the following changes:
+
+From ffb000e37be998df55d446c85edbc440fad06a17 Mon Sep 17 00:00:00 2001
+From: Dan Winship <danw@gnome.org>
+Date: Wed, 11 Apr 2012 15:21:17 -0400
+Subject: [PATCH] gmain: block child sources when blocking the parent
+
+When blocking a source that has child sources, we need to consider the
+children blocked as well. Otherwise they will still trigger repeatedly
+in an inner loop started from the parent source's callback.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=669260
+diff -pruN glib-2.30.2.orig/glib/gmain.c glib-2.30.2/glib/gmain.c
+--- glib-2.30.2.orig/glib/gmain.c	2011-11-11 21:56:52.000000000 +0400
++++ glib-2.30.2/glib/gmain.c	2012-09-22 03:41:07.686442208 +0400
+@@ -185,7 +185,8 @@ typedef struct _GSourceCallback GSourceC
+ typedef enum
+ {
+   G_SOURCE_READY = 1 << G_HOOK_FLAG_USER_SHIFT,
+-  G_SOURCE_CAN_RECURSE = 1 << (G_HOOK_FLAG_USER_SHIFT + 1)
++  G_SOURCE_CAN_RECURSE = 1 << (G_HOOK_FLAG_USER_SHIFT + 1),
++  G_SOURCE_BLOCKED = 1 << (G_HOOK_FLAG_USER_SHIFT + 2)
+ } GSourceFlags;
+ 
+ #ifdef G_THREADS_ENABLED
+@@ -323,8 +324,7 @@ struct _GSourcePrivate
+ #endif
+ 
+ #define SOURCE_DESTROYED(source) (((source)->flags & G_HOOK_FLAG_ACTIVE) == 0)
+-#define SOURCE_BLOCKED(source) (((source)->flags & G_HOOK_FLAG_IN_CALL) != 0 && \
+-		                ((source)->flags & G_SOURCE_CAN_RECURSE) == 0)
++#define SOURCE_BLOCKED(source) (((source)->flags & G_SOURCE_BLOCKED) != 0)
+ 
+ #define SOURCE_UNREF(source, context)                       \
+    G_STMT_START {                                           \
+@@ -2352,12 +2352,24 @@ block_source (GSource *source)
+ 
+   g_return_if_fail (!SOURCE_BLOCKED (source));
+ 
++  source->flags |= G_SOURCE_BLOCKED;
++
+   tmp_list = source->poll_fds;
+   while (tmp_list)
+     {
+       g_main_context_remove_poll_unlocked (source->context, tmp_list->data);
+       tmp_list = tmp_list->next;
+     }
++
++  if (source->priv && source->priv->child_sources)
++    {
++      tmp_list = source->priv->child_sources;
++      while (tmp_list)
++	{
++	  block_source (tmp_list->data);
++	  tmp_list = tmp_list->next;
++	}
++    }
+ }
+ 
+ /* HOLDS: source->context's lock */
+@@ -2366,15 +2378,27 @@ unblock_source (GSource *source)
+ {
+   GSList *tmp_list;
+   
+-  g_return_if_fail (!SOURCE_BLOCKED (source)); /* Source already unblocked */
++  g_return_if_fail (SOURCE_BLOCKED (source)); /* Source already unblocked */
+   g_return_if_fail (!SOURCE_DESTROYED (source));
+   
++  source->flags &= ~G_SOURCE_BLOCKED;
++
+   tmp_list = source->poll_fds;
+   while (tmp_list)
+     {
+       g_main_context_add_poll_unlocked (source->context, source->priority, tmp_list->data);
+       tmp_list = tmp_list->next;
+     }
++
++  if (source->priv && source->priv->child_sources)
++    {
++      tmp_list = source->priv->child_sources;
++      while (tmp_list)
++	{
++	  unblock_source (tmp_list->data);
++	  tmp_list = tmp_list->next;
++	}
++    }
+ }
+ 
+ /* HOLDS: context's lock */
+@@ -2453,8 +2477,7 @@ g_main_dispatch (GMainContext *context)
+ 	  if (!was_in_call)
+ 	    source->flags &= ~G_HOOK_FLAG_IN_CALL;
+ 
+-	  if ((source->flags & G_SOURCE_CAN_RECURSE) == 0 &&
+-	      !SOURCE_DESTROYED (source))
++	  if (SOURCE_BLOCKED (source) && !SOURCE_DESTROYED (source))
+ 	    unblock_source (source);
+ 	  
+ 	  /* Note: this depends on the fact that we can't switch
-- 
1.7.11.4
