From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 15:48:05 +0100
Subject: [Buildroot] [git commit] package/libgtk3: disable introspection
Message-ID: <20200315143547.1302182832@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0b4c33fdad501310245903ef024905a2d2d133d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build will fail if gobject-introspection is built before libgtk3:

  GISCAN   Gdk-3.0.gir
Couldn't find include 'GdkPixbuf-2.0.gir' (search path: '['/home/fabrice/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '../gdk', '/home/fabrice/buildroot/output/host/share', '/usr/share/gnome/gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/gir-1.0', '/home/fabrice/buildroot/output/host/share/gir-1.0', '/usr/share/gir-1.0']')
make[5]: *** [/home/fabrice/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/../share/gobject-introspection-1.0/Makefile.introspection:156: Gdk-3.0.gir] Error 1

So disable introspection on host and target variant

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgtk3/libgtk3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index fc131132f9..7df4426fa6 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -20,7 +20,9 @@ LIBGTK3_CONF_ENV = \
 
 LIBGTK3_CONF_OPTS = \
 	--disable-glibtest \
+	--disable-introspection \
 	--enable-explicit-deps=no
+HOST_LIBGTK3_CONF_OPTS = --disable-introspection
 
 # Override pkg-config pkgdatadir variable, it needs the prefix
 LIBGTK3_MAKE_OPTS = \
