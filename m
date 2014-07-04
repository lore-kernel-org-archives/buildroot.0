From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  4 Jul 2014 17:56:25 +0200
Subject: [Buildroot] [PATCH 2/3] exim: make EXIM_USER configurable
In-Reply-To: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
References: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1404489386-7523-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The user that executes normal exim processes is configurable at configure
time and gets hardcoded in the exim binaries. It may be changed using a
custom configuration file, but this is not enough because the user may also
need to be created in /etc/passwd.

Make the user name a configurable kconfig variable, so the same name can be
user to configure the exim build process and to create the user.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/exim/Config.in | 9 +++++++++
 package/exim/exim.mk   | 3 ++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/exim/Config.in b/package/exim/Config.in
index fb41ccb..e2ed6c4 100644
--- a/package/exim/Config.in
+++ b/package/exim/Config.in
@@ -11,6 +11,15 @@ config BR2_PACKAGE_EXIM
 
 if BR2_PACKAGE_EXIM
 
+config BR2_PACKAGE_EXIM_USER
+	string "Exim user name"
+	default "exim"
+	help
+	  The user and group that is used for Exim processes when they no
+	  longer need to be root.
+	  A user with this name is created by Buildroot in /etc/passwd in
+	  the "mail" group.
+
 config BR2_PACKAGE_EXIM_CUSTOM_CONFIG
 	bool "Use a custom configuration file for exim"
 	help
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 2e51a0d..163861b 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -33,6 +33,7 @@ endef
 define EXIM_USE_CUSTOM_CONFIG_FILE
 	$(INSTALL) -m 0644 $(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE) \
 		$(@D)/Local/Makefile
+	$(call exim-config-change,EXIM_USER,ref:$(call qstrip,$(BR2_PACKAGE_EXIM_USER)))
 endef
 
 define EXIM_USE_DEFAULT_CONFIG_FILE
@@ -92,7 +93,7 @@ define EXIM_INSTALL_TARGET_CMDS
 endef
 
 define EXIM_USERS
-exim 88 mail 8 * - - - exim
+$(call qstrip,$(BR2_PACKAGE_EXIM_USER)) 88 mail 8 * - - - exim
 endef
 
 define EXIM_INSTALL_INIT_SYSV
-- 
1.9.1
