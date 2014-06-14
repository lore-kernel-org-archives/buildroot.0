From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:00:00 +0200
Subject: [Buildroot] [git commit] fmc: new package
Message-ID: <20140614170014.921B39CFE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da686994469806dcb7239dee8aa9b06de57820e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in     |    1 +
 package/fmc/Config.in |   19 +++++++++++++++++++
 package/fmc/fmc.mk    |   31 +++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 33f3c73..9627d50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -922,6 +922,7 @@ endif
 	source "package/ebtables/Config.in"
 	source "package/ethtool/Config.in"
 	source "package/faifa/Config.in"
+	source "package/fmc/Config.in
 	source "package/foomatic-filters/Config.in"
 	source "package/fping/Config.in"
 	source "package/gesftpserver/Config.in"
diff --git a/package/fmc/Config.in b/package/fmc/Config.in
new file mode 100644
index 0000000..35de28e
--- /dev/null
+++ b/package/fmc/Config.in
@@ -0,0 +1,19 @@
+comment "fmc needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_FMC
+	bool "fmc"
+	depends on BR2_powerpc_e500mc
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_TCLAP
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_FMLIB
+	help
+	  The Frame Manager Configuration tool is Freescale PowerPC platform
+	  software package whose primary purpose is converting
+	  Parse-Classify-Police-Distribute (PCD) descriptions of network
+	  packets flow into hardware configuration. The tool provides an
+	  abstraction layer between the end customer's vision of the PCD task
+	  definition and real hardware implementation.
+
+	  http://cache.freescale.com/files/32bit/doc/app_note/AN4760.pdf
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
new file mode 100644
index 0000000..f9091c0
--- /dev/null
+++ b/package/fmc/fmc.mk
@@ -0,0 +1,31 @@
+###############################################################################
+#
+# fmc
+#
+###############################################################################
+
+FMC_VERSION = fsl-sdk-v1.5-rc3
+FMC_SITE = git://git.freescale.com/ppc/sdk/fmc.git
+FMC_LICENSE = MIT
+FMC_LICENSE_FILES = COPYING
+FMC_DEPENDENCIES = libxml2 tclap fmlib
+
+FMC_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
+	FMD_USPACE_HEADER_PATH="$(STAGING_DIR)/usr/include/fmd" \
+	FMD_USPACE_LIB_PATH="$(STAGING_DIR)/usr/lib" \
+	LIBXML2_HEADER_PATH="$(STAGING_DIR)/usr/include/libxml2" \
+	TCLAP_HEADER_PATH="$(STAGING_DIR)/usr/include"
+
+define FMC_BUILD_CMDS
+	# The linking step has dependency issues so using MAKE1
+	$(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) -C $(@D)/source
+endef
+
+define FMC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/source/fmc $(TARGET_DIR)/usr/sbin/fmc
+	cp -dpfr $(@D)/etc/fmc $(TARGET_DIR)/etc/
+endef
+
+$(eval $(generic-package))
