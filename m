From: Yiyang Fei <yiyang.fei@barco.com>
Date: Wed, 31 Aug 2011 10:34:13 -0700
Subject: [Buildroot] [PATCH] Fix fw_env bug for multi-sector environments on
	NOR flash
Message-ID: <1314812053-17452-1-git-send-email-yiyang.fei@barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix for writing multi-sector environment to NOR flash.

Signed-off-by: Yiyang Fei <yiyang.fei@barco.com>
---
 .../uboot-tools-2011.03-fw_env-NOR-write-fix.patch |   41 
++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 
package/uboot-tools/uboot-tools-2011.03-fw_env-NOR-write-fix.patch

diff --git 
a/package/uboot-tools/uboot-tools-2011.03-fw_env-NOR-write-fix.patch 
b/package/uboot-tools/uboot-tools-2011.03-fw_env-NOR-write-fix.patch
new file mode 100644
index 0000000..1a306b4
--- /dev/null
+++ b/package/uboot-tools/uboot-tools-2011.03-fw_env-NOR-write-fix.patch
@@ -0,0 +1,41 @@
+PATCH] Fix fw_env bug for multi-sector environments on NOR flash
+
+When storing u-boot environment variables on a NOR flash using multiple
+sectors, the following error occurs when writing changes using
+fw_setenv.
+
+/etc # cat fw_env.config
+/dev/mtd12  0x0000  0x20000  0x10000  2
+
+/etc # fw_setenv test test
+End of range reached, aborting
+Error: can't write fw_env to flash
+
+The reason for the error is that although both sectors are written in
+one pass, the loop for the write is executed twice because the
+"processed" variable is incremented by the incorrect amount.
+
+Signed-off-by: Yiyang Fei <yiyang.fei@barco.com>
+---
+ tools/env/fw_env.c |    5 ++---
+ 1 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
+index ed6b53f..e6b2cae 100644
+--- a/tools/env/fw_env.c
++++ b/tools/env/fw_env.c
+@@ -880,9 +880,8 @@ static int flash_write_buf (int dev, int fd, void 
*buf, size_t count,
+
+ 		ioctl (fd, MEMLOCK, &erase);
+
+-		processed  += blocklen;
+-		block_seek = 0;
+-		blockstart += blocklen;
++		processed  += erasesize;
++		blockstart += erasesize;
+ 	}
+
+ 	if (write_total > count)
+-- 
+1.7.2.5
+
-- 
1.7.2.5



DISCLAIMER:
Unless indicated otherwise, the information contained in this message is 
privileged and confidential, and is intended only for the use of the 
addressee(s) named above and others who have been specifically authorized 
to receive it. If you are not the intended recipient, you are hereby 
notified that any dissemination, distribution or copying of this message 
and/or attachments is strictly prohibited. The company accepts no 
liability for any damage caused by any virus transmitted by this email. 
Furthermore, the company does not warrant a proper and complete 
transmission of this information, nor does it accept liability for any 
delays. If you have received this message in error, please contact the 
sender and delete the message. Thank you.
