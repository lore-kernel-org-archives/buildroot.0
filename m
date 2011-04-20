From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 20 Apr 2011 14:41:59 -0300
Subject: [Buildroot] =?utf-8?q?=5BPATCH_7/7=5D_toolchain=3A_bump_2=2E6=2E3?=
	=?utf-8?q?5_kernel_headers_to_2=2E6=2E35=2E12?=
In-Reply-To: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
References: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1303321319-16553-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/kernel-headers/Config.in                 |    2 +-
 ...-types-for-headers-exported-to-user-space.patch |   59 --------------------
 ...-types-for-headers-exported-to-user-space.patch |   59 ++++++++++++++++++++
 3 files changed, 60 insertions(+), 60 deletions(-)
 delete mode 100644 toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
 create mode 100644 toolchain/kernel-headers/linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 92798d8..68151d0 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -43,7 +43,7 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
+	default "2.6.35.12"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.6"	if BR2_KERNEL_HEADERS_2_6_37
 	default "2.6.38.3"	if BR2_KERNEL_HEADERS_2_6_38
diff --git a/toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
deleted file mode 100644
index 1089c71..0000000
--- a/toolchain/kernel-headers/linux-2.6.35.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
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
-before ?u8?
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
diff --git a/toolchain/kernel-headers/linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
new file mode 100644
index 0000000..1089c71
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.35.12-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
@@ -0,0 +1,59 @@
+From 877aa0313e7d22b88d04ebef76392e1688fffff9 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Fri, 27 Nov 2009 11:20:54 +0100
+Subject: [PATCH] scsi: use __uX types for headers exported to user space
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Commit 9e4f5e29 (FC Pass Thru support) exported a number of header files
+in include/scsi to user space, but didn't change the uX types to the
+userspace-compatible __uX types. Without that you'll get compile errors
+when including them - E.G.:
+
+/tmp/include/scsi/scsi.h:145: error: expected specifier-qualifier-list
+before ?u8?
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/scsi/scsi.h         |    8 ++++----
+ include/scsi/scsi_netlink.h |    4 ++--
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/include/scsi/scsi.h b/include/scsi/scsi.h
+index 8b4deca..ec3053e 100644
+--- a/include/scsi/scsi.h
++++ b/include/scsi/scsi.h
+@@ -149,10 +149,10 @@ struct scsi_cmnd;
+ 
+ /* defined in T10 SCSI Primary Commands-2 (SPC2) */
+ struct scsi_varlen_cdb_hdr {
+-	u8 opcode;        /* opcode always == VARIABLE_LENGTH_CMD */
+-	u8 control;
+-	u8 misc[5];
+-	u8 additional_cdb_length;         /* total cdb length - 8 */
++	__u8 opcode;        /* opcode always == VARIABLE_LENGTH_CMD */
++	__u8 control;
++	__u8 misc[5];
++	__u8 additional_cdb_length;         /* total cdb length - 8 */
+ 	__be16 service_action;
+ 	/* service specific data follows */
+ };
+diff --git a/include/scsi/scsi_netlink.h b/include/scsi/scsi_netlink.h
+index 536752c..58ce8fe 100644
+--- a/include/scsi/scsi_netlink.h
++++ b/include/scsi/scsi_netlink.h
+@@ -105,8 +105,8 @@ struct scsi_nl_host_vendor_msg {
+  *    PCI :  ID data is the 16 bit PCI Registered Vendor ID
+  */
+ #define SCSI_NL_VID_TYPE_SHIFT		56
+-#define SCSI_NL_VID_TYPE_MASK		((u64)0xFF << SCSI_NL_VID_TYPE_SHIFT)
+-#define SCSI_NL_VID_TYPE_PCI		((u64)0x01 << SCSI_NL_VID_TYPE_SHIFT)
++#define SCSI_NL_VID_TYPE_MASK		((__u64)0xFF << SCSI_NL_VID_TYPE_SHIFT)
++#define SCSI_NL_VID_TYPE_PCI		((__u64)0x01 << SCSI_NL_VID_TYPE_SHIFT)
+ #define SCSI_NL_VID_ID_MASK		(~ SCSI_NL_VID_TYPE_MASK)
+ 
+ 
+-- 
+1.7.0
+
-- 
1.7.3.4
