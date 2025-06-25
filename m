Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD16C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 13:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D46D641DF7;
	Wed, 25 Jun 2025 13:39:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNa8yRThVk3G; Wed, 25 Jun 2025 13:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DB5941D7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB5941D7F;
	Wed, 25 Jun 2025 13:39:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 89948154
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 862D461500
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oU0aWh4W0B1l for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 13:39:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92C4C614E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92C4C614E2
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92C4C614E2
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:39:33 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:582b:34d4:7c8b:1aa0] (unknown
 [IPv6:2a01:e0a:12:eba0:582b:34d4:7c8b:1aa0])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id B77BAC3C60;
 Wed, 25 Jun 2025 15:39:29 +0200 (CEST)
Message-ID: <ee8e9975-90dc-4a98-915a-3ee5659716d5@grenoble.cnrs.fr>
Date: Wed, 25 Jun 2025 15:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1750858770;
 bh=kycMb9FjZGx8+4mYXsVEsNC9mWe08irbS9qb45B+jrg=;
 h=Date:To:Cc:From:Subject:From;
 b=k81cbxtqP/xy8MYMJA0VnFQpshIAlOaPFEzlwYbTCntn0ynuYDkB5sDmG4GWpT5lY
 TIa+9tCetOjpYL1Sb2hsfYTCgKoEfJrU8wqu2hrUZU7v0o+yxlLd2oXvkZBXSejfS1
 C3c5YKMAOz6E4vaKHklYnshyHJaFHLH7om/n4ccHqiVKmOQ+t6z2mfz5MfdWWeRJeX
 apPaYB2M/AZGGQGeUyOnV/vOSJATvR1kwGS+8z3I6VmgIVV7AHX1wNgfiTw7mV8nWY
 BIDM32Eom1T7iMepiLFXVs9nvC6J6+JZlbUDsz8sK3Gl26TJyoKBNVI8BVohw0X1nW
 7a0CsIC9Vb/zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=k81cbxtq
Subject: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-custom: add gcc 15 version
 selection
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch allows to use an external toolchain based on gcc 15.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 .../toolchain-external-custom/Config.in.options               | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 7a27714e09..0a4003b57c 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -46,6 +46,10 @@ choice
      Set to the gcc version that is used by your external
      toolchain.
 
+config BR2_TOOLCHAIN_EXTERNAL_GCC_15
+   bool "15.x"
+   select BR2_TOOLCHAIN_GCC_AT_LEAST_15
+
 config BR2_TOOLCHAIN_EXTERNAL_GCC_14
    bool "14.x"
    select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
