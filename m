From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Fri, 29 May 2015 18:15:11 +0200
Subject: [Buildroot] [PATCH v3 2/2] fcgiwrap: new package
In-Reply-To: <1432916111-1122-1-git-send-email-thomas.claveirole@green-communications.fr>
References: <1432916111-1122-1-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <1432916111-1122-2-git-send-email-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add package fcgiwrap from https://nginx.localdomain.pl/wiki/FcgiWrap

fcgiwrap is a simple server for running CGI applications over
FastCGI. It hopes to provide clean CGI support to Nginx (and other web
servers that may need it).

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/Config.in                                  |  1 +
 .../fcgiwrap/0001-use-LIBS-from-configure.patch    | 22 +++++++++++++++
 package/fcgiwrap/Config.in                         | 10 +++++++
 package/fcgiwrap/fcgiwrap.mk                       | 32 ++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/fcgiwrap/0001-use-LIBS-from-configure.patch
 create mode 100644 package/fcgiwrap/Config.in
 create mode 100644 package/fcgiwrap/fcgiwrap.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..188ff0d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1168,6 +1168,7 @@ endif
 	source "package/ejabberd/Config.in"
 	source "package/ethtool/Config.in"
 	source "package/faifa/Config.in"
+	source "package/fcgiwrap/Config.in"
 	source "package/fmc/Config.in"
 	source "package/foomatic-filters/Config.in"
 	source "package/fping/Config.in"
diff --git a/package/fcgiwrap/0001-use-LIBS-from-configure.patch b/package/fcgiwrap/0001-use-LIBS-from-configure.patch
new file mode 100644
index 0000000..12563c4
--- /dev/null
+++ b/package/fcgiwrap/0001-use-LIBS-from-configure.patch
@@ -0,0 +1,22 @@
+Makefile.in: Use LIBS from configure rather than specifying -lfcgi manually.
+
+libfcgi needs libm and fcgiwrap does not use libtool or pkgconf to
+detect libfcgi, so we need to add -lm explicitely when using static
+libs.  Buildroot does this by providing LIBS=-lm to configure when
+needed.  However fcgiwrap does not use Automake and its Makefile.in
+ignores LIBS from configure.  Fix it with this patch.
+
+Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
+
+diff -ur a/Makefile.in b/Makefile.in
+--- a/Makefile.in	2013-02-03 14:25:17.000000000 +0100
++++ b/Makefile.in	2015-05-29 16:33:23.895280138 +0200
+@@ -16,7 +16,7 @@
+ 	install -m 644 systemd/fcgiwrap.service $(DESTDIR)@systemdsystemunitdir@
+ endif
+
+-LDLIBS = -lfcgi @systemd_LIBS@
++LDLIBS = @LIBS@ @systemd_LIBS@
+ CFLAGS = @AM_CFLAGS@
+
+ fcgiwrap: fcgiwrap.c
diff --git a/package/fcgiwrap/Config.in b/package/fcgiwrap/Config.in
new file mode 100644
index 0000000..c3a31fc
--- /dev/null
+++ b/package/fcgiwrap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_FCGIWRAP
+	bool "fcgiwrap"
+	depends on BR2_USE_MMU # libfcgi
+	select BR2_PACKAGE_LIBFCGI
+	help
+	  fcgiwrap is a simple server for running CGI applications
+	  over FastCGI. It hopes to provide clean CGI support to Nginx
+	  (and other web servers that may need it).
+
+	  https://nginx.localdomain.pl/wiki/FcgiWrap
diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
new file mode 100644
index 0000000..698a130
--- /dev/null
+++ b/package/fcgiwrap/fcgiwrap.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# fcgiwrap
+#
+################################################################################
+
+FCGIWRAP_VERSION = 1.1.0
+FCGIWRAP_SITE = $(call github,gnosek,fcgiwrap,$(FCGIWRAP_VERSION))
+FCGIWRAP_DEPENDENCIES = host-pkgconf libfcgi
+FCGIWRAP_LICENSE = MIT
+FCGIWRAP_LICENSE_FILES = fcgiwrap.c
+FCGIWRAP_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+FCGIWRAP_DEPENDENCIES += systemd
+FCGIWRAP_CONF_OPTS += --with-systemd
+else
+FCGIWRAP_CONF_OPTS += --without-systemd
+endif
+
+# libfcgi needs libm and fcgiwrap does not use libtool or pkgconf to
+# detect libfcgi, so we need to add -lm explicitely when using static
+# libs.
+ifeq ($(BR2_STATIC_LIBS),y)
+FCGIWRAP_CONF_OPTS += LIBS=-lm
+endif
+
+# fcgiwrap uses Autoconf, but not Automake, so we need to provide
+# these to make.
+FCGIWRAP_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
+
+$(eval $(autotools-package))
-- 
2.1.4
