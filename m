From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 21:17:25 +0200
Subject: [Buildroot] [git commit] cannelloni: new package
Message-ID: <20160330191814.7C41E81D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58102865d672626628d647fdbe77740a001a2596
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: fix license, it's GPLv2, not GPLv2+.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/cannelloni/Config.in       | 15 +++++++++++++++
 package/cannelloni/cannelloni.hash |  2 ++
 package/cannelloni/cannelloni.mk   | 13 +++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index bd76669..234d105 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1349,6 +1349,7 @@ menu "Networking applications"
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
index 0000000..efbe43d
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
+CANNELLONI_LICENSE = GPLv2
+CANNELLONI_LICENSE_FILES = gpl-2.0.txt
+CANNELLONI_DEPENDENCIES = lksctp-tools
+
+$(eval $(cmake-package))
