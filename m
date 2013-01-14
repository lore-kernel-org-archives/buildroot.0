From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 21:34:35 +0100
Subject: [Buildroot] [git commit] Allow selection of individual Liberation
	font sets
Message-ID: <20130114203855.74EF099596@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73f7994e53e5a3e1749b29bec4c0922b60885c04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't always want all the font sets on small systems.

[Peter: cleanup Config.in, ensure target dir gets created first]
Signed-off-by: Charles Manning <cdhmanning@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liberation/Config.in     |   15 +++++++++++++++
 package/liberation/liberation.mk |   22 +++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletions(-)

diff --git a/package/liberation/Config.in b/package/liberation/Config.in
index 48d4195..b68166f 100644
--- a/package/liberation/Config.in
+++ b/package/liberation/Config.in
@@ -5,3 +5,18 @@ config BR2_PACKAGE_LIBERATION
 	  three most commonly used fonts on Microsoft systems:
 	  Times New Roman, Arial, and Courier New.
 
+if BR2_PACKAGE_LIBERATION
+
+config BR2_PACKAGE_LIBERATION_MONO
+	bool "mono fonts"
+	default y
+
+config BR2_PACKAGE_LIBERATION_SANS
+	bool "sans fonts"
+	default y
+
+config BR2_PACKAGE_LIBERATION_SERIF
+	bool "serif fonts"
+	default y
+
+endif
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 7d55650..363d327 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -9,9 +9,29 @@ LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 
+ifeq ($(BR2_PACKAGE_LIBERATION_MONO),y)
+define LIBERATION_INSTALL_MONO
+	$(INSTALL) -m 644 $(@D)/LiberationMono*.ttf $(LIBERATION_TARGET_DIR)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LIBERATION_SANS),y)
+define LIBERATION_INSTALL_SANS
+	$(INSTALL) -m 644 $(@D)/LiberationSans*.ttf $(LIBERATION_TARGET_DIR)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LIBERATION_SERIF),y)
+define LIBERATION_INSTALL_SERIF
+	$(INSTALL) -m 644 $(@D)/LiberationSerif*.ttf $(LIBERATION_TARGET_DIR)
+endef
+endif
+
 define LIBERATION_INSTALL_TARGET_CMDS
 	mkdir -p $(LIBERATION_TARGET_DIR)
-	$(INSTALL) -m 644 $(@D)/*.ttf $(LIBERATION_TARGET_DIR)
+	$(LIBERATION_INSTALL_MONO)
+	$(LIBERATION_INSTALL_SANS)
+	$(LIBERATION_INSTALL_SERIF)
 endef
 
 define LIBERATION_CLEAN_CMDS
