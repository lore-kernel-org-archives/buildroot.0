Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E08AC83F22
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 19:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 546F34158E;
	Wed, 16 Jul 2025 19:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rd81RNkklOnX; Wed, 16 Jul 2025 19:11:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8701A4158F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8701A4158F;
	Wed, 16 Jul 2025 19:11:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DCBC511AA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 19:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2FEE614FA
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 19:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKJbVwFaw58G for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 19:11:37 +0000 (UTC)
X-Greylist: delayed 904 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 16 Jul 2025 19:11:37 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3217460DBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3217460DBE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.54;
 helo=sender4-of-o54.zoho.com; envelope-from=aaron@bubbl-tek.com;
 receiver=<UNKNOWN> 
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3217460DBE
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 19:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752692189; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=C/ucP7IbuXUosLTjt6tvv4Kngk1SdDIothmJdN/W5Hfxz31YYYj7vBGf8IdBt239pxQ1rsu286EP7V6zauAc7LoVrIJ6I1L1I38Sn0qZ8HNCfSrbgwU3T3DmfteGR/8CfLobKWQc9gaWr5B6BusHSNUdH2siIV8MCPiRqE/hT3I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752692189;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gLyseUSIeIwEd0fhKWizDUSnMkDtlH3XJYjk4yJamDI=; 
 b=jTuCrOLP/qua27Ao/I5Wzg9Tl8BhBg+3DFVdi7UnPxd5azerFJAODKR9ar7n4QmGqkw+vKrJQYq0/Q7XNhtvbrvWPm58wN7GGllVz9rOWFm+BWkVMLCWECssAXyjodufrp3IynUFZop0xN05Z85gk4tIHXIm7EZJxY3rbotbhq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=bubbl-tek.com;
 spf=pass  smtp.mailfrom=aaron@bubbl-tek.com;
 dmarc=pass header.from=<aaron@bubbl-tek.com>
Received: by mx.zohomail.com with SMTPS id 1752692187455904.0257173339043;
 Wed, 16 Jul 2025 11:56:27 -0700 (PDT)
From: Aaron Sierra <aaron@bubbl-tek.com>
To: buildroot@buildroot.org
Date: Wed, 16 Jul 2025 13:56:25 -0500
Message-ID: <20250716185626.365031-1-aaron@bubbl-tek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1752692189; 
 s=zmail; d=bubbl-tek.com; i=aaron@bubbl-tek.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=gLyseUSIeIwEd0fhKWizDUSnMkDtlH3XJYjk4yJamDI=;
 b=qPcNT2qO0rHRggCmbQzICRFrjgQBPwkKC8yMznDxvVmAn8kz7AChDiKalPGIOKP7
 f5eDkEN+0o+42rPBXEO7qimRgs/xJxsoT3Ib23pYhQ52Rp8MyvWhAJcDXM4QX0V2p4w
 A/bcwj//g61hkotPsEncojeFMStQX1J0GSZE8NDI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=bubbl-tek.com
Subject: [Buildroot] [PATCH] package/xinetd: fix build with musl
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

The ecvt(), fcvt(), and gcvt() functions from stdlib.h, used by the SIO
library packaged with the xinetd sources, are masked by _GNU_SOURCE in
musl libc.

Signed-off-by: Aaron Sierra <aaron@bubbl-tek.com>
---
 package/xinetd/xinetd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index f58c26f02a..f63a8a2251 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -29,6 +29,11 @@ else ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)
 XINETD_CFLAGS += -DNO_RPC
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+# Make ecvt(), fcvt(), and gcvt() available for SIO library
+XINETD_CFLAGS += -D_GNU_SOURCE
+endif
+
 XINETD_CONF_ENV += \
 	CFLAGS="$(XINETD_CFLAGS)" \
 	LIBS="$(XINETD_LIBS)"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
