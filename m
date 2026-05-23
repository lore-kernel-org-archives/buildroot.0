Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869D5CD5BB8
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 534BE60B3C;
	Sat, 23 May 2026 15:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGG3xIn9Nsyt; Sat, 23 May 2026 15:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38E2660B2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779549585;
	bh=RuADaI6isV3YQR7JRDSQkZ5x8NUB1LSohkxHN5CT2VI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Tt44C6xz1Ybls75K29HjOHdo4RkSYjdfDsn2vaSLRX920VGHd+HPWxOvufXPZLvHc
	 DDJ9re6+lrdLlLdFBktFyLAB50zqw5aBFjrapO0CB4e3X1Y75ycBtR+ddeGEyK6mlq
	 KZ4kDWeuwZujIbteYNtBo1dWFYMEfz20V6I/zMAHlz+P300GdT/4+5jaCJWgQoNthT
	 lUjOFlOuwW05rMQA2xJHmDPrS+Rp2U13x90Iyqxvyzl5/DHiE0I/zQVv+JKoyHZAgv
	 /VFiNzTGIzxlCnUdRrr79R7/pTYOwQ3MmXG1w8171XktvgQ+eb10u5xLf3kODe56+j
	 rn+/Bey9/d9pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38E2660B2B;
	Sat, 23 May 2026 15:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5696A263
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46AC54017C
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HNr7DoNVL2Z2 for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7856B40487
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7856B40487
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7856B40487
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5vW-1wdxJ80nMu-00Ud9N; Sat, 23
 May 2026 17:19:34 +0200
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 15:19:10 +0000
Message-ID: <20260523151911.10285-8-and@gmx.li>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523151911.10285-1-and@gmx.li>
References: <20260523151911.10285-1-and@gmx.li>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8AZMTYakiOZnxjOrAGh/YeN6uwCVSuqPwzwdKu7H6CMY55iSvPG
 VSsYXRgcgW3/9xLzGQ5w35lLBnzhSRi9pzG/pfBmOgiAZH/sxfaBS/eli1i3Hf3QJ/e7js7
 5puhjKn6iNy4yzbEjQkn/XUgrkUsDwsRwUQvizG61+0xYNwabGZfqShzxMfqUMqc5m7xeDl
 Gs1hRV1BIZqsxjZIAREuA==
UI-OutboundReport: notjunk:1;M01:P0:vLol/ItV0eE=;bThU0qOilKu8rwCslA36knRvRvB
 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
 KG962OCkisfzriHRE8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779549574; x=1780154374; i=and@gmx.li;
 bh=AiJeXvHM2pc6KMHamUhkCK9ouY0l8vaCHKaaRLdMGJE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tOJ5osXfruqyjdMLnZxmS6I5LHitzUcjPa69enJLoLcG6VJeVr6a+95yVoUIsSwN
 BDopDNRfRDJ12I08mG4uEF6RXpFy4xZug750vcoAqRnTeenEwzqdvmIGQwMIeQoB0
 NFQtVuC+yhoAfzclmv/TMvhu520qwz3AKG+iwVrURMSHfpMYlVIuESWw/imuIUpk1
 0VUw4/JdZIzRqs5wISm17NW8O4vTu6/tX8v5pd0k0udGmfACwvwrYg9CGIi1GPJ95
 7aNLVVWwi66SvOl5XLnq7fYVwLFe6oVVuA3pz5ghpSjH9Hwqyzw9uhGkfHVNOEl2H
 GLSbrMBfwQgQFlsRNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=tOJ5osXf
Subject: [Buildroot] [PATCH/next v2 8/9] package/petitboot: remove lvm2
 !BR2_STATIC_LIBS reason
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Laurent Vivier <laurent@vivier.eu>, Sen Hastings <sen@hastings.org>,
 Christian Stewart <christian@aperture.us>, Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/petitboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 76cbbe9c..3a0ee4bc 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PETITBOOT
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # lvm2, agetty
 	depends on BR2_USE_WCHAR # elfutils, kexec-lite
-	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, lvm2, nvme
+	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, nvme
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, kexec-lite, lvm2
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || !BR2_PACKAGE_KEXEC_ARCH_SUPPORTS # kexec
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
