From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Mar 2016 23:36:32 +0100
Subject: [Buildroot] [git commit] putty: add new package
Message-ID: <20160314223733.AFC0C807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af65a20a8cd022c4036313079c6523196df6b0e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop unneeded wchar dependency]
Signed-off-by: Alexander Dahl <post@lespocky.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |  1 +
 package/putty/Config.in  |  9 +++++++++
 package/putty/putty.hash |  3 +++
 package/putty/putty.mk   | 22 ++++++++++++++++++++++
 4 files changed, 35 insertions(+)

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
index 0000000..fe5b9eb
--- /dev/null
+++ b/package/putty/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PUTTY
+	bool "putty"
+	depends on BR2_USE_MMU # fork()
+	help
+	  PuTTY is a free SSH and Telnet client. Without GTK2 activated,
+	  only the commandline tools plink, pscp, psftp, and puttygen are
+	  built; enable GTK2 for the graphical client.
+
+	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
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
