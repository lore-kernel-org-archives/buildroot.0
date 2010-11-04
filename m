From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 04 Nov 2010 10:57:27 +0200
Subject: [Buildroot] [PATCH RESEND] matchbox-common was missing in Config.in
Message-ID: <20101104085727.29477.63211.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While at it add option to install PDA style desktop folders.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/matchbox/Config.in                         |   10 ++++++++++
 .../matchbox/matchbox-common/matchbox-common.mk    |    4 ++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 43189ca..e4b6149 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -22,6 +22,16 @@ config BR2_PACKAGE_MATCHBOX_DESKTOP
 	help
 	  A PDA style application launcher or 'item browser'.
 
+config BR2_PACKAGE_MATCHBOX_COMMON
+	bool "Matchbox session common files"
+	depends on BR2_PACKAGE_MATCHBOX && BR2_PACKAGE_MATCHBOX_PANEL && BR2_PACKAGE_MATCHBOX_DESKTOP
+	help
+	  Common desktop folders and matchbox-session script.
+
+config BR2_PACKAGE_MATCHBOX_COMMON_PDA
+	bool "PDA style desktop folders"
+	depends on BR2_PACKAGE_MATCHBOX_COMMON
+
 config BR2_PACKAGE_MATCHBOX_KEYBOARD
 	bool "Matchbox Virtual Keyboard"
 	depends on BR2_PACKAGE_MATCHBOX
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
index 81a1729..d35d11b 100644
--- a/package/matchbox/matchbox-common/matchbox-common.mk
+++ b/package/matchbox/matchbox-common/matchbox-common.mk
@@ -9,6 +9,10 @@ MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
 MATCHBOX_COMMON_SITE = http://matchbox-project.org/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION)
 MATCHBOX_COMMON_DEPENDENCIES = matchbox-lib
 
+ifeq ($(strip $(BR2_PACKAGE_MATCHBOX_COMMON_PDA)),y)
+	MATCHBOX_COMMON_CONF_OPT += --enable-pda-folders
+endif
+
 #############################################################
 
 $(eval $(call AUTOTARGETS,package/matchbox,matchbox-common))
