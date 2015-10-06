From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Oct 2015 11:48:39 +0200
Subject: [Buildroot] [git commit] glib-networking: specify GIO_MODULE_DIR
	for target
Message-ID: <20151006084506.DDA1481E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fe434bf35b09ddf438392e6e5b4bc0b849495c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glib-networking/glib-networking.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 0ef69c4..b12c978 100644
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
