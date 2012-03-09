From: Simon Dawson <spdawson@gmail.com>
Date: Fri, 9 Mar 2012 12:44:14 +0000
Subject: [Buildroot] New package lcdproc
In-Reply-To: <20120308090516.06e1e329@skate>
References: <CAHt8ZCPGCi-3jXKAjnjdbYq97=2se1c3YjDc18V27QEA7Mcq0Q@mail.gmail.com>
 <CAHt8ZCONKjxYVWrGaKwfn-1ruDJMV-yyCTLPyE=JZ946Qo5vfQ@mail.gmail.com>
 <20120307202109.30f9c625@skate>
 <CAHt8ZCMVj5nQ=TZYnBktWHrxqYtwg_1oM5SimyaBFm3uaGZ1Ag@mail.gmail.com>
 <20120308090516.06e1e329@skate>
Message-ID: <CAHt8ZCNO7woNaN-Gh2=DWjJXUzQJ64RBUh_taHVYC6EnnrmhWg@mail.gmail.com>
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
