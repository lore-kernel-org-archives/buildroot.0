From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 24 Dec 2017 19:18:05 -0200
Subject: [Buildroot] [PATCH] daq: new package
Message-ID: <1514150285-19871-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...0001-Fix-build-against-the-musl-C-library.patch | 29 ++++++++++++++++++++++
 package/daq/Config.in                              | 13 ++++++++++
 package/daq/daq.hash                               |  5 ++++
 package/daq/daq.mk                                 | 26 +++++++++++++++++++
 6 files changed, 75 insertions(+)
 create mode 100644 package/daq/0001-Fix-build-against-the-musl-C-library.patch
 create mode 100644 package/daq/Config.in
 create mode 100644 package/daq/daq.hash
 create mode 100644 package/daq/daq.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9f4f2822036e..8f847358f614 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1564,6 +1564,7 @@ F:	package/rtl8189fs/
 F:	package/xr819-xradio/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
+F:	package/daq/
 F:	package/libgdiplus/
 F:	package/mongodb/
 F:	package/pimd/
diff --git a/package/Config.in b/package/Config.in
index bd39a374f06f..c1e52a3f0998 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1338,6 +1338,7 @@ menu "Networking"
 	source "package/cgic/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
+	source "package/daq/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
 	source "package/fmlib/Config.in"
diff --git a/package/daq/0001-Fix-build-against-the-musl-C-library.patch b/package/daq/0001-Fix-build-against-the-musl-C-library.patch
new file mode 100644
index 000000000000..a37fe9a7ec56
--- /dev/null
+++ b/package/daq/0001-Fix-build-against-the-musl-C-library.patch
@@ -0,0 +1,29 @@
+From d3eec1a3b7c67a5e6f524c65608fd2eacac3782b Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Sun, 24 Dec 2017 12:58:49 -0200
+Subject: [PATCH] Fix build against the musl C library
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ os-daq-modules/daq_ipfw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os-daq-modules/daq_ipfw.c b/os-daq-modules/daq_ipfw.c
+index 016beb06ad61..c2a41759bb04 100644
+--- a/os-daq-modules/daq_ipfw.c
++++ b/os-daq-modules/daq_ipfw.c
+@@ -23,10 +23,10 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
++#include <unistd.h>
+ 
+ #include <sys/types.h>
+ #include <sys/time.h>
+-#include <sys/unistd.h>
+ 
+ #include <netinet/in.h>
+ #include <sys/socket.h>
+-- 
+1.9.1
+
diff --git a/package/daq/Config.in b/package/daq/Config.in
new file mode 100644
index 000000000000..0627274b52ad
--- /dev/null
+++ b/package/daq/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_DAQ
+	bool "daq"
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBDNET
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	help
+	  DAQ is a Data Acquisition library for packet I/O from the
+	  Snort project.
+
+	  https://www.snort.org
+
+comment "daq needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/daq/daq.hash b/package/daq/daq.hash
new file mode 100644
index 000000000000..6a0cb5ed0781
--- /dev/null
+++ b/package/daq/daq.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256 d41da5f7793e66044e6927dd868c0525e7ee4ec1a3515bf74ef9a30cd9273af0  daq-2.0.6.tar.gz
+
+# Hash for license files:
+sha256 07f28289c09fd9eb5a6ff7bc710ff40363601b1bbc6f3637d8ed412150e90819  COPYING
diff --git a/package/daq/daq.mk b/package/daq/daq.mk
new file mode 100644
index 000000000000..f10c31d4a157
--- /dev/null
+++ b/package/daq/daq.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# daq
+#
+################################################################################
+
+DAQ_VERSION = 2.0.6
+DAQ_SITE = https://www.snort.org/downloads/snort
+DAQ_SOURCE = daq-$(DAQ_VERSION).tar.gz
+
+DAQ_LICENSE = GPL-2.0
+DAQ_LICENSE_FILES = COPYING
+
+DAQ_DEPENDENCIES = libpcap libdnet
+
+# package does not build in parallel due to improper make rules
+# related to the generation of the tokdefs.h header file
+DAQ_MAKE = $(MAKE1)
+
+# assume these flags are available to prevent configure from
+# running test programs while cross compiling
+DAQ_CONF_ENV = \
+	ac_cv_lib_pcap_pcap_lib_version="yes" \
+	daq_cv_libpcap_version_1x="yes"
+
+$(eval $(autotools-package))
-- 
1.9.1
