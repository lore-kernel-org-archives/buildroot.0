From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Apr 2014 22:10:05 +0200
Subject: [Buildroot] [git commit] python-pygame: Make installation of
	examples optional
Message-ID: <20140411201351.DE0589C718@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75d03d1bb9df15aa00964ecac118d208a10815f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They take up 1.5 MB in the target file system.

Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pygame/Config.in        |    6 ++++++
 package/python-pygame/python-pygame.mk |    7 +++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

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
index d9219b9..2278a5c 100644
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
