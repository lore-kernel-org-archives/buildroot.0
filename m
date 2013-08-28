From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Aug 2013 16:17:19 +0200
Subject: [Buildroot] [git commit] gcc-final: Drop obsolete code for handling
	lib64
Message-ID: <20130828141709.9DA299B5D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=027ef3f2b272e5b2d5b258eb4d50e4be8cad0603
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 5628776c4a4d29d0715633ea463b64cc19e19c5a
"toolchain-external: fix lib64 symlinks"

lib64 is a symlink to lib so there is no reason to copy the libraries
to lib64 anymore. This fixes multiple building problems
for buildroot toolchains:

[...]
mv: 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64/libuClibc-0.9.33.2.so'
and 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib/libuClibc-0.9.33.2.so'
are the same file
mv: 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64/libutil-0.9.33.2.so'
and 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib/libutil-0.9.33.2.so'
are the same file
mv: 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64/libutil.so.0'
and 'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib/libutil.so.0'
are the same file
rmdir: failed to remove
'output/host/usr/mips64-buildroot-linux-uclibc/sysroot/lib64': Not a directory
[...]

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/gcc-final/gcc-final.mk |   14 --------------
 1 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 9f54c68..b62dfe2 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -55,20 +55,6 @@ endif
 HOST_GCC_FINAL_CONF_OPT += \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
-# Handle lib64
-define HOST_GCC_FINAL_HANDLE_LIB64
-	if [ -d "$(STAGING_DIR)/lib64" ]; then \
-		if [ ! -e "$(STAGING_DIR)/lib" ]; then \
-			mkdir -p "$(STAGING_DIR)/lib"; \
-		fi; \
-		mv "$(STAGING_DIR)/lib64/"* "$(STAGING_DIR)/lib/"; \
-		rmdir "$(STAGING_DIR)/lib64"; \
-		rm "$(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/lib64";\
-	fi
-endef
-
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_HANDLE_LIB64
-
 # Make sure we have 'cc'
 define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
 	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
