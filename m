From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jan 2011 13:13:45 +0100
Subject: [Buildroot] [git commit master 1/1] kernel-headers: remove
	deprecated 2.6.30/2.6.31 versions
Message-ID: <20110110131222.E19368A3BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f1e7204cc3367aeb0cbaf4886b5f8223f012c74f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/kernel-headers/Config.in                 |   11 +---
 .../kernel-headers/linux-2.6.30.9-mips-delay.patch |   35 -----------
 ...-types-for-headers-exported-to-user-space.patch |   60 --------------------
 3 files changed, 1 insertions(+), 105 deletions(-)
 delete mode 100644 toolchain/kernel-headers/linux-2.6.30.9-mips-delay.patch
 delete mode 100644 toolchain/kernel-headers/linux-2.6.31.14-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

diff --git a/toolchain/kernel-headers/Config.in b/toolchain/kernel-headers/Config.in
index fe1eeb1..69c5c18 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -15,14 +15,6 @@ choice
 	  For the snapshot, you have to provide the
 	  linux-2.6.tar.bz2 tarball in your download dir.
 
-	config BR2_KERNEL_HEADERS_2_6_30
-		bool "Linux 2.6.30.x kernel headers"
-		depends on BR2_DEPRECATED
-
-	config BR2_KERNEL_HEADERS_2_6_31
-		bool "Linux 2.6.31.x kernel headers"
-		depends on BR2_DEPRECATED
-
 	config BR2_KERNEL_HEADERS_2_6_32
 		bool "Linux 2.6.32.x kernel headers"
 		depends on BR2_DEPRECATED
@@ -32,6 +24,7 @@ choice
 		bool "Linux 2.6.33.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_34
+		depends on BR2_DEPRECATED
 		bool "Linux 2.6.34.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_35
@@ -59,8 +52,6 @@ config BR2_DEFAULT_KERNEL_VERSION
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "2.6.30.10"	if BR2_KERNEL_HEADERS_2_6_30
-	default "2.6.31.14"	if BR2_KERNEL_HEADERS_2_6_31
 	default "2.6.32.28"	if BR2_KERNEL_HEADERS_2_6_32
 	default "2.6.33.7"	if BR2_KERNEL_HEADERS_2_6_33
 	default "2.6.34.7"	if BR2_KERNEL_HEADERS_2_6_34
diff --git a/toolchain/kernel-headers/linux-2.6.30.9-mips-delay.patch b/toolchain/kernel-headers/linux-2.6.30.9-mips-delay.patch
deleted file mode 100644
index 9e13c2c..0000000
--- a/toolchain/kernel-headers/linux-2.6.30.9-mips-delay.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3cb3a66cf7559d9c5d47ddf58481530b8943052f Mon Sep 17 00:00:00 2001
-From: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
-Date: Tue, 9 Jun 2009 11:12:48 +0900
-Subject: [PATCH] MIPS: Fix __ndelay build error and add 'ull' suffix for 32-bit kernel
-
-Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
-Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
----
- arch/mips/lib/delay.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/mips/lib/delay.c b/arch/mips/lib/delay.c
-index f69c6b5..6b3b1de 100644
---- a/arch/mips/lib/delay.c
-+++ b/arch/mips/lib/delay.c
-@@ -43,7 +43,7 @@ void __udelay(unsigned long us)
- {
- 	unsigned int lpj = current_cpu_data.udelay_val;
- 
--	__delay((us * 0x000010c7 * HZ * lpj) >> 32);
-+	__delay((us * 0x000010c7ull * HZ * lpj) >> 32);
- }
- EXPORT_SYMBOL(__udelay);
- 
-@@ -51,6 +51,6 @@ void __ndelay(unsigned long ns)
- {
- 	unsigned int lpj = current_cpu_data.udelay_val;
- 
--	__delay((us * 0x00000005 * HZ * lpj) >> 32);
-+	__delay((ns * 0x00000005ull * HZ * lpj) >> 32);
- }
- EXPORT_SYMBOL(__ndelay);
--- 
-1.6.3.3
-
diff --git a/toolchain/kernel-headers/linux-2.6.31.14-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.31.14-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
deleted file mode 100644
index 2fc6176..0000000
--- a/toolchain/kernel-headers/linux-2.6.31.14-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
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
-- 
1.7.2.2
