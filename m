From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:53:53 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_05/36=5D_package/libiscsi=3A_new_p?=
	=?utf-8?q?ackage?=
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-5-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in            |    1 +
 package/libiscsi/Config.in   |   12 ++++++++++++
 package/libiscsi/libiscsi.mk |   23 +++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/libiscsi/Config.in
 create mode 100644 package/libiscsi/libiscsi.mk

diff --git a/package/Config.in b/package/Config.in
index 3b581a2..ef411e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -417,6 +417,7 @@ source "package/libesmtp/Config.in"
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
index 0000000..4e1fe1a
--- /dev/null
+++ b/package/libiscsi/libiscsi.mk
@@ -0,0 +1,23 @@
+#-----------------------------------------------------------------------------
+# Package description
+
+LIBISCSI_VERSION         = 1.5.0
+LIBISCSI_SITE            = git://github.com/sahlberg/libiscsi.git
+LIBISCSI_LICENSE         = LGPLv2.1+
+LIBISCSI_LICENSE_FILES   = COPYING LICENCE-LGPL-2.1.txt
+#?Note: the binaries are GPLv2+, but we do not use them
+LIBISCSI_INSTALL_STAGING = YES
+LIBISCSI_DEPENDENCIES    = popt
+
+#----------------------------------------------------------------------------
+# Package build process
+
+# As we use the git repository, we need to generate the configure script
+# Using the standard autoreconf does not work (missing m4/ dir)
+define LIBISCSI_CREATE_CONFIGURE
+	cd $(@D); ./autogen.sh
+endef
+LIBISCSI_PRE_CONFIGURE_HOOKS += LIBISCSI_CREATE_CONFIGURE
+LIBISCSI_DEPENDENCIES        += host-autoconf
+
+$(eval $(autotools-package))
-- 
1.7.2.5
