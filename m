Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1D7C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 12:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 911D160F8B;
	Mon, 20 Jan 2025 12:04:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTjbvEsr6EF7; Mon, 20 Jan 2025 12:04:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D982360F7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D982360F7E;
	Mon, 20 Jan 2025 12:04:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7477469
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 12:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FF2860F7E
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 12:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTRvzWJyi_8p for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 12:04:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E787260F85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E787260F85
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E787260F85
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 12:04:12 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id B23893530F22; Mon, 20 Jan 2025 13:04:06 +0100 (CET)
Date: Mon, 20 Jan 2025 13:04:06 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Z447tvu5eNQC9iBB@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-32-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1737374646; bh=zG8FI9Mgivv9MzM+vMcyZcwptvxxR28xx+gjahG2C+8=;
 h=Date:From:To:Cc:Subject:From;
 b=H6NCh8jwKCeTbllaWC3aKRH9XlL3YqC9r9u3otv14LZMNqJmmSKfsGHEGU9ENAAIT
 jix9/Msbo+OjtEAz0i4YIfplVT+QnE1CGrxnQrXqb5jRFP8x/ijfuIJ/e6DNAeP5MK
 3gkwQWoBnuAUo44IZRLz8MiTlEJwUZD5PhngDhv6wz9RnHLxfVCBCi5xIU3r2d7+Yd
 pSdj89OKK4WZW4VVfQpwGgXdQ2Vu9IP32vyf6JH3124BxowhuWcmwelk5357HAJM/A
 ZzYxmaRL519UpijIIgAQ9rjJqqkjkXt+E/14XQvDQopDdsH2din26ENDIplI4Fqk+1
 q31QtvRjCVstw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=H6NCh8jw
Subject: [Buildroot] [PATCH] package/uclibc: deactivate time64 support for
 older kernel's
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

For Linux systems older then 5.1.0 we need to disable time64 support
in uClibc-ng to avoid compilation failure.

Fixes Buildroot's arcturus_ucp1020_defconfig.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/uclibc.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index fdd5850874..700d2d9f0b 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -72,6 +72,17 @@ define UCLIBC_BINFMT_CONFIG
 endef
 endif
 
+
+#
+# 64-bit time_t is enabled by default but needs headers >= 5.1.0
+#
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1),)
+define UCLIBC_DISABLE_TIME64
+       $(call KCONFIG_DISABLE_OPT,UCLIBC_USE_TIME64)
+endef
+endif
+
+
 #
 # AArch64 definitions
 #
@@ -398,6 +409,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_DISABLE_OPT,DOSTRIP)
 	$(UCLIBC_MMU_CONFIG)
 	$(UCLIBC_BINFMT_CONFIG)
+	$(UCLIBC_DISABLE_TIME64)
 	$(UCLIBC_AARCH64_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARC_ATOMICS_CONFIG)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
