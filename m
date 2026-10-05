Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387ECCA5FFC
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 22:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6D214061D;
	Mon,  5 Oct 2026 22:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yTDYHf1dG0wL; Mon,  5 Oct 2026 22:37:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4E59F40648
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791239837;
	b=LO3kM9cA5hEjY3pyHfydwdpl2jSMWMijT59rmKtIRY5ZM9EJtygCghJme7o3YmqvBcxh
	 fWupJhuumeg6Lhm4G3cuBO0ve3n9r4AayqvQ0xY+3xmkGVzAJbLCp6CJT/g9glOm/YAwP
	 LPe3Jzg7Ny6MxkR8v9OZpWZWy9ACk5/nkP9DVAJejGmWuYy/nfX+E7ZQGdpP3YKIbiaMg
	 NmQmmUo5Mwt5RaAo00DP9ftFTR/gAbQm9QdufDShJAmacH1oni06+rqyP7iXNvtdMe1oB
	 OrurYj2RG1JHULwTXDy9O3iGQCdua2cm7n7g5fSfBaRCvMpbatpif3vC1bceDvLXiwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791239837;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:From:
	 To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=m0bQdP3CUBEo1ILgpfm6hn9DNhUeeqO95w+Pc3kSk30=;
	b=PiVdDLY6foLHUiuXqe+da4AJQeOypa1G4hXTVGpsp79QrDs/twskmKDtj0RnrIAWTlJs
	 /OkoANEILh7GlHHElPqWkBuZx9sPGFgnfe+VJ1CSIZJ41h5eBbyvxTKxtznSrXcFi/8og
	 rphWJ6eU+vYN71ycM9v+DNu6mTYafLD9+aDLaMQu41GKpnYvAiHad+02/UIyAJ/lVMazP
	 J5XYw/vrL/HDxpu/T/W0MZU2tAz9A8cVE6zb8PRwx58X1Xx03nUC8Wzs2EMhel6z+wnMg
	 PJhptIWDLclLwlSN6biIzsXHzvR2/jhTPGUg18RXTem1AcORoAcngNaz7LcotIg2JKg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791239837;
	bh=m0bQdP3CUBEo1ILgpfm6hn9DNhUeeqO95w+Pc3kSk30=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QmavSDWx2QpZVqAyfSSsDf1tlgQ56Os6RSU6mnuqClUFQFzeBp5+tlLDKpvp3rRwM
	 VH70e4C3Vqv+OY+XRqIy03nTBFiPVGXk3gaSwRGUbiT3hrZLlBHem9EGkcRIY9byJ4
	 DKN5QuOEGdyc3TGtrq8MVCwXGtsVwdzJaKckCIjMdXxdq0PJlKnM5I9ykfhrSZUJEh
	 zHo5unZl34Jnmh39pMQf4WBXnfov6ugr6+CjVBOw9byqnXcABvmxeymgE8ACqcieWI
	 9Rxw909gcq1e5YyPTgb1FB+prgP3+Oh1FMOObaxiwzGAkqdzJweTROzWa1+XLJ1sJ5
	 3MUydmtQ5wChQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E59F40648;
	Mon,  5 Oct 2026 22:37:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 301912E0
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2135D80B89
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JrPnsDrdPg8p for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 22:34:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CD9DD80A50
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=207.191.199.123
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791239681;
 b=rZP4ubqXcsn9RLjoACZfoStPbIcWXfulNUrbAKi2V5c0LW/HxrPjBcCLUhnhJBKCo0pg
 LfVq4dzC0XJTu9GmRdNEmCFDwH8Lxu4q7ZpOEvXYhmSHOVut1kbcyJUSrlsx6vKIw8XbJ
 1I56Oz4ab6HhiA22ectC5xoMvJeSxquRcA2H3VbfgzlI2ZbOtFieJynYcFg/M+PFxDGoL
 k9xVwFLz14sBvVh+u2ddyPZ/fXVTqCKMNEbXpXGujVBkYNIVkmkiQvtJnQU/GBK/Wn9K4
 WrKiccc5OHQQVCuKzVenXMmPhWN0JlQN9Ky7bVKUSo//7i71iC5ig97U2Si0iH9ZQBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791239681;
 h=Received-SPF:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=OJSDf+7EsWKp0Q83i4hNVdDh9TmAwghSToUt7eVEofY=;
 b=bgyFdwosUPHXH0RD5CCr3czW9/TWP5EsYHaig0O8q0hkz1wE4JNkVf1zW6YL4hlcitZ4
 DtIkLcmg45Z3uO6fsc5DGu8svsVm4DZR98eHDc0cKB2kwWrMGVsEbqDl7ZFcmsfTIPoUq
 XUTjdnpAHEam9VrNg7fGSqH4GE6DT+kRVuFkKCWwCQB9JW3rFZMD9TADcv0twI0QK7ku6
 HJKzoD3KsYcvMEXVATVWI17Nw0IXF2pE/pfuDK4LObq1roJrCJ9FWMOCLRWu3cd0YjpKh
 VN/C/9bm+Ig8wzAuQ3VMbZ2ukPeniby8+NV3y5lVq73HPdIi6YqC3hDo4oFgYo+CIHQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=realitydiluted.com; 
 arc=none smtp.remote-ip=207.191.199.123
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=207.191.199.123;
 helo=home.bethel-hill.org; envelope-from=sjhill@realitydiluted.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none)
 header.from=realitydiluted.com
Received: from home.bethel-hill.org
 (207-191-199-123.dhcp.imoncommunications.net [207.191.199.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD9DD80A50
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:34:40 +0000 (UTC)
Received: from localhost.centaur.lan ([127.0.0.1]:46348
 helo=home.bethel-hill.org)
 by home.bethel-hill.org with esmtp (Exim 4.98.2)
 (envelope-from <sjhill@realitydiluted.com>)
 id 1xDrGT-00000001Vch-2BfB; Mon, 05 Oct 2026 22:34:33 +0000
From: "Steven J. Hill" <sjhill@realitydiluted.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Neal Frager <neal.frager@amd.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Steven J. Hill" <sjhill@realitydiluted.com>,
 "Steven J. Hill" <steven.hill@collins.com>
Date: Mon,  5 Oct 2026 22:33:11 +0000
Message-ID: <20261005223427.359874-3-sjhill@realitydiluted.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005223427.359874-1-sjhill@realitydiluted.com>
References: <20261005223427.359874-1-sjhill@realitydiluted.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] gcc-bare-metal: add directories for second
 stage GCC.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add directories which will be used for building a bare metal
toolchain capable of supporting C++ and other languages. The
support will be enabled in future patches.

Signed-off-by: Steven J. Hill <steven.hill@collins.com>
Signed-off-by: Steven J. Hill <sjhill@realitydiluted.com>
---
 .../gcc-bare-metal-final.hash                 |  8 ++
 .../gcc-bare-metal-final.mk                   | 96 +++++++++++++++++++
 .../gcc-bare-metal-initial.hash               |  8 ++
 .../gcc-bare-metal-initial.mk                 | 70 ++++++++++++++
 4 files changed, 182 insertions(+)
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.hash
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.mk
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.hash
 create mode 100644 package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.mk

diff --git a/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.hash b/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.hash
new file mode 100644
index 0000000000..1e1003eec9
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.hash
@@ -0,0 +1,8 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.2.0/sha512.sum
+sha512  c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1  gcc-16.2.0.tar.xz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.mk b/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.mk
new file mode 100644
index 0000000000..57d934260b
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal-final/gcc-bare-metal-final.mk
@@ -0,0 +1,96 @@
+################################################################################
+#
+# gcc-bare-metal-final
+#
+################################################################################
+
+GCC_BARE_METAL_FINAL_VERSION = $(GCC_BARE_METAL_VERSION)
+GCC_BARE_METAL_FINAL_SITE = $(GCC_BARE_METAL_SITE)
+GCC_BARE_METAL_FINAL_SOURCE = $(GCC_BARE_METAL_SOURCE)
+GCC_BARE_METAL_FINAL_LICENSE = $(GCC_BARE_METAL_SOURCE)
+GCC_BARE_METAL_FINAL_LICENSE_FILES = $(GCC_BARE_METAL_LICENSE)
+GCC_BARE_METAL_FINAL_CPE_ID_VENDOR = gnu
+GCC_BARE_METAL_FINAL_CPE_ID_PRODUCT = gcc
+
+GCC_BARE_METAL_FINAL_ADD_TOOLCHAIN_DEPENDENCY = NO
+GCC_BARE_METAL_FINAL_INSTALL_STAGING = YES
+
+GCC_BARE_METAL_FINAL_DL_SUBDIR = $(HOST_GCC_BARE_METAL_DL_SUBDIR)
+HOST_GCC_BARE_METAL_FINAL_DL_SUBDIR = $(GCC_BARE_METAL_FINAL_DL_SUBDIR)
+
+HOST_GCC_BARE_METAL_FINAL_DEPENDENCIES = \
+	$(HOST_GCC_BARE_METAL_DEPENDENCIES) \
+	newlib-bare-metal-nano
+
+HOST_GCC_BARE_METAL_FINAL_EXCLUDES = \
+	$(HOST_GCC_BARE_METAL_EXCLUDES)
+
+HOST_GCC_BARE_METAL_FINAL_MAKE_OPTS = \
+	$(HOST_GCC_BARE_METAL_MAKE_OPTS) \
+	all-gcc \
+	all-target-libgcc
+
+HOST_GCC_BARE_METAL_FINAL_INSTALL_OPTS = \
+	$(HOST_GCC_BARE_METAL_INSTALL_OPTS)
+
+HOST_GCC_BARE_METAL_FINAL_CONF_OPTS = \
+	$(HOST_GCC_BARE_METAL_CONF_OPTS) \
+	$(HOST_GCC_BARE_METAL_FINAL_MULTILIB) \
+	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS)) \
+	--with-build-time-tools=$(HOST_DIR)/$(GNU_TARGET_NAME)/bin \
+	--with-native-system-header-dir=/usr/include \
+	--enable-languages=c,c++ \
+	--enable-lto \
+	--disable-shared \
+	--disable-threads \
+	--enable-languages=c,c++ \
+	--enable-tls \
+	--with-newlib \
+	--disable-libmudflap \
+	--disable-libssp \
+	--disable-libquadmath \
+	--disable-libgomp \
+	--disable-nls \
+	--disable-tm-clone-registry \
+	--disable-multilib
+
+HOST_GCC_BARE_METAL_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib*
+
+define HOST_GCC_BARE_METAL_FINAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		MAKEINFO=missing \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(HOST_GCC_BARE_METAL_FINAL_CONF_OPTS) \
+			$(GCC_FINAL_BARE_METAL_EXTRA_CONF_OPTS_$(arch_tuple)) \
+			--target=$(arch_tuple) \
+			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
+			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
+			RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ranlib
+	)
+endef
+
+define HOST_GCC_BARE_METAL_FINAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_FINAL_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_GCC_BARE_METAL_FINAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			-C $(@D)/build-$(arch_tuple) \
+			$(HOST_GCC_BARE_METAL_FINAL_INSTALL_OPTS) \
+			install
+	)
+endef
+
+$(eval $(generic-package))
+$(eval $(host-autotools-package))
diff --git a/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.hash b/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.hash
new file mode 100644
index 0000000000..1e1003eec9
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.hash
@@ -0,0 +1,8 @@
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-16.2.0/sha512.sum
+sha512  c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1  gcc-16.2.0.tar.xz
+
+# Locally calculated
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.mk b/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.mk
new file mode 100644
index 0000000000..872ae15a31
--- /dev/null
+++ b/package/gcc-bare-metal/gcc-bare-metal-initial/gcc-bare-metal-initial.mk
@@ -0,0 +1,70 @@
+################################################################################
+#
+# gcc-bare-metal-initial
+#
+################################################################################
+
+GCC_BARE_METAL_INITIAL_VERSION = $(GCC_BARE_METAL_VERSION)
+GCC_BARE_METAL_INITIAL_SITE = $(GCC_BARE_METAL_SITE)
+GCC_BARE_METAL_INITIAL_SOURCE = $(GCC_BARE_METAL_SOURCE)
+GCC_BARE_METAL_INITIAL_LICENSE = $(GCC_BARE_METAL_LICENSE)
+GCC_BARE_METAL_INITIAL_LICENSE_FILES = $(GCC_BARE_METAL_LICENSE_FILES)
+
+HOST_GCC_BARE_METAL_INITIAL_DL_SUBDIR = $(HOST_GCC_BARE_METAL_DL_SUBDIR)
+
+HOST_GCC_BARE_METAL_INITIAL_DEPENDENCIES = \
+	$(HOST_GCC_BARE_METAL_DEPENDENCIES)
+
+HOST_GCC_BARE_METAL_INITIAL_EXCLUDES = \
+	$(HOST_GCC_BARE_METAL_EXCLUDES)
+
+HOST_GCC_BARE_METAL_INITIAL_MAKE_OPTS = \
+	$(HOST_GCC_BARE_METAL_MAKE_OPTS) \
+	all-gcc \
+	all-target-libgcc
+
+HOST_GCC_BARE_METAL_INITIAL_INSTALL_OPTS = \
+	$(HOST_GCC_BARE_METAL_INSTALL_OPTS)
+
+HOST_GCC_BARE_METAL_INITIAL_CONF_OPTS = \
+	$(HOST_GCC_BARE_METAL_CONF_OPTS) \
+	--enable-languages=c \
+	--disable-__cxa_atexit \
+	--disable-largefile \
+	--disable-libstdcxx-pch \
+	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
+
+define HOST_GCC_BARE_METAL_INITIAL_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		$(HOST_CONFIGURE_OPTS) \
+		MAKEINFO=missing \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(HOST_GCC_BARE_METAL_INITIAL_CONF_OPTS) \
+			$(GCC_INITIAL_BARE_METAL_EXTRA_CONF_OPTS_$(arch_tuple))\
+			--target=$(arch_tuple) \
+			--with-sysroot=$(HOST_DIR)/$(arch_tuple)/sysroot \
+			AR_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ar \
+			RANLIB_FOR_TARGET=$(HOST_DIR)/bin/$(arch_tuple)-ranlib
+	)
+endef
+
+define HOST_GCC_BARE_METAL_INITIAL_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_INITIAL_METAL_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define HOST_GCC_BARE_METAL_INITIAL_INSTALL_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		$(HOST_MAKE_ENV) $(MAKE) \
+			$(HOST_GCC_BARE_METAL_INTIAL_INSTALL_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+$(eval $(host-autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
