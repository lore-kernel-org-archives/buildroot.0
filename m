Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEEECA5FF5
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 22:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D964260778;
	Mon,  5 Oct 2026 22:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqwqCA2ehZCE; Mon,  5 Oct 2026 22:37:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8E39060761
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791239835;
	b=hU5kjIvi5aZw4FlrvMCuoQpiibZtkGTjsd34yYlMUkvzTHzQ6UrUdgHqPNl+fp9w/rbl
	 bQsb5O6le+5WDaZFWjcI51uzo7mKMqbvJci8+AOHxXuN6FhanWvatE1zEMoeSxskOXYY6
	 wUrI+zY3Rv0pCaeVu2x74aNRuKJzB0WGf0NbjdGARPYdnerNBm09McMJdcoHutBJV1AR1
	 6eJgPlUcIHbL0nhA+YfhPUEmHK3mSQPy2OudJaRAuq4QbbR8vxSCSAaPKRoaRW7qASuH/
	 Yn2NqDPj5XHTSlNsx+az3Fb+4eWtMxgHsBF6G9zfA3VRMi/PNXXdmAVQ/7SSu++jfRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791239835;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:From:
	 To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CCRosAKMPWFaDJv51DPIP5HPUYsN97KfEgDOcRuLZfc=;
	b=OKjQhKxuwiKfQ5HAxeRRiyT5FzXG6bDQW2xr63+OVbb7oLVK5d0Zhd3It34317ujjz7s
	 8NiHPZEnZNbJmVaiiWFvKTfp9fs2XG/nT3uVEE8xGstmZOwYj8YLLYJVpKtes1ZP/Tl2I
	 lawixrU4+FOFR8ajsHzXesVTsThK7YKunZ4o/pBDkvchDjbsXh04MHHHdUjgn5gbB7CKX
	 PGmm8Q3KnJ8atTZ6AV+oGMtCAnj0WFwb7Rj976uq75649wKnMJRWp/RlrDo+SqjmAxJ3J
	 RZVcFYHqNgZEkDgG/AvAwKjcj0XBGZFWxC1servLxZMIDqQKCxg/trG8Lu3E+RjoSiQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=none header.from=realitydiluted.com;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791239835;
	bh=CCRosAKMPWFaDJv51DPIP5HPUYsN97KfEgDOcRuLZfc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WClm+roU4K0W8gjVp1RRYE8neiv3Xc5fWT7hmUeDhwuzRqoFRWy8LwoIP4d+Dc5dk
	 7aOv1jytYBhatZkVTIDw9ljZdf+lRdf8SvglqNPTUKMTYK8H6jI6D6kMLnxG+rCW+E
	 MFJmIZnsI9sF0lykDFqOWq8dgK0pAO6AEjyb0tKbeSkLl7Qlp2ZZ1mIKxDFMNyYh/h
	 MNhNhhoWxRVyTy16KGyh766stPy+E3W+IMhVczjKwH05IUjJHsjRNWWQ3BZtaDIenU
	 2ht8uukCYEacgzBLT4RS7bM0I8Ns0UJXJJ965kcH61DwlkmkMbTnnj1abyVPwT//hx
	 hMgr8pmxc500A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E39060761;
	Mon,  5 Oct 2026 22:37:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E06ED2E0
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6EE96069E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UdSTMw_s53e for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 22:34:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DC461605D2
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=207.191.199.123
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791239680;
 b=iq+AXV6yLKMyERESKuLZOktUew1NakTnkV6/llQamp6JAlf4oGmsvlO6K9AZAN3dgldn
 0hV3FZNx6UHgZN2SPcc9b160kj6ROw1Fzy6vR6QGg8H2lEB44AL901KzGBI5UIVJvZhjZ
 adyVN5sOcTvVnTLf0rJNWDyoKY00ypcCXv9XD6AyBe3wgnrW6ptnDsZm1LwsRffyotN5P
 frqb3Eco+38mxbcIzBXq0vWV2DuF6+HuVMBnBf26VAjPUuXtm2Hkv6aB1X21ufQu/MiA8
 2+bvKWBvpokqYLXi40xkMdW3ulg6Xw8s7tJFeZLgk9K1ueRy8fFMDWZpH1sckwAi+RQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791239680;
 h=Received-SPF:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=lh2br2/3oQxL1V8bfxM88LGOetWXL7sUF9PQVmiw++k=;
 b=P40fl0iie4sxGtJZbT/CICcxUIMULyPUwXRrZaARN9ML2R/lF+0aguUXo2sgfufRD5Cy
 8FVVK3jCJRCTAVr40+8S8t/Dg20d+XnOOKgcisLhlUrASz1s/A3s9uW4RsGzS73Mr6z1O
 TXwFUa401WqI/ALUjqkxeqftEf/7BDUQMl0EgMRsVSDD9f+QCmhlCHwYrqhIw3GO40zYA
 bF8S6NStPbO4F9QKJ2//91ZQl7YWd2E5Y1zsW1rOBX+imAghnzgWM+1Djf2SPssn6R9j1
 W76n7XtStDcDB0HTtBF92C7SXMTFEjlkzmFo31n8O4D9bOuLZHgV9Ysr1u7t4UKBuSw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=realitydiluted.com; 
 arc=none smtp.remote-ip=207.191.199.123
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=207.191.199.123;
 helo=home.bethel-hill.org; envelope-from=sjhill@realitydiluted.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none)
 header.from=realitydiluted.com
Received: from home.bethel-hill.org
 (207-191-199-123.dhcp.imoncommunications.net [207.191.199.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC461605D2
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:34:39 +0000 (UTC)
Received: from localhost.centaur.lan ([127.0.0.1]:46348
 helo=home.bethel-hill.org)
 by home.bethel-hill.org with esmtp (Exim 4.98.2)
 (envelope-from <sjhill@realitydiluted.com>)
 id 1xDrGR-00000001Vch-1ltr; Mon, 05 Oct 2026 22:34:31 +0000
From: "Steven J. Hill" <sjhill@realitydiluted.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Neal Frager <neal.frager@amd.com>, Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Steven J. Hill" <sjhill@realitydiluted.com>,
 "Steven J. Hill" <steven.hill@collins.com>
Date: Mon,  5 Oct 2026 22:33:09 +0000
Message-ID: <20261005223427.359874-1-sjhill@realitydiluted.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] newlib-bare-metal-nano: add new package
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

Add new package for building of the nano C-runtime used by
bare metal toolchains wanting C++ language support. Building
of the package will be enabled in future patches.

Signed-off-by: Steven J. Hill <steven.hill@collins.com>
Signed-off-by: Steven J. Hill <sjhill@realitydiluted.com>
---
 package/newlib-bare-metal-nano/Config.in      | 10 ++
 .../newlib-bare-metal-nano.hash               |  1 +
 .../newlib-bare-metal-nano.mk                 | 98 +++++++++++++++++++
 package/newlib-bare-metal/Config.in           | 10 ++
 .../toolchain-bare-metal-buildroot/Config.in  | 11 +++
 .../toolchain-bare-metal-buildroot.mk         |  3 +
 6 files changed, 133 insertions(+)
 create mode 100644 package/newlib-bare-metal-nano/Config.in
 create mode 120000 package/newlib-bare-metal-nano/newlib-bare-metal-nano.hash
 create mode 100644 package/newlib-bare-metal-nano/newlib-bare-metal-nano.mk

diff --git a/package/newlib-bare-metal-nano/Config.in b/package/newlib-bare-metal-nano/Config.in
new file mode 100644
index 0000000000..04e6325917
--- /dev/null
+++ b/package/newlib-bare-metal-nano/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NEWLIB_BARE_METAL_NANO
+	bool
+	default y if BR2_PACKAGE_NEWLIB_BARE_METAL
+	help
+	  newlib-nano is an open source C library (libc) targeting
+	  embedded microcontrollers (MCU). Implementation focus is on
+	  code and data size reduction through optimization and removal
+	  of non-MCU features.
+
+	  https://github.com/32bitmicro/newlib-nano-1.0
diff --git a/package/newlib-bare-metal-nano/newlib-bare-metal-nano.hash b/package/newlib-bare-metal-nano/newlib-bare-metal-nano.hash
new file mode 120000
index 0000000000..f5ffcdfaba
--- /dev/null
+++ b/package/newlib-bare-metal-nano/newlib-bare-metal-nano.hash
@@ -0,0 +1 @@
+../newlib-bare-metal/newlib-bare-metal.hash
\ No newline at end of file
diff --git a/package/newlib-bare-metal-nano/newlib-bare-metal-nano.mk b/package/newlib-bare-metal-nano/newlib-bare-metal-nano.mk
new file mode 100644
index 0000000000..4461cd600d
--- /dev/null
+++ b/package/newlib-bare-metal-nano/newlib-bare-metal-nano.mk
@@ -0,0 +1,98 @@
+################################################################################
+#
+# newlib-bare-metal-nano
+#
+################################################################################
+
+NEWLIB_BARE_METAL_NANO_VERSION = $(NEWLIB_BARE_METAL_VERSION)
+NEWLIB_BARE_METAL_NANO_SITE = $(NEWLIB_BARE_METAL_SITE)
+NEWLIB_BARE_METAL_NANO_SOURCE = $(NEWLIB_BARE_METAL_SOURCE)
+NEWLIB_BARE_METAL_NANO_DEPENDENCIES = newlib-bare-metal
+NEWLIB_BARE_METAL_NANO_ADD_TOOLCHAIN_DEPENDENCY = NO
+NEWLIB_BARE_METAL_NANO_LICENSE = $(NEWLIB_BARE_METAL_LICENSE)
+NEWLIB_BARE_METAL_NANO_LICENSE_FILES = $(NEWLIB_BARE_METAL_LICENSE_FILES)
+NEWLIB_BARE_METAL_NANO_CPE_ID_VENDOR = $(NEWLIB_BARE_METAL_CPE_ID_VENDOR)
+NEWLIB_BARE_METAL_NANO_CPE_ID_PRODUCT = $(NEWLIB_BARE_METAL_CPE_ID_PRODUCT)
+
+NEWLIB_BARE_METAL_NANO_INSTALL_STAGING = YES
+NEWLIB_BARE_METAL_NANO_INSTALL_TARGET = NO
+
+NEWLIB_BARE_METAL_NANO_CONF_OPTS = \
+	--build=$(GNU_HOST_NAME) \
+	--prefix=/usr \
+	--exec-prefix=/usr \
+	--sysconfdir=/etc \
+	--localstatedir=/var \
+	--program-prefix="" \
+	$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \
+	$(QUIET) \
+	--enable-newlib-io-c99-formats \
+	--enable-newlib-io-long-long \
+	--enable-newlib-io-float \
+	--enable-newlib-io-long-double \
+	--with-tooldir=/usr
+
+define NEWLIB_BARE_METAL_NANO_CONFIGURE_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		mkdir -p $(@D)/build-$(arch_tuple) && \
+		cd $(@D)/build-$(arch_tuple) && \
+		mkdir -p $(@D)/build-$(arch_tuple)/tmp-install && \
+		PATH=$(BR_PATH) \
+		CONFIG_SITE=/dev/null \
+		$(@D)/configure \
+			$(NEWLIB_BARE_METAL_NANO_CONF_OPTS) \
+			$(NEWLIB_BARE_METAL_NANO_EXTRA_CONF_OPTS_$(arch_tuple))\
+			--enable-multilib \
+		        --prefix=$(@D)/build-$(arch_tuple)-nano/tmp-install \
+		        --enable-newlib-reent-small \
+		        --disable-newlib-fvwrite-in-streamio \
+		        --disable-newlib-fseek-optimization \
+		        --disable-newlib-wide-orient \
+		        --enable-newlib-nano-malloc \
+		        --disable-newlib-unbuf-stream-opt \
+		        --enable-lite-exit \
+		        --enable-newlib-global-atexit \
+		        --enable-newlib-nano-formatted-io \
+		        --disable-newlib-supplied-syscalls \
+			--enable-multilib \
+		        --disable-nls \
+		        CFLAGS_FOR_TARGET="-Os -ffunction-sections -fdata-sections    -mcmodel=medlow" \
+		        CXXFLAGS_FOR_TARGET="-Os -ffunction-sections -fdata-sections    -mcmodel=medlow" \
+			--target=$(arch_tuple)
+	)
+endef
+
+define NEWLIB_BARE_METAL_NANO_BUILD_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_NANO_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple)
+	)
+endef
+
+define NEWLIB_BARE_METAL_NANO_INSTALL_STAGING_CMDS
+	$(foreach arch_tuple, $(TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE), \
+		PATH=$(BR_PATH) $(MAKE1) \
+			$(NEWLIB_BARE_METAL_NANO_MAKE_OPTS) \
+			-C $(@D)/build-$(arch_tuple) \
+			DESTDIR=$(@D)/build-$(arch_tuple)/tmp-install \
+			install
+		cp -a $(@D)/build-$(arch_tuple)/tmp-install/usr/lib/libc.a \
+			$(HOST_DIR)/$(arch_tuple)/sysroot/usr/lib/libc_nano.a
+		cp -a $(@D)/build-$(arch_tuple)/tmp-install/usr/lib/libm.a \
+			$(HOST_DIR)/$(arch_tuple)/sysroot/usr/lib/libm_nano.a
+		cp -a $(@D)/build-$(arch_tuple)/tmp-install/usr/lib/libg.a \
+			$(HOST_DIR)/$(arch_tuple)/sysroot/usr/lib/libg_nano.a
+		cp -a $(@D)/build-$(arch_tuple)/tmp-install/usr/lib/libgloss.a \
+			$(HOST_DIR)/$(arch_tuple)/sysroot/usr/lib/libgloss_nano.a
+		mkdir -p $(HOST_DIR)/$(arch_tuple)/sysroot/usr/include/newlib-nano
+		cp -a $(@D)/build-$(arch_tuple)/tmp-install/usr/include/newlib.h \
+			$(HOST_DIR)/$(arch_tuple)/sysroot/usr/include/newlib-nano
+	)
+endef
+
+$(eval $(generic-package))
+
+ifneq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIG_DIR),)
+include $(wildcard $(subst ",,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_CONFIGS))/*)
+endif
diff --git a/package/newlib-bare-metal/Config.in b/package/newlib-bare-metal/Config.in
index 1ff3d5d8ec..33dd57b905 100644
--- a/package/newlib-bare-metal/Config.in
+++ b/package/newlib-bare-metal/Config.in
@@ -1,2 +1,12 @@
 config BR2_PACKAGE_NEWLIB_BARE_METAL
 	bool
+	default y if BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
+	help
+	  Newlib is a C library intended for use on embedded systems.
+
+	  Newlib is a C standard library implementation intended for use
+	  on embedded systems. It is a conglomeration of several library
+	  parts, all under free software licenses that make them easily
+	  usable on embedded products.
+
+	  https://sourceware.org/git/newlib-cygwin.git
diff --git a/toolchain/toolchain-bare-metal-buildroot/Config.in b/toolchain/toolchain-bare-metal-buildroot/Config.in
index 7ba579b570..65b49d36aa 100644
--- a/toolchain/toolchain-bare-metal-buildroot/Config.in
+++ b/toolchain/toolchain-bare-metal-buildroot/Config.in
@@ -26,6 +26,17 @@ config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB
 	  When enabled, this option will apply to all architecture
 	  tuples in the list.
 
+config BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_NANO
+	bool "Enable nano"
+	select BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB
+	select BR2_PACKAGE_NEWLIB_BARE_METAL_NANO
+	help
+	  Build the nano newlib libraries to allow support for
+	  other languages like c++ and FORTRAN.
+
+	  When enabled, this option will apply to all architecture
+	  tuples in the list.
+
 source "package/newlib-bare-metal/Config.in"
 
 endif # BR2_TOOLCHAIN_BARE_METAL_BUILDROOT
diff --git a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
index 71063fcee4..f261333fcd 100644
--- a/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
+++ b/toolchain/toolchain-bare-metal-buildroot/toolchain-bare-metal-buildroot.mk
@@ -5,6 +5,9 @@
 ################################################################################
 
 TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES = newlib-bare-metal
+ifeq ($(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_NANO),y)
+TOOLCHAIN_BARE_METAL_BUILDROOT_DEPENDENCIES += host-gcc-bare-metal-final
+endif
 TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH_TUPLE = $(call qstrip,$(BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_ARCH))
 TOOLCHAIN_BARE_METAL_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
