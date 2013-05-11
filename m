From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 May 2013 11:49:34 -0300
Subject: [Buildroot] [PATCH] toolchain-external: fix bug #5054
Message-ID: <1368283774-19848-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The external toolchain logic checks (and finds) the proper ARCH_LIB_DIR
and forcibly copies it to */lib even if it's in */lib64
This is all well until the check is done for create_lib64_symlinks which
only verifies if ARCH_SYSROOT_DIR/lib64 is a symlink, which in some
toolchain it's a real directory (like sourcery x86_64 2012.09) and thus
doesn't make the symlink in the target.

Fix this by also checking for a real directory.

Easily reproducible by running "make qemu_x86_64_defconfig", switching
to an external toolchain before build, building and then trying to run
the resulting image.

Closes bug #5054

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-external/ext-tool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index bf2bee8..a87bc3b 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -446,7 +446,7 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	fi ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}) ; \
-	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
+	if [ -L $${ARCH_SYSROOT_DIR}/lib64 -o -d $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
 	fi ; \
 	if test x"$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" == x"y"; then \
-- 
1.8.1.5
