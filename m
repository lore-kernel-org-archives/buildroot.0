From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 12 Oct 2012 23:28:11 +0300
Subject: [Buildroot] [PATCH] putty: UNIX port of the famous Telnet and SSH
	GUI client
Message-ID: <1350073691-18721-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/Config.in       |    1 +
 package/putty/Config.in |    7 +++++++
 package/putty/putty.mk  |   24 ++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/putty/Config.in
 create mode 100644 package/putty/putty.mk

diff --git a/package/Config.in b/package/Config.in
index fb4ec28..3f2c289 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -598,6 +598,7 @@ source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/pptp-linux/Config.in"
 source "package/proftpd/Config.in"
+source "package/putty/Config.in"
 source "package/quagga/Config.in"
 source "package/radvd/Config.in"
 source "package/rp-pppoe/Config.in"
diff --git a/package/putty/Config.in b/package/putty/Config.in
new file mode 100644
index 0000000..125fbd6
--- /dev/null
+++ b/package/putty/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PUTTY
+	bool "putty"
+	select BR2_PACKAGE_LIBGTK2
+	help
+	  UNIX port of the famous Telnet and SSH GUI client
+
+	  http://www.chiark.greenend.org.uk/~sgtatham/putty
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
new file mode 100644
index 0000000..df66df5
--- /dev/null
+++ b/package/putty/putty.mk
@@ -0,0 +1,24 @@
+############################################
+#
+# putty
+# 
+############################################
+
+PUTTY_VERSION = 0.62-2012-08-27
+PUTTY_SOURCE = putty-$(PUTTY_VERSION).tar.gz
+PUTTY_SITE = http://tartarus.org/~simon/putty-snapshots
+PUTTY_SUBDIR = unix
+PUTTY_AUTORECONF = yes
+PUTTY_DEPENDENCIES = libglib2 libgtk2 gdk-pixbuf xlib_libX11 pango
+PUTTY_LICENSE = MIT
+PUTTY_LICENSE_FILES = LICENSE
+
+define PUTTY_CONFIGURE_FIXUP
+	(cd $(@D)/unix; \
+	sed -i configure.ac -e '/^AM_PATH_GTK(/d' -e 's|-Wall -Werror||g' )
+endef
+
+PUTTY_POST_PATCH_HOOKS += PUTTY_CONFIGURE_FIXUP
+
+$(eval $(autotools-package))
+
-- 
1.7.7.6
