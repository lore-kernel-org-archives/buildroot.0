From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 09:49:57 +0100
Subject: [Buildroot] [git commit] package/libgtk3: don't use pkgconf
 directly for host build
Message-ID: <20181215084602.CC61885D8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faeed44e3febc1faeaee825a583e8cf47a31c0e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build of host-libgtk3 calls $(HOST_DIR)/bin/pkgconf directly,
assuming that it will return correct results when building host
tools. It did work in practice without per-package directories, but is
not how pkg-config is used for host build in general: we recommend to
use $(HOST_DIR)/bin/pkg-config and we have in $(HOST_MAKE_ENV) a
number of environment variables that tell pkg-config to return results
relevant for host builds.

With per-package directories, calling $(HOST_DIR)/bin/pkgconf fails
badly, because it searches for .pc files in the per-package directory
of host-pkgconf itself, which obviously is empty.

So, we switch to using $(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY),
which uses the regular pkg-config with the right environment
variables.

This allows the build of host-libgtk3 to find gdk-pixbuf-2.0 and
gio-2.0 built for the host, even in the context of
BR2_PER_PACKAGE_DIRECTORIES=y.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 1b85d00aae..bdf820de37 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -151,8 +151,8 @@ HOST_LIBGTK3_DEPENDENCIES = \
 	host-librsvg
 
 HOST_LIBGTK3_CFLAGS = \
-	`$(HOST_DIR)/bin/pkgconf --cflags --libs gdk-pixbuf-2.0` \
-	`$(HOST_DIR)/bin/pkgconf --cflags --libs gio-2.0`
+	`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --cflags --libs gdk-pixbuf-2.0` \
+	`$(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY) --cflags --libs gio-2.0`
 
 define HOST_LIBGTK3_CONFIGURE_CMDS
 	echo "#define GETTEXT_PACKAGE \"gtk30\"" >> $(@D)/gtk/config.h
