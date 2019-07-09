From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue,  9 Jul 2019 09:45:50 +0200
Subject: [Buildroot] [PATCH 2/3] package: remove common prefix/suffix from
 git-fetched packages
In-Reply-To: <20190709074551.22747-1-victor.huesca@bootlin.com>
References: <20190709074551.22747-1-victor.huesca@bootlin.com>
Message-ID: <20190709074551.22747-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While many project name their git tags <version> where <version> is
just the version number, some project add other prefix/suffix to their
version number. Common cases are:
- Add 'v' like '<pkg>_VERSION = v0.3.1'
- Add the package name (often separeted with a '/', '-' or '.') like
  '<pkg>_VERSION = <pkg>-1.5.2' or '<pkg>_VERSION = <pkg>/1.5.2'.
- Add a generic suffix like '-release', '-dev' or 'debian'
- Any combinaison of the those.

In Buildroot, we currently encode the full version (with its
prefix/suffix) in the <pkg>_VERSION variable. However, that doesn't
work well to match version numbers with the release-monitoring.org
website, which filters such prefixes/suffixes.

This commit rely on the '<pkg>_DL_VERSION' variable.

Other corner-case witch very specific prefix/suffix will be handle
by a separate commit.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 boot/lpc32xxcdl/lpc32xxcdl.mk               | 3 ++-
 package/at/at.mk                            | 3 ++-
 package/dt-utils/dt-utils.mk                | 3 ++-
 package/f2fs-tools/f2fs-tools.mk            | 3 ++-
 package/fio/fio.mk                          | 3 ++-
 package/gstreamer1/gst1-shark/gst1-shark.mk | 3 ++-
 package/linux-zigbee/linux-zigbee.mk        | 3 ++-
 package/netcat-openbsd/netcat-openbsd.mk    | 3 ++-
 package/speexdsp/speexdsp.mk                | 3 ++-
 package/trace-cmd/trace-cmd.mk              | 3 ++-
 10 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/boot/lpc32xxcdl/lpc32xxcdl.mk b/boot/lpc32xxcdl/lpc32xxcdl.mk
index 30afed050b..6f3c929f0e 100644
--- a/boot/lpc32xxcdl/lpc32xxcdl.mk
+++ b/boot/lpc32xxcdl/lpc32xxcdl.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LPC32XXCDL_VERSION = lpc32xx_cdl_v2.11
+LPC32XXCDL_VERSION = 2.11
+LPC32XXCDL_DL_VERSION = lpc32xx_cdl_v$(LPC32XXCDL_VERSION)
 LPC32XXCDL_SITE = http://git.lpcware.com/lpc3xxx_cdl.git
 LPC32XXCDL_SITE_METHOD = git
 
diff --git a/package/at/at.mk b/package/at/at.mk
index 36aa8c7a42..93e33be19c 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-AT_VERSION = release/3.1.23
+AT_VERSION = 3.1.23
+AT_DL_VERSION = release/$(AT_VERSION)
 AT_SITE = https://salsa.debian.org/debian/at.git
 AT_SITE_METHOD = git
 # Tried to add missing deps for parsetime.l but still parallel build fails
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
index 25c287d434..7b503f3b02 100644
--- a/package/dt-utils/dt-utils.mk
+++ b/package/dt-utils/dt-utils.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-DT_UTILS_VERSION = v2019.01.0
+DT_UTILS_VERSION = 2019.01.0
+DT_UTILS_DL_VERSION = v$(DT_UTILS_VERSION)
 DT_UTILS_SITE = https://git.pengutronix.de/git/tools/dt-utils
 DT_UTILS_SITE_METHOD = git
 DT_UTILS_LICENSE = GPL-2.0
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index ba16218bda..424db55a63 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = v1.11.0
+F2FS_TOOLS_VERSION = 1.11.0
+F2FS_TOOLS_DL_VERSION = v$(F2FS_TOOLS_VERSION)
 F2FS_TOOLS_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 F2FS_TOOLS_SITE_METHOD = git
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 34e24e55de..f31c181b63 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-FIO_VERSION = fio-3.9
+FIO_VERSION = 3.9
+FIO_DL_VERSION = fio-$(FIO_VERSION)
 FIO_SITE = git://git.kernel.dk/fio.git
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
diff --git a/package/gstreamer1/gst1-shark/gst1-shark.mk b/package/gstreamer1/gst1-shark/gst1-shark.mk
index cdf3145429..3e3352d3e0 100644
--- a/package/gstreamer1/gst1-shark/gst1-shark.mk
+++ b/package/gstreamer1/gst1-shark/gst1-shark.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-GST1_SHARK_VERSION = v0.6.0
+GST1_SHARK_VERSION = 0.6.0
+GST1_SHARK_DL_VERSION = v$(GST1_SHARK_VERSION)
 GST1_SHARK_SITE =  https://github.com/RidgeRun/gst-shark.git
 GST1_SHARK_SITE_METHOD = git
 GST1_SHARK_GIT_SUBMODULES = YES
diff --git a/package/linux-zigbee/linux-zigbee.mk b/package/linux-zigbee/linux-zigbee.mk
index 8d3248f2e1..3f1174492e 100644
--- a/package/linux-zigbee/linux-zigbee.mk
+++ b/package/linux-zigbee/linux-zigbee.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LINUX_ZIGBEE_VERSION = v0.3.1
+LINUX_ZIGBEE_VERSION = 0.3.1
+LINUX_ZIGBEE_DL_VERSION = v$(LINUX_ZIGBEE_VERSION)
 LINUX_ZIGBEE_SITE = git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee
 LINUX_ZIGBEE_LICENSE = GPL-2.0
 LINUX_ZIGBEE_LICENSE_FILES = COPYING
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index a2333531c0..41a3035c42 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = debian/1.195-2
+NETCAT_OPENBSD_VERSION = 1.195-2
+NETCAT_OPENBSD_DL_VERSION = debian/$(NETCAT_OPENBSD_VERSION)
 NETCAT_OPENBSD_SITE = https://salsa.debian.org/debian/netcat-openbsd.git
 NETCAT_OPENBSD_SITE_METHOD = git
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
diff --git a/package/speexdsp/speexdsp.mk b/package/speexdsp/speexdsp.mk
index f5a46cd9de..a357258614 100644
--- a/package/speexdsp/speexdsp.mk
+++ b/package/speexdsp/speexdsp.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-SPEEXDSP_VERSION = SpeexDSP-1.2.0
+SPEEXDSP_VERSION = 1.2.0
+SPEEXDSP_DL_VERSION = SpeexDSP-$(SPEEXDSP_VERSION)
 SPEEXDSP_SITE = https://git.xiph.org/speexdsp.git
 SPEEXDSP_SITE_METHOD = git
 SPEEXDSP_LICENSE = BSD-3-Clause
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index dfca6a170d..9440fafe17 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = trace-cmd-v2.7
+TRACE_CMD_VERSION = 2.7
+TRACE_CMD_DL_VERSION = trace-cmd-v$(TRACE_CMD_VERSION)
 TRACE_CMD_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_INSTALL_STAGING = YES
-- 
2.21.0
