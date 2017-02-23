From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:20:38 +0100
Subject: [Buildroot] [git commit branch/next] gdk-pixbuf: bump to version
	2.36.5
Message-ID: <20170223212205.B060D8222F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=487b419cc647da18f04a98ee69c160705f0c44e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This release needs a new tweak regarding loaders.cache - it's now used
to build the thumbnailer.
Since we already generate it using the host variant for the target we
can re-use this for the build step.
It's not necessary to used the tweaked version since the build one is
only used to account for mime types, not the plugins/loaders themselves.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash |  4 ++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 11 ++++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 827b386..e92f498 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.4.sha256sum
-sha256	0b19901c3eb0596141d2d48ddb9dac79ad1524bdf59366af58ab38fcb9ee7463	gdk-pixbuf-2.36.4.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.5.sha256sum
+sha256	7ace06170291a1f21771552768bace072ecdea9bd4a02f7658939b9a314c40fc	gdk-pixbuf-2.36.5.tar.xz
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 4fe6bd7..e4d3658 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.36
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).4
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).5
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
@@ -73,5 +73,14 @@ define GDK_PIXBUF_DISABLE_TESTS
 endef
 GDK_PIXBUF_POST_PATCH_HOOKS += GDK_PIXBUF_DISABLE_TESTS
 
+# Target gdk-pixbuf needs loaders.cache populated to build for the
+# thumbnailer. Use the host-built since it matches the target options
+# regarding mime types (which is the used information).
+define GDK_PIXBUF_COPY_LOADERS_CACHE
+	cp -f $(HOST_DIR)/usr/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache \
+		$(@D)/gdk-pixbuf
+endef
+GDK_PIXBUF_POST_PATCH_HOOKS += GDK_PIXBUF_COPY_LOADERS_CACHE
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
