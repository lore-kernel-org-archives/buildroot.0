From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 16:38:04 +0200
Subject: [Buildroot] [git commit] package: add tree
Message-ID: <20130606144144.764E49A943@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f7c5d92314061ff68c8f12d0788f65b1d979cf11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tree is a recursive directory listing command that produces a depth
indented listing of files.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/tree/Config.in |   13 +++++++++++++
 package/tree/tree.mk   |   27 +++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f26b1aa..ce82e99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -95,6 +95,7 @@ source "package/sstrip/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tar/Config.in"
 endif
+source "package/tree/Config.in"
 source "package/vala/Config.in"
 source "package/yasm/Config.in"
 endmenu
diff --git a/package/tree/Config.in b/package/tree/Config.in
new file mode 100644
index 0000000..b6e21c8
--- /dev/null
+++ b/package/tree/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_TREE
+	bool "tree"
+	depends on BR2_USE_WCHAR
+	help
+	  Tree is a recursive directory listing command that produces
+	  a depth indented listing of files, which is colorized ala
+	  dircolors if the LS_COLORS environment variable is set and
+	  output is to tty.
+
+	  http://mama.indstate.edu/users/ice/tree/
+
+comment "tree requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/tree/tree.mk b/package/tree/tree.mk
new file mode 100644
index 0000000..509ba45
--- /dev/null
+++ b/package/tree/tree.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# tree
+#
+################################################################################
+
+TREE_VERSION = 1.6.0
+TREE_SOURCE = tree-$(TREE_VERSION).tgz
+TREE_SITE = http://mama.indstate.edu/users/ice/tree/src/
+TREE_LICENSE = GPLv2+
+TREE_LICENSE_FILES = LICENSE
+
+define TREE_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define TREE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/tree $(TARGET_DIR)/usr/bin/tree
+	$(INSTALL) -D -m 0644 $(@D)/doc/tree.1 \
+		$(TARGET_DIR)/usr/share/man/man1/tree.1
+endef
+
+define TREE_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
