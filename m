From: Jared Holzman <j.holzman@genesysdesign.com.au>
Date: Tue, 02 Dec 2008 15:15:22 +1100
Subject: [Buildroot] [PATCH] target/cramfs/cramfs.mk: Fix device table not
 being passed to mkcramfs
Message-ID: <4934B65A.90804@genesysdesign.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While mkcramfs was being patched to support a device table, the target device table was not being passed to the mkcramfs options. This patch fixes that

Signed-off-by: Jared Holzman <j.holzman@genesysdesign.com.au>

Index: target/cramfs/cramfs.mk
===================================================================
--- target/cramfs/cramfs.mk	(revision 24069)
+++ target/cramfs/cramfs.mk	(working copy)
@@ -40,11 +40,15 @@
 #
 #############################################################
 ifeq ($(BR2_ENDIAN),"BIG")
-CRAMFS_ENDIANNESS=-b
+CRAMFS_OPTS=-b
 else
-CRAMFS_ENDIANNESS=-l
+CRAMFS_OPTS=-l
 endif
 
+ifneq ($(TARGET_DEVICE_TABLE),)
+CRAMFS_OPTS += -D $(TARGET_DEVICE_TABLE)
+endif
+
 CRAMFS_TARGET=$(IMAGE).cramfs
 
 cramfsroot: host-fakeroot makedevs cramfs
@@ -68,7 +72,7 @@
 		>> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 endif
 	# Use fakeroot so mkcramfs believes the previous fakery
-	echo "$(CRAMFS_DIR)/mkcramfs -q $(CRAMFS_ENDIANNESS) " \
+	echo "$(CRAMFS_DIR)/mkcramfs -q $(CRAMFS_OPTS) " \
 		"$(TARGET_DIR) $(CRAMFS_TARGET)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	chmod a+x $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))
 	$(STAGING_DIR)/usr/bin/fakeroot -- $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(CRAMFS_TARGET))

---

Regards,

Jared Holzman

------------------------------------------------------------------------

*Electronics Design Engineer*

*Genesys Electronics Design Pty Ltd*

Unit 5, 33 Ryde Rd Pymble

NSW, Australia 2073

Direct: +612 9496 8924

Phone: +612 9496 8900

Fax: +612 9496 8999


j.holzman at genesysdesign.com.au <mailto:j.holzman@genesysdesign.com.au>

www.genesysdesign.com.au <http://www.genesysdesign.com.au>

------------------------------------------------------------------------
