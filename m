From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 18:14:04 +0200
Subject: [Buildroot] [git commit] ibrdtn: new package
Message-ID: <20150901083108.D5E3B7F95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c964e320f2676f1bc36cbebeba102c440815d7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - Add missing include in package/Config.in to make the package
    appear in menuconfig.
  - Fix the comment dependencies: the comment should be shown either
    if C++ is not available *or* if threads are not supported.
  - Add a hash file.
  - Add missing dependency on host-pkgconf, since pkg-config is used
    to detect the availability of ibrcommon.
  - Remove the custom INSTALL_STAGING_OPTS and INSTALL_TARGET_OPTS:
    they are not needed since automake is used.
  - Make --with-compression conditional on whether zlib is available.
  - Add optional dependency on libglib2.
  - Add missing final newlines in .mk and Config.in files.]

Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/ibrdtn/Config.in   |   16 ++++++++++++++++
 package/ibrdtn/ibrdtn.hash |    2 ++
 package/ibrdtn/ibrdtn.mk   |   30 ++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 36f8f1c..3da201a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -981,6 +981,7 @@ menu "Networking"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
 	source "package/ibrcommon/Config.in"
+	source "package/ibrdtn/Config.in"
 	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcurl/Config.in"
diff --git a/package/ibrdtn/Config.in b/package/ibrdtn/Config.in
new file mode 100644
index 0000000..5698315
--- /dev/null
+++ b/package/ibrdtn/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_IBRDTN
+	bool "ibrdtn"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_IBRCOMMON
+	help
+	  IBR-DTN is a small dtn application that supports:
+	  Bundle Protocol RFC 5050
+	  Bundle Security Protocol RFC 6257
+
+	  This package contains the ibrdtn library.
+
+	  http://trac.ibr.cs.tu-bs.de/project-cm-2012-ibrdtn
+
+comment "ibrdtn needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ibrdtn/ibrdtn.hash b/package/ibrdtn/ibrdtn.hash
new file mode 100644
index 0000000..5f23327
--- /dev/null
+++ b/package/ibrdtn/ibrdtn.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	  288b14ccbaefb5e3234065c2778c247797ccb3c7afbb6746bb37dc12c620d360	ibrdtn-1.0.1.tar.gz
diff --git a/package/ibrdtn/ibrdtn.mk b/package/ibrdtn/ibrdtn.mk
new file mode 100644
index 0000000..aab27a8
--- /dev/null
+++ b/package/ibrdtn/ibrdtn.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# ibrdtn
+#
+################################################################################
+
+IBRDTN_VERSION = 1.0.1
+IBRDTN_SOURCE = ibrdtn-$(IBRDTN_VERSION).tar.gz
+IBRDTN_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRDTN_INSTALL_STAGING = YES
+IBRDTN_LICENSE = Apache-2.0
+IBRDTN_LICENSE_FILES = COPYING
+IBRDTN_DEPENDENCIES = ibrcommon host-pkgconf
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+IBRDTN_CONF_OPTS += --with-compression
+IBRDTN_DEPENDENCIES += zlib
+else
+IBRDTN_CONF_OPTS += --without-compression
+IBRDTN_DEPENDENCIES += zlib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+IBRDTN_CONF_OPTS += --with-glib
+IBRDTN_DEPENDENCIES += libglib2
+else
+IBRDTN_CONF_OPTS += --without-glib
+endif
+
+$(eval $(autotools-package))
