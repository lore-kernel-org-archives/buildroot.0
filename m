From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Nov 2014 16:41:07 +0000
Subject: [Buildroot] [PATCH 3/3] libgtk3: apply an upstream patch to fix a
	regression
In-Reply-To: <1415637667-57658-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415637667-57658-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1415637667-57658-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply an upstream patch to fix a build regression in 3.14.5. This patch
will be included in the next 3.14.6 release, so we can remove it in the
next version bump.

Error message:

./.libs/libgtk-3.so: undefined reference to `GTK_IS_PLUG'

Bug report:
  https://bugzilla.gnome.org/show_bug.cgi?id=739885

Upstream commit:
  https://git.gnome.org/browse/gtk+/commit/?id=36fedb0c4b373272afc2d76a7c790d696ed48034

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...lug-is-conditionally-supported-on-X11-onl.patch |   57 ++++++++++++++++++++
 1 files changed, 57 insertions(+), 0 deletions(-)
 create mode 100644 package/libgtk3/0006-window-GtkPlug-is-conditionally-supported-on-X11-onl.patch

diff --git a/package/libgtk3/0006-window-GtkPlug-is-conditionally-supported-on-X11-onl.patch b/package/libgtk3/0006-window-GtkPlug-is-conditionally-supported-on-X11-onl.patch
new file mode 100644
index 0000000..081cd1e
--- /dev/null
+++ b/package/libgtk3/0006-window-GtkPlug-is-conditionally-supported-on-X11-onl.patch
@@ -0,0 +1,57 @@
+window: GtkPlug is conditionally supported on X11 only
+
+Apply an upstream patch to fix a build regression in 3.14.5. This patch
+will be included in the next 3.14.6 release, so we can remove it in the 
+next version bump.
+
+Error message:
+
+./.libs/libgtk-3.so: undefined reference to `GTK_IS_PLUG'
+
+Bug report:
+  https://bugzilla.gnome.org/show_bug.cgi?id=739885
+
+Upstream commit:
+  https://git.gnome.org/browse/gtk+/commit/?id=36fedb0c4b373272afc2d76a7c790d696ed48034
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From 36fedb0c4b373272afc2d76a7c790d696ed48034 Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Mon, 10 Nov 2014 14:08:20 +0000
+Subject: [PATCH] window: GtkPlug is conditionally supported on X11 only
+
+We cannot do a type check on it if we don't have the X11 backend
+compiled in.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=739885
+---
+ gtk/gtkwindow.c |    9 ++++++++-
+ 1 files changed, 8 insertions(+), 1 deletions(-)
+
+diff --git a/gtk/gtkwindow.c b/gtk/gtkwindow.c
+index 0d0fb88..6cb355b 100644
+--- a/gtk/gtkwindow.c
++++ b/gtk/gtkwindow.c
+@@ -1610,10 +1610,17 @@ gtk_window_constructed (GObject *object)
+ {
+   GtkWindow *window = GTK_WINDOW (object);
+   GtkWindowPrivate *priv = window->priv;
++  gboolean is_plug;
+ 
+   G_OBJECT_CLASS (gtk_window_parent_class)->constructed (object);
+ 
+-  if (priv->type == GTK_WINDOW_TOPLEVEL && !GTK_IS_PLUG (window))
++#ifdef GDK_WINDOWING_X11
++  is_plug = GTK_IS_PLUG (window);
++#else
++  is_plug = FALSE;
++#endif
++
++  if (priv->type == GTK_WINDOW_TOPLEVEL && !is_plug)
+     {
+       priv->multipress_gesture = gtk_gesture_multi_press_new (GTK_WIDGET (object));
+       gtk_gesture_single_set_button (GTK_GESTURE_SINGLE (priv->multipress_gesture), 0);
+-- 
+1.7.1
+
-- 
1.7.1
