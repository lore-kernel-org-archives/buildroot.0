From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 16:41:56 +0200
Subject: [Buildroot] [git commit branch/next] ibrcommon: new package
Message-ID: <20150829144252.5641781D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d45e6bf09d0413742457b371762b09e69cf22829
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
  - add package in package/Config.in, to make it visible in menuconfig
  - make the openssl, libnl and libxml2 dependencies optional, since
    they are definitely not mandatory
  - add README to the license files, since it contains useful
    licensing related information.
  - remove custom INSTALL_STAGING_OPTS and INSTALL_TARGET_OPTS since
    the package uses automake.
  - add missing final newline in Config.in and .mk file.]

Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/ibrcommon/Config.in    |   14 ++++++++++++++
 package/ibrcommon/ibrcommon.mk |   35 +++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 68b3aa8..36f8f1c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -980,6 +980,7 @@ menu "Networking"
 	source "package/fmlib/Config.in"
 	source "package/geoip/Config.in"
 	source "package/glib-networking/Config.in"
+	source "package/ibrcommon/Config.in"
 	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcurl/Config.in"
diff --git a/package/ibrcommon/Config.in b/package/ibrcommon/Config.in
new file mode 100644
index 0000000..5aa51a4
--- /dev/null
+++ b/package/ibrcommon/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_IBRCOMMON
+	bool "ibrcommon"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  IBR-DTN is a small dtn application that supports:
+	  Bundle Protocol RFC 5050
+	  Bundle Security Protocol RFC 6257
+
+	  http://trac.ibr.cs.tu-bs.de/project-cm-2012-ibrdtn
+
+comment "ibrcommon needs a toolchain w/ C++, threads"
+        depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ibrcommon/ibrcommon.mk b/package/ibrcommon/ibrcommon.mk
new file mode 100644
index 0000000..282bfb0
--- /dev/null
+++ b/package/ibrcommon/ibrcommon.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# ibrcommon
+#
+################################################################################
+
+IBRCOMMON_VERSION = 1.0.1
+IBRCOMMON_SOURCE = ibrcommon-$(IBRCOMMON_VERSION).tar.gz
+IBRCOMMON_SITE = https://www.ibr.cs.tu-bs.de/projects/ibr-dtn/releases/
+IBRCOMMON_INSTALL_STAGING = YES
+IBRCOMMON_LICENSE = Apache-2.0
+IBRCOMMON_LICENSE_FILES = COPYING README
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+IBRCOMMON_DEPENDENCIES += openssl
+IBRCOMMON_CONF_OPTS += --with-openssl
+else
+IBRCOMMON_CONF_OPTS += --without-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+IBRCOMMON_DEPENDENCIES += libnl
+IBRCOMMON_CONF_OPTS += --with-lowpan
+else
+IBRCOMMON_CONF_OPTS += --without-lowpan
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+IBRCOMMON_DEPENDENCIES += libxml2
+IBRCOMMON_CONF_OPTS += --with-xml
+else
+IBRCOMMON_CONF_OPTS += --without-xml
+endif
+
+$(eval $(autotools-package))
