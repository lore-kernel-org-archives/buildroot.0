From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 22:34:30 +0100
Subject: [Buildroot] [git commit] Added lcdproc package
Message-ID: <20120315214110.5E44990DC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccb44fd52f76bca3cbd6a89bc9407ada5ab47d65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix download URL, move to 'Hardware handling' section]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                             |    1 +
 package/lcdproc/Config.in                     |    7 +++++++
 package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch |   18 ++++++++++++++++++
 package/lcdproc/lcdproc.mk                    |   14 ++++++++++++++
 4 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9eef96e..f0ce963 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -190,6 +190,7 @@ source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
+source "package/lcdproc/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lsuio/Config.in"
diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
new file mode 100644
index 0000000..6c8614d
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
diff --git a/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch b/package/lcdproc/lcdproc-0.5.5-LCDd.conf.patch
new file mode 100644
index 0000000..283ac88
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
index 0000000..e8919e9
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
+LCDPROC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
+
+LCDPROC_CONF_OPT = --enable-drivers=all
+
+LCDPROC_DEPENDENCIES = ncurses
+
+$(eval $(call AUTOTARGETS))
