From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jun 2014 08:02:06 -0700
Subject: [Buildroot] [PATCH 3/3] fmc: new package
In-Reply-To: <1402412526-24844-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1402412526-24844-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1402412526-24844-4-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/Config.in     |    1 +
 package/fmc/Config.in |   14 ++++++++++++++
 package/fmc/fmc.mk    |   31 +++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 package/fmc/Config.in
 create mode 100644 package/fmc/fmc.mk

diff --git a/package/Config.in b/package/Config.in
index ac3af6b..f874eaf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -918,6 +918,7 @@ source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
+source "package/fmc/Config.in
 source "package/foomatic-filters/Config.in"
 source "package/fping/Config.in"
 source "package/gesftpserver/Config.in"
diff --git a/package/fmc/Config.in b/package/fmc/Config.in
new file mode 100644
index 0000000..9530756
--- /dev/null
+++ b/package/fmc/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FMC
+	bool "fmc"
+	depends on BR2_powerpc_e500mc
+	select BR2_PACKAGE_TCLAP
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_FMLIB
+	help
+	  The Frame Manager Configuration tool is a software package whose primary
+	  purpose is converting Parse-Classify-Police-Distribute (PCD) descriptions of
+	  network packets flow into hardware configuration. The tool provides an
+	  abstraction layer between the end customer's vision of the PCD task
+	  definition and real hardware implementation.
+
+	  http://cache.freescale.com/files/32bit/doc/app_note/AN4760.pdf
diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
new file mode 100644
index 0000000..513a8ef
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
+	cp -dr --no-preserve=ownership $(@D)/etc/fmc $(TARGET_DIR)/etc/
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
