From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 20:33:22 +0200
Subject: [Buildroot] [git commit] external-toolchain: do not copy shared
	libraries when BR2_PREFER_STATIC_LIB=y
Message-ID: <20120429183343.A39A996C01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e3dac50454f17f8d1890dc7f2c7fcefbd929416
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 0a997a5..a45603a 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -372,13 +372,15 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	ARCH_LIB_DIR=`echo $${ARCH_LIBC_A_LOCATION} | sed -r -e 's:.*/usr/(lib(64)?)/(.*/)?libc.a:\1:'` ; \
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	mkdir -p $(TARGET_DIR)/lib ; \
-	echo "Copy external toolchain libraries to target..." ; \
-	for libs in $(LIB_EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
-	done ; \
-	for libs in $(USR_LIB_EXTERNAL_LIBS); do \
-		$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
-	done ; \
+	if test -z "$(BR2_PREFER_STATIC_LIB)" ; then \
+		echo "Copy external toolchain libraries to target..." ; \
+		for libs in $(LIB_EXTERNAL_LIBS); do \
+			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
+		done ; \
+		for libs in $(USR_LIB_EXTERNAL_LIBS); do \
+			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
+		done ; \
+	fi ; \
 	echo "Copy external toolchain sysroot to staging..." ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR}) ; \
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
