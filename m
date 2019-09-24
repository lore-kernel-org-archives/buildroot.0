From: stephan.hoffmann at ext.grandcentrix.net <stephan.hoffmann@ext.grandcentrix.net>
Date: Tue, 24 Sep 2019 14:27:54 +0200
Subject: [Buildroot] [PATCH v2] libhttpserver: new package
Message-ID: <20190924122754.15416-1-stephan.hoffmann@ext.grandcentrix.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>

libhttpserver is a C++ library for building high performance RESTfuls
web servers. libhttpserver is built upon libmicrohttpd to provide a
simple API for developers to create HTTP services in C++.

The installed pkg-config file contains an error, thus we include
the patch 458d16b922304006fe418897044e14b0544a127a from the upstream
repo that is not yet released.

Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>

---
Changes v1 -> v2:
  - Update DEVELOPERS
  - Add signed-off to patch
  - Update "depends on" and fix comment
  - Add hash for License file
  - Change += to = in mk file
---
 DEVELOPERS                                    |  3 +++
 package/Config.in                             |  1 +
 ...-expectations-in-libhttpserver.pc.in.patch | 27 +++++++++++++++++++
 package/libhttpserver/Config.in               | 15 +++++++++++
 package/libhttpserver/libhttpserver.hash      |  3 +++
 package/libhttpserver/libhttpserver.mk        | 16 +++++++++++
 6 files changed, 65 insertions(+)
 create mode 100644 package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch
 create mode 100644 package/libhttpserver/Config.in
 create mode 100644 package/libhttpserver/libhttpserver.hash
 create mode 100644 package/libhttpserver/libhttpserver.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b427fd92ae..e57bda4dae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2179,6 +2179,9 @@ F:	package/gtest/
 F:	package/mtdev/
 F:	package/mtdev2tuio/
 
+N:	Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
+F:	package/libhttpserver/
+
 N:	Steve Calfee <stevecalfee@gmail.com>
 F:	package/python-pymysql/
 F:	package/python-pyratemp/
diff --git a/package/Config.in b/package/Config.in
index 2fc11065f6..e6ee550e7a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1584,6 +1584,7 @@ menu "Networking"
 	source "package/libgsasl/Config.in"
 	source "package/libhtp/Config.in"
 	source "package/libhttpparser/Config.in"
+	source "package/libhttpserver/Config.in"
 	source "package/libidn/Config.in"
 	source "package/libidn2/Config.in"
 	source "package/libiscsi/Config.in"
diff --git a/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch b/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch
new file mode 100644
index 0000000000..74ca58bb31
--- /dev/null
+++ b/package/libhttpserver/0001-Fix-lib-expectations-in-libhttpserver.pc.in.patch
@@ -0,0 +1,27 @@
+From 2bc7cf0beb6b8a124c1c7360c4fb5279e8763f07 Mon Sep 17 00:00:00 2001
+From: Sebastiano Merlino <electrictwister2000@gmail.com>
+Date: Sat, 8 Jun 2019 15:36:06 -0700
+Subject: [PATCH] Fix lib expectations in libhttpserver.pc.in
+
+Signed-off-by: Stephan Hoffmann <stephan.hoffmann@ext.grandcentrix.net>
+---
+Patch status: upstream commit 458d16b922304006fe418897044e14
+
+ libhttpserver.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libhttpserver.pc.in b/libhttpserver.pc.in
+index 36355ee..55f7c0e 100644
+--- a/libhttpserver.pc.in
++++ b/libhttpserver.pc.in
+@@ -8,6 +8,6 @@ Description: A C++ library for creating an embedded Rest HTTP server
+ Version: @VERSION@
+ Requires: libmicrohttpd >= 0.9.37
+ Conflicts:
+-Libs: -L${libdir} -lmicrohttpd
++Libs: -L${libdir} -lhttpserver
+ Libs.private: @LHT_LIBDEPS@
+ Cflags: -I${includedir} -I${includedir}/httpserver
+-- 
+2.17.1
+
diff --git a/package/libhttpserver/Config.in b/package/libhttpserver/Config.in
new file mode 100644
index 0000000000..7105dc67f2
--- /dev/null
+++ b/package/libhttpserver/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBHTTPSERVER
+	bool "libhttpserver"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  libhttpserver is a C++ library for building high performance
+	  RESTfuls web servers. libhttpserver is built upon
+	  libmicrohttpd to provide a simple API for developers to
+	  create HTTP services in C++.
+
+	  https://github.com/etr/libhttpserver
+
+comment "libhttpserver needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
new file mode 100644
index 0000000000..0333aabbae
--- /dev/null
+++ b/package/libhttpserver/libhttpserver.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 778fa0aec199bf8737b2d540c2563a694c18957329f9885e372f7aaafb838351 libhttpserver-0.17.5.tar.gz
+sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a COPYING.LESSER
diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
new file mode 100644
index 0000000000..1640c05e35
--- /dev/null
+++ b/package/libhttpserver/libhttpserver.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libhttpserver
+#
+################################################################################
+
+LIBHTTPSERVER_VERSION = 0.17.5
+LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
+LIBHTTPSERVER_LICENSE = LGPL-2.1-or-later
+LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
+LIBHTTPSERVER_INSTALL_STAGING = YES
+LIBHTTPSERVER_CONF_OPTS = --enable-same-directory-build
+LIBHTTPSERVER_AUTORECONF = YES
+LIBHTTPSERVER_DEPENDENCIES = libmicrohttpd
+
+$(eval $(autotools-package))
-- 
2.17.1


-- 

*Azure IoT* Gold Partner ? *Azure Sphere* Elite Partner ? *Vodafone 
NB-IoT* Partner ? Apple *MFi* & *HomeKit* Developer ? *Bluetooth* SIG ? 
*zigbee* Alliance ? *LoRa* Alliance ? *Thread* Group


grandcentrix GmbH???
Holzmarkt 1???50676 *K?ln*?|?Phoenixseestrasse 18???44263 *Dortmund*???
Deutschland
| t <https://twitter.com/grandcentrix> | f 
<https://www.facebook.com/GrandCentrix/> | in 
<https://www.linkedin.com/company/grandcentrix> | phone: +49-221-677-860-0 
|?email: hello at grandcentrix.net <mailto:hello@grandcentrix.net>



Amtsgericht K?ln | HRB ?70119 | Gesch?ftsf?hrer: R. Rottmann, M. Willnow | 
USt.-IdNr.: DE266333969
