From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Dec 2011 22:13:21 +0100
Subject: [Buildroot] [git commit] New package: feh
Message-ID: <20111210222040.D47628F8F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=507e88bea8d57136a0966e3716b4698872d45d70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-By: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in     |    1 +
 package/feh/Config.in |   14 ++++++++++++++
 package/feh/feh.mk    |   21 +++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cf0f400..eb93b1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -133,6 +133,7 @@ source "package/fluxbox/Config.in"
 comment "X applications"
 source "package/alsamixergui/Config.in"
 source "package/docker/Config.in"
+source "package/feh/Config.in"
 source "package/gqview/Config.in"
 source "package/gmpc/Config.in"
 source "package/gob2/Config.in"
diff --git a/package/feh/Config.in b/package/feh/Config.in
new file mode 100644
index 0000000..31e7239
--- /dev/null
+++ b/package/feh/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FEH
+	bool "feh"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXINERAMA
+	select BR2_PACKAGE_XLIB_LIBXT
+	select BR2_PACKAGE_IMLIB2_PNG
+	select BR2_PACKAGE_IMLIB2_JPEG
+	select BR2_PACKAGE_IMLIB2_X
+	select BR2_PACKAGE_GIBLIB
+	select BR2_PACKAGE_LIBCURL
+	help
+	  feh is an X11 image viewer aimed mostly at console users.
+
+	  http://feh.finalrewind.org/
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
new file mode 100644
index 0000000..eb68277
--- /dev/null
+++ b/package/feh/feh.mk
@@ -0,0 +1,21 @@
+FEH_VERSION = 2.0
+FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
+FEH_SITE = http://feh.finalrewind.org/
+FEH_DEPENDENCIES = libcurl giblib imlib2 libpng xlib_libXinerama xlib_libXt
+
+define FEH_BUILD_CMDS
+	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+		-C $(@D) all
+endef
+
+define FEH_INSTALL_TARGET_CMDS
+	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
+		DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
+
+define FEH_UNINSTALL_TARGET_CMDS
+	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) " \
+		DESTDIR=$(TARGET_DIR) -C $(@D) uninstall
+endef
+
+$(eval $(call GENTARGETS))
