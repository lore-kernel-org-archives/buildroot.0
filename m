From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue,  2 Feb 2016 18:37:42 +0100
Subject: [Buildroot] [PATCH v2] gr-osmosdr: new package
Message-ID: <1454434662-4679-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Add support for gr-osmosdr - a GNU Radio block for interfacing with various
radio hardware.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
	- use github instead of tarball (issue with hash changed for same archive
	  content);
	- use 'select' gnuradio instead of 'depends on' gnuradio;
	- due to previous point add gnuradio list of  dependencies;
	- gr-osmosdr need gnuradio-block -> add select.
---
 package/Config.in                  |  1 +
 package/gr-osmosdr/Config.in       | 56 ++++++++++++++++++++++++++++++++++++++
 package/gr-osmosdr/gr-osmosdr.hash |  2 ++
 package/gr-osmosdr/gr-osmosdr.mk   | 55 +++++++++++++++++++++++++++++++++++++
 4 files changed, 114 insertions(+)
 create mode 100644 package/gr-osmosdr/Config.in
 create mode 100644 package/gr-osmosdr/gr-osmosdr.hash
 create mode 100644 package/gr-osmosdr/gr-osmosdr.mk

diff --git a/package/Config.in b/package/Config.in
index a491d85..9ff97c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1271,6 +1271,7 @@ menu "Miscellaneous"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
+	source "package/gr-osmosdr/Config.in"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
new file mode 100644
index 0000000..9218fdc
--- /dev/null
+++ b/package/gr-osmosdr/Config.in
@@ -0,0 +1,56 @@
+comment "gr-omsmosdr needs a toolchain w/ C++, NPTL, wchar, dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_GR_OSMOSDR
+	bool "gr-osmosdr"
+	depends on BR2_INSTALL_LIBSTDCPP # gnuradio
+	depends on !BR2_STATIC_LIBS # gnuradio
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # gnuradio
+	depends on BR2_USE_MMU # use fork()
+	depends on BR2_USE_WCHAR # gnuradio
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # gnuradio
+	select BR2_PACKAGE_GNURADIO
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	help
+	  GNU Radio block for interfacing with various radio hardware
+
+if BR2_PACKAGE_GR_OSMOSDR
+
+comment "gr-osmosdr-python needs gnuradio w/ python support"
+	depends on !BR2_PACKAGE_GNURADIO_PYTHON
+
+config BR2_PACKAGE_GR_OSMOSDR_PYTHON
+	bool "python support"
+	depends on BR2_PACKAGE_GNURADIO_PYTHON
+	help
+	  Enable Python support
+
+config BR2_PACKAGE_GR_OSMOSDR_IQFILE
+	bool "IQ File Source support"
+	help
+	  Enable IQ File Source support
+
+comment "gr-osmodr-rtlsdr needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_GR_OSMOSDR_RTLSDR
+	bool "Osmocom RTLSDR support"
+	select BR2_PACKAGE_LIBRTLSDR
+	depends on BR2_TOOLCHAIN_HAS_THREADS # librtlsdr
+	help
+	  Enable Osmocom RTLSDR support
+
+config BR2_PACKAGE_GR_OSMOSDR_RTLSDR_TCP
+	bool "RTLSDR TCP Client support"
+	help
+	  Enable RTLSDR TCP client support
+
+config BR2_PACKAGE_GR_OSMOSDR_RFSPACE
+	bool "RFSPACE Receivers support"
+	help
+	  Enable RFSPACE Receivers support
+
+endif
diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
new file mode 100644
index 0000000..ce6e84a
--- /dev/null
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -0,0 +1,2 @@
+# Locally calculated:
+sha256 d40462dddc0ebd769b2df3c6ad6fe82c9e9a4a73f7b3c5ce53efbce724906290 gr-osmosdr-a45968f3381f33b86ca344bb76bd62c131d98d93.tar.gz
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
new file mode 100644
index 0000000..3f32220
--- /dev/null
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# gr-osmosdr
+#
+################################################################################
+
+GR_OSMOSDR_VERSION = a45968f3381f33b86ca344bb76bd62c131d98d93
+GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,$(GR_OSMOSDR_VERSION))
+GR_OSMOSDR_LICENSE = GPLv3+
+GR_OSMOSDR_LICENSE_FILES = COPYING
+
+# gr-osmosdr prevents doing an in-source-tree build
+GR_OSMOSDR_SUPPORTS_IN_SOURCE_BUILD = no
+
+GR_OSMOSDR_DEPENDENCIES = gnuradio
+
+GR_OSMOSDR_CONF_OPTS = -DENABLE_DEFAULT=OFF
+
+# For third-party blocks, the gr-osmosdr libraries are mandatory at
+# compile time.
+GR_OSMOSDR_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_GR_OSMOSDR_PYTHON),y)
+GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
+GR_OSMOSDR_DEPENDENCIES += python
+else
+GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GR_OSMOSDR_IQFILE),y)
+GR_OSMOSDR_CONF_OPTS += -DENABLE_FILE=ON
+else
+GR_OSMOSDR_CONF_OPTS += -DENABLE_FILE=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GR_OSMOSDR_RTLSDR),y)
+GR_OSMOSDR_CONF_OPTS += -DENABLE_RTL=ON
+GR_OSMOSDR_DEPENDENCIES += librtlsdr
+else
+GR_OSMOSDR_CONF_OPTS += -DENABLE_RTL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GR_OSMOSDR_RTLSDR_TCP),y)
+GR_OSMOSDR_CONF_OPTS += -DENABLE_RTL_TCP=ON
+else
+GR_OSMOSDR_CONF_OPTS += -DENABLE_RTL_TCP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GR_OSMOSDR_RFSPACE),y)
+GR_OSMOSDR_CONF_OPTS += -DENABLE_RFSPACE=ON
+else
+GR_OSMOSDR_CONF_OPTS += -DENABLE_RFSPACE=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.4.10
