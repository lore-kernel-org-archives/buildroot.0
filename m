From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu, 14 Jan 2016 17:25:24 +0100
Subject: [Buildroot] [PATCH 1/1] gr-osmosdr: new package
Message-ID: <1452788724-10250-1-git-send-email-gwenj@trabucayre.com>
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
 package/Config.in                  |  1 +
 package/gr-osmosdr/Config.in       | 50 +++++++++++++++++++++++++++++++++++++
 package/gr-osmosdr/gr-osmosdr.hash |  2 ++
 package/gr-osmosdr/gr-osmosdr.mk   | 51 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 package/gr-osmosdr/Config.in
 create mode 100644 package/gr-osmosdr/gr-osmosdr.hash
 create mode 100644 package/gr-osmosdr/gr-osmosdr.mk

diff --git a/package/Config.in b/package/Config.in
index 89b23db..e86264c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1266,6 +1266,7 @@ menu "Miscellaneous"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
+	source "package/gr-osmosdr/Config.in"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
new file mode 100644
index 0000000..b49a1e9
--- /dev/null
+++ b/package/gr-osmosdr/Config.in
@@ -0,0 +1,50 @@
+comment "gr-osmosdr needs gnuradio support"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_GNURADIO
+
+config BR2_PACKAGE_GR_OSMOSDR
+	bool "gr-osmosdr"
+	depends on BR2_USE_MMU # use fork()
+	depends on BR2_PACKAGE_GNURADIO
+	help
+	  GNU Radio block for interfacing with various radio hardware
+
+if BR2_PACKAGE_GR_OSMOSDR
+
+comment "gr-osmosdr-python needs gnuradio with python support"
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
+	select BR2_PACKAGE_GNURADIO_BLOCKS
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
+	select BR2_PACKAGE_GNURADIO_BLOCKS
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
index 0000000..a65ed30
--- /dev/null
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -0,0 +1,2 @@
+# Locally calculated:
+sha256 5df3faa49e76a9f66a37755f20b5c9238550f913b0dbd9214f811415ec61b1b3 gr-osmosdr-0.1.4.tar.gz
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
new file mode 100644
index 0000000..1ea711e
--- /dev/null
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# gr-osmosdr
+#
+################################################################################
+
+GR_OSMOSDR_VERSION = 0.1.4
+GR_OSMOSDR_SITE = http://cgit.osmocom.org/gr-osmosdr/snapshot
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
