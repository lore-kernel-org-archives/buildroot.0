From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 19:52:56 +0100
Subject: [Buildroot] [git commit branch/next] websocketpp: new package
Message-ID: <20181118185107.E650183929@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=315bd925f15e34b5af761175964b77f5652b410f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
[Peter: fix alphabetical ordering as suggested by Ryan]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/websocketpp/Config.in        | 15 +++++++++++++++
 package/websocketpp/websocketpp.hash |  3 +++
 package/websocketpp/websocketpp.mk   | 15 +++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d9c6755f17..f4d98d9b0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1829,6 +1829,7 @@ F:	package/python-pysnmp/
 F:	package/python-pysnmp-apps/
 F:	package/python-pysnmp-mibs/
 F:	package/python-tornado/
+F:	package/websocketpp/
 
 N:	Ryan Coe <bluemrp9@gmail.com>
 F:	package/inadyn/
diff --git a/package/Config.in b/package/Config.in
index 9951b1a522..5a5d840391 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1586,6 +1586,7 @@ menu "Networking"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
 	source "package/wampcc/Config.in"
+	source "package/websocketpp/Config.in"
 	source "package/zeromq/Config.in"
 	source "package/zmqpp/Config.in"
 	source "package/zyre/Config.in"
diff --git a/package/websocketpp/Config.in b/package/websocketpp/Config.in
new file mode 100644
index 0000000000..cadb9ff696
--- /dev/null
+++ b/package/websocketpp/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_WEBSOCKETPP
+	bool "websocketpp"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  WebSocket++ is a header only C++ library that implements
+	  RFC6455 The WebSocket Protocol. It allows integrating
+	  WebSocket client and server functionality into C++ programs.
+	  It uses interchangeable network transport modules including
+	  one based on C++ iostreams and one based on Boost Asio.
+
+	  http://www.zaphoyd.com/websocketpp
+
+comment "websocketpp needs a toolchain w/ C++ and gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/websocketpp/websocketpp.hash b/package/websocketpp/websocketpp.hash
new file mode 100644
index 0000000000..8bf671d96e
--- /dev/null
+++ b/package/websocketpp/websocketpp.hash
@@ -0,0 +1,3 @@
+# Locally Computed:
+sha256  178899de48c02853b55b1ea8681599641cedcdfce59e56beaff3dd0874bf0286  websocketpp-0.8.1.tar.gz
+sha256  b31e597bc777d884a39663c11d0557a0af40780e1f451de11ea5103924a69667  COPYING
diff --git a/package/websocketpp/websocketpp.mk b/package/websocketpp/websocketpp.mk
new file mode 100644
index 0000000000..47da4dbe2f
--- /dev/null
+++ b/package/websocketpp/websocketpp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# websocketpp
+#
+################################################################################
+
+WEBSOCKETPP_VERSION = 0.8.1
+WEBSOCKETPP_SITE = $(call github,zaphoyd,websocketpp,$(WEBSOCKETPP_VERSION))
+WEBSOCKETPP_LICENSE = BSD-3c, MIT, Zlib
+WEBSOCKETPP_LICENSE_FILES = COPYING
+WEBSOCKETPP_INSTALL_STAGING = YES
+# Only installs headers
+WEBSOCKETPP_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
