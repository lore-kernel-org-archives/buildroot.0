From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 16:31:04 +0200
Subject: [Buildroot] [git commit] sl: new package
Message-ID: <20150403143118.118B7819C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c4aa31640d9e80b80373fe229e5f789c4645e27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SL (Steam Locomotive) runs across your terminal when you type "sl" as
you meant to type "ls". It's just a joke command, and not useful at
all.

[Thomas:
 - Change "depends on BR2_PACKAGE_NCURSES" to "select
   BR2_PACKAGE_NCURSES".
 - Rewrap Config.in help text.
 - Remove comment in help text about the need to check dependencies,
   there's nothing to be done really.
 - Change the license from "Unclear" to "Custom".
 - Use $(TARGET_CONFIGURE_OPTS instead of passing CC and CFLAGS
   explicitly.
 - Pass '-m 0755' when doing the $(INSTALL)
 - Add ncurses to SL_DEPENDENCIES.]

Signed-off-by: Jens Rosenboom <j.rosenboom@x-ion.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in    |    1 +
 package/sl/Config.in |    9 +++++++++
 package/sl/sl.mk     |   21 +++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4dd3ff2..ee4d476 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -184,6 +184,7 @@ menu "Games"
 	source "package/opentyrian-data/Config.in"
 	source "package/prboom/Config.in"
 	source "package/rubix/Config.in"
+	source "package/sl/Config.in"
 endmenu
 
 menu "Fonts, icons, sounds and themes"
diff --git a/package/sl/Config.in b/package/sl/Config.in
new file mode 100644
index 0000000..7abe705
--- /dev/null
+++ b/package/sl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SL
+	bool "sl"
+	select BR2_PACKAGE_NCURSES
+	help
+	  SL (Steam Locomotive) runs across your terminal when you
+	  type "sl" as you meant to type "ls". It's just a joke
+	  command, and not useful at all.
+
+	  https://github.com/mtoyoda/sl
diff --git a/package/sl/sl.mk b/package/sl/sl.mk
new file mode 100644
index 0000000..bb28b2a
--- /dev/null
+++ b/package/sl/sl.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# sl
+#
+################################################################################
+
+SL_VERSION = 5.02
+SL_SITE = $(call github,mtoyoda,sl,$(SL_VERSION))
+SL_LICENSE = Custom
+SL_LICENSE_FILES = LICENSE
+SL_DEPENDENCIES = ncurses
+
+define SL_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define SL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/sl $(TARGET_DIR)/usr/bin/sl
+endef
+
+$(eval $(generic-package))
