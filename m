From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jul 2013 22:30:49 +0200
Subject: [Buildroot] [PATCHv3 3/4] toolchain/toolchain-external: don't use
	x$(...) construct or ==
In-Reply-To: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1374093050-30344-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With modern shells, we can simply do test using the "$(...)" = "value"
form. This commit gets rid of the x$(...) = x"value" constructs and
replaces == by =, which is the correct operator to test the equality
of two strings with the test program.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/ext-tool.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 80e03b9..8aac50e 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -368,15 +368,15 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
 	fi ; \
-	if test x$(BR2_arm) == x"y" ; then \
+	if test "$(BR2_arm)" = "y" ; then \
 		$(call check_arm_abi,\
 			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
 			$(TOOLCHAIN_EXTERNAL_READELF)) ; \
 	fi ; \
-	if test x$(BR2_INSTALL_LIBSTDCPP) == x"y" ; then \
+	if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
 		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
 	fi ; \
-	if test x$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC) == x"y" ; then \
+	if test "$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
 		$(call check_uclibc,$${SYSROOT_DIR}) ; \
 	else \
 		$(call check_glibc,$${SYSROOT_DIR}) ; \
@@ -464,7 +464,7 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 -o -d $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
 	fi ; \
-	if test x"$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" == x"y"; then \
+	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
 		$(call MESSAGE,"Copying gdbserver") ; \
 		gdbserver_found=0 ; \
 		for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} ; do \
-- 
1.8.1.2
