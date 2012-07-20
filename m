From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 21:08:53 +0200
Subject: [Buildroot] [git commit] sound-theme-borealis: new package
Message-ID: <20120720190912.0F1A896BF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=594610a39ed94fb6bf9c5b6b9b52580c82944635
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[thomas.petazzoni at free-electrons.com:
  slightly adjust the installation process to just do a loop of calls
  to $(INSTALL).]

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/sound-theme-borealis/Config.in             |    6 +++++
 .../sound-theme-borealis/sound-theme-borealis.mk   |   21 ++++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 46747d9..ab5781c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -499,6 +499,7 @@ source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
+source "package/sound-theme-borealis/Config.in"
 source "package/sound-theme-freedesktop/Config.in"
 endmenu
 
diff --git a/package/sound-theme-borealis/Config.in b/package/sound-theme-borealis/Config.in
new file mode 100644
index 0000000..fcc109f
--- /dev/null
+++ b/package/sound-theme-borealis/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SOUND_THEME_BOREALIS
+	bool "sound-theme-borealis"
+	help
+	  Borealis sound theme.
+
+	  http://kde-look.org/content/show.php?content=12584
diff --git a/package/sound-theme-borealis/sound-theme-borealis.mk b/package/sound-theme-borealis/sound-theme-borealis.mk
new file mode 100644
index 0000000..afca72a
--- /dev/null
+++ b/package/sound-theme-borealis/sound-theme-borealis.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# sound-theme-borealis
+#
+#############################################################
+SOUND_THEME_BOREALIS_VERSION = 0.9a
+SOUND_THEME_BOREALIS_SITE = http://ico.bukvic.net/Linux/Borealis_soundtheme
+SOUND_THEME_BOREALIS_SOURCE = \
+	Borealis_sound_theme_ogg-$(SOUND_THEME_BOREALIS_VERSION).tar.bz2
+
+define SOUND_THEME_BOREALIS_INSTALL_TARGET_CMDS
+	for f in $(@D)/*.ogg ; do \
+		$(INSTALL) -D -m 0644 $$f $(TARGET_DIR)/usr/share/sounds/borealis/stereo/`basename $$f` ; \
+	done
+endef
+
+define SOUND_THEME_BOREALIS_UNINSTALL_TARGET_CMDS
+	$(RM) -r $(TARGET_DIR)/usr/share/sounds/borealis
+endef
+
+$(eval $(generic-package))
