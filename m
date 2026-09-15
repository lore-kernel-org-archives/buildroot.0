Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43C5C88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 12:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E52D405D9;
	Tue, 15 Sep 2026 12:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiyyFsoMxq_I; Tue, 15 Sep 2026 12:30:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8E34840517
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789475401;
	b=hynUkfjdZbQSzxC7uErKeDQweOekpFwT0DnfmnSEnQwgwOQ0M6higeWx7mvk5t7jTmpS
	 RFHIsHZjufZX3obN9b/I/xtMXd6liUJDz4+w6boNaQR7bR2tBPq84KOP8Saatckz371KT
	 OrRgHLtQpH29LKlOUC7YVuhukgELG9QB9jDYnkN7UNuMOlFQ2KrqFNAKlhCYs2rH0gqGO
	 Ws+8WYVmJUFXyEbAke1rNz6aTNLFmm4V+XtUUhmFlgYh9XFz13mzJSjGCBFW+2+CQV7Sr
	 tjzBlaubxfwy3nQ6lL9s8C4pkNuz5ZRKyub9b5XSgEuLZg7VesRTg8i2xJdC6ulZScg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789475401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Jbd49A7auwLn+MBjZcEOr/tcce+CV17l5pVmdB/VppI=;
	b=iqFz31+ZNqaPPyLULeJD+ZTOG/VBxYJP7BemO+e3HtOmDQoiQsQN3m9Enu/QcLGVWl3m
	 cv/zLZ4gOYlVrOYpK3JmUsTeNBizbqJHshce3pYGv08KeRW2pRGUYFWLFokijKlbwFxFM
	 Djj3pqcKt0cdu46kSRfhHEBRGBm/zRhZlvgTIQ/bQkaq6LI8ZzbYniyXrhFTN2sg2ylPv
	 DjTtLWd7dQcZOWe03WC5W+U2k1mSs/Fs4OtM4AaDqtUaBIz9MNnKDw2Im12VmWs9IEczV
	 bw0UzlmfeAP4ucZV6ras860P8efJUSiram0MfbxU/2YrRA1sr8X6hsId9q5HnpRERDQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789475401;
	bh=Jbd49A7auwLn+MBjZcEOr/tcce+CV17l5pVmdB/VppI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kvVx+DefHMeAvXzrYastk8rdnX7ZIOR1UD7nXjlnwFQCH6knTQq4DjYKBqIAafjuR
	 2n9rIkB7UQx6VIpfoqAmMKOKcvkUwP2eOblHCBq6F6UCHQfpC4naZx67OD29n+xFD5
	 +c9ZZTIQyl0H8tnXv89mIgE1O/8aCv+0P2VLJ1/IRIMnyUCdVWZzveyShmRno0LE6G
	 OtI7S/z0ZBaIJrVYo4KdG9tpduxAZUt77k4rTuDO1YC1kVn9HOj0fEiK0z7j8Q/qR8
	 JPET1OHG3cDRwb8w6oo2f9k7Hwc5XfId/RpjVd80uqgmmCuV9uiPpE1NQeOAwoRvqc
	 2V9NFd7jQB6jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E34840517;
	Tue, 15 Sep 2026 12:30:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C124493
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27DAF605DE
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToS3XlPaWJDm for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 12:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9CD1B605D7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789475398;
 b=SqDwMGmpAzihXB+eqvuRHD33TBr1mSEPjXSjwn0QMiVBiJCMq5l7uCrNB/OlGKfGEQhG
 u/Jxnh1EnpfNcDvqLmBSiRRYKXIQ1VkXDTPfaG5+wG1GG7QOdgzKcaLHUNWgtEL6/iA4h
 o7K51tAse+80JOdRXz/SEyl/ZmO9GK82+ZNSyDpHkgSJz3u4zFMIllnT8Sd0zXthkP0VD
 oCvFLhbJ7e33xvrTqivdw+XZUTlkW05NAS2T7hp18vFYjXv6AivR+g66jVC+d2ng8auqZ
 roFdWqw1+s6nexeHb5LOYxbS8Sp77qXKhU2XKG4e33Edhjc6a6myw2W50GCZU1G2G7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789475398;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=knX/T7kl3/nSVyPwzAAb2pwxknujnxklDvRGUhjy9v8=;
 b=Xww/G8uNyWRCHwQwnf3TCbwTM/M9kZg1pFC+jPCg9w9Ff/CI4vLseNIbSRHuV4nEapU8
 A0IMcOv92vAe8SLaxtJ/4AVjw9ei+bNmSZ8GLnKwj9r/WrL7RBtxxMFd9EtCZnA4QoDh2
 bVjmXnPvMLR+gBUffKNPorMl5i7xnO8biUzTRLMYcdQIe6L+YBVQIQvF8MWY+a3WzKqpn
 LFpj1yyFg7kWquyarVc2UKp9BgfQq0tR0Z2msCWNfN3F7b4Ald/Iea3cpzyuWi+4/pi0Q
 Tia79WHXHGZSJbOmfmGlSM+FPctb0OTY1TF4E6am3eXMWQeqktvw6pxnEqGGXXrcC7Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=KAYgjSs0; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CD1B605D7
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:29:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 83C76C5CD49
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:30:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0913D60498;
 Tue, 15 Sep 2026 12:29:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2288B11C7AFEF; 
 Tue, 15 Sep 2026 14:29:50 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Chen Pei <cp0613@linux.alibaba.com>
Date: Tue, 15 Sep 2026 14:29:44 +0200
Message-ID: <20260915122946.1953137-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915122946.1953137-1-thomas.petazzoni@bootlin.com>
References: <20260915122946.1953137-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/ndctl: propagate !BR2_STATIC_LIBS
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ndctl selects kmod and keyutils, both of which depend on
!BR2_STATIC_LIBS, but this dependency was not propagated into ndctl
when the package was introduced. This commit fixes this issue.

Fixes: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6 ("package/ndctl: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ndctl/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
index 708871d693..79bae61ebb 100644
--- a/package/ndctl/Config.in
+++ b/package/ndctl/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_NDCTL
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS # kmod, keyutils
 	select BR2_PACKAGE_INIPARSER
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_KEYUTILS
@@ -19,9 +20,10 @@ config BR2_PACKAGE_NDCTL
 
 	  https://github.com/pmem/ndctl
 
-comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10"
+comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_HAS_UDEV \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 \
+		|| BR2_STATIC_LIBS
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
