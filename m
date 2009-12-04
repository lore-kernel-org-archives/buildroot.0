From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 4 Dec 2009 14:25:08 +0100
Subject: [Buildroot] [git commit master] kernel-headers: 2.6.32 needs scsi.h
	fix like 2.6.31
Message-ID: <20091204132633.7A41F777F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=89b9188aa0c14e55819dfb1c1578e3f1c25471d0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Emmanuel Blot <eblot.ml@gmail.com>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...-types-for-headers-exported-to-user-space.patch |   89 ++++++++++++++++++++
 1 files changed, 89 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/kernel-headers/linux-2.6.32-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

diff --git a/toolchain/kernel-headers/linux-2.6.32-scsi-use-__uX-types-for-headers-exported-to-user-space.patch b/toolchain/kernel-headers/linux-2.6.32-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
new file mode 100644
index 0000000..ac9875d
--- /dev/null
+++ b/toolchain/kernel-headers/linux-2.6.32-scsi-use-__uX-types-for-headers-exported-to-user-space.patch
@@ -0,0 +1,89 @@
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
+@@ -125,21 +125,21 @@ struct scsi_nl_host_vendor_msg {
+ #include <scsi/scsi_host.h>
+ 
+ /* Exported Kernel Interfaces */
+-int scsi_nl_add_transport(u8 tport,
++int scsi_nl_add_transport(__u8 tport,
+ 	 int (*msg_handler)(struct sk_buff *),
+ 	void (*event_handler)(struct notifier_block *, unsigned long, void *));
+-void scsi_nl_remove_transport(u8 tport);
++void scsi_nl_remove_transport(__u8 tport);
+ 
+-int scsi_nl_add_driver(u64 vendor_id, struct scsi_host_template *hostt,
++int scsi_nl_add_driver(__u64 vendor_id, struct scsi_host_template *hostt,
+ 	int (*nlmsg_handler)(struct Scsi_Host *shost, void *payload,
+-				 u32 len, u32 pid),
++				 __u32 len, __u32 pid),
+ 	void (*nlevt_handler)(struct notifier_block *nb,
+ 				 unsigned long event, void *notify_ptr));
+-void scsi_nl_remove_driver(u64 vendor_id);
++void scsi_nl_remove_driver(__u64 vendor_id);
+ 
+-void scsi_nl_send_transport_msg(u32 pid, struct scsi_nl_hdr *hdr);
+-int scsi_nl_send_vendor_msg(u32 pid, unsigned short host_no, u64 vendor_id,
+-			 char *data_buf, u32 data_len);
++void scsi_nl_send_transport_msg(__u32 pid, struct scsi_nl_hdr *hdr);
++int scsi_nl_send_vendor_msg(__u32 pid, unsigned short host_no, __u64 vendor_id,
++			 char *data_buf, __u32 data_len);
+ 
+ #endif /* __KERNEL__ */
+ 
+-- 
+1.6.5
+
-- 
1.6.3.3
