From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 23 Feb 2016 00:07:51 +0100
Subject: [Buildroot] [PATCH v2] owfs: new package
Message-ID: <1456182471-20883-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All modules are always enabled when their dependencies are satisfied.

tcl doesn't work because the tclConfig.sh installed by our tcl package
is wrong: it adds -I/usr/include.

perl doesn't work out of the box, I didn't investigate.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: Remove redundant part of the patch + improved its commit message.
---
 package/Config.in                                  |  1 +
 .../0001-configure.ac-check-for-localtime_r.patch  | 33 +++++++++++
 package/owfs/Config.in                             | 16 +++++
 package/owfs/owfs.hash                             |  4 ++
 package/owfs/owfs.mk                               | 69 ++++++++++++++++++++++
 5 files changed, 123 insertions(+)
 create mode 100644 package/owfs/0001-configure.ac-check-for-localtime_r.patch
 create mode 100644 package/owfs/Config.in
 create mode 100644 package/owfs/owfs.hash
 create mode 100644 package/owfs/owfs.mk

diff --git a/package/Config.in b/package/Config.in
index dc68184..70b0ee5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -984,6 +984,7 @@ menu "Hardware handling"
 	source "package/mtdev/Config.in"
 	source "package/ne10/Config.in"
 	source "package/neardal/Config.in"
+	source "package/owfs/Config.in"
 	source "package/pcsc-lite/Config.in"
 	source "package/tslib/Config.in"
 	source "package/urg/Config.in"
diff --git a/package/owfs/0001-configure.ac-check-for-localtime_r.patch b/package/owfs/0001-configure.ac-check-for-localtime_r.patch
new file mode 100644
index 0000000..c4c3844
--- /dev/null
+++ b/package/owfs/0001-configure.ac-check-for-localtime_r.patch
@@ -0,0 +1,33 @@
+From 75e92438bcdb78a90912366b07bf503646806686 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Sun, 21 Feb 2016 17:02:06 +0100
+Subject: [PATCH] configure.ac: check for localtime_r
+
+HAVE_LOCALTIME_R is used in owftp.c, so it should be checked for.
+
+Without this, static build fails because localtime_r is defined twice.
+
+Upstream-Status: Submitted
+https://sourceforge.net/p/owfs/mailman/message/34873667/
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c22dde9..12fdd18 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1529,7 +1529,7 @@ AC_FUNC_SELECT_ARGTYPES
+ AC_FUNC_STRFTIME
+ AC_FUNC_STRTOD
+ AC_TYPE_SIGNAL
+-AC_CHECK_FUNCS([accept daemon getaddrinfo freeaddrinfo gethostbyname2_r gethostbyaddr_r gethostbyname_r getservbyname_r getopt getopt_long gettimeofday inet_ntop inet_pton memchr memset select socket strcasecmp strchr strdup strncasecmp strtol strtoul twalk tsearch tfind tdelete tdestroy vasprintf strsep vsprintf vsnprintf writev getline])
++AC_CHECK_FUNCS([accept daemon getaddrinfo freeaddrinfo gethostbyname2_r gethostbyaddr_r gethostbyname_r getservbyname_r getopt getopt_long gettimeofday inet_ntop inet_pton memchr memset select socket strcasecmp strchr strdup strncasecmp strtol strtoul twalk tsearch tfind tdelete tdestroy vasprintf strsep vsprintf vsnprintf writev getline localtime_r])
+ 
+ if test "${ENABLE_ZERO}" = "true" ; then
+ 	AC_SEARCH_LIBS(dlopen, dl, AC_DEFINE(HAVE_DLOPEN, 1, [Define if you have dlopen]))
+-- 
+2.7.0
+
diff --git a/package/owfs/Config.in b/package/owfs/Config.in
new file mode 100644
index 0000000..802d1e4
--- /dev/null
+++ b/package/owfs/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_OWFS
+	bool "owfs"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  OWFS is an easy way to use the powerful 1-wire system of
+	  Dallas/Maxim.
+
+	  OWFS is a simple and flexible program to monitor and control
+	  the physical environment. You can write scripts to read
+	  temperature, flash lights, write to an LCD, log and graph,
+	  etc.
+
+	  http://owfs.org/
+
+comment "owfs needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/owfs/owfs.hash b/package/owfs/owfs.hash
new file mode 100644
index 0000000..3991eec
--- /dev/null
+++ b/package/owfs/owfs.hash
@@ -0,0 +1,4 @@
+# From https://sourceforge.net/projects/owfs/files/owfs/3.1p1/
+sha1  80892ca3e72fef2979b8f0a04db15fd24a2cbda6  owfs-3.1p1.tar.gz
+# Locally calculated
+sha256  e69421ae534565c1f8530a2447f583401f4d0d4b1cf3cb8cf399a57133ed7f81  owfs-3.1p1.tar.gz
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
new file mode 100644
index 0000000..e8c451c
--- /dev/null
+++ b/package/owfs/owfs.mk
@@ -0,0 +1,69 @@
+################################################################################
+#
+# owfs
+#
+################################################################################
+
+OWFS_VERSION = 3.1p1
+OWFS_SITE = http://downloads.sourceforge.net/project/owfs/owfs/$(OWFS_VERSION)
+OWFS_DEPENDENCIES = host-pkgconf
+OWFS_CONF_OPTS = --disable-owperl --without-perl5 --disable-owtcl --without-tcl
+
+# 0001-configure.ac-check-for-localtime_r.patch touches configure.ac
+OWFS_AUTORECONF = YES
+
+# owtcl license is declared in module/ownet/c/src/include/ow_functions.h
+OWFS_LICENSE = GPLv2+, LGPLv2 (owtcl)
+OWFS_LICENSE_FILES = COPYING COPYING.LIB
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+OWFS_CONF_OPTS += --enable-owfs
+OWFS_DEPENDENCIES += libfuse
+else
+OWFS_CONF_OPTS += --disable-owfs
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+OWFS_CONF_OPTS += --enable-usb
+OWFS_DEPENDENCIES += libusb
+else
+OWFS_CONF_OPTS += --disable-usb
+endif
+
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+OWFS_CONF_OPTS += --enable-avahi
+OWFS_DEPENDENCIES += avahi
+else
+OWFS_CONF_OPTS += --disable-avahi
+endif
+
+ifeq ($(BR2_PACKAGE_PHP),y)
+OWFS_CONF_OPTS += --enable-owphp --with-php --with-phpconfig=$(STAGING_DIR)/usr/bin/php-config
+OWFS_DEPENDENCIES += php host-swig
+else
+OWFS_CONF_OPTS += --disable-owphp --without-php
+endif
+
+# setup.py isn't python3 compliant
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+OWFS_CONF_OPTS += \
+	--enable-owpython \
+	--with-python \
+	--with-pythonconfig=$(STAGING_DIR)/usr/bin/python-config
+OWFS_MAKE_ENV += \
+	CC="$(TARGET_CC)" \
+	PYTHONPATH="$(PYTHON_PATH)" \
+	_python_sysroot=$(STAGING_DIR) \
+	_python_prefix=/usr \
+	_python_exec_prefix=/usr
+OWFS_DEPENDENCIES += python host-swig
+else
+OWFS_CONF_OPTS += --disable-owpython --without-python
+endif
+
+ifeq ($(BR2_STATIC_LIBS),y)
+# zeroconf support uses dlopen()
+OWFS_CONF_OPTS += --disable-zero
+endif
+
+$(eval $(autotools-package))
-- 
2.7.0
