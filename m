From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Oct 2015 16:54:30 -0300
Subject: [Buildroot] [PATCH] glib-networking: specify GIO_MODULE_DIR for
	target
Message-ID: <1444074870-31815-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the upgrade to pkgconf 0.9.12 all directories and variables with
directories are sysroot-prefixed, whereas with the old patch only some
variables were (includedir, mapdir, sdkdir, libdir).

libglib2 uses a giomoduledir=${libdir}/gio/modules variable in
gio-2.0.pc, which when expanded via sysroot by pkgconf at configure time
points to the staging directory (via libdir expansion).
When target install gets called the gio module gets installed to staging
rather than target, with the obvious consequences this has.

Work-around this pkgconfig abuse by overriding GIO_MODULE_DIR at target
install time.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glib-networking/glib-networking.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index deb138a..67a9203 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -16,6 +16,8 @@ GLIB_NETWORKING_DEPENDENCIES = \
 	libglib2
 GLIB_NETWORKING_LICENSE = LGPLv2+
 GLIB_NETWORKING_LICENSE_FILES = COPYING
+GLIB_NETWORKING_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) \
+	GIO_MODULE_DIR=/usr/lib/gio/modules install
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 GLIB_NETWORKING_DEPENDENCIES += gnutls
-- 
2.4.9
