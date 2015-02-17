From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue, 17 Feb 2015 18:55:14 +0100
Subject: [Buildroot] [PATCH 4/4] GNURadio: new package
In-Reply-To: <1424195714-15903-1-git-send-email-gwenj@trabucayre.com>
References: <1424195714-15903-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1424195714-15903-4-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/Config.in            |  1 +
 package/gnuradio/Config.in   | 44 ++++++++++++++++++++++++++++++++++++++++++++
 package/gnuradio/gnuradio.mk | 24 ++++++++++++++++++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 package/gnuradio/Config.in
 create mode 100644 package/gnuradio/gnuradio.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..37235d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1034,6 +1034,7 @@ menu "Miscellaneous"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
 	source "package/empty/Config.in"
+	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
new file mode 100644
index 0000000..826e6fc
--- /dev/null
+++ b/package/gnuradio/Config.in
@@ -0,0 +1,44 @@
+config BR2_PACKAGE_GNURADIO
+	bool "GNURadio"
+	depends on BR2_INET_IPV6
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_PYTHON
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_TEST
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_PYTHON
+
+	help
+	  GNU Radio is a free & open-source software development toolkit that
+	  provides signal processing blocks to implement software radios. It can be
+	  used with readily-available low-cost external RF hardware to create
+	  software-defined radios, or without hardware in a simulation-like
+	  environment. It is widely used in hobbyist, academic and commercial
+	  environments to support both wireless communications research and
+	  real-world radio systems.
+
+	  http://gnuradio.org/
+
+comment "GNURadio needs a toolchain w/ C++, mmu, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_MMU \
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS \
+		&& BR2_LARGEFILE && BR2_INET_IPV6)
+
+
+if BR2_PACKAGE_GNURADIO
+
+config BR2_PACKAGE_GNURADIO_BLOCKS
+	bool "gnuradio-blocks"
+
+config BR2_PACKAGE_GNURADIO_PYTHON
+	bool "gnuradio-python"
+
+endif
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
new file mode 100644
index 0000000..9ea8db9
--- /dev/null
+++ b/package/gnuradio/gnuradio.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# gnuradio
+#
+################################################################################
+
+GNURADIO_VERSION = 2bb2b31476cb33e9c1bbb196fffba3a857b4f75a
+GNURADIO_SITE = git://git.gnuradio.org/gnuradio
+GNURADIO_LICENSE = GPLv3+
+GNURADIO_LICENSE_FILES = COPYING
+
+GNURADIO_BUILD_DIR = build
+#needed for volk compile
+GNURADIO_DEPENDENCIES += host-python-cheetah
+GNURADIO_DEPENDENCIES += host-swig host-boost boost
+GNURADIO_INSTALL_STAGING = YES
+
+GNURADIO_CONF_OPTS += -DENABLE_DEFAULT=OFF -DENABLE_TESTING=OFF
+GNURADIO_CONF_OPTS += -DENABLE_VOLK=ON -DENABLE_GNURADIO_RUNTIME=ON
+
+GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=$(if $(BR2_PACKAGE_GNURADIO_BLOCKS),ON,OFF)
+GNURADIO_CONF_OPTS += -DENABLE_PYTHON=$(if $(BR2_PACKAGE_GNURADIO_PYTHON),ON,OFF)
+
+$(eval $(cmake-package))
-- 
2.0.5
