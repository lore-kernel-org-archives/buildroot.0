From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Dec 2010 16:10:30 -0300
Subject: [Buildroot] [PATCH 05/10] gcc: install copies of libgcc,
	libstdc++ and libgcj to the sysroot too
In-Reply-To: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1293563435-10054-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to keep a copy around for the future SDK functionality.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 543454b..215915d 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -421,6 +421,8 @@ ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These go in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcc_s* \
+		$(STAGING_DIR)/lib/
+	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcc_s* \
 		$(TARGET_DIR)/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgcc_s*
 endif
@@ -428,14 +430,20 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	mkdir -p $(TARGET_DIR)/usr/lib
 	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libstdc++.so* \
+		$(STAGING_DIR)/usr/lib/
+	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libstdc++.so* \
 		$(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
+	cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcj.so* $(STAGING_DIR)/usr/lib/
 	cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcj.so* $(TARGET_DIR)/usr/lib/
+	mkdir -p $(STAGING_DIR)/usr/lib/security
 	mkdir -p $(TARGET_DIR)/usr/lib/security
 	cp -dpf $(HOST_DIR)/usr/lib/security/classpath.security \
+		$(STAGING_DIR)/usr/lib/security/
+	cp -dpf $(HOST_DIR)/usr/lib/security/classpath.security \
 		$(TARGET_DIR)/usr/lib/security/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgcj.so*
 endif
-- 
1.7.2.2
