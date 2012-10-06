From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 6 Oct 2012 21:32:09 +0200
Subject: [Buildroot] [git commit] pulseaudio: fix X11 + !locale build issue
Message-ID: <20121006193625.B3419997DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a22e9342405de96e1f230f862bb840549cb111ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/aa1072ee5115ce12f03d600b46ff980a9d20c45d/

Pulseaudio installs autostart .desktop files when X11 support is enabled,
but the files are not created from the corresponding .desktop.in files
when built with --disable-nls (which we add for !locale builds).

Reported upstream at: https://bugs.freedesktop.org/show_bug.cgi?id=54658

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/pulseaudio/pulseaudio.mk |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index b9638ac..6396fef 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -57,6 +57,25 @@ ifneq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG),yy)
 PULSEAUDIO_CONF_OPT += --disable-gtk2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCB)$(BR2_PACKAGE_XLIB_LIBSM)$(BR2_PACKAGE_XLIB_LIBXTST),yyy)
+PULSEAUDIO_DEPENDENCIES += libxcb xlib_libSM xlib_libXtst
+
+# .desktop file generation needs nls support, so fake it for !locale builds
+# https://bugs.freedesktop.org/show_bug.cgi?id=54658
+ifneq ($(BR2_ENABLE_LOCALE),y)
+define PULSEAUDIO_FIXUP_DESKTOP_FILES
+	cp $(@D)/src/daemon/pulseaudio.desktop.in \
+	   $(@D)/src/daemon/pulseaudio.desktop
+	cp $(@D)/src/daemon/pulseaudio-kde.desktop.in \
+	   $(@D)/src/daemon/pulseaudio-kde.desktop
+endef
+PULSEAUDIO_POST_PATCH_HOOKS += PULSEAUDIO_FIXUP_DESKTOP_FILES
+endif
+
+else
+PULSEAUDIO_CONF_OPT += --disable-x11
+endif
+
 ifneq ($(BR2_PACKAGE_VALA),y)
 define PULSEAUDIO_REMOVE_VALA
 	rm -rf $(TARGET_DIR)/usr/share/vala
