From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 19:09:55 +0200
Subject: [Buildroot] [PATCH 09/10] package/weston: bump to 1.6.0
In-Reply-To: <cover.1411232859.git.yann.morin.1998@free.fr>
References: <cover.1411232859.git.yann.morin.1998@free.fr>
Message-ID: <38597af86b3b318bb3b2542f491eab5ab6442ef3.1411232859.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch applied upstream.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/weston/weston-0000-safe-foreach.patch | 36 ---------------------------
 package/weston/weston.mk                      |  2 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 package/weston/weston-0000-safe-foreach.patch

diff --git a/package/weston/weston-0000-safe-foreach.patch b/package/weston/weston-0000-safe-foreach.patch
deleted file mode 100644
index 7ea7197..0000000
--- a/package/weston/weston-0000-safe-foreach.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-commit a35d028d66cdd83a4a08663231dd2504f1b228f9
-Author: U. Artie Eoff <ullysses.a.eoff@intel.com>
-Date:   Wed May 21 09:20:02 2014 -0700
-
-    comp-wayland: use safe foreach when destroying outputs
-    
-    wl_list_for_each dereference's output to increment the
-    next iteration of the loop.  However, output is free'd
-    inside the loop resulting in a dereference to free'd
-    memory.
-    
-    Use wl_list_for_each_safe instead, which is designed to
-    handle this kind of pattern.
-    
-    Signed-off-by: U. Artie Eoff <ullysses.a.eoff@intel.com>
-    Reviewed-by: Thierry Reding <thierry.reding@gmail.com>
-    Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/src/compositor-wayland.c b/src/compositor-wayland.c
-index a08b71a..76e5396 100644
---- a/src/compositor-wayland.c
-+++ b/src/compositor-wayland.c
-@@ -1997,9 +1997,9 @@ err_free:
- static void
- wayland_compositor_destroy(struct wayland_compositor *c)
- {
--	struct weston_output *output;
-+	struct weston_output *output, *next;
- 
--	wl_list_for_each(output, &c->base.output_list, link)
-+	wl_list_for_each_safe(output, next, &c->base.output_list, link)
- 		wayland_output_destroy(output);
- 
- 	c->base.renderer->destroy(&c->base);
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 7bb35b9..f4702ca 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 1.5.0
+WESTON_VERSION = 1.6.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
1.9.1
