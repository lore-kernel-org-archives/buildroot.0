Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5061C83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6BCF41956;
	Tue,  1 Jul 2025 19:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtrmF8YSBTQS; Tue,  1 Jul 2025 19:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE0BC41973
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE0BC41973;
	Tue,  1 Jul 2025 19:44:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63A08179
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81ED76072F
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uctsMYsCp9wy for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A07926083A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A07926083A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A07926083A
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:44:43 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D1CADB0056A;
 Tue,  1 Jul 2025 21:44:34 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  1 Jul 2025 21:44:11 +0200
Message-ID: <20250701194411.13153-3-ju.o@free.fr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701194411.13153-1-ju.o@free.fr>
References: <20250701194411.13153-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751399082;
 bh=8cGh+P+t4asWRaieW28ufoitFh/kQboI9Z09yXjYUWg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SmW9tvovS+F58Ilz2e0cTBYOFegiRL3KYcS/WmmGS2ufTvKs3ktl0od5dMwfTOm7o
 J0lvtXY5PqfXprCDkt4XJUOXYmnyFsdNcqmkW37Lm1kCxktVGl4QY7KSkmGzrz5SXM
 kUR09i1DteYAbPqE/vRl48BYXkjFfTwqsM1UOOdDaAIKj+lHsoJj5qBqENBAiVDc8s
 qD9l870wsoKJhcr5JGWdLWXrEmH+A8LjpiMCON7Ya5wAQwKgOgd4UV4ABTcf6qZLTE
 CJvQLKxHO9yp9rKzlAUhSehVzh3iL7jyBCbRJDxnr2zQiNhfVNucfWi0+zw/2aEjvr
 KU3ZoFBsGEzqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SmW9tvov
Subject: [Buildroot] [PATCH v2 3/3]
 toolchain/toolchain-external/toolchain-external-custom: hide gcc versions
 for unsupported CPUs
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The BR2_ARCH_NEEDS_GCC_AT_LEAST_X guards were added in commit [1]
for toolchain-external-custom gcc versions from 4.8 to 12. No guard
was added for gcc 13 because is was the latest version at that time
(and the symbol BR2_ARCH_NEEDS_GCC_AT_LEAST_14 was not available
at that time).

Then, commit [2] and [3] added gcc 14 and 15 without adding
guards.

In order to prevent a Buildroot user selecting an external custom
toolchain that does not support a selected CPU, this commit adds all
the missing guards.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/eed1670d8a6f0899f5fdfc26bd6d1609ebc19c7a
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/7fa12e4f9ed736c7238dbdadf4dc5b9da03007b3
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/5f1a38a41f0b6702444940b24bcd0d79a41a0059

Reported-by: Arnout Vandecappelle <arnout@rnout.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v1 -> v2:
- this is a new patch in the series.
---
 .../toolchain-external-custom/Config.in.options                | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 0a4003b57c..1580ffb920 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -48,14 +48,17 @@ choice
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_15
 	bool "15.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_14
 	bool "14.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_13
 	bool "13.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_12
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
