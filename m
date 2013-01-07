From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  7 Jan 2013 15:12:59 -0300
Subject: [Buildroot] [PATCH 2/3] libmcrypt: new package
In-Reply-To: <1357582380-22332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1357582380-22332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1357582380-22332-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                       |    1 +
 package/libmcrypt/Config.in             |    7 +++++++
 package/libmcrypt/libmcrypt-nocxx.patch |   15 +++++++++++++++
 package/libmcrypt/libmcrypt.mk          |   21 +++++++++++++++++++++
 4 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 package/libmcrypt/Config.in
 create mode 100644 package/libmcrypt/libmcrypt-nocxx.patch
 create mode 100644 package/libmcrypt/libmcrypt.mk

diff --git a/package/Config.in b/package/Config.in
index 942e62c..ca5136f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -370,6 +370,7 @@ source "package/beecrypt/Config.in"
 source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
+source "package/libmcrypt/Config.in"
 source "package/libmhash/Config.in"
 source "package/libnss/Config.in"
 source "package/nettle/Config.in"
diff --git a/package/libmcrypt/Config.in b/package/libmcrypt/Config.in
new file mode 100644
index 0000000..e5dc5e2
--- /dev/null
+++ b/package/libmcrypt/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBMCRYPT
+	bool "libmcrypt"
+	help
+	  libmcrypt is a library that provides uniform interface to access
+	  several encryption algorithms.
+
+	  http://mcrypt.sourceforge.net/
diff --git a/package/libmcrypt/libmcrypt-nocxx.patch b/package/libmcrypt/libmcrypt-nocxx.patch
new file mode 100644
index 0000000..b1c2871
--- /dev/null
+++ b/package/libmcrypt/libmcrypt-nocxx.patch
@@ -0,0 +1,15 @@
+libmcrypt doesn't use C++ so remove the check.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura libmcrypt-2.5.8.orig/configure.in libmcrypt-2.5.8/configure.in
+--- libmcrypt-2.5.8.orig/configure.in	2013-01-07 12:20:44.332200669 -0300
++++ libmcrypt-2.5.8/configure.in	2013-01-07 12:20:50.405390565 -0300
+@@ -19,7 +19,6 @@
+ 
+ AC_PROG_MAKE_SET
+ 
+-AC_PROG_CXX
+ AC_PROG_CC
+ AC_PROG_CPP
+ AC_PROG_INSTALL
diff --git a/package/libmcrypt/libmcrypt.mk b/package/libmcrypt/libmcrypt.mk
new file mode 100644
index 0000000..9d22f01
--- /dev/null
+++ b/package/libmcrypt/libmcrypt.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# libmcrypt
+#
+#############################################################
+
+LIBMCRYPT_VERSION = 2.5.8
+LIBMCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/$(LIBMCRYPT_VERSION)
+LIBMCRYPT_AUTORECONF = YES
+LIBMCRYPT_INSTALL_STAGING = YES
+LIBMCRYPT_LICENSE = LGPLv2.1
+LIBMCRYPT_LICENSE_FILES = COPYING.LIB
+
+define LIBMCRYPT_STAGING_LIBMCRYPT_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/libmcrypt-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/libmcrypt-config
+endef
+
+LIBMCRYPT_POST_INSTALL_STAGING_HOOKS += LIBMCRYPT_STAGING_LIBMCRYPT_CONFIG_FIXUP
+
+$(eval $(autotools-package))
-- 
1.7.8.6
