From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 30 Apr 2013 22:00:47 +0200
Subject: [Buildroot] [PATCH 1/1] new package : git
Message-ID: <1367352047-8940-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


new package : git
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/Config.in     |  1 +
 package/git/Config.in |  7 +++++++
 package/git/git.mk    | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 package/git/Config.in
 create mode 100644 package/git/git.mk

diff --git a/package/Config.in b/package/Config.in
index a530afc..4a02f6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -73,6 +73,7 @@ source "package/gawk/Config.in"
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
index 0000000..da58b11
--- /dev/null
+++ b/package/git/git.mk
@@ -0,0 +1,54 @@
+#############################################################
+#
+# git
+#
+#############################################################
+#                     resolves tag 1.8.2.1
+GIT_VERSION         = 5bda18c186e455f8e65f976d3bf333ab1f4b5b53
+GIT_SITE            = https://github.com/git/git.git
+GIT_SITE_METHOD     = git
+GIT_LICENSE         = LGPLv2.1+
+GIT_LICENSE_FILES   = COPYING
+
+GIT_AUTORECONF      = YES
+
+GIT_DEPENDENCIES +=  $(if $(BR2_PACKAGE_ZLIB),zlib)
+GIT_DEPENDENCIES +=  $(if $(BR2_PACKAGE_OPENSSL),openssl)
+GIT_DEPENDENCIES +=  $(if $(BR2_PACKAGE_PERL),perl)
+GIT_DEPENDENCIES +=  $(if $(BR2_PACKAGE_CURL),curl)
+GIT_DEPENDENCIES +=  $(if $(BR2_PACKAGE_EXPAT),expat)
+GIT_DEPENDENCIES +=  $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+GIT_DEPENDENCIES +=  $(if $(BR2_PACKAGE_TCL),tcl)
+  
+ifeq ($(BR2_PACKAGE_OPENSSL),n)
+	GIT_CONF_OPT += --without-openssl
+endif      
+
+ifeq ($(BR2_PACKAGE_PERL),y)
+	GIT_CONF_OPT += --with-libpcre
+endif  
+ 
+ifeq ($(BR2_PACKAGE_CURL),n)
+	GIT_CONF_OPT += --without-curl
+endif 
+
+ifeq ($(BR2_PACKAGE_EXPAT),n)
+	GIT_CONF_OPT += --without-expat
+endif 
+
+ifeq ($(BR2_PACKAGE_LIBICONV),n)
+	GIT_CONF_OPT += --without-iconv
+else
+	GIT_CONF_OPT += --with-iconv=/usr/lib
+endif 
+
+ifeq ($(BR2_PACKAGE_TCL),n)
+	GIT_CONF_OPT += --without-tcltk
+endif 
+     
+# assume yes for these tests, configure will bail out otherwise
+# saying error: cannot run test program while cross compiling
+GIT_CONF_ENV = 	ac_cv_fread_reads_directories=yes \
+				ac_cv_snprintf_returns_bogus=yes
+				
+$(eval $(autotools-package))
-- 
1.8.2.1
