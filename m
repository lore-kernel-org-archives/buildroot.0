From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Jul 2013 00:25:06 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-external: don't use
	x$(...) construct or ==
Message-ID: <20130718061512.23E6B9A299@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f50eff3401e5f41f68bd08d92d9886eecf23926f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With modern shells, we can simply do test using the "$(...)" = "value"
form. This commit gets rid of the x$(...) = x"value" constructs and
replaces == by =, which is the correct operator to test the equality
of two strings with the test program.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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
