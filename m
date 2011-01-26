From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jan 2011 12:09:42 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: get rid of
	deprecated 2.6.32 / 2.6.33 versions
Message-ID: <20110126112158.C736E8D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=60fd10d3544ee5f598406887b0ab26e166ea117e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |   12 +----
 ...-types-for-headers-exported-to-user-space.patch |   60 --------------------
 ...-types-for-headers-exported-to-user-space.patch |   59 -------------------
 3 files changed, 1 insertions(+), 130 deletions(-)
 delete mode 100644 toolchain/kernel-headers/linux-2.6.32.28-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
 delete mode 100644 toolchain/kernel-headers/linux-2.6.33.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index dc39a24..70b2ce0 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -15,14 +15,6 @@ choice
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_6_32
-		bool "Linux 2.6.32.x kernel headers"
-		depends on BR2_DEPRECATED
-
-	config BR2_KERNEL_HEADERS_2_6_33
-		depends on BR2_DEPRECATED
-		bool "Linux 2.6.33.x kernel headers"
-
 	config BR2_KERNEL_HEADERS_2_6_34
 		depends on BR2_DEPRECATED
 		bool "Linux 2.6.34.x kernel headers"
@@ -48,12 +40,10 @@ config BR2_DEFAULT_KERNEL_VERSION
 	depends on BR2_KERNEL_HEADERS_VERSION
 	help
 	  Specify the version you want to use.
-	  E.G.: 2.6.31.2
+	  E.G.: 2.6.37
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.32.28"	if BR2_KERNEL_HEADERS_2_6_32
-	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6.34.8"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.9"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.3"	if BR2_KERNEL_HEADERS_2_6_36
diff --git a/toolchain/kernel-headers/linux-2.6.32.28-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.28-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
deleted file mode 100644
index 2fc6176..0000000
--- a/toolchain/kernel-headers/linux-2.6.32.28-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 5e0675efcec309617ba2d334c68ddb250ef942b2 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Fri, 27 Nov 2009 11:20:54 +0100
-Subject: [PATCH] scsi: use __uX types for headers exported to user space
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit 9e4f5e29 (FC Pass Thru support) exported a number of header files
-in include/scsi to user space, but didn't change the uX types to the
-userspace-compatible __uX types. Without that you'll get compile errors
-when including them - E.G.:
-
-/tmp/include/scsi/scsi.h:145: error: expected specifier-qualifier-list
-before ???u8???
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- include/scsi/scsi.h         |    8 ++++----
- include/scsi/scsi_netlink.h |   20 ++++++++++----------
- 2 files changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/include/scsi/scsi.h b/include/scsi/scsi.h
-index 34c46ab..b3cffec 100644
---- a/include/scsi/scsi.h
-+++ b/include/scsi/scsi.h
-@@ -145,10 +145,10 @@ struct scsi_cmnd;
- 
- /* defined in T10 SCSI Primary Commands-2 (SPC2) */
- struct scsi_varlen_cdb_hdr {
--	u8 opcode;        /* opcode always == VARIABLE_LENGTH_CMD */
--	u8 control;
--	u8 misc[5];
--	u8 additional_cdb_length;         /* total cdb length - 8 */
-+	__u8 opcode;        /* opcode always == VARIABLE_LENGTH_CMD */
-+	__u8 control;
-+	__u8 misc[5];
-+	__u8 additional_cdb_length;         /* total cdb length - 8 */
- 	__be16 service_action;
- 	/* service specific data follows */
- };
-diff --git a/include/scsi/scsi_netlink.h b/include/scsi/scsi_netlink.h
-index 536752c..7445c46 100644
---- a/include/scsi/scsi_netlink.h
-+++ b/include/scsi/scsi_netlink.h
-@@ -105,8 +105,8 @@ struct scsi_nl_host_vendor_msg {
-  *    PCI :  ID data is the 16 bit PCI Registered Vendor ID
-  */
- #define SCSI_NL_VID_TYPE_SHIFT		56
--#define SCSI_NL_VID_TYPE_MASK		((u64)0xFF << SCSI_NL_VID_TYPE_SHIFT)
--#define SCSI_NL_VID_TYPE_PCI		((u64)0x01 << SCSI_NL_VID_TYPE_SHIFT)
-+#define SCSI_NL_VID_TYPE_MASK		((__u64)0xFF << SCSI_NL_VID_TYPE_SHIFT)
-+#define SCSI_NL_VID_TYPE_PCI		((__u64)0x01 << SCSI_NL_VID_TYPE_SHIFT)
- #define SCSI_NL_VID_ID_MASK		(~ SCSI_NL_VID_TYPE_MASK)
- 
- 
- 
--- 
-1.6.5
-
diff --git a/toolchain/kernel-headers/linux-2.6.33.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.33.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
deleted file mode 100644
index 1089c71..0000000
--- a/toolchain/kernel-headers/linux-2.6.33.7-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 877aa0313e7d22b88d04ebef76392e1688fffff9 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Fri, 27 Nov 2009 11:20:54 +0100
-Subject: [PATCH] scsi: use __uX types for headers exported to user space
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit 9e4f5e29 (FC Pass Thru support) exported a number of header files
-in include/scsi to user space, but didn't change the uX types to the
-userspace-compatible __uX types. Without that you'll get compile errors
-when including them - E.G.:
-
-/tmp/include/scsi/scsi.h:145: error: expected specifier-qualifier-list
-before ???u8???
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- include/scsi/scsi.h         |    8 ++++----
- include/scsi/scsi_netlink.h |    4 ++--
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/include/scsi/scsi.h b/include/scsi/scsi.h
-index 8b4deca..ec3053e 100644
---- a/include/scsi/scsi.h
-+++ b/include/scsi/scsi.h
-@@ -149,10 +149,10 @@ struct scsi_cmnd;
- 
- /* defined in T10 SCSI Primary Commands-2 (SPC2) */
- struct scsi_varlen_cdb_hdr {
--	u8 opcode;        /* opcode always == VARIABLE_LENGTH_CMD */
--	u8 control;
--	u8 misc[5];
--	u8 additional_cdb_length;         /* total cdb length - 8 */
-+	__u8 opcode;        /* opcode always == VARIABLE_LENGTH_CMD */
-+	__u8 control;
-+	__u8 misc[5];
-+	__u8 additional_cdb_length;         /* total cdb length - 8 */
- 	__be16 service_action;
- 	/* service specific data follows */
- };
-diff --git a/include/scsi/scsi_netlink.h b/include/scsi/scsi_netlink.h
-index 536752c..58ce8fe 100644
---- a/include/scsi/scsi_netlink.h
-+++ b/include/scsi/scsi_netlink.h
-@@ -105,8 +105,8 @@ struct scsi_nl_host_vendor_msg {
-  *    PCI :  ID data is the 16 bit PCI Registered Vendor ID
-  */
- #define SCSI_NL_VID_TYPE_SHIFT		56
--#define SCSI_NL_VID_TYPE_MASK		((u64)0xFF << SCSI_NL_VID_TYPE_SHIFT)
--#define SCSI_NL_VID_TYPE_PCI		((u64)0x01 << SCSI_NL_VID_TYPE_SHIFT)
-+#define SCSI_NL_VID_TYPE_MASK		((__u64)0xFF << SCSI_NL_VID_TYPE_SHIFT)
-+#define SCSI_NL_VID_TYPE_PCI		((__u64)0x01 << SCSI_NL_VID_TYPE_SHIFT)
- #define SCSI_NL_VID_ID_MASK		(~ SCSI_NL_VID_TYPE_MASK)
- 
- 
--- 
-1.7.0
-
-- 
1.7.3.4
