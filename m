From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 29 Mar 2018 21:52:47 +0200
Subject: [Buildroot] [PATCH] itop: new package
Message-ID: <20180329195247.24360-1-alexandre.belloni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

itop is a simple top-like interrupt load monitor. It can be useful to
debug interrupt issues.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/itop/Config.in |  4 ++++
 package/itop/itop.hash |  5 +++++
 package/itop/itop.mk   | 21 +++++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/itop/Config.in
 create mode 100644 package/itop/itop.hash
 create mode 100644 package/itop/itop.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 40fda40bdac8..179dd1512665 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -98,6 +98,7 @@ N:	Alexander Varnin <fenixk19@mail.ru>
 F:	package/liblog4c-localtime/
 
 N:	Alexandre Belloni <alexandre.belloni@bootlin.com>
+F:	package/itop/
 F:	package/tz/
 
 N:	Alexandre Esse <alexandre.esse.dev@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 2f9210a04e22..9f7b1905948f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -94,6 +94,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
 	source "package/iozone/Config.in"
+	source "package/itop/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
 	source "package/ktap/Config.in"
diff --git a/package/itop/Config.in b/package/itop/Config.in
new file mode 100644
index 000000000000..5339fae20094
--- /dev/null
+++ b/package/itop/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_ITOP
+	bool "itop"
+	help
+	  itop is a simple top-like interrupt load monitor
diff --git a/package/itop/itop.hash b/package/itop/itop.hash
new file mode 100644
index 000000000000..e76222d1ede9
--- /dev/null
+++ b/package/itop/itop.hash
@@ -0,0 +1,5 @@
+# Locally generated:
+sha512 06aecfe61ba2ef3423dd6f0d3c889521daa4588a2d6b1f5666080d9d44b3b1361247716de5601a7636ff87a838b836869731d062fc11b423b017dd99d2d2d298  itop_0.1.orig.tar.gz
+
+# Hash for license files:
+sha512 4113ed89fc91f55762e1deeb2b7e43af124eba2e037e13b7fe794ee33f40a8b218112b8ab167b5d8778cd5532d6f2c19058df7a24799ba29ff0be2d4004262e4  COPYING
diff --git a/package/itop/itop.mk b/package/itop/itop.mk
new file mode 100644
index 000000000000..0beb6df4c509
--- /dev/null
+++ b/package/itop/itop.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# itop
+#
+################################################################################
+
+ITOP_VERSION = 0.1
+ITOP_SITE = http://http.debian.net/debian/pool/main/i/itop
+ITOP_SOURCE = itop_$(ITOP_VERSION).orig.tar.gz
+ITOP_LICENSE = GPL-2.0
+ITOP_LICENSE_FILES = COPYING
+
+define ITOP_BUILD_CMDS
+	(cd $(@D) && $(TARGET_CC) -o itop src/itop.c)
+endef
+
+define ITOP_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/itop $(TARGET_DIR)/bin/itop
+endef
+
+$(eval $(generic-package))
-- 
2.16.3
