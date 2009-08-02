From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Aug 2009 10:00:41 +0200
Subject: [Buildroot] [git commit] lvm: fix installation to target dir
Message-ID: <20090802080126.57E35775E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b0629253765226375fd1bf7e296ef1174cf9c620
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The installation to the target directory was broken for two reasons:

 * Due to how the lvm2.mk file was written, for each file listed in
   $(LVM2_TARGET_SBINS) and $(LVM2_TARGET_DMSETUP_SBINS), it was
   reinstalling all the files listed in those variables. When a target
   contains several elements, there's no need to make a loop to handle
   each of the elements: the rule will get executed as many times as
   they are elements in the target.

 * For some odd reason, lvm2 build system installs executable with 555
   and libraries with 444. Therefore, once copied to the target
   directory, these executables and libraries cannot be
   overwritten... for example by a later execution of Buildroot. We
   fix this up by changing the permissions of the binaries and
   libraries installed by lvm2 to saner values (755 and 644)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lvm2/lvm2.mk |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index b3467b5..3727e36 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -81,17 +81,19 @@ $(LVM2_DIR)/.configured: $(LVM2_DIR)/.unpacked
 $(LVM2_DIR)/.built: $(LVM2_DIR)/.configured
 	$(MAKE1) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
 	$(MAKE1) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
+	# Fixup write permissions so that the files can be overwritten
+	# several times in the $(TARGET_DIR)
+	chmod 755 $(STAGING_DIR)/sbin/lvm
+	chmod 755 $(STAGING_DIR)/sbin/dmsetup
+	chmod 644 $(STAGING_DIR)/lib/$(LVM2_LIB)
 	touch $(LVM2_DIR)/.built
 
 
-$(LVM2_TARGET_SBINS): $(LVM2_DIR)/.built
-	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
-
-$(LVM2_TARGET_DMSETUP_SBINS): $(LVM2_DIR)/.built
-	for binary in $(LVM2_DMSETUP_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
+$(LVM2_TARGET_SBINS) $(LVM2_TARGET_DMSETUP_SBINS): $(LVM2_DIR)/.built
+	cp -a $(STAGING_DIR)/sbin/$(notdir $@) $@
 
 $(LVM2_TARGET_LIBS): $(LVM2_DIR)/.built
-	for lib in $(LVM2_LIB); do echo $$lib; cp -a $(STAGING_DIR)/lib/$$lib $(TARGET_DIR)/lib; done
+	cp -a $(STAGING_DIR)/lib/$(notdir $@) $@
 
 
 ifeq ($(BR2_PACKAGE_LVM2_DMSETUP_ONLY),y)
-- 
1.6.3.3
