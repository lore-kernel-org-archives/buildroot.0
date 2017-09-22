From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 09:00:35 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] gdk-pixbuf: security bump
	to version 2.36.10
Message-ID: <20170922074750.B574C7FA45@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6b99d28efd7dbf60a0d644f906f45217d9c44a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes the following security issues:

CVE-2017-2862 - An exploitable heap overflow vulnerability exists in the
gdk_pixbuf__jpeg_image_load_increment functionality of Gdk-Pixbuf 2.36.6.  A
specially crafted jpeg file can cause a heap overflow resulting in remote
code execution.  An attacker can send a file or url to trigger this
vulnerability.

CVE-2017-2870 - An exploitable integer overflow vulnerability exists in the
tiff_image_parse functionality of Gdk-Pixbuf 2.36.6 when compiled with
Clang.  A specially crafted tiff file can cause a heap-overflow resulting in
remote code execution.  An attacker can send a file or a URL to trigger this
vulnerability.

CVE-2017-6311 - gdk-pixbuf-thumbnailer.c in gdk-pixbuf allows
context-dependent attackers to cause a denial of service (NULL pointer
dereference and application crash) via vectors related to printing an error
message.

The host version now needs the same workaround as we do for the target to
not pull in shared-mime-info.

Also add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3853675ae03df209253c34d292eb3b9535e3f68c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdk-pixbuf/gdk-pixbuf.hash | 6 ++++--
 package/gdk-pixbuf/gdk-pixbuf.mk   | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index ebb03a8..9cb947f 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.6.sha256sum
-sha256 455eb90c09ed1b71f95f3ebfe1c904c206727e0eeb34fc94e5aaf944663a820c  gdk-pixbuf-2.36.6.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.10.sha256sum
+sha256 f8f6fa896b89475c73b6e9e8d2a2b062fc359c4b4ccb8e96470d6ab5da949ace  gdk-pixbuf-2.36.10.tar.xz
+# Locally calculated
+sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index bf83b19..5e8bb41 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GDK_PIXBUF_VERSION_MAJOR = 2.36
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).6
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).10
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
@@ -20,6 +20,9 @@ GDK_PIXBUF_CONF_ENV = \
 	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY) \
 	gio_can_sniff=no
 
+HOST_GDK_PIXBUF_CONF_ENV = \
+	gio_can_sniff=no
+
 GDK_PIXBUF_CONF_OPTS = --disable-glibtest
 
 ifneq ($(BR2_PACKAGE_LIBPNG),y)
