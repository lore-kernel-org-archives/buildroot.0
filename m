From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 21 Jul 2015 13:11:40 +0300
Subject: [Buildroot] [PATCH] openipmi: new package
Message-ID: <6a0b19385e58f845152f7bad579fcb89ee11de64.1437473500.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OpenIPMI provides libraries and command line tools for interacting with IPMI
enabled devices.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/Config.in              |  1 +
 package/openipmi/Config.in     | 16 ++++++++++++++++
 package/openipmi/openipmi.hash |  2 ++
 package/openipmi/openipmi.mk   | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 package/openipmi/Config.in
 create mode 100644 package/openipmi/openipmi.hash
 create mode 100644 package/openipmi/openipmi.mk

diff --git a/package/Config.in b/package/Config.in
index 20ecd38534b2..9942e3a77285 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -390,6 +390,7 @@ endif
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
 	source "package/open2300/Config.in"
+	source "package/openipmi/Config.in"
 	source "package/openocd/Config.in"
 	source "package/openpowerlink/Config.in"
 	source "package/owl-linux/Config.in"
diff --git a/package/openipmi/Config.in b/package/openipmi/Config.in
new file mode 100644
index 000000000000..667efa74a863
--- /dev/null
+++ b/package/openipmi/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_OPENIPMI
+	bool "openipmi"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlopen()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_NCURSES
+	help
+	  IPMI allows remote monitoring and remote management of
+	  devices. OpenIPMI provides a library and command line tools
+	  to interact with IPMI enabled devices. OpenIPMI also provides
+	  an IPMI BMC simulator.
+
+comment "openipmi needs a toolchain w/ dynamic library, threads"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
new file mode 100644
index 000000000000..3a40f6068f60
--- /dev/null
+++ b/package/openipmi/openipmi.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
+sha1 54f63ab7fe09f6a4b0b718601fe9c61014aa220b OpenIPMI-2.0.21.tar.gz
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
new file mode 100644
index 000000000000..1d8960ee3107
--- /dev/null
+++ b/package/openipmi/openipmi.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# openipmi
+#
+################################################################################
+
+OPENIPMI_VERSION = 2.0.21
+OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
+OPENIPMI_SOURCE = OpenIPMI-2.0.21.tar.gz
+OPENIPMI_LICENSE = LGPLv2+, GPLv2+, BSD-3c
+OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
+OPENIPMI_DEPENDENCIES = popt ncurses host-pkgconf
+OPENIPMI_CONF_ENV = ac_cv_path_pkgprog="$(PKG_CONFIG_HOST_BINARY)"
+OPENIPMI_CONF_OPTS = \
+		--with-glib=no \
+		--with-glib12=no \
+		--with-tcl=no \
+		--with-perl=no \
+		--with-python=no \
+		--with-swig=no
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPENIPMI_DEPENDENCIES += openssl
+OPENIPMI_CONF_OPTS += --with-openssl=yes
+else
+OPENIPMI_CONF_OPTS += --with-openssl=no
+endif
+
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+OPENIPMI_DEPENDENCIES += netsnmp
+OPENIPMI_CONF_OPTS += --with-ucdsnmp=yes
+else
+OPENIPMI_CONF_OPTS += --with-ucdsnmp=no
+endif
+
+$(eval $(autotools-package))
-- 
2.1.4
