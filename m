Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17079E7735F
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 07:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5D8183D88;
	Sat, 30 Sep 2023 07:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5D8183D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XU7MN829fhit; Sat, 30 Sep 2023 07:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B9688233E;
	Sat, 30 Sep 2023 07:55:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B9688233E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C0ED1BF681
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D93CE41CD8
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 07:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D93CE41CD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gAsMR7afZC4H for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 07:54:36 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F70B403D6
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 07:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F70B403D6
Received: by mail.gandi.net (Postfix) with ESMTPA id 7BA9D40007;
 Sat, 30 Sep 2023 07:54:33 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Sat, 30 Sep 2023 09:54:22 +0200
Message-ID: <20230930075426.513345-7-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
References: <20230930075426.513345-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696060474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGIz1D7e/S/bGkZFe3Qtvcxu0oL7/+miRl0TlEHYKTY=;
 b=F2yDxa/nM0kvCSERMkUGBylG72MCZIk4LjgVfp2/cpmgTsbu+AQqfin5AXJdMxc/eO4zfL
 5kSDTZiyCr/LLwCE1mcISziNKEfoZx+CVYHeOLjl3WPbe6MKunDrhp4R5BBYUUNUtiVDRH
 VDxh2goxn9wP0jZ2yXzCZ/Gd55uZxw4GNKN1J8xL7zn8lcSjD98KfDMw7JB+hnfYVhjQTC
 BoRpGR5UR9f94GtR4VnVvOrVX9b7n7R0GpebRBloncDib76T788YlVpD5ETXzLj5xRwztP
 T8Fz2dEMrW4O0A0iJqcJY1BzC6HTdrkf8NVKZJEqPNG6aRkyeBhwV7uo5tjDWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F2yDxa/n
Subject: [Buildroot] [PATCH v2 6/7] package/gcc/gcc-final: add a target
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Henri Roosen <henri.roosen@ginzinger.com>,
 Stefan Mayrhofer <stefan.mayrhofer@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 package/gcc/Config.in                         |  3 ++
 package/gcc/gcc-final/gcc-final.mk            | 42 +++++++++----------
 toolchain/toolchain-buildroot/Config.in       |  1 +
 .../toolchain-buildroot.mk                    |  4 +-
 4 files changed, 27 insertions(+), 23 deletions(-)
 create mode 100644 package/gcc/Config.in

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
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
