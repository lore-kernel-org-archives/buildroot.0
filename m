From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Apr 2010 10:30:53 +0200
Subject: [Buildroot] [git commit master] uclibc: Fix for improper copying of
	kernel headers
Message-ID: <20100403083230.359DB88D30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=17541bd0ecab812942ff7d6f1963e520f3903d29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1219

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 toolchain/uClibc/uclibc.mk |   39 ---------------------------------------
 2 files changed, 1 insertions(+), 39 deletions(-)

diff --git a/CHANGES b/CHANGES
index c6ab12b..69867e9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,6 +25,7 @@
 	#1117: Bump nano to 2.2.3 and migrate to Makefile.autotools.in
 	#1123: Bump less to 436 and migrate to Makefile.autotools.in
 	#1129: Bump memstat to 0.8 and migrate to Makefile.package.in
+	#1219: kernel headers not correctly installed into toolchain/staging
 	#1273: BR2_INET_IPV6 does not enable IPv6 in pppd
 	#1303: Add librsync package
 	#1327: mtd-utils compile failure due to lack of --sysroot in CFLAGS
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 765a684..db346f0 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -419,23 +419,10 @@ $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.confi
 		$(if $(BR2_UCLIBC_VERSION_0_9_28_3),install_dev,install_headers)
 	# Install the kernel headers to the first stage gcc include dir
 	# if necessary
-ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 	if [ ! -f $(TOOLCHAIN_DIR)/uClibc_dev/usr/include/linux/version.h ]; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/* \
 			$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
 	fi
-else
-	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/asm \
-			$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/linux \
-			$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
-		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ]; then \
-			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
-				$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
-		fi; \
-	fi
-endif
 	touch $@
 
 $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_initial) $(LIBFLOAT_TARGET)
@@ -476,23 +463,10 @@ else
 		install_runtime install_dev
 endif
 	# Install the kernel headers to the staging dir if necessary
-ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/* \
 			$(STAGING_DIR)/usr/include/; \
 	fi
-else
-	if [ ! -f $(STAGING_DIR)/usr/include/linux/version.h ]; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/asm \
-			$(STAGING_DIR)/usr/include/; \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/linux \
-			$(STAGING_DIR)/usr/include/; \
-		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ]; then \
-			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
-				$(STAGING_DIR)/usr/include/; \
-		fi; \
-	fi
-endif
 	# Build the host utils. Need to add an install target...
 	$(MAKE1) -C $(UCLIBC_DIR)/utils \
 		PREFIX=$(STAGING_DIR) \
@@ -607,23 +581,10 @@ $(TARGET_DIR)/usr/lib/libc.a: $(STAGING_DIR)/usr/lib/libc.a
 		RUNTIME_PREFIX=/ \
 		install_dev
 	# Install the kernel headers to the target dir if necessary
-ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ]; then \
 		cp -pLR $(LINUX_HEADERS_DIR)/include/* \
 			$(TARGET_DIR)/usr/include/; \
 	fi
-else
-	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ]; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/asm \
-			$(TARGET_DIR)/usr/include/; \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/linux \
-			$(TARGET_DIR)/usr/include/; \
-		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ]; then \
-			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
-				$(TARGET_DIR)/usr/include/; \
-		fi; \
-	fi
-endif
 	touch -c $@
 
 uclibc_target: cross_compiler uclibc $(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
-- 
1.6.3.3
