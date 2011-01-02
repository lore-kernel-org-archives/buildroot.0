From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Jan 2011 22:55:37 +0100
Subject: [Buildroot] [git commit master 1/1] gcc: install copies of libgcc,
	libstdc++ and libgcj to the sysroot
Message-ID: <20110102220443.4A5938F346@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5bd272eb6bdd85c2de7ee1405058dbb0131b8beb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to keep a copy around for the future SDK functionality.

Also it's a better fix for bug #1051.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/gcc-uclibc-4.x.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 0d6f2ae..633b8aa 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -424,6 +424,8 @@ ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These go in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcc_s* \
+		$(STAGING_DIR)/lib/
+	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcc_s* \
 		$(TARGET_DIR)/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgcc_s*
 endif
@@ -431,14 +433,20 @@ ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
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
