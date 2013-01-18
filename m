From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 18 Jan 2013 23:08:43 +0100
Subject: [Buildroot] [PATCH v3 1/5] sg3_utils: new package
In-Reply-To: <1358546927-25707-1-git-send-email-marek.belisko@open-nandra.com>
References: <1358546927-25707-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1358546927-25707-2-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in              |    1 +
 package/sg3_utils/Config.in    |   16 ++++++++++++++++
 package/sg3_utils/sg3_utils.mk |   39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 package/sg3_utils/Config.in
 create mode 100644 package/sg3_utils/sg3_utils.mk

diff --git a/package/Config.in b/package/Config.in
index 11e6f3a..e6153f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -261,6 +261,7 @@ source "package/rpi-userland/Config.in"
 source "package/sane-backends/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
+source "package/sg3_utils/Config.in"
 source "package/smartmontools/Config.in"
 source "package/snowball-hdmiservice/Config.in"
 source "package/sredird/Config.in"
diff --git a/package/sg3_utils/Config.in b/package/sg3_utils/Config.in
new file mode 100644
index 0000000..4e60992
--- /dev/null
+++ b/package/sg3_utils/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_SG3_UTILS
+	bool "sgutils"
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Low level utilities for devices that use a SCSI command set.
+	  This option install only libsgutils2 library not programs.
+
+	  http://sg.danny.cz/sg/sg3_utils.html
+
+config BR2_PACKAGE_SG3_UTILS_PROGS
+	bool "install programs"
+	depends on BR2_PACKAGE_SG3_UTILS
+
+comment "sgutils requires a toolchain with LARGEFILE and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
new file mode 100644
index 0000000..e1844f1
--- /dev/null
+++ b/package/sg3_utils/sg3_utils.mk
@@ -0,0 +1,39 @@
+#############################################################
+#
+# sg3_utils
+#
+#############################################################
+SG3_UTILS_VERSION = 1.34
+SG3_UTILS_SITE    = http://sg.danny.cz/sg/p/
+SG3_UTILS_LICENSE = BSD-3c
+# utils progs are GPLv2+ licenced
+ifneq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
+SG3_UTILS_LICENSE += GPLv2+
+endif
+SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
+
+# install the libsgutils2 library
+SG3_UTILS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
+define SG3_UTILS_REMOVE_PROGS
+	for prog in \
+		dd decode_sense emc_trespass format get_config \
+		get_lba_status ident inq logs luns map26 \
+		map sgm_dd modes opcodes sgp_dd persist prevent \
+		raw rbuf rdac read readcap read_block_limits \
+		read_buffer read_long reassign referrals \
+		requests reset rmsn rtpg safte sanitize \
+		sat_identify sat_phy_event sat_set_features scan \
+		senddiag ses start stpg sync test_rwbuf turs \
+		unmap verify vpd write_buffer write_long \
+		write_same wr_mode ; do \
+		$(RM) $(TARGET_DIR)/usr/bin/sg_$${prog} ; \
+	done
+	$(RM) $(TARGET_DIR)/usr/bin/sginfo
+endef
+
+SG3_UTILS_POST_INSTALL_TARGET_HOOKS += SG3_UTILS_REMOVE_PROGS
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
