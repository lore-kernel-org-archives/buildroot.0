From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 17 Mar 2013 17:59:31 +0200
Subject: [Buildroot] [PATCH 1/2] Added package enscript
Message-ID: <1363535972-29959-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GNU Enscript is a free replacement for Adobe's enscript program.
GNU Enscript converts ASCII files to PostScript, HTML, or RTF and
stores generated output to a file or sends it directly to the
printer. It includes features for `pretty-printing' (language-
sensitive code highlighting) in several programming languages.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in            |    1 +
 package/enscript/Config.in   |   13 +++++++++++++
 package/enscript/enscript.mk |   20 ++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 package/enscript/Config.in
 create mode 100644 package/enscript/enscript.mk

diff --git a/package/Config.in b/package/Config.in
index 4cf71d6..78bd745 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -292,6 +292,7 @@ endmenu
 
 menu "Interpreter languages and scripting"
 source "package/erlang/Config.in"
+source "package/enscript/Config.in"
 source "package/haserl/Config.in"
 source "package/jamvm/Config.in"
 source "package/lua/Config.in"
diff --git a/package/enscript/Config.in b/package/enscript/Config.in
new file mode 100644
index 0000000..5198da9
--- /dev/null
+++ b/package/enscript/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_ENSCRIPT
+	bool "enscript"
+	select BR2_PACKAGE_GETTEXT
+	help
+	   GNU Enscript is a free replacement for Adobe's enscript program.
+
+	   GNU Enscript converts ASCII files to PostScript, HTML, or RTF and 
+	   stores generated output to a file or sends it directly to the 
+	   printer. It includes features for `pretty-printing' (language-
+	   sensitive code highlighting) in several programming languages. 
+	  
+	   http://www.gnu.org/software/enscript
+
diff --git a/package/enscript/enscript.mk b/package/enscript/enscript.mk
new file mode 100644
index 0000000..29fd6d4
--- /dev/null
+++ b/package/enscript/enscript.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# enscript
+#
+#############################################################
+ENSCRIPT_VERSION = 1.6.6
+ENSCRIPT_SITE = $(BR2_GNU_MIRROR)/enscript/
+ENSCRIPT_SOURCE = enscript-$(ENSCRIPT_VERSION).tar.gz
+ENSCRIPT_DEPENDENCIES = 
+ENSCRIPT_LICENSE = GPLv3
+ENSCRIPT_LICENSE_FILES = COPYING
+
+#Enable pthread threads if toolchain supports threads
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS), y)
+	ENSCRIPT_CONF_OPT += --enable-threads=pth
+else
+	ENSCRIPT_CONF_OPT += --disable-threads
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
