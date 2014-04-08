From: Paul Cercueil <paul@crapouillou.net>
Date: Tue,  8 Apr 2014 19:45:06 +0200
Subject: [Buildroot] [PATCH 2/5] python-pygame: Make installation of
	examples optional
In-Reply-To: <1396979109-10691-1-git-send-email-paul@crapouillou.net>
References: <1396979109-10691-1-git-send-email-paul@crapouillou.net>
Message-ID: <1396979109-10691-2-git-send-email-paul@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maarten ter Huurne <maarten@treewalker.org>

They take up 1.5 MB in the target file system.

Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
---
 package/python-pygame/Config.in        | 6 ++++++
 package/python-pygame/python-pygame.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
index b9a367d..f72ee31 100644
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -20,6 +20,12 @@ config BR2_PACKAGE_PYTHON_PYGAME_IMAGE
 	  pygame module for loading, saving and transfering images.
 	  Will autoselect sdl_image with png and jpeg support.
 
+config BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES
+	bool "pygame.examples"
+	help
+	  Include examples.
+	  Selecting this option adds about 1.5 MB to the target file system.
+
 config BR2_PACKAGE_PYTHON_PYGAME_FONT
 	bool "pygame.font"
 	select BR2_PACKAGE_SDL_TTF
diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index b6381a3..dac9a82 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -94,4 +94,11 @@ endef
 
 PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_TESTS
 
+ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES),y)
+define PYTHON_PYGAME_REMOVE_EXAMPLES
+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/pygame/examples
+endef
+PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_EXAMPLES
+endif
+
 $(eval $(python-package))
-- 
1.9.1
