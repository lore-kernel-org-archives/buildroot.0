From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Tue, 26 May 2015 18:24:28 +0200
Subject: [Buildroot] [PATCH 1/1] fcgiwrap: new package
Message-ID: <1432657468-17210-1-git-send-email-thomas.claveirole@green-communications.fr>
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
 package/Config.in            |  1 +
 package/fcgiwrap/Config.in   | 10 ++++++++++
 package/fcgiwrap/fcgiwrap.mk | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+)
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
diff --git a/package/fcgiwrap/Config.in b/package/fcgiwrap/Config.in
new file mode 100644
index 0000000..a5c15a0
--- /dev/null
+++ b/package/fcgiwrap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_FCGIWRAP
+	bool "fcgiwrap"
+	depends on BR2_USE_MMU # Transitive dependency from libfcgi.
+	select BR2_PACKAGE_LIBFCGI
+	help
+	  fcgiwrap is a simple server for running CGI applications
+	  over FastCGI. It hopes to provide clean CGI support to Nginx
+	  (and other web servers that may need it).
+
+	  https://nginx.localdomain.pl/wiki/FcgiWrap
diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
new file mode 100644
index 0000000..053f1d0
--- /dev/null
+++ b/package/fcgiwrap/fcgiwrap.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# fcgiwrap
+#
+################################################################################
+
+FCGIWRAP_VERSION = 1.1.0
+FCGIWRAP_SITE = $(call github,gnosek,fcgiwrap,$(FCGIWRAP_VERSION))
+FCGIWRAP_DEPENDENCIES = libfcgi
+FCGIWRAP_LICENSE = MIT
+FCGIWRAP_AUTORECONF = YES
+
+# We need -lm to link with libfcgi, and fcgiwrap does not add it automatically.
+FCGIWRAP_CONF_OPTS = LDFLAGS=-lm
+
+# fcgiwrap uses Autoconf, but not Automake, so we need to provide these to make.
+FCGIWRAP_MAKE_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)" $(FCGIWRAP_CONF_OPTS)
+
+$(eval $(autotools-package))
-- 
2.1.4
