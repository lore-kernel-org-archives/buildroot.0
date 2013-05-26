From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 23:26:49 +0200
Subject: [Buildroot] [git commit] git: new package
Message-ID: <20130602212057.7935E9A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c183aed401f7228ba6667e170c0642d86706e0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: needs largefile, fix license info]
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in     |    1 +
 package/git/Config.in |   11 ++++++++
 package/git/git.mk    |   63 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index de84d46..52a0735 100644
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
index 0000000..31e5ffe
--- /dev/null
+++ b/package/git/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GIT
+	bool "git"
+	depends on BR2_LARGEFILE
+	help
+	  Git is a free and open source distributed version control system
+	  designed to handle everything from small to very large projects.
+
+	  http://git-scm.com
+
+comment "git requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/git/git.mk b/package/git/git.mk
new file mode 100644
index 0000000..408456b
--- /dev/null
+++ b/package/git/git.mk
@@ -0,0 +1,63 @@
+#############################################################
+#
+# git
+#
+#############################################################
+
+GIT_VERSION         = 1.8.3
+GIT_SITE            = http://git-core.googlecode.com/files/
+GIT_LICENSE         = GPLv2 LGPLv2.1+
+GIT_LICENSE_FILES   = COPYING LGPL-2.1
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
