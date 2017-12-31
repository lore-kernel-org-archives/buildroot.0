From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 17:28:49 +0100
Subject: [Buildroot] [git commit] curlpp: new package
Message-ID: <20171231162859.D7237803AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eaa4d2ead333add4737ed3593090d0d69d285420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/curlpp/Config.in   | 12 ++++++++++++
 package/curlpp/curlpp.hash |  5 +++++
 package/curlpp/curlpp.mk   | 15 +++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d3f3f05..7163634 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1567,6 +1567,7 @@ F:	package/rtl8189fs/
 F:	package/xr819-xradio/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
+F:	package/curlpp/
 F:	package/daq/
 F:	package/libgdiplus/
 F:	package/mongodb/
diff --git a/package/Config.in b/package/Config.in
index a343503..abd082c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1339,6 +1339,7 @@ menu "Networking"
 	source "package/canfestival/Config.in"
 	source "package/cgic/Config.in"
 	source "package/cppzmq/Config.in"
+	source "package/curlpp/Config.in"
 	source "package/czmq/Config.in"
 	source "package/daq/Config.in"
 	source "package/filemq/Config.in"
diff --git a/package/curlpp/Config.in b/package/curlpp/Config.in
new file mode 100644
index 0000000..a23e5d9
--- /dev/null
+++ b/package/curlpp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CURLPP
+	bool "curlpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBCURL
+	help
+	  cURLpp is a C++ wrapper for libcURL.
+
+	  http://www.curlpp.org/
+
+comment "curlpp needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/curlpp/curlpp.hash b/package/curlpp/curlpp.hash
new file mode 100644
index 0000000..2b14a23
--- /dev/null
+++ b/package/curlpp/curlpp.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256 97e3819bdcffc3e4047b6ac57ca14e04af85380bd93afe314bee9dd5c7f46a0a  v0.8.1.tar.gz
+
+# Hash for license files:
+sha256 8b9e3afd4d06ad3c169e788e5187a3e9f4f35671e9a7322f7e74bea9643b5b5a  doc/LICENSE
diff --git a/package/curlpp/curlpp.mk b/package/curlpp/curlpp.mk
new file mode 100644
index 0000000..7528855
--- /dev/null
+++ b/package/curlpp/curlpp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# curlpp
+#
+################################################################################
+
+CURLPP_VERSION = 0.8.1
+CURLPP_SITE = https://github.com/jpbarrette/curlpp/archive
+CURLPP_SOURCE = v$(CURLPP_VERSION).tar.gz
+CURLPP_LICENSE = MIT
+CURLPP_LICENSE_FILES = doc/LICENSE
+CURLPP_INSTALL_STAGING = YES
+CURLPP_DEPENDENCIES = libcurl
+
+$(eval $(cmake-package))
