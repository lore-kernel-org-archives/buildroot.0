From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 16:45:29 +0100
Subject: [Buildroot] [PATCH v2] udpxy: new package
In-Reply-To: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
References: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <1483371929-13907-8-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
Changes v1 -> v2:
  - Fix url in mk file (trailing slash)
---
 package/Config.in        |  1 +
 package/udpxy/Config.in  |  8 ++++++++
 package/udpxy/udpxy.hash |  4 ++++
 package/udpxy/udpxy.mk   | 24 ++++++++++++++++++++++++
 4 files changed, 37 insertions(+)
 create mode 100644 package/udpxy/Config.in
 create mode 100644 package/udpxy/udpxy.hash
 create mode 100644 package/udpxy/udpxy.mk

diff --git a/package/Config.in b/package/Config.in
index 59fa851..208516d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -45,6 +45,7 @@ menu "Audio and video applications"
 	source "package/tovid/Config.in"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
+	source "package/udpxy/Config.in"
 	source "package/upmpdcli/Config.in"
 	source "package/v4l2grab/Config.in"
 	source "package/vlc/Config.in"
diff --git a/package/udpxy/Config.in b/package/udpxy/Config.in
new file mode 100644
index 0000000..febb2ef
--- /dev/null
+++ b/package/udpxy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_UDPXY
+	bool "udpxy"
+	help
+	  udpxy is a UDP-to-HTTP multicast traffic relay daemon: it forwards UDP 
+	  traffic from a given multicast subscription to the requesting HTTP 
+	  client.
+
+	  http://www.udpxy.com/
diff --git a/package/udpxy/udpxy.hash b/package/udpxy/udpxy.hash
new file mode 100644
index 0000000..93f1661
--- /dev/null
+++ b/package/udpxy/udpxy.hash
@@ -0,0 +1,4 @@
+# Locally computed
+md5 0c953f7dd80329c1a062997afb9b6744  udpxy.1.0.23-9-prod.tar.gz
+sha1    4194fc98d51284da48d07c44bbc5bdfa4813a4b8    udpxy.1.0.23-9-prod.tar.gz
+sha256  6ce33b1d14a1aeab4bd2566aca112e41943df4d002a7678d9a715108e6b714bd    udpxy.1.0.23-9-prod.tar.gz
diff --git a/package/udpxy/udpxy.mk b/package/udpxy/udpxy.mk
new file mode 100644
index 0000000..a27ac42
--- /dev/null
+++ b/package/udpxy/udpxy.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# udpxy
+#
+#################################################################################
+
+UDPXY_VERSION = 1.0.23-9-prod
+UDPXY_SOURCE = udpxy.$(UDPXY_VERSION).tar.gz
+UDPXY_SITE = http://www.udpxy.com/download/1_23
+UDPXY_LICENSE = GPLv3+
+UDPXY_LICENSE_FILES = README
+
+UDPXY_MAKE_OPTS=$(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) PREFIX=/usr
+
+define UDPXY_BUILD_CMDS
+  $(MAKE) $(UDPXY_MAKE_OPTS) -C $(@D)/
+endef
+
+define UDPXY_INSTALL_TARGET_CMDS
+  $(MAKE) $(UDPXY_MAKE_OPTS) -C $(@D)/ install
+endef
+
+$(eval $(generic-package))
+
-- 
2.1.4
