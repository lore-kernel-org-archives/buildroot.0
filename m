From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 26 May 2013 14:38:32 -0500
Subject: [Buildroot] [PATCH 1/1] git: new package
In-Reply-To: <1367352047-8940-1-git-send-email-sagaert.johan@skynet.be>
References: <1367352047-8940-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <1369597112-17592-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sagaert Johan <sagaert.johan@skynet.be>

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/Config.in     |    1 +
 package/git/Config.in |    7 ++++++
 package/git/git.mk    |   62 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 package/git/Config.in
 create mode 100644 package/git/git.mk

diff --git a/package/Config.in b/package/Config.in
index d980871..2aeaeff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -74,6 +74,7 @@ source "package/gawk/Config.in"
 endif
 source "toolchain/gcc/Config.in.2"
 source "package/gettext/Config.in"
+source "package/git/Config.in"
 source "package/gperf/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/grep/Config.in"
diff --git a/package/git/Config.in b/package/git/Config.in
new file mode 100644
index 0000000..c3c060e
--- /dev/null
+++ b/package/git/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GIT
+	bool "git"
+	help
+	  Git is a free and open source distributed version control system
+	  designed to handle everything from small to very large projects.
+	  
+	  http://git-scm.com
diff --git a/package/git/git.mk b/package/git/git.mk
new file mode 100644
index 0000000..1d097f5
--- /dev/null
+++ b/package/git/git.mk
@@ -0,0 +1,62 @@
+#############################################################
+#
+# git
+#
+#############################################################
+GIT_VERSION         = 1.8.3
+GIT_SITE            = http://git-core.googlecode.com/files/
+GIT_LICENSE         = LGPLv2.1+
+GIT_LICENSE_FILES   = COPYING
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+	GIT_DEPENDENCIES += zlib
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	GIT_DEPENDENCIES += openssl
+	GIT_CONF_OPT += --with-openssl
+else
+	GIT_CONF_OPT += --without-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_PERL),y)
+	GIT_DEPENDENCIES += perl
+	GIT_CONF_OPT += --with-libpcre
+else
+	GIT_CONF_OPT += --without-libpcre
+endif
+
+ifeq ($(BR2_PACKAGE_CURL),y)
+	GIT_DEPENDENCIES += curl
+	GIT_CONF_OPT += --with-curl
+else
+	GIT_CONF_OPT += --without-curl
+endif
+
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+	GIT_DEPENDENCIES += expat
+	GIT_CONF_OPT += --with-expat
+else
+	GIT_CONF_OPT += --without-expat
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+	GIT_DEPENDENCIES += libiconv
+	GIT_CONF_OPT += --with-iconv=/usr/lib
+else
+	GIT_CONF_OPT += --without-iconv
+endif
+
+ifeq ($(BR2_PACKAGE_TCL),y)
+	GIT_DEPENDENCIES += tcl
+	GIT_CONF_OPT += --with-tcltk
+else
+	GIT_CONF_OPT += --without-tcltk
+endif
+
+# assume yes for these tests, configure will bail out otherwise
+# saying error: cannot run test program while cross compiling
+GIT_CONF_ENV = 	ac_cv_fread_reads_directories=yes \
+	ac_cv_snprintf_returns_bogus=yes
+
+$(eval $(autotools-package))
-- 
1.7.9.5
