From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2014 20:57:29 +0100
Subject: [Buildroot] [git commit branch/next] Add OpenTyrian package (SDL
	game)
Message-ID: <20140212195804.3445A9C9BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b8ffcd8f25cede33bcd2dc81ef8682c2acb0b97
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Peter: hide -data package if opentyrian isn't enabled]
Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                          |    2 +
 package/opentyrian-data/Config.in          |    9 +++++++
 package/opentyrian-data/opentyrian-data.mk |   23 +++++++++++++++++
 package/opentyrian/Config.in               |   24 ++++++++++++++++++
 package/opentyrian/opentyrian.mk           |   36 ++++++++++++++++++++++++++++
 5 files changed, 94 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 19c9c4b..c323711 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -156,6 +156,8 @@ source "package/doom-wad/Config.in"
 source "package/gnuchess/Config.in"
 source "package/lbreakout2/Config.in"
 source "package/ltris/Config.in"
+source "package/opentyrian/Config.in"
+source "package/opentyrian-data/Config.in"
 source "package/prboom/Config.in"
 source "package/rubix/Config.in"
 endmenu
diff --git a/package/opentyrian-data/Config.in b/package/opentyrian-data/Config.in
new file mode 100644
index 0000000..df25c21
--- /dev/null
+++ b/package/opentyrian-data/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_OPENTYRIAN_DATA
+	bool "OpenTyrian data"
+	depends on BR2_PACKAGE_OPENTYRIAN
+	help
+	  Data files to use with OpenTyrian game. Currently only the original
+	  Tyrian 2.1 data files, that have been released as Freeware in 2004,
+	  are compatible.
+
+	  http://code.google.com/p/opentyrian/wiki/FAQ
diff --git a/package/opentyrian-data/opentyrian-data.mk b/package/opentyrian-data/opentyrian-data.mk
new file mode 100644
index 0000000..75fa3d9
--- /dev/null
+++ b/package/opentyrian-data/opentyrian-data.mk
@@ -0,0 +1,23 @@
+###############################################################################
+#
+# opentyrian-data
+#
+###############################################################################
+
+OPENTYRIAN_DATA_VERSION = 2.1
+OPENTYRIAN_DATA_SITE = http://www.camanis.net/opentyrian/
+OPENTYRIAN_DATA_SOURCE = tyrian21.zip
+OPENTYRIAN_DATA_LICENSE = Freeware
+
+define OPENTYRIAN_DATA_EXTRACT_CMDS
+	unzip -d $(@D) $(DL_DIR)/$(OPENTYRIAN_DATA_SOURCE)
+endef
+
+define OPENTYRIAN_DATA_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/opentyrian/data/
+	cp $(@D)/tyrian21/* $(TARGET_DIR)/usr/share/opentyrian/data/
+	rm -f $(TARGET_DIR)/usr/share/opentyrian/data/*.doc
+	rm -f $(TARGET_DIR)/usr/share/opentyrian/data/*.exe
+endef
+
+$(eval $(generic-package))
diff --git a/package/opentyrian/Config.in b/package/opentyrian/Config.in
new file mode 100644
index 0000000..3ebcf08
--- /dev/null
+++ b/package/opentyrian/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_OPENTYRIAN
+	bool "OpenTyrian"
+	select BR2_PACKAGE_SDL
+	select BR2_PACKAGE_OPENTYRIAN_DATA
+	help
+	  OpenTyrian is a port of the DOS shoot-em-up Tyrian. It uses SDL,
+	  making it easily cross-platform.
+	  It requires the original data files to run.
+	  A display with minimum 640x480 resolution and a keyboard are needed
+	  to play the game.
+	  If you want some sound, activate ALSA with OSS emulation.
+
+	  http://code.google.com/p/opentyrian/
+
+if BR2_PACKAGE_OPENTYRIAN
+
+config BR2_PACKAGE_OPENTYRIAN_NET
+	bool "network support"
+	default y
+	select BR2_PACKAGE_SDL_NET
+	help
+	  Activates network support in OpenTyrian. Will add SDL_net.
+
+endif
diff --git a/package/opentyrian/opentyrian.mk b/package/opentyrian/opentyrian.mk
new file mode 100644
index 0000000..80465a3
--- /dev/null
+++ b/package/opentyrian/opentyrian.mk
@@ -0,0 +1,36 @@
+###############################################################################
+#
+# opentyrian
+#
+###############################################################################
+
+OPENTYRIAN_VERSION = 2.1.20130907
+OPENTYRIAN_SITE = http://www.camanis.net/opentyrian/releases/
+OPENTYRIAN_SOURCE = opentyrian-$(OPENTYRIAN_VERSION)-src.tar.gz
+OPENTYRIAN_LICENSE = GPLv2+
+OPENTYRIAN_LICENSE_FILES = COPYING
+
+OPENTYRIAN_DEPENDENCIES = sdl
+
+ifeq ($(BR2_PACKAGE_OPENTYRIAN_NET),y)
+OPENTYRIAN_DEPENDENCIES += sdl_net
+OPENTYRIAN_NETWORK = true
+else
+OPENTYRIAN_NETWORK = false
+endif
+
+define OPENTYRIAN_BUILD_CMDS
+        $(MAKE) PLATFORM=UNIX \
+		CC="$(TARGET_CC)" \
+		STRIP="/bin/true" \
+		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl-config" \
+		LDFLAGS="-lm" \
+		WITH_NETWORK="$(OPENTYRIAN_NETWORK)" \
+		-C $(@D) release
+endef
+
+define OPENTYRIAN_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/opentyrian $(TARGET_DIR)/usr/bin/opentyrian
+endef
+
+$(eval $(generic-package))
