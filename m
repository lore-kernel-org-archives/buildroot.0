From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 11 Jan 2014 00:20:34 +0100
Subject: [Buildroot] [git commit] Add LTris package (SDL game)
Message-ID: <20140110232043.92B0A9C43A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ed7b4921e8f349e6b12d6e8f74c971f2d001f85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in       |    1 +
 package/ltris/Config.in |   20 ++++++++++++++++++++
 package/ltris/ltris.mk  |   24 ++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a0fb704..20e142f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -157,6 +157,7 @@ menu "Games"
 source "package/doom-wad/Config.in"
 source "package/gnuchess/Config.in"
 source "package/lbreakout2/Config.in"
+source "package/ltris/Config.in"
 source "package/prboom/Config.in"
 source "package/rubix/Config.in"
 endmenu
diff --git a/package/ltris/Config.in b/package/ltris/Config.in
new file mode 100644
index 0000000..1ce52da
--- /dev/null
+++ b/package/ltris/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LTRIS
+	bool "LTris"
+	select BR2_PACKAGE_SDL
+	help
+	  LTris as a tetris clone, using SDL. It optionally requires
+	  SDL_mixer for audio support.  A display with minimum 640x480
+	  resolution and a keyboard are recommanded.
+
+	  http://lgames.sourceforge.net/index.php?project=LTris
+
+if BR2_PACKAGE_LTRIS
+
+config BR2_PACKAGE_LTRIS_AUDIO
+	bool "audio support"
+	default y
+	select BR2_PACKAGE_SDL_MIXER
+	help
+	  Activates audio support in LTris. Will add SDL_mixer.
+
+endif
diff --git a/package/ltris/ltris.mk b/package/ltris/ltris.mk
new file mode 100644
index 0000000..e26bf45
--- /dev/null
+++ b/package/ltris/ltris.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# ltris
+#
+#############################################################
+
+LTRIS_SITE = http://downloads.sourceforge.net/lgames/ltris/
+LTRIS_VERSION = 1.0.19
+LTRIS_LICENSE = GPLv2+
+LTRIS_LICENSE_FILES = COPYING
+
+LTRIS_DEPENDENCIES = sdl
+
+LTRIS_CONF_ENV = \
+	SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config"
+
+ifeq ($(BR2_PACKAGE_LTRIS_AUDIO),y)
+LTRIS_DEPENDENCIES += sdl_mixer
+LTRIS_CONF_OPT += --enable-audio=yes
+else
+LTRIS_CONF_OPT += --disable-audio
+endif
+
+$(eval $(autotools-package))
