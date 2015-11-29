From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:53:25 +0100
Subject: [Buildroot] [git commit branch/next] spi-tools: new package
Message-ID: <20151129145520.0C6A081DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ed8750b4313bf26798c063c83a071995c90bb40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package contains some simple command line tools to help using Linux
spidev devices.

https://github.com/cpb-/spi-tools

The included version is based in a sha1 and not a tagged version as the
current master branch contains autotools support for build but there is
no tagged version with autotools support yet.

The only other quirk with the recipe is related to the VERSION define
which is normally obtained in build time via git for this package, but
that would fail within Buildroot as the package build is normally not
performed inside a git repository.
To work around that, I have added a hook which will substitute change
the VERSION to match that of the Buildroot package.

I have tested this package in an ARM target with a custom SPI device.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/spi-tools/Config.in      |    7 +++++++
 package/spi-tools/spi-tools.hash |    2 ++
 package/spi-tools/spi-tools.mk   |   24 ++++++++++++++++++++++++
 4 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9e3494a..658dc03 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -417,6 +417,7 @@ endif
 	source "package/smartmontools/Config.in"
 	source "package/smstools3/Config.in"
 	source "package/snowball-hdmiservice/Config.in"
+	source "package/spi-tools/Config.in"
 	source "package/sredird/Config.in"
 	source "package/statserial/Config.in"
 	source "package/stm32flash/Config.in"
diff --git a/package/spi-tools/Config.in b/package/spi-tools/Config.in
new file mode 100644
index 0000000..8d26344
--- /dev/null
+++ b/package/spi-tools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SPI_TOOLS
+	bool "spi-tools"
+	help
+	  This package contains some simple command line tools to help
+	  using Linux spidev devices.
+
+	  https://github.com/cpb-/spi-tools
diff --git a/package/spi-tools/spi-tools.hash b/package/spi-tools/spi-tools.hash
new file mode 100644
index 0000000..61ccd5e
--- /dev/null
+++ b/package/spi-tools/spi-tools.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256	52ab1f1de29afbac95983f5af58adcb1807e1f3479a897e9331e020b5cfa296f  spi-tools-cc6a41fdcec60610703ba6db488c621c64952898.tar.gz
diff --git a/package/spi-tools/spi-tools.mk b/package/spi-tools/spi-tools.mk
new file mode 100644
index 0000000..f3df435
--- /dev/null
+++ b/package/spi-tools/spi-tools.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# spi-tools
+#
+################################################################################
+
+# git commit sha1 is used as there is no release tag with autotools support yet
+SPI_TOOLS_VERSION = cc6a41fdcec60610703ba6db488c621c64952898
+SPI_TOOLS_SITE = $(call github,cpb-,spi-tools,$(SPI_TOOLS_VERSION))
+# autoreconf must be run as specified in package documentation
+SPI_TOOLS_AUTORECONF = YES
+SPI_TOOLS_LICENSE = GPLv2
+SPI_TOOLS_LICENSE_FILES = LICENSE
+
+# Package attempts to use git to obtain version, that fails within Buildroot.
+# To avoid it, set the GIT_VERSION variable to the Buildroot package version.
+define SPI_TOOLS_SET_VERSION
+	$(SED) "s/^\(GIT_VERSION:=\).*/\1$(SPI_TOOLS_VERSION)/" \
+		$(@D)/src/Makefile.am
+endef
+
+SPI_TOOLS_POST_PATCH_HOOKS = SPI_TOOLS_SET_VERSION
+
+$(eval $(autotools-package))
