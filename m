From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Mar 2011 09:11:23 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: add 2.6.38,
	remove 2.6.34.x
Message-ID: <20110315091144.A010B9033A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aa08cb6f57a2bb979fb98ee76c9f8d0ecfe02d87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |   13 ++--
 toolchain/kernel-headers/kernel-headers.mk         |    2 +-
 ...-types-for-headers-exported-to-user-space.patch |   59 --------------------
 3 files changed, 7 insertions(+), 67 deletions(-)
 delete mode 100644 toolchain/kernel-headers/linux-2.6.34.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index 7149836..3bb7470 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -6,7 +6,7 @@ comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_6_37
+	default BR2_KERNEL_HEADERS_2_6_38
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -15,10 +15,6 @@ choice
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_6_34
-		depends on BR2_DEPRECATED
-		bool "Linux 2.6.34.x kernel headers"
-
 	config BR2_KERNEL_HEADERS_2_6_35
 		bool "Linux 2.6.35.x kernel headers"
 
@@ -28,6 +24,9 @@ choice
 	config BR2_KERNEL_HEADERS_2_6_37
 		bool "Linux 2.6.37.x kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_38
+		bool "Linux 2.6.38.x kernel headers"
+
 	config BR2_KERNEL_HEADERS_VERSION
 		bool "Linux 2.6 (manually specified version)"
 
@@ -40,13 +39,13 @@ config BR2_DEFAULT_KERNEL_VERSION
 	depends on BR2_KERNEL_HEADERS_VERSION
 	help
 	  Specify the version you want to use.
-	  E.G.: 2.6.37
+	  E.G.: 2.6.38
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.34.8"	if BR2_KERNEL_HEADERS_2_6_34
 	default "2.6.35.11"	if BR2_KERNEL_HEADERS_2_6_35
 	default "2.6.36.4"	if BR2_KERNEL_HEADERS_2_6_36
 	default "2.6.37.4"	if BR2_KERNEL_HEADERS_2_6_37
+	default "2.6.38"	if BR2_KERNEL_HEADERS_2_6_38
 	default "2.6"		if BR2_KERNEL_HEADERS_SNAP
 	default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/kernel-headers.mk b/toolchain/kernel-headers/kernel-headers.mk
index 7d2e45b..079497a 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -33,7 +33,7 @@ LINUX_HEADERS_UNPACK_DIR:=$(TOOLCHAIN_DIR)/linux-$(LINUX_HEADERS_VERSION)
 LINUX_HEADERS_DIR:=$(TOOLCHAIN_DIR)/linux
 
 # long term support kernels are stored in a longterm/v2.6.x subdir
-ifeq ($(BR2_KERNEL_HEADERS_2_6_34)$(BR2_KERNEL_HEADERS_2_6_35),y)
+ifeq ($(BR2_KERNEL_HEADERS_2_6_35),y)
 DEFAULT_KERNEL_HEADERS_MAJOR := \
 	$(shell echo $(DEFAULT_KERNEL_HEADERS) | sed 's/\.[0-9]*$$//')
 # += adds a space between
diff --git a/toolchain/kernel-headers/linux-2.6.34.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.34.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
deleted file mode 100644
index 1089c71..0000000
--- a/toolchain/kernel-headers/linux-2.6.34.8-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
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
