From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 May 2012 19:39:14 +0200
Subject: [Buildroot] [git commit branch/next] kernel-headers: remove 2.6.35,
	add 3.4
Message-ID: <20120521174025.86C5296D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73c8f3b934611174414f044e4a16bd36e4ea4d62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

And mark 2.6.36 / 2.6.37 as deprecated.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |   12 ++--
 ...-types-for-headers-exported-to-user-space.patch |   59 --------------------
 2 files changed, 7 insertions(+), 64 deletions(-)

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 36370b4..b3fb362 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_3_3
+	default BR2_KERNEL_HEADERS_3_4
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -15,14 +15,13 @@ choice
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_6_35
-		bool "Linux 2.6.35.x kernel headers"
-
 	config BR2_KERNEL_HEADERS_2_6_36
 		bool "Linux 2.6.36.x kernel headers"
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_37
 		bool "Linux 2.6.37.x kernel headers"
+		depends on BR2_DEPRECATED
 
 	config BR2_KERNEL_HEADERS_2_6_38
 		bool "Linux 2.6.38.x kernel headers"
@@ -42,6 +41,9 @@ choice
 	config BR2_KERNEL_HEADERS_3_3
 		bool "Linux 3.3.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_3_4
+		bool "Linux 3.4.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -58,7 +60,6 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.35.14"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.8"	if BR2_KERNEL_HEADERS_2_6_38
@@ -67,5 +68,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "3.1.10"	if BR2_KERNEL_HEADERS_3_1
 	default "3.2.16"	if BR2_KERNEL_HEADERS_3_2
 	default "3.3.5"		if BR2_KERNEL_HEADERS_3_3
+	default "3.4"		if BR2_KERNEL_HEADERS_3_4
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.35.14-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.35.14-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
deleted file mode 100644
index 1089c71..0000000
--- a/toolchain/kernel-headers/linux-2.6.35.14-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
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
