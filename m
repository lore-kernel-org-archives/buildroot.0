From: Alexander Dahl <post@lespocky.de>
Date: Fri, 11 Mar 2016 07:45:59 +0100
Subject: [Buildroot] [PATCH 1/1] putty: add new package
Message-ID: <1457678759-11688-1-git-send-email-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
This is the first patch in a series trying to get packages upstream
created for and used by fli4l [1], in some cases for a long time. I
start with putty, because it got a security update this week anyway.

[1] http://www.fli4l.de/

 package/Config.in        |  1 +
 package/putty/Config.in  | 12 ++++++++++++
 package/putty/putty.hash |  5 +++++
 package/putty/putty.mk   | 22 ++++++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 package/putty/Config.in
 create mode 100644 package/putty/putty.hash
 create mode 100644 package/putty/putty.mk

diff --git a/package/Config.in b/package/Config.in
index 35a24ba..2e00fbb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1465,6 +1465,7 @@ endif
 	source "package/ptpd/Config.in"
 	source "package/ptpd2/Config.in"
 	source "package/pure-ftpd/Config.in"
+	source "package/putty/Config.in"
 	source "package/quagga/Config.in"
 	source "package/radvd/Config.in"
 	source "package/rp-pppoe/Config.in"
diff --git a/package/putty/Config.in b/package/putty/Config.in
new file mode 100644
index 0000000..5c18b2c
--- /dev/null
+++ b/package/putty/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PUTTY
+	bool "putty"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	help
+	  PuTTY is a free SSH and Telnet client
+
+	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
+
+comment "putty needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/putty/putty.hash b/package/putty/putty.hash
new file mode 100644
index 0000000..4b02acc
--- /dev/null
+++ b/package/putty/putty.hash
@@ -0,0 +1,5 @@
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.67/{md5,sha1,sha256,sha512}sums
+md5 8d5d450e8f9a011e2e411e3f30827e9b                                                                                                    putty-0.67.tar.gz
+sha1 132ff74266e590a007f86cbb4bea5642db7bdd76                                                                                           putty-0.67.tar.gz
+sha256 80192458e8a46229de512afeca5c757dd8fce09606b3c992fbaeeee29b994a47                                                                 putty-0.67.tar.gz
+sha512 c2b17da46b8db3fe3837a10cb9cf5dd4b3ef6bfa15cadab83f3b87cf1479ed31fced90b774297ae53bdcbbdf230fc80d5c73d5ff3be6916fb591fd7ce3d35eca putty-0.67.tar.gz
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
new file mode 100644
index 0000000..ca86c47
--- /dev/null
+++ b/package/putty/putty.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# putty
+#
+################################################################################
+
+PUTTY_VERSION = 0.67
+PUTTY_SOURCE = putty-$(PUTTY_VERSION).tar.gz
+PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
+PUTTY_SUBDIR = unix
+PUTTY_LICENSE = MIT
+PUTTY_LICENSE_FILES = LICENCE
+PUTTY_CONF_OPTS = --disable-gtktest
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+PUTTY_CONF_OPTS += --with-gtk=2
+PUTTY_DEPENDENCIES += libgtk2
+else
+PUTTY_CONF_OPTS += --without-gtk
+endif
+
+$(eval $(autotools-package))
-- 
2.1.4
