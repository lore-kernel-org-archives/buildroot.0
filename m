From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:14:50 +0100
Subject: [Buildroot] [git commit] package/ncurses: trim leading 'lib' from
	definition of libs to install
Message-ID: <20141215211813.1858F80425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=19569281dd7e1482908b5bfb6e0d928bdf246008
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, ncurses creates symlinks from the non-'w' variants to the
equivalent 'w' variant, but forgets to do so for pkg-config files.

To be able to share the same list between the libraries and the
pkg-config files to symlink, just trim the 'lib' prefix of libraries in
the definition, and just add it back at the time we need it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.mk |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index b870aa4..9b660fd 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -43,17 +43,17 @@ else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 NCURSES_CONF_OPTS += --with-shared --with-normal
 endif
 
-NCURSES_LIBS-y = libncurses
-NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) += libmenu
-NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += libpanel
-NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += libform
+NCURSES_LIBS-y = ncurses
+NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_MENU) += menu
+NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_PANEL) += panel
+NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += form
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
 NCURSES_CONF_OPTS += --enable-widec
 NCURSES_LIB_SUFFIX = w
 
 define NCURSES_LINK_LIBS_STATIC
-	for lib in $(NCURSES_LIBS-y); do \
+	for lib in $(NCURSES_LIBS-y:%=lib%); do \
 		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).a \
 			$(1)/usr/lib/$${lib}.a; \
 	done
@@ -62,7 +62,7 @@ define NCURSES_LINK_LIBS_STATIC
 endef
 
 define NCURSES_LINK_LIBS_SHARED
-	for lib in $(NCURSES_LIBS-y); do \
+	for lib in $(NCURSES_LIBS-y:%=lib%); do \
 		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).so \
 			$(1)/usr/lib/$${lib}.so; \
 	done
@@ -95,7 +95,7 @@ endef
 
 ifneq ($(BR2_STATIC_LIBS),y)
 define NCURSES_INSTALL_TARGET_LIBS
-	for lib in $(NCURSES_LIBS-y); do \
+	for lib in $(NCURSES_LIBS-y:%=lib%); do \
 		cp -dpf $(NCURSES_DIR)/lib/$${lib}$(NCURSES_LIB_SUFFIX).so* \
 			$(TARGET_DIR)/usr/lib/; \
 	done
