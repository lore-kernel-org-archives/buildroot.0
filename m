From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sat,  4 Sep 2010 20:49:42 +0200
Subject: [Buildroot] [PATCH] bump kernel headers to latest stable,
	including scsi patch for latests kernel headers
Message-ID: <1283626182-28176-1-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bump to latest (begin of September 2010) kernel headers,
scsi.h and scsi_net.h have not changed since April 2010
-> so renaming the scsi patches files in toolchain/kernel-headers/ to match higher versions

Signed-off-by: Marcus Osdoba <marcus.osdoba@googlemail.com>
---
 toolchain/kernel-headers/Config.in                 |   10 ++-
 ...-types-for-headers-exported-to-user-space.patch |   60 --------------------
 ...-types-for-headers-exported-to-user-space.patch |   60 ++++++++++++++++++++
 ...-types-for-headers-exported-to-user-space.patch |   59 -------------------
 ...-types-for-headers-exported-to-user-space.patch |   59 +++++++++++++++++++
 ...-types-for-headers-exported-to-user-space.patch |   59 +++++++++++++++++++
 6 files changed, 185 insertions(+), 122 deletions(-)
 delete mode 100644 toolchain/kernel-headers/linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
 create mode 100644 toolchain/kernel-headers/linux-2.6.32.21-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
 delete mode 100644 toolchain/kernel-headers/linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
 create mode 100644 toolchain/kernel-headers/linux-2.6.34.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
 create mode 100644 toolchain/kernel-headers/linux-2.6.35.4-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index e60595f..de8ea01 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -45,6 +45,9 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_34
 		bool "Linux 2.6.34.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_35
+		bool "Linux 2.6.35.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -61,13 +64,14 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.27.50"	if BR2_KERNEL_HEADERS_2_6_27
+	default "2.6.27.53"	if BR2_KERNEL_HEADERS_2_6_27
 	default "2.6.28.10"	if BR2_KERNEL_HEADERS_2_6_28
 	default "2.6.29.6"	if BR2_KERNEL_HEADERS_2_6_29
 	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
 	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
-	default "2.6.32.18"	if BR2_KERNEL_HEADERS_2_6_32
+	default "2.6.32.21"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
-	default "2.6.34.3"	if BR2_KERNEL_HEADERS_2_6_34
+	default "2.6.34.6"	if BR2_KERNEL_HEADERS_2_6_34
+	default "2.6.35.4"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
deleted file mode 100644
index 2fc6176..0000000
--- a/toolchain/kernel-headers/linux-2.6.32.18-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
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
diff --git a/toolchain/kernel-headers/linux-2.6.32.21-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32.21-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
new file mode 100644
index 0000000..2fc6176
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.32.21-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
@@ -0,0 +1,60 @@
+From 5e0675efcec309617ba2d334c68ddb250ef942b2 Mon Sep 17 00:00:00 2001
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
+before ???u8???
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/scsi/scsi.h         |    8 ++++----
+ include/scsi/scsi_netlink.h |   20 ++++++++++----------
+ 2 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/include/scsi/scsi.h b/include/scsi/scsi.h
+index 34c46ab..b3cffec 100644
+--- a/include/scsi/scsi.h
++++ b/include/scsi/scsi.h
+@@ -145,10 +145,10 @@ struct scsi_cmnd;
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
+index 536752c..7445c46 100644
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
+ 
+-- 
+1.6.5
+
diff --git a/toolchain/kernel-headers/linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
deleted file mode 100644
index 1089c71..0000000
--- a/toolchain/kernel-headers/linux-2.6.34.3-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
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
diff --git a/toolchain/kernel-headers/linux-2.6.34.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.34.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
new file mode 100644
index 0000000..1089c71
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.34.6-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
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
+before ???u8???
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
diff --git a/toolchain/kernel-headers/linux-2.6.35.4-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.35.4-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
new file mode 100644
index 0000000..1089c71
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.35.4-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
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
+before ???u8???
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
1.7.1
