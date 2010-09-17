From: Pierre-Luc Simard <pierreluc.simard@admetric.ca>
Date: Fri, 17 Sep 2010 10:59:55 -0700
Subject: [Buildroot] [PATCH 10/17] TI's DVSDK for DM365 processors
In-Reply-To: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
Message-ID: <1284746402-19186-11-git-send-email-pierreluc.simard@admetric.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ti/Config.in                               |    1 +
 package/ti/ti-dvsdk-dm365/Config.in                |    6 +
 .../ti/ti-dvsdk-dm365/ti-dvsdk-dm365-extract.py    |   52 ++++++++++
 package/ti/ti-dvsdk-dm365/ti-dvsdk-dm365.mk        |  105 ++++++++++++++++++++
 4 files changed, 164 insertions(+), 0 deletions(-)
 create mode 100644 package/ti/ti-dvsdk-dm365/Config.in
 create mode 100644 package/ti/ti-dvsdk-dm365/ti-dvsdk-dm365-extract.py
 create mode 100644 package/ti/ti-dvsdk-dm365/ti-dvsdk-dm365.mk

diff --git a/package/ti/Config.in b/package/ti/Config.in
index 9827b44..d64500e 100644
--- a/package/ti/Config.in
+++ b/package/ti/Config.in
@@ -47,5 +47,6 @@ source "package/ti/ti-cgt6x/Config.in"
 source "package/ti/ti-codec-engine/Config.in"
 source "package/ti/ti-dmai/Config.in"
 source "package/ti/ti-dspbios/Config.in"
+source "package/ti/ti-dvsdk-dm365/Config.in"
 
 endif
diff --git a/package/ti/ti-dvsdk-dm365/Config.in b/package/ti/ti-dvsdk-dm365/Config.in
new file mode 100644
index 0000000..05a798b
--- /dev/null
+++ b/package/ti/ti-dvsdk-dm365/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TI_DVSDK_DM365
+	bool "DVSDK for TI's DM365 processor"
+	depends on BR2_PACKAGE_TI_PLATFORM_dm365 || BR2_PACKAGE_TI_PLATFORM_dm368
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  TI's DVSDK
\ No newline at end of file
diff --git a/package/ti/ti-dvsdk-dm365/ti-dvsdk-dm365-extract.py b/package/ti/ti-dvsdk-dm365/ti-dvsdk-dm365-extract.py
new file mode 100644
index 0000000..8bc1205
--- /dev/null
+++ b/package/ti/ti-dvsdk-dm365/ti-dvsdk-dm365-extract.py
@@ -0,0 +1,52 @@
+#!/usr/bin/env python
+import sys
+from subprocess import Popen, PIPE
+
+
+if len(sys.argv) < 4:
+	print "usage: ",
+	print sys.argv[0],
+	print " <installer> <codesourcery> <destination>"
+	print " "
+	print "    installer   : the DVSDK installer location "
+	print "                   (eg: ~/Downloads/dvsdk_..._setuplinux.bin)"
+	print "    codesourcery: location of the CodeSourcery installation" 
+	print "                   (eg: ~/CodeSourcery/Sourcery_G++_Lite/bin)"
+	print "    destination : where to install the files"
+	print "                   (eg: ~/dvsdk)"
+	sys.exit(2)
+else:
+	installer=sys.argv[1]
+	codesourcery=sys.argv[2]
+	destination=sys.argv[3]
+	print "Installer: ",
+	print installer
+	print "CodeSourcery: ",
+	print codesourcery
+	print "Destination: ",
+	print destination
+
+pb = Popen(installer, shell=False, stdout=PIPE, stdin=PIPE, stderr=PIPE)
+question = 0
+data = pb.stdout.read(1)
+while data:
+	sys.stdout.write(data)
+	if data == ']':
+		if question == 0:
+			pb.stdin.write("Y\n")
+			question = 1
+		elif question == 1:
+			pb.stdin.write(codesourcery)
+			pb.stdin.write("\n")
+			sys.stdout.write(codesourcery)
+			sys.stdout.write("\n")
+			question = 2
+		elif question == 2:
+			pb.stdin.write(destination)
+			pb.stdin.write("\n")
+			sys.stdout.write(destination)
+			sys.stdout.write("\n")
+			question = 3
+	data = pb.stdout.read(1)
+
+sys.exit(pb.wait())
\ No newline at end of file
diff --git a/package/ti/ti-dvsdk-dm365/ti-dvsdk-dm365.mk b/package/ti/ti-dvsdk-dm365/ti-dvsdk-dm365.mk
new file mode 100644
index 0000000..a2fe9d7
--- /dev/null
+++ b/package/ti/ti-dvsdk-dm365/ti-dvsdk-dm365.mk
@@ -0,0 +1,105 @@
+################################################################################
+#
+# ti-dvsdk-dm365
+#
+################################################################################
+TI_DVSDK_DM365_VERSION:=4.00.00.17
+TI_DVSDK_DM365_FILE_VERSION_MAJOR:=4_00
+TI_DVSDK_DM365_FILE_VERSION:=$(TI_DVSDK_DM365_FILE_VERSION_MAJOR)_00_17
+
+TI_DVSDK_DM365_SOURCE:=ti-dvsdk-dm365-$(TI_DVSDK_DM365_VERSION).tar.gz
+TI_DVSDK_DM365_SOURCE_BIN:=dvsdk_dm365-evm_$(TI_DVSDK_DM365_FILE_VERSION)_setuplinux.bin
+TI_DVSDK_DM365_SOURCE_BIN_FOLDER:=dvsdk_dm365-evm_$(TI_DVSDK_DM365_FILE_VERSION)
+TI_DVSDK_DM365_SITE:=http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/dvsdk/DVSDK_$(TI_DVSDK_DM365_FILE_VERSION_MAJOR)/latest/exports
+TI_DVSDK_DM365_DIR:=$(BUILD_DIR)/ti-dvsdk-dm365-$(TI_DVSDK_DM365_VERSION)
+
+TI_DVSDK_DM365_INSTALL_STAGING = NO
+TI_DVSDK_DM365_DEPENDENCIES = linux26 alsa-lib
+
+# The DVSDK installer from TI will REFUSE to install itself if it does not find
+# the right version of the CodeSourcery compiler. This package will download
+# then extract the CodeSourcery compiler to a temp directory and keep it there 
+# just long enough to run the DVSDK installer.
+# It's not the best solution but, for the moment, it's the only one that works.
+TI_DVSDK_DM365_CS_VERSION_MAJOR=2009q1
+TI_DVSDK_DM365_CS_VERSION=$(TI_DVSDK_DM365_CS_VERSION_MAJOR)-203
+TI_DVSDK_DM365_CS_FILE=arm-$(TI_DVSDK_DM365_CS_VERSION)-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
+TI_DVSDK_DM365_CS_SITE=http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi
+TI_DVSDK_DM365_CS_DIR=arm-$(TI_DVSDK_DM365_CS_VERSION_MAJOR)
+
+# Extracting the DVSDK unattended, requires a python script.
+TI_DVSDK_DM365_EXTRACT=$(TOPDIR)/package/ti/ti-dvsdk-dm365/ti-dvsdk-dm365-extract.py
+
+# Some directory settings will be required by other tools. 
+TI_DVSDK_DM365_CE_INSTALL_DIR:=$(TI_DVSDK_DM365_DIR)/`grep -m 1 CE_INSTALL_DIR $(TI_DVSDK_DM365_DIR)/Rules.make | cut -f2 -d'/'`
+TI_DVSDK_DM365_CODEC_INSTALL_DIR:=$(TI_DVSDK_DM365_DIR)/`grep -m 1 CODEC_INSTALL_DIR $(TI_DVSDK_DM365_DIR)/Rules.make | cut -f2 -d'/'`
+TI_DVSDK_DM365_DMAI_INSTALL_DIR:=$(TI_DVSDK_DM365_DIR)/`grep -m 1 DMAI_INSTALL_DIR $(TI_DVSDK_DM365_DIR)/Rules.make | cut -f2 -d'/'`
+TI_DVSDK_DM365_DVTB_INSTALL_DIR:=$(TI_DVSDK_DM365_DIR)/`grep -m 1 DVTB_INSTALL_DIR $(TI_DVSDK_DM365_DIR)/Rules.make | cut -f2 -d'/'`
+TI_DVSDK_DM365_FC_INSTALL_DIR:=$(TI_DVSDK_DM365_DIR)/`grep -m 1 FC_INSTALL_DIR $(TI_DVSDK_DM365_DIR)/Rules.make | cut -f2 -d'/'`
+TI_DVSDK_DM365_DM365MM_MODULE_INSTALL_DIR:=$(TI_DVSDK_DM365_DIR)/`grep -m 1 DM365MM_MODULE_INSTALL_DIR $(TI_DVSDK_DM365_DIR)/Rules.make | cut -f2 -d'/'`
+TI_DVSDK_DM365_XDAIS_INSTALL_DIR:=$(TI_DVSDK_DM365_DIR)/`grep -m 1 XDAIS_INSTALL_DIR $(TI_DVSDK_DM365_DIR)/Rules.make | cut -f2 -d'/'`
+TI_DVSDK_DM365_XDC_INSTALL_DIR:=$(TI_DVSDK_DM365_DIR)/`grep -m 1 XDC_INSTALL_DIR $(TI_DVSDK_DM365_DIR)/Rules.make | cut -f2 -d'/'`
+TI_DVSDK_DM365_LINUXUTILS_INSTALL_DIR:=$(TI_DVSDK_DM365_DIR)/`grep -m 1 LINUXUTILS_INSTALL_DIR $(TI_DVSDK_DM365_DIR)/Rules.make | cut -f2 -d'/'`
+
+# Select what will be built in the DVSDK (not using build all)
+TI_DVSDK_DM365_TARGETS=cmem irq edma dm365mm dmai
+
+# Where to install the kernel modules
+$(DL_DIR)/$(TI_DVSDK_DM365_CS_FILE):
+	$(call DOWNLOAD,$(TI_DVSDK_DM365_CS_SITE),$(TI_DVSDK_DM365_CS_FILE))
+
+# NOTE:
+# Archive contains hardlinks and it may fails on some filesystem. Ignoring
+# return values will adding the missing symlink will resolve the issue.
+# Anyway, CodeSourcery is not used in this package.
+$(DL_DIR)/$(TI_DVSDK_DM365_SOURCE): $(DL_DIR)/$(TI_DVSDK_DM365_CS_FILE)
+	$(call DOWNLOAD,$(TI_DVSDK_DM365_SITE),$(TI_DVSDK_DM365_SOURCE_BIN))
+	- (cd $(DL_DIR);tar -xf $(DL_DIR)/$(TI_DVSDK_DM365_CS_FILE))
+	( if [ ! -e $(DL_DIR)/$(TI_DVSDK_DM365_CS_DIR)/bin/arm-none-linux-gnueabi-gcc ]; then\
+			ln -s $(DL_DIR)/$(TI_DVSDK_DM365_CS_DIR)/bin/arm-none-linux-gnueabi-gcc-4.3.3 $(DL_DIR)/$(TI_DVSDK_DM365_CS_DIR)/bin/arm-none-linux-gnueabi-gcc;\
+		fi\
+	)
+	chmod +x $(DL_DIR)/$(TI_DVSDK_DM365_SOURCE_BIN)
+	python $(TI_DVSDK_DM365_EXTRACT) \
+		$(DL_DIR)/$(TI_DVSDK_DM365_SOURCE_BIN) \
+		$(DL_DIR)/$(TI_DVSDK_DM365_CS_DIR)/bin \
+		$(DL_DIR)/$(TI_DVSDK_DM365_SOURCE_BIN_FOLDER)
+	find $(DL_DIR)/$(TI_DVSDK_DM365_SOURCE_BIN_FOLDER) -type f -not -readable -exec sudo chmod gou+r {} \;
+	find $(DL_DIR)/$(TI_DVSDK_DM365_SOURCE_BIN_FOLDER) -type d -not -executable -exec sudo chmod gou+rx {} \;
+	(cd $(DL_DIR); \
+		tar -czf $(TI_DVSDK_DM365_SOURCE) $(TI_DVSDK_DM365_SOURCE_BIN_FOLDER)\
+	)
+	rm -rf $(DL_DIR)/$(TI_DVSDK_DM365_SOURCE_BIN_FOLDER)
+	rm -rf $(DL_DIR)/$(TI_DVSDK_DM365_CS_DIR)
+
+
+define TI_DVSDK_DM365_CONFIGURE_CMDS
+	$(SED) s:DVSDK_INSTALL_DIR=.*:DVSDK_INSTALL_DIR=$(@D):g $(@D)/Rules.make
+	$(SED) s:LINUXKERNEL_INSTALL_DIR=.*:LINUXKERNEL_INSTALL_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION):g $(@D)/Rules.make
+	$(SED) s:CSTOOL_DIR=.*:CSTOOL_DIR=$(dir $(TARGET_CROSS))/..:g $(@D)/Rules.make
+	$(SED) s:CSTOOL_PREFIX=.*:CSTOOL_PREFIX=$(TARGET_CROSS):g $(@D)/Rules.make
+	$(SED) s:EXEC_DIR=.*:EXEC_DIR=$(STAGING_DIR)/usr/bin:g $(@D)/Rules.make
+	$(SED) s:LINUXLIBS_INSTALL_DIR=.*:LINUXLIBS_INSTALL_DIR=$(TARGET_DIR)/usr:g $(@D)/Rules.make
+	for i in $(TI_DVSDK_DM365_TARGETS) ; do \
+		$(MAKE) -C $(@D) $${i}_clean; \
+	done
+	$(SED) s:^GCC_LD_FLAGS.*:\&\ -L$(TARGET_DIR)/lib:g $(TI_DVSDK_DM365_DMAI_INSTALL_DIR)/packages/ti/sdo/dmai/apps/Makefile.app
+endef
+
+define TI_DVSDK_DM365_BUILD_CMDS
+	for i in $(TI_DVSDK_DM365_TARGETS) ; do \
+		$(MAKE) -C $(@D) $${i}; \
+	done
+endef
+
+define TI_DVSDK_DM365_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/kernel/drivers/dsp
+	$(INSTALL) $(TI_DVSDK_DM365_LINUXUTILS_INSTALL_DIR)/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.ko $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/kernel/drivers/dsp/cmemk.ko
+	$(INSTALL) $(TI_DVSDK_DM365_LINUXUTILS_INSTALL_DIR)/packages/ti/sdo/linuxutils/irq/src/module/irqk.ko $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/kernel/drivers/dsp/irqk.ko
+	$(INSTALL) $(TI_DVSDK_DM365_LINUXUTILS_INSTALL_DIR)/packages/ti/sdo/linuxutils/edma/src/module/edmak.ko $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/kernel/drivers/dsp/edmak.ko
+	$(INSTALL) $(TI_DVSDK_DM365_DM365MM_MODULE_INSTALL_DIR)/module/dm365mmap.ko $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/kernel/drivers/dsp/dm365mmap.ko
+endef
+
+ti-dvsdk-dm365-source: $(DL_DIR)/$(TI_DVSDK_DM365_SOURCE)
+
+$(eval $(call GENTARGETS,package/ti,ti-dvsdk-dm365))
-- 
1.7.0.4
