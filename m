From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:58:05 +0100
Subject: [Buildroot] [git commit] libgtk3: fix undefined reference to
	get_xkb()
Message-ID: <20141028175816.5A108B1CBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9879f676d8c8ca8f3eac14a2c5193959d97d093
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When configuring Gtk+ with --disable-xkb, the build fails because of an
undefined reference to get_xkb().

This issue as been reported upstream [1]. This patch fixes it.

Fixes:

http://autobuild.buildroot.net/results/513/513d79b97bb8ad0e5cd431c47c706b5ec87a9882/
http://autobuild.buildroot.net/results/0c3/0c3f1df92481852622445478d2239371fc818f41/

[1] https://bugzilla.gnome.org/show_bug.cgi?id=739070

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...3-0004-Fix-undefined-reference-to-get_xkb.patch |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/libgtk3/libgtk3-0004-Fix-undefined-reference-to-get_xkb.patch b/package/libgtk3/libgtk3-0004-Fix-undefined-reference-to-get_xkb.patch
new file mode 100644
index 0000000..c2f4b4f
--- /dev/null
+++ b/package/libgtk3/libgtk3-0004-Fix-undefined-reference-to-get_xkb.patch
@@ -0,0 +1,33 @@
+From b64a04250b1f35923434158beb6ddb5726b41eac Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Mon, 27 Oct 2014 10:34:38 +0100
+Subject: [PATCH 1/1] Fix undefined reference to get_xkb()
+
+When configuring Gtk+ with --disable-xkb, the build fails because of an
+undefined reference to get_xkb().
+
+This patch fixes this issue.
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ gdk/x11/gdkkeys-x11.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gdk/x11/gdkkeys-x11.c b/gdk/x11/gdkkeys-x11.c
+index c45a971..6a5481b 100644
+--- a/gdk/x11/gdkkeys-x11.c
++++ b/gdk/x11/gdkkeys-x11.c
+@@ -1498,8 +1498,10 @@ gdk_x11_keymap_map_virtual_modifiers (GdkKeymap       *keymap,
+   int i, j;
+   gboolean retval;
+ 
++#ifdef HAVE_XKB
+   if (KEYMAP_USE_XKB (keymap))
+     get_xkb (keymap_x11);
++#endif
+ 
+   retval = TRUE;
+ 
+-- 
+1.9.1
+
