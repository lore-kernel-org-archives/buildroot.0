From: Nicolas Pitre <nico@cam.org>
Date: Wed, 03 Dec 2008 15:37:03 -0500 (EST)
Subject: [Buildroot] [PATCH 1/3] create a libuuid subtarget in the e2fsprogs
	package
Message-ID: <alpine.LFD.2.00.0812031536150.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This is needed to build the latest mkfs.ubifs provided by the next patch.

Signed-off-by: Nicolas Pitre <nico@cam.org>

Index: package/e2fsprogs/e2fsprogs.mk
===================================================================
--- package/e2fsprogs/e2fsprogs.mk	(revision 24219)
+++ package/e2fsprogs/e2fsprogs.mk	(working copy)
@@ -68,6 +74,16 @@
 	#$(STRIPCMD) $(E2FSPROGS_DIR)/lib/lib*.so.*.*
 	touch -c $@
 
+$(E2FSPROGS_DIR)/lib/uuid/libuuid.a: $(E2FSPROGS_DIR)/.configured
+	$(MAKE1) -C $(E2FSPROGS_DIR)/lib/uuid
+
+$(STAGING_DIR)/usr/lib/libuuid.a: $(E2FSPROGS_DIR)/lib/uuid/libuuid.a
+	$(INSTALL) -D $(E2FSPROGS_DIR)/lib/uuid/libuuid.a $(STAGING_DIR)/usr/lib/libuuid.a
+	$(INSTALL) -D $(E2FSPROGS_DIR)/lib/uuid/uuid.h $(STAGING_DIR)/usr/include/uuid/uuid.h
+	touch -c $@
+
+libuuid: $(STAGING_DIR)/usr/lib/libuuid.a
+
 E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_BADBLOCKS)) += ${TARGET_DIR}/sbin/badblocks
 E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_BLKID)) += ${TARGET_DIR}/sbin/blkid
 E2FSPROGS_RM$(strip $(BR2_PACKAGE_E2FSPROGS_CHATTR)) += ${TARGET_DIR}/bin/chattr
