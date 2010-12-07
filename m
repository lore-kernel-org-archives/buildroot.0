From: heiko at zuerker.org <heiko@zuerker.org>
Date: Tue,  7 Dec 2010 15:32:58 -0600
Subject: [Buildroot] [PATCH] add shadow password support
Message-ID: <f9326e5048382646daf4469a1a62b25b8fd925dd.1291757566.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/Config.in        |    1 +
 package/shadow/Config.in |   13 +++++++++++++
 package/shadow/shadow.mk |   16 ++++++++++++++++
 3 files changed, 30 insertions(+), 0 deletions(-)
 create mode 100644 package/shadow/Config.in
 create mode 100644 package/shadow/shadow.mk

diff --git a/package/Config.in b/package/Config.in
index 03e580a..c42c2dd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -471,6 +471,7 @@ source "package/bootutils/Config.in"
 source "package/module-init-tools/Config.in"
 source "package/procps/Config.in"
 source "package/psmisc/Config.in"
+source "package/shadow/Config.in"
 source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
 source "package/util-linux/Config.in"
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
new file mode 100644
index 0000000..b10fc1a
--- /dev/null
+++ b/package/shadow/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_SHADOW
+	bool "shadow"
+	help
+	  This package includes the programs necessary to convert traditional
+	  V7 UNIX password files to the SVR4 shadow password format and additional
+	  tools to work with shadow passwords.
+	  - 'pwconv' converts everything to the shadow password format.
+	  - 'pwunconv' converts back to non-shadow passwords.
+	  - 'pwck' checks the integrity of the password and shadow files.
+	  - 'lastlog' prints out the last login times of all users.
+	  - 'useradd', 'userdel', 'usermod' to manage user accounts.
+	  - 'groupadd', 'groupdel', 'groupmod' to manage groups.
+
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
new file mode 100644
index 0000000..730b8c5
--- /dev/null
+++ b/package/shadow/shadow.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# SHADOW
+#
+#############################################################
+SHADOW_VERSION:=4.1.4.2
+SHADOW_SOURCE:=shadow-$(SHADOW_VERSION).tar.bz2
+SHADOW_SITE:=ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow
+SHADOW_INSTALL_STAGING=YES
+
+SHADOW_CONF_OPT=--without-libpam --without-libcrack
+SHADOW_CONF_ENV=ac_cv_func_setpgrp_void=yes
+HOST_SHADOW_CONF_OPT=--without-libpam --without-libcrack
+
+$(eval $(call AUTOTARGETS,package,shadow))
+$(eval $(call AUTOTARGETS,package,shadow,host))
-- 
1.7.3.2
