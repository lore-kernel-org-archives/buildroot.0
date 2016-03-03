From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  3 Mar 2016 13:01:47 +0100
Subject: [Buildroot] [PATCH] cannelloni: new package
Message-ID: <1457006507-26443-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                  |  1 +
 package/cannelloni/Config.in       | 15 +++++++++++++++
 package/cannelloni/cannelloni.hash |  2 ++
 package/cannelloni/cannelloni.mk   | 13 +++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/cannelloni/Config.in
 create mode 100644 package/cannelloni/cannelloni.hash
 create mode 100644 package/cannelloni/cannelloni.mk

diff --git a/package/Config.in b/package/Config.in
index 3c6e448..cd40175 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1338,6 +1338,7 @@ menu "Networking applications"
 	source "package/bwm-ng/Config.in"
 	source "package/c-icap/Config.in"
 	source "package/c-icap-modules/Config.in"
+	source "package/cannelloni/Config.in"
 	source "package/can-utils/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
diff --git a/package/cannelloni/Config.in b/package/cannelloni/Config.in
new file mode 100644
index 0000000..0938159
--- /dev/null
+++ b/package/cannelloni/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CANNELLONI
+	bool "cannelloni"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # lksctp-tools
+	depends on BR2_TOOLCHAIN_HAS_THREADS # lksctp-tools
+	select BR2_PACKAGE_LKSCTP_TOOLS
+	help
+	  A SocketCAN over Ethernet tunnel. The tunnel supports both
+	  UDP and SCTP protocols.
+
+	  https://github.com/mguentner/cannelloni
+
+comment "cannelloni needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
new file mode 100644
index 0000000..826af9b
--- /dev/null
+++ b/package/cannelloni/cannelloni.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  7341b76e2af056ecbcfc9fabc6e67c88234666be60f1eb099390c61bb9925856  cannelloni-v0.5.tar.gz
diff --git a/package/cannelloni/cannelloni.mk b/package/cannelloni/cannelloni.mk
new file mode 100644
index 0000000..bebff53
--- /dev/null
+++ b/package/cannelloni/cannelloni.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# cannelloni
+#
+################################################################################
+
+CANNELLONI_VERSION = v0.5
+CANNELLONI_SITE = $(call github,mguentner,cannelloni,$(CANNELLONI_VERSION))
+CANNELLONI_LICENSE = GPLv2+
+CANNELLONI_LICENSE_FILES = gpl-2.0.txt
+CANNELLONI_DEPENDENCIES = lksctp-tools
+
+$(eval $(cmake-package))
-- 
2.7.0
