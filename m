Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068E6C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 07:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EB8280DC5;
	Sat, 19 Sep 2026 07:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OF3pWFT2SWR4; Sat, 19 Sep 2026 07:54:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9699B810E9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789804441;
	b=ChdEcrrPPPjvzqjHslY4DmVTwT2yIXLyHMBxcb77mk5rej/iwOByAmbisMoqQ7tgkBRM
	 /0lAV1WPd9VB0pS3fjK0uEx6SCjohKr+PPZk4TGKpDgIzQsL2eS9/zivzRaax3UO5Bx4n
	 EDkiZOaDWWmL3abwZVtR4dLvFdAtz0c34m43SEYwHTwR2pRWIrGTzFU0uZx9t94SGrAaL
	 DUL9rPyCEM+6VZ9w+OvZBMmh6ZhyuurHJobPuvWlqxFAR2MFk6e5T+38ogh/cvSbbL+go
	 CxM1qDyfhOPmDNm18yJK2yvvLCKneaNE1+nB2Yon+Ugapd+3ZEbtS+10kGo/HH5eWeg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789804441;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Nm2N11hjBM48jm9r2m1gD5Y7X94D9CLPN/fMO0gObEY=;
	b=OxtP+e3brEBMLcEPdKEL/CYBwsGLeUU0s24JvMJBpKKSOlYj6dXixW07dXqxB4AYOTlV
	 oDccPWnwbjgd5qiTipIAWfBDKfunUx07KB7YtoCD2eCPwrlI7F0MGPKNs39sc1hf5DT1N
	 GWy26oh4zMxlFhadZqWiB3jQCoQhXDe2EJlOJDRyXHCezb5q03AZg35IVquFAkghvk4Hn
	 UoZgBzCTTpkx5eBstG2sygyeZGhPF6LHyOmyirvum4jNMdaVFYXzgSOmAGEnmwk4SYCW4
	 KEckwTd5+6z/uvKDBuleT91ez/Fu9rYq6wO87Sls+FjB0R+tjWKTZcb0u1M41wPqn+A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=none header.from=openadk.org;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789804441;
	bh=Nm2N11hjBM48jm9r2m1gD5Y7X94D9CLPN/fMO0gObEY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=E21+CFRM6dhNqPk5t+VvzXlvcxZUbaCBq0X22YENFDHhxzastd235NHLTTs00x/Ff
	 aIR/cTnjA+qgOJ+ksepuORn1mDxisnEAmvm7Hou6X71Ug04AOhptu3wRWRR8F1J3Yu
	 HxTH73VSfE0h3y86RP86Pvywmmxm5wOq2EChGqAv00T6s/Cq54VTE7RZrgCxsBD5hp
	 MfVkANX4+78u9alktTu6JH8gGM4Kr0kMclA2kcl0uE23fqz2N/zfcmNuhuJ0CkzqW2
	 8meJNFgnrjF/euEoK/VatmQQQmhFHKz6SR3RxfFlQH1IZA20UMSJQ25VOtGSdofZi9
	 dZDV2a36YWB5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9699B810E9;
	Sat, 19 Sep 2026 07:54:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D30B6224
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0798810E9
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hh6oeotQcwcC for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 07:53:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 99EE580DC5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789804439;
 b=pqnlbwPZtPLRxTVyj06IVEubjL7MaKmzdz8unCVhW1iv4/8Uqds3DKCx6EdZsEyUej1t
 Y6lTUXrwNGxm8K6I7MVoBF0zjMY5PV2bE74qvQcNAF9q/5ww7++8A31YxAiHE7g1wnxE0
 EokliLXo/hGMQvoi/PSuFsEOcpvj9aOKrxkHsrB8Hq6LiRTerXoaeARi4en2XgZ10/HJM
 NoViAbIJ2JTnnVETzhFo5IlrOdBljN3tfflIdy+QoMQSvvYvFoYNJJaVcvwZAyZxHTrXg
 i+SneeFPh5257VHlQH3QYbqVuc7r4xCXc42pCCIuTCoxXbWIWco/ZSfNod7eTmIk4lQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789804439;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=75ID3NevM0WVetr0QOfeDDSOgWZbPsbq2KY3BTvSd7Y=;
 b=HITzL8J8YRL2De6VGo6RCVC6Zs/p6WT5oCDY4Y9PFdVbYMIXHofAthT7GLUaWTHwbm5L
 sGwzdNUMxwG1cqC+es1KoyIH5dmgEaFGjoP8Et/yAzEgBX5qkalQRMzAipcAlp46lAnpk
 6z8mVN25g1P3YlEybCRngVZKyEaQK4W4nIYNgfzyLSHAG47RIc7kyGKyipXTvHUqJHwJf
 LLD9gWBIwf3NOyHrmD+yg/K4RapWk44ZR5lhyk74cHG5sZUTifnO0XrQin4BbxJJ9fC7z
 INjuAweLPxnN6EK0dfgaT7lmFJDcwwieappfTm37pxbQnT1xvHapxjsiGjciACEPhIA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=openadk.org; 
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99EE580DC5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1789804437; bh=ByMSgAzagg/T2j8OifyANIhRO8vlkPAaqYCDqCA4OaU=;
 h=Date:From:To:Subject:From;
 b=VwZw+jiTuWMZqbrWcwJP1jywxwJyC6g+q8qrANtxU/zFtLa5TUjlTLM4ffxK0z/K7
 xWZGpkDGZFrE/nuVYnHVIZtxLUUiK8RYp2lVzcEPKagrsFduEXC/CdDWTW4EvBg9qI
 Bl9pE7eJvbmRvle7TS5uWs5017rRK+nfx5x/Mjv95B60yk6MxDLvun1QZCV64jLyG1
 +g2L6nUbay4QkptypgCHT3C2BqmbYnl2pbONZRbhXcx7I6eTbYPhQstbqXVcF0UAyq
 1KmctlUKd4/uIlAKZyWvlb1a8tk6qb1cM2mc/SzeqsLR7gknO1s6xCsjzBzSMytC+C
 vLQlVPibahQsw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 30AFE31E0651; Sat, 19 Sep 2026 09:53:57 +0200 (CEST)
Date: Sat, 19 Sep 2026 09:53:57 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aq4_lUtScguSDLRY@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH v2 2/2] package/chawan: new package
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

Chawan is a text-mode web browser and pager for Unix-like systems, with
a focus on implementing modern web standards while remaining
self-contained, easy to understand and extensible.

It includes functionality such as CSS, inline images inside the
terminal, and JavaScript through a small, independent browser engine.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  - add comments from dowan gullient
  - add comments from Thomas Petazzoni
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/chawan/Config.in   | 14 ++++++++++++++
 package/chawan/chawan.hash |  3 +++
 package/chawan/chawan.mk   | 39 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 package/chawan/Config.in
 create mode 100644 package/chawan/chawan.hash
 create mode 100644 package/chawan/chawan.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 520e2a836d..bb449ded00 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3468,6 +3468,7 @@ F:	board/stmicroelectronics/stm32f746-disco/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
+F:	package/chawan/
 F:	package/evilwm/
 F:	package/fbv/
 F:	package/libpam-pkcs11/
diff --git a/package/Config.in b/package/Config.in
index 243b390d1c..76ae6f5810 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2441,6 +2441,7 @@ endif
 	source "package/casync/Config.in"
 	source "package/casync-nano/Config.in"
 	source "package/cfm/Config.in"
+	source "package/chawan/Config.in"
 	source "package/chrony/Config.in"
 	source "package/civetweb/Config.in"
 	source "package/cloudflared/Config.in"
diff --git a/package/chawan/Config.in b/package/chawan/Config.in
new file mode 100644
index 0000000000..3dec3723af
--- /dev/null
+++ b/package/chawan/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_CHAWAN
+	bool "chawan"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_PACKAGE_BROTLI
+	select BR2_PACKAGE_LIBSSH2
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A TUI Web-Browser.
+
+	  https://chawan.net/
+
+comment "chawan needs a toolchain w/ gcc >= 11"
+	depends on BR2_USE_MMU && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
diff --git a/package/chawan/chawan.hash b/package/chawan/chawan.hash
new file mode 100644
index 0000000000..95f996d10a
--- /dev/null
+++ b/package/chawan/chawan.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e0a06e1504e10a51c6009751d79b798c98d8274e559fe195d4b4b7ddadf91bb8  v0.4.4.tar.gz
+sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/chawan/chawan.mk b/package/chawan/chawan.mk
new file mode 100644
index 0000000000..585a1fa0db
--- /dev/null
+++ b/package/chawan/chawan.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# chawan
+#
+################################################################################
+
+CHAWAN_VERSION = 0.4.4
+CHAWAN_SITE = https://git.sr.ht/~bptato/chawan/archive
+CHAWAN_SOURCE = v$(CHAWAN_VERSION).tar.gz
+CHAWAN_LICENSE = Unlicense
+CHAWAN_LICENSE_FILES = UNLICENSE
+
+CHAWAN_DEPENDENCIES = brotli host-nim libssh2 openssl
+
+ifeq ($(BR2_aarch64),y)
+CHAWAN_TARGET_ARCH = arm64
+else ifeq ($(BR2_x86_64),y)
+CHAWAN_TARGET_ARCH = amd64
+else
+CHAWAN_TARGET_ARCH = $(BR2_ARCH)
+endif
+
+TARGET_CONFIGURE_OPTS += \
+	FLAGS="--os=linux \
+	--cpu:$(CHAWAN_TARGET_ARCH) \
+	--gcc.exe:$(TARGET_CROSS)gcc \
+	--gcc.linkerexe:$(TARGET_CROSS)gcc" \
+	PREFIX="/usr"
+
+define CHAWAN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define CHAWAN_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+	DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
