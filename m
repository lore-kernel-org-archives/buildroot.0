From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 22:50:41 +0100
Subject: [Buildroot] [git commit] gr-osmosdr: new package
Message-ID: <20160302202755.D94DE7FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89d210449c7c410ddc8524b595b070f425d515af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for gr-osmosdr - a GNU Radio block for interfacing with various
radio hardware.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Thomas:
 - instead of selecting BR2_PACKAGE_GNURADIO, use "depends
   on". Indeed, it is fairly obvious for a user that some GNURadio
   extensions require GNURadio to be built. And it avoids the need to
   replicate all the complex dependencies of GNURadio.
 - remove comment that the Python support needs Python. It's fairly
   obvious, no?
 - remove comment about the thread dependency of
   BR2_PACKAGE_GR_OSMOSDR_RTLSDR, since anyway GNURadio already need
   threads. Yes, we sometimes still add such dependencies, but in the
   case of GNURadio, it's highly unlikely that GNURadio will ever
   loose the thread dependency.
 - use "NO" instead of "no" as the value for
   GR_OSMOSDR_SUPPORTS_IN_SOURCE_BUILD since we always use upper-case
   letters for the value of such booleans.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/gr-osmosdr/Config.in       | 37 +++++++++++++++++++++++++
 package/gr-osmosdr/gr-osmosdr.hash |  2 ++
 package/gr-osmosdr/gr-osmosdr.mk   | 55 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 95 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index eba5c9a..c0b3b17 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1299,6 +1299,7 @@ menu "Miscellaneous"
 	source "package/empty/Config.in"
 	source "package/gnuradio/Config.in"
 	source "package/googlefontdirectory/Config.in"
+	source "package/gr-osmosdr/Config.in"
 	source "package/haveged/Config.in"
 	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
new file mode 100644
index 0000000..aa6ef0d
--- /dev/null
+++ b/package/gr-osmosdr/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_GR_OSMOSDR
+	bool "gr-osmosdr"
+	depends on BR2_PACKAGE_GNURADIO
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	help
+	  GNU Radio block for interfacing with various radio hardware
+
+if BR2_PACKAGE_GR_OSMOSDR
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
+config BR2_PACKAGE_GR_OSMOSDR_RTLSDR
+	bool "Osmocom RTLSDR support"
+	select BR2_PACKAGE_LIBRTLSDR
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
index 0000000..6a0cc26
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
+GR_OSMOSDR_SUPPORTS_IN_SOURCE_BUILD = NO
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
