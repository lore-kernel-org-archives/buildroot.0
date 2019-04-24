From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 11:39:30 +0200
Subject: [Buildroot] [PATCH 2/4] package/genimage: add patch to support
 bootable flag in GPT tables
In-Reply-To: <20190424093933.6212-1-thomas.petazzoni@bootlin.com>
References: <20190424093933.6212-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190424093933.6212-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch, submitted upstream, to add support for
setting the bootable flag in GPT partition tables. While we normally
don't accept feature patches in Buildroot, this one is really minimal
(two lines of code) and is in fact necessary for the STM32MP157
Discovery Kit defconfig.

Indeed, the STM32MP157 BootROM loads the first stage bootloader from
the GPT partitions named fsbl*, which requires a GPT partition
table. But then, the "U-Boot Generic Distro" mechanism identifies the
GPT partition that contains the extlinux.conf file to use thanks to
the "bootable" flag of GPT partitions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...dd-support-for-bootable-flags-on-GPT.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/genimage/0001-image-hd-add-support-for-bootable-flags-on-GPT.patch

diff --git a/package/genimage/0001-image-hd-add-support-for-bootable-flags-on-GPT.patch b/package/genimage/0001-image-hd-add-support-for-bootable-flags-on-GPT.patch
new file mode 100644
index 0000000000..03cc5dd39d
--- /dev/null
+++ b/package/genimage/0001-image-hd-add-support-for-bootable-flags-on-GPT.patch
@@ -0,0 +1,45 @@
+From f23a09b177d9a55679fd3a57951313b8a34dc4d9 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 23 Apr 2019 14:09:42 +0200
+Subject: [PATCH] image-hd: add support for bootable flags on GPT
+
+Bit 2 of the GPT partition table entry "flags" attribute allows to
+mark the partition as bootable, so we add support for setting this
+flag, using the same bootable flag used for MBR partition tables.
+
+Setting this flag is useful to properly support the "Generic Distro"
+concept from U-Boot [1], which searches for boot scripts in the
+bootable partition.
+
+[1] http://git.denx.de/?p=u-boot.git;a=blob;f=doc/README.distro
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/pengutronix/genimage/pull/58
+---
+ image-hd.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/image-hd.c b/image-hd.c
+index 2c2860c..1f80ae7 100644
+--- a/image-hd.c
++++ b/image-hd.c
+@@ -78,6 +78,8 @@ struct gpt_partition_entry {
+ #define GPT_SECTORS		(1 + GPT_ENTRIES * sizeof(struct gpt_partition_entry) / 512)
+ #define GPT_REVISION_1_0	0x00010000
+ 
++#define GPT_PE_FLAG_BOOTABLE	(1 << 2)
++
+ static void hdimage_setup_chs(unsigned int lba, unsigned char *chs)
+ {
+ 	const unsigned int hpc = 255;
+@@ -275,6 +277,7 @@ static int hdimage_insert_gpt(struct image *image, struct list_head *partitions)
+ 		uuid_parse(part->partition_uuid, table[i].uuid);
+ 		table[i].first_lba = htole64(part->offset/512);
+ 		table[i].last_lba = htole64((part->offset + part->size)/512 - 1);
++		table[i].flags = part->bootable ? GPT_PE_FLAG_BOOTABLE : 0;
+ 		for (j = 0; j < strlen(part->name) && j < 36; j++)
+ 			table[i].name[j] = htole16(part->name[j]);
+ 		i++;
+-- 
+2.20.1
+
-- 
2.20.1
