From: Vadym Kochan <vadim4j@gmail.com>
Date: Sat, 19 Sep 2020 23:19:04 +0300
Subject: [Buildroot] [PATCH] package/mstpd: new package
Message-ID: <20200919201904.15883-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Serhiy Boiko <serhiy.boiko@plvision.eu>

Add MSTPD (Multiple Spanning Tree Protocol Daemon) an open source
user-space daemon licensed under GPLv2.

Signed-off-by: Serhiy Boiko <serhiy.boiko@plvision.eu>
Signed-off-by: Vadym Kochan <vadim4j@gmail.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/mstpd/Config.in  | 11 +++++++++++
 package/mstpd/mstpd.hash |  3 +++
 package/mstpd/mstpd.mk   | 20 ++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/mstpd/Config.in
 create mode 100644 package/mstpd/mstpd.hash
 create mode 100644 package/mstpd/mstpd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 506e675587..15708d26ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2654,6 +2654,7 @@ N:	Vadim Kochan <vadim4j@gmail.com>
 F:	package/brcm-patchram-plus/
 F:	package/frr/
 F:	package/gettext-tiny/
+F:	package/mstpd/
 F:	package/tinyssh/
 
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 2f30252891..737c0695c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2145,6 +2145,7 @@ menu "Networking applications"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
 	source "package/mrp/Config.in"
+	source "package/mstpd/Config.in"
 	source "package/mtr/Config.in"
 	source "package/nbd/Config.in"
 	source "package/ncftp/Config.in"
diff --git a/package/mstpd/Config.in b/package/mstpd/Config.in
new file mode 100644
index 0000000000..ac921b0d2b
--- /dev/null
+++ b/package/mstpd/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_MSTPD
+	bool "mstpd"
+	select BR2_PACKAGE_BASH # init
+	depends on BR2_USE_MMU  # bash
+	help
+	  Multiple Spanning Tree Protocol Daemon
+
+	  MSTPD is an open source user-space daemon licensed
+	  under GPLv2.
+
+	  https://github.com/mstpd/mstpd
diff --git a/package/mstpd/mstpd.hash b/package/mstpd/mstpd.hash
new file mode 100644
index 0000000000..6cb6e2f166
--- /dev/null
+++ b/package/mstpd/mstpd.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 dd6492039368efff0bd13b3f9c8bb32d859ebfe258a70ef23b2163c4b6c35f0c  0.0.8.tar.gz
+sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  LICENSE
diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
new file mode 100644
index 0000000000..49dc769509
--- /dev/null
+++ b/package/mstpd/mstpd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# mstpd
+#
+################################################################################
+
+MSTPD_VERSION = 0.0.8
+MSTPD_SOURCE = $(MSTPD_VERSION).tar.gz
+MSTPD_SITE = https://github.com/mstpd/mstpd/archive
+MSTPD_LICENSE = GPL-2.0
+MSTPD_LICENSE_FILES = LICENSE
+MSTPD_AUTORECONF = YES
+
+# mstpd requires that it is installed into /sbin, not /usr/sbin
+MSTPD_CONF_OPTS = \
+	--prefix=/ \
+	--exec-prefix=/ \
+	--sbindir=/sbin
+
+$(eval $(autotools-package))
-- 
2.17.1
