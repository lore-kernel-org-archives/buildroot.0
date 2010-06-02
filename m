From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jun 2010 21:02:45 +0200
Subject: [Buildroot] [git commit master] kernel-headers: add 2.6.34
Message-ID: <20100602190350.2E36D8A2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3d5198c19bd9f10618448890e50f2ef953e91e86
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |    6 ++-
 ...-types-for-headers-exported-to-user-space.patch |   59 ++++++++++++++++++++
 2 files changed, 64 insertions(+), 1 deletions(-)
 create mode 100644 toolchain/kernel-headers/linux-2.6.34-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 004355d..5e6f5cb 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_33
+	default BR2_KERNEL_HEADERS_2_6_34
 
 	help
 	  Select the version of kernel header files you wish to use.
@@ -42,6 +42,9 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_33
 		bool "Linux 2.6.33.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_34
+		bool "Linux 2.6.34.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -65,5 +68,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "2.6.31.13"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6.32.15"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.5"	if BR2_KERNEL_HEADERS_2_6_33
+	default "2.6.34"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/linux-2.6.34-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.34-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
new file mode 100644
index 0000000..1089c71
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.34-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
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
1.6.3.3
