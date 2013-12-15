From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:38:09 +0100
Subject: [Buildroot] [git commit] python-pygame: convert to the Python
	package infrastructure
Message-ID: <20131215130826.1ED279C035@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba2e9e0fa960ebe948d5e30a41b7db19c17a0c4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pygame/python-pygame.mk |   25 ++++++++-----------------
 1 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/package/python-pygame/python-pygame.mk b/package/python-pygame/python-pygame.mk
index 9db5a3f..681b36c 100644
--- a/package/python-pygame/python-pygame.mk
+++ b/package/python-pygame/python-pygame.mk
@@ -10,6 +10,7 @@ PYTHON_PYGAME_VERSION = f0bb4a4b365d
 PYTHON_PYGAME_SOURCE  = pygame-$(PYTHON_PYGAME_VERSION).tar.gz
 PYTHON_PYGAME_SITE = https://bitbucket.org/pygame/pygame
 PYTHON_PYGAME_SITE_METHOD = hg
+PYTHON_PYGAME_SETUP_TYPE = distutils
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
 PYTHON_PYGAME_OPT_DEPENDS += sdl_image
@@ -23,7 +24,7 @@ ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
 PYTHON_PYGAME_OPT_DEPENDS += sdl_mixer
 endif
 
-PYTHON_PYGAME_DEPENDENCIES = python sdl $(PYTHON_PYGAME_OPT_DEPENDS)
+PYTHON_PYGAME_DEPENDENCIES = sdl $(PYTHON_PYGAME_OPT_DEPENDS)
 
 ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
 define PYTHON_PYGAME_UNCONFIGURE_IMAGE
@@ -81,28 +82,18 @@ define PYTHON_PYGAME_CONFIGURE_CMDS
 	$(PYTHON_PYGAME_UNCONFIGURE_SCRAP)
 endef
 
-define PYTHON_PYGAME_BUILD_CMDS
-	(cd $(@D); CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-		LDSHARED="$(TARGET_CROSS)gcc -shared" \
-		CROSS_COMPILING=yes \
-		_python_sysroot=$(STAGING_DIR) \
-		_python_srcdir=$(BUILD_DIR)/python$(PYTHON_VERSION) \
-		_python_prefix=/usr \
-		_python_exec_prefix=/usr \
-		$(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 define PYTHON_PYGAME_REMOVE_DOC
 	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs
 endef
+
+PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_DOC
 endif
 
-define PYTHON_PYGAME_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install \
-		--prefix=$(TARGET_DIR)/usr)
+define PYTHON_PYGAME_REMOVE_TESTS
 	rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests
-	$(PYTHON_PYGAME_REMOVE_DOC)
 endef
 
-$(eval $(generic-package))
+PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS += PYTHON_PYGAME_REMOVE_TESTS
+
+$(eval $(python-package))
