From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 21:17:10 +0200
Subject: [Buildroot] [PATCH 6/9] cyrus-sasl: add new package
In-Reply-To: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1314127033-14861-7-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in                                  |    1 +
 package/cyrus-sasl/Config.in                       |   20 ++++++++++
 .../cyrus-sasl-allow-disabling-saslauthd.patch     |   19 ++++++++++
 package/cyrus-sasl/cyrus-sasl-hostcc.patch         |   27 ++++++++++++++
 package/cyrus-sasl/cyrus-sasl.mk                   |   39 ++++++++++++++++++++
 5 files changed, 106 insertions(+), 0 deletions(-)
 create mode 100644 package/cyrus-sasl/Config.in
 create mode 100644 package/cyrus-sasl/cyrus-sasl-allow-disabling-saslauthd.patch
 create mode 100644 package/cyrus-sasl/cyrus-sasl-hostcc.patch
 create mode 100644 package/cyrus-sasl/cyrus-sasl.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..397e9c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
 source "package/ctorrent/Config.in"
 source "package/cups/Config.in"
+source "package/cyrus-sasl/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
diff --git a/package/cyrus-sasl/Config.in b/package/cyrus-sasl/Config.in
new file mode 100644
index 0000000..b16f868
--- /dev/null
+++ b/package/cyrus-sasl/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_CYRUS_SASL
+	bool "cyrus-sasl"
+	select BR2_PACKAGE_BERKELEYDB
+	help
+	  SASL (Simple Authentication Security Layer) is an Internet
+	  standards-track method for remote computers to authenticate.
+	  The Cyrus SASL library makes supporting various SASL mechanisms easy
+	  for both client and server writers.
+
+	  http://www.cyrusimap.org/
+
+if BR2_PACKAGE_CYRUS_SASL
+
+config BR2_PACKAGE_CYRUS_SASL_DBPATH
+	string "Custom SASL user database file"
+	help
+	  This is the file where cyrus-sasl stores user passwords.
+	  Leave empty to use the default.
+
+endif
diff --git a/package/cyrus-sasl/cyrus-sasl-allow-disabling-saslauthd.patch b/package/cyrus-sasl/cyrus-sasl-allow-disabling-saslauthd.patch
new file mode 100644
index 0000000..32e8e70
--- /dev/null
+++ b/package/cyrus-sasl/cyrus-sasl-allow-disabling-saslauthd.patch
@@ -0,0 +1,19 @@
+configure stops with an error on saslauthd.
+This patch makes it possible to disable saslauthd to allow compiling the
+rest of cyrus-sasl at least.
+
+diff -u -r cyrus-sasl-2.1.24rc1-orig/configure cyrus-sasl-2.1.24rc1/configure
+--- cyrus-sasl-2.1.24rc1-orig/configure	2009-05-07 16:24:25.000000000 +0200
++++ cyrus-sasl-2.1.24rc1/configure	2011-05-02 15:10:36.793333728 +0200
+@@ -15542,8 +15542,10 @@
+ 
+ 
+ 
+-subdirs="$subdirs saslauthd"
+ 
++if test "$with_saslauthd" != no; then
++  subdirs="$subdirs saslauthd"
++fi
+ 
+ 
+ 
diff --git a/package/cyrus-sasl/cyrus-sasl-hostcc.patch b/package/cyrus-sasl/cyrus-sasl-hostcc.patch
new file mode 100644
index 0000000..bf940e4
--- /dev/null
+++ b/package/cyrus-sasl/cyrus-sasl-hostcc.patch
@@ -0,0 +1,27 @@
+Fix HOSTCC and related variables.
+
+Patch inspired by:
+http://tech.dir.groups.yahoo.com/group/nslu2-linux/message/4044?var=0
+
+diff -r -u cyrus-sasl-2.1.24rc1-orig//include/Makefile.in cyrus-sasl-2.1.24rc1/include/Makefile.in
+--- cyrus-sasl-2.1.24rc1-orig/include/Makefile.in	2009-05-07 16:24:46.000000000 +0200
++++ cyrus-sasl-2.1.24rc1/include/Makefile.in	2011-05-05 12:29:38.036844027 +0200
+@@ -266,12 +266,12 @@
+ depcomp = $(SHELL) $(top_srcdir)/config/depcomp
+ am__depfiles_maybe = depfiles
+ @AMDEP_TRUE at DEP_FILES = ./$(DEPDIR)/makemd5.Po
+-COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
+-	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+-LTCOMPILE = $(LIBTOOL) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) \
+-	$(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
+-CCLD = $(CC)
+-LINK = $(LIBTOOL) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
++COMPILE = $(HOSTCC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
++	$(CPPFLAGS) $(AM_CFLAGS) $(HOSTCFLAGS)
++LTCOMPILE = $(LIBTOOL) --mode=compile $(HOSTCC) $(DEFS) $(DEFAULT_INCLUDES) \
++	$(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(HOSTCFLAGS)
++CCLD = $(HOSTCC)
++LINK = $(LIBTOOL) --mode=link $(CCLD) $(AM_CFLAGS) $(HOSTCFLAGS) \
+ 	$(AM_LDFLAGS) $(LDFLAGS) -o $@
+ DIST_SOURCES = $(makemd5_SOURCES)
+ DATA = $(frameheader_DATA)
diff --git a/package/cyrus-sasl/cyrus-sasl.mk b/package/cyrus-sasl/cyrus-sasl.mk
new file mode 100644
index 0000000..5cdc575
--- /dev/null
+++ b/package/cyrus-sasl/cyrus-sasl.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# cyrus-sasl
+#
+#############################################################
+
+CYRUS_SASL_VERSION = 2.1.24rc1
+CYRUS_SASL_SOURCE = cyrus-sasl-$(CYRUS_SASL_VERSION).tar.gz
+CYRUS_SASL_SITE = ftp://ftp.cyrusimap.org/cyrus-sasl
+CYRUS_SASL_DEPENDENCIES = berkeleydb
+
+# The --program-prefix='' parameter is needed to avoid cyrus-sasl to install
+# executable files prefixed with the tuple name (e.g. arm-linux-saslpasswd2)
+CYRUS_SASL_CONF_OPT = \
+	--disable-dependency-tracking \
+	--disable-sample \
+	--disable-checkapop \
+	--enable-login \
+	--disable-otp \
+	--disable-srp \
+	--disable-gssapi \
+	--disable-cram \
+	--disable-anon \
+	--disable-digest \
+	--disable-ntlm \
+	--disable-passdss \
+	--without-saslauthd \
+	--without-des \
+	--without-openssl \
+	--program-prefix=''
+
+CYRUS_SASL_INSTALL_STAGING = YES
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_CYRUS_SASL_DBPATH)),)
+CYRUS_SASL_CONF_OPT += \
+	--with-dbpath="$(call qstrip,$(BR2_PACKAGE_CYRUS_SASL_DBPATH))"
+endif
+
+$(eval $(call AUTOTARGETS,package,cyrus-sasl))
-- 
1.7.4.1
