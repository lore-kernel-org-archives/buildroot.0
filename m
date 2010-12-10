From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Fri, 10 Dec 2010 19:47:58 +0300
Subject: [Buildroot] [PATCH] Add 'klish' package
Message-ID: <1291999678-25429-1-git-send-email-serj.kalichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The klish is a framework for implementing a CISCO-like CLI on a UNIX systems.
It is configurable by XML files. The klish is the fork of clish project.

http://klish.googlecode.com

Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
---
 package/Config.in       |    1 +
 package/klish/Config.in |   16 ++++++++++++++++
 package/klish/klish.mk  |   21 +++++++++++++++++++++
 3 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 package/klish/Config.in
 create mode 100644 package/klish/klish.mk

diff --git a/package/Config.in b/package/Config.in
index 10d8918..2ffb5ca 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -467,6 +467,7 @@ source "package/logrotate/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
 source "package/which/Config.in"
+source "package/klish/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/klish/Config.in b/package/klish/Config.in
new file mode 100644
index 0000000..c6201f2
--- /dev/null
+++ b/package/klish/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_KLISH
+	bool "klish"
+	help
+	  The klish is a framework for implementing a CISCO-like CLI on a UNIX systems.
+	  It is configurable by XML files. The klish is the fork of clish project.
+
+	  http://klish.googlecode.com
+
+if BR2_PACKAGE_KLISH
+
+config BR2_PACKAGE_KLISH_SVN
+	bool "Get klish sources from the SVN repository"
+	help
+	  Use source code from SVN repository instead klish stable version.
+
+endif
diff --git a/package/klish/klish.mk b/package/klish/klish.mk
new file mode 100644
index 0000000..b7bedf9
--- /dev/null
+++ b/package/klish/klish.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# klish
+#
+#############################################################
+
+ifeq ($(BR2_PACKAGE_KLISH_SVN),y)
+KLISH_VERSION:=HEAD
+KLISH_SITE:=http://klish.googlecode.com/svn/trunk
+KLISH_SITE_METHOD:=svn
+else
+KLISH_VERSION = 1.3.1
+KLISH_SOURCE = klish-$(KLISH_VERSION).tar.bz2
+KLISH_SITE = http://klish.googlecode.com/files
+endif
+
+KLISH_INSTALL_STAGING = YES
+KLISH_INSTALL_TARGET = YES
+KLISH_CONF_OPT = --disable-gpl --without-tcl
+
+$(eval $(call AUTOTARGETS,package,klish))
-- 
1.7.3.3
