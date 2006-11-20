From: Goetz Bock <bock@blacknet.de>
Date: Mon, 20 Nov 2006 16:28:37 +0100
Subject: [Buildroot] patch: lvm2.mk
Message-ID: <20061120152837.GB3065@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear list,

building lvm2 as user failes, as the install step tries to write to
/etc/lvm/. Patch follows:

Index: package/lvm2/lvm2.mk
===================================================================
--- package/lvm2/lvm2.mk        (revision 16570)
+++ package/lvm2/lvm2.mk        (working copy)
@@ -56,7 +56,7 @@
 
 $(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
        $(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
-       $(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) install prefix=$(STAGING_DIR) exe
c_prefix=$(STAGING_DIR)
+       $(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) install DESTDIR=$(STAGING_DIR)
        for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/
$$binary $(TARGET_DIR)/sbin; done
 
 lvm2: uclibc dm $(LVM2_TARGET_SBINS)


-- 
Goetz Bock       (c) 2006 as     blacknet.de - Munich - Germany   /"\
IT Consultant  Creative Commons  secure mobile Linux everNETting  \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
