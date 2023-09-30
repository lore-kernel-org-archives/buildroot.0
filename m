Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B61E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1D7241C3D;
	Sat, 30 Sep 2023 13:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1D7241C3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dssvExo22sJS; Sat, 30 Sep 2023 13:12:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7699841D50;
	Sat, 30 Sep 2023 13:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7699841D50
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2A5C1BF86C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5ECE60B51
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5ECE60B51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CjIy5QZLA41r for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C14260F44
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C14260F44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 348D1839F1; Sat, 30 Sep 2023 13:11:03 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 14:49:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc3634187790d352684d892fd2bbdc9f2ba84925
X-Git-Newrev: bfcddf057099d25e2f19aeb43c31af0f772006dc
X-Patchwork-Hint: ignore
Message-Id: <20230930131103.348D1839F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc/gcc-final: add a target
 variant in charge of target installation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bfcddf057099d25e2f19aeb43c31af0f772006dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a target package "gcc-final", which is a target
package responsible for installing the gcc runtime libraries to
STAGING_DIR and TARGET_DIR. This task was so far done by the host
gcc-final package.

The motivation for splitting it up into a target package is to be able
to properly handle the licensing situation of GCC, where the host part
of GCC (the compiler itself) is under GPLv3, but the runtime libraries
on the target are under GPLv3-with-exception. So far, we were not
handling at all the license of gcc.

So what this commit does is:

 * Add a gcc-final target package, which is depended on by the
   toolchain-buildroot package, and which depends on
   host-gcc-final.

 * Moves to gcc-final the logic for installing target/staging
   libraries

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gcc/Config.in                              |  3 ++
 package/gcc/gcc-final/gcc-final.mk                 | 42 +++++++++++-----------
 toolchain/toolchain-buildroot/Config.in            |  1 +
 .../toolchain-buildroot/toolchain-buildroot.mk     |  4 +--
 4 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/package/gcc/Config.in b/package/gcc/Config.in
new file mode 100644
index 0000000000..d2a26abba1
--- /dev/null
+++ b/package/gcc/Config.in
@@ -0,0 +1,3 @@
+config BR2_PACKAGE_GCC_FINAL
+	bool
+	default y if BR2_TOOLCHAIN_BUILDROOT
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index ae6aedb2e7..bd18d9ea71 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -8,6 +8,11 @@ GCC_FINAL_VERSION = $(GCC_VERSION)
 GCC_FINAL_SITE = $(GCC_SITE)
 GCC_FINAL_SOURCE = $(GCC_SOURCE)
 
+GCC_FINAL_DEPENDENCIES = host-gcc-final
+GCC_FINAL_ADD_TOOLCHAIN_DEPENDENCY = NO
+GCC_FINAL_INSTALL_STAGING = YES
+
+GCC_FINAL_DL_SUBDIR = gcc
 HOST_GCC_FINAL_DL_SUBDIR = gcc
 
 HOST_GCC_FINAL_DEPENDENCIES = \
@@ -135,68 +140,63 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
 # -cc symlink to the wrapper is not created.
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
-HOST_GCC_FINAL_LIBS = libgcc_s libatomic
+GCC_FINAL_LIBS = libgcc_s libatomic
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-HOST_GCC_FINAL_USR_LIBS += libstdc++
+GCC_FINAL_USR_LIBS += libstdc++
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_DLANG),y)
-HOST_GCC_FINAL_USR_LIBS += libgdruntime libgphobos
+GCC_FINAL_USR_LIBS += libgdruntime libgphobos
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
-HOST_GCC_FINAL_USR_LIBS += libgfortran
+GCC_FINAL_USR_LIBS += libgfortran
 # fortran needs quadmath on x86 and x86_64
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBQUADMATH),y)
-HOST_GCC_FINAL_USR_LIBS += libquadmath
+GCC_FINAL_USR_LIBS += libquadmath
 endif
 endif
 
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
-HOST_GCC_FINAL_USR_LIBS += libgomp
+GCC_FINAL_USR_LIBS += libgomp
 endif
 
-HOST_GCC_FINAL_USR_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_LIBS))
+GCC_FINAL_USR_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_LIBS))
 
-define HOST_GCC_FINAL_INSTALL_STAGING_LIBS
-	$(foreach lib,$(HOST_GCC_FINAL_LIBS), \
+define GCC_FINAL_INSTALL_STAGING_CMDS
+	$(foreach lib,$(GCC_FINAL_LIBS), \
 		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib)* \
 			$(STAGING_DIR)/lib/
 	)
-	$(foreach lib,$(HOST_GCC_FINAL_USR_LIBS), \
+	$(foreach lib,$(GCC_FINAL_USR_LIBS), \
 		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib)* \
 			$(STAGING_DIR)/usr/lib/
 	)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-define HOST_GCC_FINAL_INSTALL_TARGET_LIBS
+define GCC_FINAL_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/lib $(TARGET_DIR)/usr/lib
-	$(foreach lib,$(HOST_GCC_FINAL_LIBS), \
+	$(foreach lib,$(GCC_FINAL_LIBS), \
 		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).so* \
 			$(TARGET_DIR)/lib/
 	)
-	$(foreach lib,$(HOST_GCC_FINAL_USR_LIBS), \
+	$(foreach lib,$(GCC_FINAL_USR_LIBS), \
 		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$(lib).so* \
 			$(TARGET_DIR)/usr/lib/
 	)
 endef
 endif
 
-define HOST_GCC_FINAL_INSTALL_LIBS
-	$(HOST_GCC_FINAL_INSTALL_STAGING_LIBS)
-	$(HOST_GCC_FINAL_INSTALL_TARGET_LIBS)
-endef
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBS
-
 # coldfire is not working without removing these object files from libgcc.a
 ifeq ($(BR2_m68k_cf),y)
-define HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
+define GCC_FINAL_M68K_LIBGCC_FIXUP
 	find $(STAGING_DIR) -name libgcc.a -print | \
 		while read t; do $(GNU_TARGET_NAME)-ar dv "$t" _ctors.o; done
 endef
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
+GCC_FINAL_POST_INSTALL_STAGING_HOOKS += HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
 endif
 
+$(eval $(generic-package))
 $(eval $(host-autotools-package))
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 64f7892f98..0173f40d97 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -111,4 +111,5 @@ source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
 source "package/gcc/Config.in.host"
+source "package/gcc/Config.in"
 endif
diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index 6da64b7c77..76862fa2e3 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -6,11 +6,11 @@
 
 BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
-# Triggering the build of the host-gcc-final will automatically do the
+# Triggering the build of the gcc-final will automatically do the
 # build of binutils, uClibc, kernel headers and all the intermediate
 # gcc steps.
 
-TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
+TOOLCHAIN_BUILDROOT_DEPENDENCIES = gcc-final
 
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
