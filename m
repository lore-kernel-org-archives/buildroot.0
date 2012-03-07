From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 7 Mar 2012 18:05:17 +0000
Subject: [Buildroot] New package lcdproc
In-Reply-To: <CAHt8ZCPGCi-3jXKAjnjdbYq97=2se1c3YjDc18V27QEA7Mcq0Q@mail.gmail.com>
References: <CAHt8ZCPGCi-3jXKAjnjdbYq97=2se1c3YjDc18V27QEA7Mcq0Q@mail.gmail.com>
Message-ID: <CAHt8ZCONKjxYVWrGaKwfn-1ruDJMV-yyCTLPyE=JZ946Qo5vfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff --git a/package/Config.in b/package/Config.in
index 41cbb8c..4237e3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -302,6 +302,7 @@ source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
+source "package/lcdproc/Config.in"
 source "package/libart/Config.in"
 source "package/libdrm/Config.in"
 source "package/libexif/Config.in"
diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
new file mode 100644
index 0000000..68dc46c
--- /dev/null
+++ b/package/lcdproc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LCDPROC
+	bool "lcdproc"
+	select BR2_PACKAGE_NCURSES
+	help
+	LCD display driver daemon and clients
+
+	 http://lcdproc.org/
diff --git a/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
b/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
new file mode 100644
index 0000000..f5702ff
--- /dev/null
+++ b/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
@@ -0,0 +1,11 @@
+--- lcdproc-0.5.3/LCDd.conf.orig	2009-06-20 14:48:34.000000000 +0100
++++ lcdproc-0.5.3/LCDd.conf	2010-05-11 10:02:21.000000000 +0100
+@@ -34,7 +34,7 @@
+ #            the driver modules and will thus not be able to
+ #            function properly.
+ # NOTE: Always place a slash as last character !
+-DriverPath=server/drivers/
++DriverPath=/usr/lib/lcdproc/
+
+ # Tells the server to load the given drivers. Multiple lines can be given.
+ # The name of the driver is case sensitive and determines the section
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
new file mode 100644
index 0000000..20c43ee
--- /dev/null
+++ b/package/lcdproc/lcdproc.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# lcdproc
+#
+#############################################################
+LCDPROC_VERSION = 0.5.5
+
+LCDPROC_AUTORECONF = YES
+LCDPROC_INSTALL_STAGING = NO
+LCDPROC_INSTALL_TARGET = YES
+
+LCDPROC_CONF_OPT = --enable-drivers=all
+
+LCDPROC_DEPENDENCIES = uclibc ncurses
+
+$(eval $(call AUTOTARGETS))
