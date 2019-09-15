From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 23:36:20 +0200
Subject: [Buildroot] [git commit] package/ytree: new package
Message-ID: <20190915213219.075C58E766@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2355d88e7343197d71e3d40a5d1edca025838b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/ytree/Config.in  |  7 +++++++
 package/ytree/ytree.hash |  3 +++
 package/ytree/ytree.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f2704d8f1a..4467688779 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -426,6 +426,7 @@ F:	package/waylandpp/
 F:	package/x11r7/
 F:	package/x264/
 F:	package/x265/
+F:	package/ytree/
 F:	package/znc/
 
 N:	Biagio Montaruli <biagio.hkr@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 6423dc5d80..ab43543c7f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2180,6 +2180,7 @@ comment "Utilities"
 	source "package/which/Config.in"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
+	source "package/ytree/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/ytree/Config.in b/package/ytree/Config.in
new file mode 100644
index 0000000000..4eca9c7e10
--- /dev/null
+++ b/package/ytree/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_YTREE
+	bool "ytree"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Ytree - a (curses-based) file manager similar to DOS Xtree(tm)
+
+	  https://www.han.de/~werner/ytree.html
diff --git a/package/ytree/ytree.hash b/package/ytree/ytree.hash
new file mode 100644
index 0000000000..a671279558
--- /dev/null
+++ b/package/ytree/ytree.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 763e8c2af528174cd738ed8f2eca62579e3edef57ccbd242be7cf181ae15d251  ytree-1.99pl1.tar.gz
+sha256 eb6bf7204569b4fe8eaf9d4dffc57e44047c5efb5deba1b2d99069ddbc99d031  COPYING
diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
new file mode 100644
index 0000000000..2d2a6946f7
--- /dev/null
+++ b/package/ytree/ytree.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# ytree
+#
+################################################################################
+
+YTREE_VERSION = 1.99pl1
+YTREE_SITE = https://www.han.de/~werner
+YTREE_LICENSE = GPL-2.0
+YTREE_LICENSE_FILES = COPYING
+YTREE_DEPENDENCIES = ncurses
+
+YTREE_CFLAGS = -DCOLOR_SUPPORT $(TARGET_CFLAGS)
+YTREE_LDFLAGS = -lncurses $(TARGET_LDFLAGS)
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+YTREE_DEPENDENCIES += readline
+YTREE_CFLAGS += -DREADLINE_SUPPORT
+YTREE_LDFLAGS += -lreadline
+endif
+
+define YTREE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(YTREE_CFLAGS)" LDFLAGS="$(YTREE_LDFLAGS)"
+endef
+
+define YTREE_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)/usr" install
+endef
+
+$(eval $(generic-package))
