From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Jan 2014 10:11:40 -0300
Subject: [Buildroot] [PATCH] sg3_utils: bump to version 1.37
Message-ID: <1391001100-20048-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sg3_utils/sg3_utils.mk | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 8bb79b5..be86bd7 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.34
+SG3_UTILS_VERSION = 1.37
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
-SG3_UTILS_SITE    = http://sg.danny.cz/sg/p/
+SG3_UTILS_SITE  = http://sg.danny.cz/sg/p/
 SG3_UTILS_LICENSE = BSD-3c
 # utils progs are GPLv2+ licenced
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
@@ -20,7 +20,8 @@ SG3_UTILS_INSTALL_STAGING = YES
 ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),)
 define SG3_UTILS_REMOVE_PROGS
 	for prog in \
-		dd decode_sense emc_trespass format get_config \
+		compare_and_write copy_results dd decode_sense \
+		emc_trespass format get_config \
 		get_lba_status ident inq logs luns map26 \
 		map sgm_dd modes opcodes sgp_dd persist prevent \
 		raw rbuf rdac read readcap read_block_limits \
@@ -29,10 +30,18 @@ define SG3_UTILS_REMOVE_PROGS
 		sat_identify sat_phy_event sat_set_features scan \
 		senddiag ses start stpg sync test_rwbuf turs \
 		unmap verify vpd write_buffer write_long \
-		write_same wr_mode ; do \
+		write_same wr_mode xcopy; do \
 		$(RM) $(TARGET_DIR)/usr/bin/sg_$${prog} ; \
 	done
-	$(RM) $(TARGET_DIR)/usr/bin/sginfo
+	for prog in \
+		logging_level mandat readcap ready satl start stop \
+		temperature; do \
+		$(RM) $(TARGET_DIR)/usr/bin/scsi_$${prog} ; \
+	done
+	for prog in \
+		sginfo sgm_dd sgp_dd; do \
+		$(RM) $(TARGET_DIR)/usr/bin/$${prog}; \
+	done
 endef
 
 SG3_UTILS_POST_INSTALL_TARGET_HOOKS += SG3_UTILS_REMOVE_PROGS
-- 
1.8.3.2
