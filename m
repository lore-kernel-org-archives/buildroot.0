From: Ludovic Guegan <ludovic.guegan@gmail.com>
Date: Tue,  2 Feb 2016 00:31:03 +0100
Subject: [Buildroot]  [PATCH 6/8 RFC] package/rtop: add rtop package in Go
In-Reply-To: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <1454369465-4804-7-git-send-email-ludovic.guegan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ludovic Guegan <ludovic.guegan@gmail.com>
---
 package/Config.in      |  1 +
 package/rtop/Config.in |  8 ++++++++
 package/rtop/rtop.hash |  1 +
 package/rtop/rtop.mk   | 16 ++++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/rtop/Config.in
 create mode 100644 package/rtop/rtop.hash
 create mode 100644 package/rtop/rtop.mk

diff --git a/package/Config.in b/package/Config.in
index 09c2b40..d0e5e4e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ menu "Erlang libraries/modules"
 endmenu
 endif
 	source "package/gauche/Config.in"
+	source "package/rtop/Config.in"
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
diff --git a/package/rtop/Config.in b/package/rtop/Config.in
new file mode 100644
index 0000000..857112a
--- /dev/null
+++ b/package/rtop/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_RTOP
+	bool "rtop"
+	depends on BR2_PACKAGE_HOST_GOLANG
+	help
+	  rtop is an interactive, remote system monitoring tool based on SSH
+
+	  https://github.com/rapidloop/rtop
+
diff --git a/package/rtop/rtop.hash b/package/rtop/rtop.hash
new file mode 100644
index 0000000..1407231
--- /dev/null
+++ b/package/rtop/rtop.hash
@@ -0,0 +1 @@
+sha256 44ab02299a204befe49d725bdb76a249db419807e13b7ca451ba14ea5d3de1c2  rtop-release_1.0.tar.gz
diff --git a/package/rtop/rtop.mk b/package/rtop/rtop.mk
new file mode 100644
index 0000000..f233ebe
--- /dev/null
+++ b/package/rtop/rtop.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# rtop
+#
+################################################################################
+
+RTOP_LICENSE = MIT
+RTOP_VERSION = release_1.0
+RTOP_SITE = $(call github,rapidloop,rtop,$(RTOP_VERSION))
+RTOP_EXTRACT_DIR = $(@D)/src/github.com/rapidloop/rtop
+RTOP_BUILD_PACKAGES = github.com/rapidloop/rtop
+
+RTOP_DEPS += $(call fetch-golang-package, golang.org/x/crypto/curve25519, 1f22c0103821b9390939b6776727195525381532)
+RTOP_DEPS += $(call fetch-golang-package, golang.org/x/crypto/ssh, 1f22c0103821b9390939b6776727195525381532)
+
+$(eval $(golang-package))
-- 
2.7.0
