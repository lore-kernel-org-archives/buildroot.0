From: Robert Carter <r.carter@cs.auckland.ac.nz>
Date: Tue, 31 Oct 2006 17:01:06 +1300
Subject: [Buildroot] [patch] sfdisk: seek error
In-Reply-To: <200610231115.19527.javierruere@apexar.com>
References: <200610231115.19527.javierruere@apexar.com>
Message-ID: <163A92C6-1084-4D2E-87F0-0E0203D6C7FA@cs.auckland.ac.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch to fix the error which appears with sfdisk when compiled  
with gcc 3.4.6.

seek error: wanted 0x0000000000000000, got 0x0000000000000000

Solution from this article:
http://linuxfromscratch.org/pipermail/lfs-dev/2004-August/048483.html

Rob


Index: package/sfdisk/sfdisk.mk
===================================================================
--- package/sfdisk/sfdisk.mk    (revision 16401)
+++ package/sfdisk/sfdisk.mk    (working copy)
@@ -15,7 +15,7 @@

  $(SFDISK_DIR)/sfdisk: $(SFDISK_DIR)
         $(MAKE) \
-               CROSS=$(TARGET_CROSS) DEBUG=false  OPTIMIZATION="$ 
(TARGET_CFLAGS)" \
+               CROSS=$(TARGET_CROSS) DEBUG=false OPTIMIZATION="$ 
(TARGET_CFLAGS) -fno-unit-at-a-time" \
                 -C $(SFDISK_DIR)
         -$(STRIP) $(SFDISK_DIR)/sfdisk;
         touch -c $(SFDISK_DIR)/sfdisk
