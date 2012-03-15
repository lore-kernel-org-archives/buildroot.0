From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 15 Mar 2012 08:49:42 +0000
Subject: [Buildroot] [PATCH resend] Added lcdproc package
Message-ID: <CAHt8ZCP+vjdJ4AtHC8P=DXy+h2PBoHg8mfoFCQLx9bjyEmK0iw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Simon Dawson <spdawson@gmail.com>

---
 package/Config.in                             |    1 +
 package/lcdproc/Config.in                     |    7 +++++++
 package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch |   18 ++++++++++++++++++
 package/lcdproc/lcdproc.mk                    |   14 ++++++++++++++
 4 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 package/lcdproc/Config.in
 create mode 100644 package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
 create mode 100644 package/lcdproc/lcdproc.mk

diff --git a/package/Config.in b/package/Config.in
index 36a221c..2b78f93 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -303,6 +303,7 @@ source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
+source "package/lcdproc/Config.in"
 source "package/libart/Config.in"
 source "package/libdrm/Config.in"
 source "package/libexif/Config.in"
diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
new file mode 100644
index 0000000..be3a1f8
--- /dev/null
+++ b/package/lcdproc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LCDPROC
+       bool "lcdproc"
+       select BR2_PACKAGE_NCURSES
+       help
+         LCD display driver daemon and clients
+
+         http://lcdproc.org/
diff --git a/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
b/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
new file mode 100644
index 0000000..4d6e623
--- /dev/null
+++ b/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
@@ -0,0 +1,18 @@
+Fix the default LCDd configuration file, so that the DriverPath
+is set to the correct lcdproc library install path, rather than
+the dummy/default path.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+---
+
+--- lcdproc-0.5.3/LCDd.conf.orig       2009-06-20 14:48:34.000000000 +0100
++++ lcdproc-0.5.3/LCDd.conf    2010-05-11 10:02:21.000000000 +0100
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
index 0000000..b7c0e23
--- /dev/null
+++ b/package/lcdproc/lcdproc.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# lcdproc
+#
+#############################################################
+LCDPROC_VERSION = 0.5.5
+LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
+LCDPROC_SITE =
http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lcdproc/
+
+LCDPROC_CONF_OPT = --enable-drivers=all
+
+LCDPROC_DEPENDENCIES = ncurses
+
+$(eval $(call AUTOTARGETS))
