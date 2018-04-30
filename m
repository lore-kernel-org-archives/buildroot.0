From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:49:35 +0200
Subject: [Buildroot] [git commit] imx-alsa-plugins: new package
Message-ID: <20180430155741.134198A50B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbc43196a47690f74d0b80ee357d24e7e392e8c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Freescale specific alsa-lib plugins for the i.MX processor family.

For now, the only provided plugin is:
  * Rate Converter Plugin Using Freescale ASRC Resampler

The ASRC hardware resampler can be found on i.MX53 and most i.MX 6
processors.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas:
 - Remove the mention "This package is provided by Freescale as-is and
   doesn't have an upstream." from the Config.in help text, since
   according to Gary Bisson, there is a Git repository for such
   projects, and therefore some form of upstream.
 - Add missing entry to DEVELOPERS file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/freescale-imx/Config.in                    |  1 +
 package/freescale-imx/imx-alsa-plugins/Config.in   | 22 ++++++++++++++++++++++
 .../imx-alsa-plugins/imx-alsa-plugins.hash         |  3 +++
 .../imx-alsa-plugins/imx-alsa-plugins.mk           | 21 +++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d8f429f989..bbb586e7db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1036,6 +1036,7 @@ F:	board/lemaker/bananapro/
 F:	configs/bananapro_defconfig
 F:	package/augeas/
 F:	package/bctoolbox/
+F:	package/freescale-imx/imx-alsa-plugins/
 F:	package/libshout/
 F:	package/libupnpp/
 F:	package/luv/
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index d7f260dd7a..97aeb15764 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -71,6 +71,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 
+source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
diff --git a/package/freescale-imx/imx-alsa-plugins/Config.in b/package/freescale-imx/imx-alsa-plugins/Config.in
new file mode 100644
index 0000000000..ec9b5b19cf
--- /dev/null
+++ b/package/freescale-imx/imx-alsa-plugins/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_IMX_ALSA_PLUGINS
+	bool "imx-alsa-plugins"
+	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  ALSA plugins specific for the Freescale i.MX platform. It
+	  requires a kernel that includes the i.MX specific headers
+	  to be built.
+
+	  The following plugins are provided so far:
+	    * Rate Converter Plugin Using Freescale ASRC Hardware
+	      Resampler (i.MX53 and most i.MX6)
+
+comment "imx-alsa-libs needs an imx-specific Linux kernel to be built"
+	depends on BR2_arm
+	depends on !BR2_LINUX_KERNEL
+
+comment "imx-alsa-libs needs a toolchain w/ threads"
+	depends on BR2_arm
+	depends on BR2_LINUX_KERNEL && !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
new file mode 100644
index 0000000000..b0f47080ce
--- /dev/null
+++ b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256  e76a71e9166fbedeaa535fd7ebc07edc30a1e87f529ab2aa733e3603d3183ed0  imx-alsa-plugins-rel_imx_4.9.x_1.0.0_ga.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING.GPL
diff --git a/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
new file mode 100644
index 0000000000..9c81ff0df0
--- /dev/null
+++ b/package/freescale-imx/imx-alsa-plugins/imx-alsa-plugins.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# imx-alsa-plugins
+#
+################################################################################
+
+IMX_ALSA_PLUGINS_VERSION = rel_imx_4.9.x_1.0.0_ga
+IMX_ALSA_PLUGINS_SITE = https://source.codeaurora.org/external/imx/imx-alsa-plugins
+IMX_ALSA_PLUGINS_SITE_METHOD = git
+IMX_ALSA_PLUGINS_LICENSE = GPL-2.0+
+IMX_ALSA_PLUGINS_LICENSE_FILES = COPYING.GPL
+IMX_ALSA_PLUGINS_DEPENDENCIES = host-pkgconf alsa-lib
+
+# git, no configure
+IMX_ALSA_PLUGINS_AUTORECONF = YES
+
+# needs access to imx-specific kernel headers
+IMX_ALSA_PLUGINS_DEPENDENCIES += linux
+IMX_ALSA_PLUGINS_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -idirafter $(LINUX_DIR)/include/uapi"
+
+$(eval $(autotools-package))
