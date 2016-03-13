From: Alexander Dahl <post@lespocky.de>
Date: Sun, 13 Mar 2016 10:30:36 +0100
Subject: [Buildroot] [PATCH v2] putty: add new package
Message-ID: <1457861436-16499-1-git-send-email-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Dahl <post@lespocky.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
This is the first patch in a series trying to get packages upstream
created for and used by fli4l [1], in some cases for a long time.

I start with putty, because it got a security update this week anyway.

v1 -> v2:
  - added a hint to help text which tools are built without GTK
  - removed weak md5 and sha1 hashes

[1] http://www.fli4l.de/
---
 package/Config.in        |  1 +
 package/putty/Config.in  | 14 ++++++++++++++
 package/putty/putty.hash |  3 +++
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
index 0000000..420a753
--- /dev/null
+++ b/package/putty/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_PUTTY
+	bool "putty"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	help
+	  PuTTY is a free SSH and Telnet client. Without GTK2 activated,
+	  only the commandline tools plink, pscp, psftp, and puttygen are
+	  built; enable GTK2 for the graphical client.
+
+	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
+
+comment "putty needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/putty/putty.hash b/package/putty/putty.hash
new file mode 100644
index 0000000..75990e4
--- /dev/null
+++ b/package/putty/putty.hash
@@ -0,0 +1,3 @@
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.67/{sha256,sha512}sums
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
