From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:04 +0100
Subject: [Buildroot] [PATCH 05/51] package/libiscsi: new package
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-6-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in            |    1 +
 package/libiscsi/Config.in   |   12 ++++++++++++
 package/libiscsi/libiscsi.mk |   22 ++++++++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 package/libiscsi/Config.in
 create mode 100644 package/libiscsi/libiscsi.mk

diff --git a/package/Config.in b/package/Config.in
index 658de91..9a7e409 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -454,6 +454,7 @@ source "package/libesmtp/Config.in"
 source "package/libeXosip2/Config.in"
 source "package/libfcgi/Config.in"
 source "package/libidn/Config.in"
+source "package/libiscsi/Config.in"
 source "package/liboauth/Config.in"
 source "package/libmicrohttpd/Config.in"
 source "package/neon/Config.in"
diff --git a/package/libiscsi/Config.in b/package/libiscsi/Config.in
new file mode 100644
index 0000000..f3fc29e
--- /dev/null
+++ b/package/libiscsi/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBISCSI
+	bool "libiscsi"
+	select BR2_PACKAGE_POPT
+	help
+	  Libiscsi is a client-side library to implement the iSCSI protocol
+	  that can be used to access resource of an iSCSI Target.
+	  
+	  The library is fully async with regards to iscsi commands and scsi
+	  tasks, but a sync layer is also provided for ease of use for simpler
+	  applications.
+	  
+	  https://github.com/sahlberg/libiscsi  (no proper homepage)
diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
new file mode 100644
index 0000000..319b5b6
--- /dev/null
+++ b/package/libiscsi/libiscsi.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# libiscsi
+#
+#############################################################
+
+LIBISCSI_VERSION         = 1.6.0
+LIBISCSI_SOURCE          = libiscsi-$(LIBISCSI_VERSION).tar.gz
+LIBISCSI_SITE            = https://github.com/downloads/sahlberg/libiscsi
+LIBISCSI_LICENSE         = GPLv2+ LGPLv2.1+
+LIBISCSI_LICENSE_FILES   = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt 
+LIBISCSI_INSTALL_STAGING = YES
+LIBISCSI_DEPENDENCIES    = popt
+
+LIBISCSI_AUTORECONF = YES
+# Having a m4/ directory is mandatory for autoreconf to work
+define LIBISCSI_CREATE_M4_DIR
+	mkdir -p $(@D)/m4
+endef
+LIBISCSI_PRE_CONFIGURE_HOOKS += LIBISCSI_CREATE_M4_DIR
+
+$(eval $(autotools-package))
-- 
1.7.2.5
