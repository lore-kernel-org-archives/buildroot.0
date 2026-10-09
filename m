Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E8ECA6015
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 02:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D8686088B;
	Fri,  9 Oct 2026 02:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up_FCWrUI-Zn; Fri,  9 Oct 2026 02:21:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BC16D607B2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791512472;
	b=RISl61V2xJKgEuUO2H7NSAI4UApv5PqW/EiBdWNYPWLNXOPlIchswrpFVw/vTN8F0hfh
	 aY/fN1emRQAW942Ktgb1KTZb4YL3qmy6+JH+LNFU3ztiHoG0uqhgdqbVm2uoH6ZTL+G7I
	 XugNkCTuCJgwip8VVL32TKOhJHvVp7M4mb3BcSLWOBazUn+q0ZFC82jM4vAPAkpJqvbAn
	 5eAPwx6DaucIVRImgauw4J1P1DcNTrxeRUtJFfXbhqVUGVz1mngPC8BTbTw5qE9n1ftF1
	 r9sYTn3Ck77V5dw1OmWJ+L3qvBjUjuQjdDGo+F+VLjbVxhU2c7VDDEC4ldIDQH0kbog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791512472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=f+ge2SpFBiRvVXyCtbr7YdeD/ylld+0ZkCAtaFbfFrQ=;
	b=ZskjXF7nx7Q831NlJujIpmDNqZGzOl4m80Uw2MmSALV2d+XHSdgzThNdSES4CqJb5G4a
	 kcd2KfGpZVsgtYw6HAg0KjstIVwh7foMXnorGPTNMFJqdCqzehOzIzLpPfQLjhnSQ9jza
	 YlFkMcmrtIo5bLKY5ZDe1Uhpn56yRKFQkBnLtpgtOBPmHn/J7iD6Ag8+dHDuZxrXr9njM
	 b4lH6Csjxqfvcmsr96asp8SpXWTf1IGMcHETyTCCM9befbPDRa3eWU/VeWZUaL3JAW2pN
	 E4rEf2tPA/hx0OBhiwXXJfjA1AFWE6zC/113l8Ok2m1PiyYLWkK2PTfUUYat4VQpkXA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cPcAbpql;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791512472;
	bh=f+ge2SpFBiRvVXyCtbr7YdeD/ylld+0ZkCAtaFbfFrQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S5cxz2nL2wFwVThsOpwmUJjpkiZxm0ggwYM5QLTKAorrI6GKMDC03WXyOnlUuXZqQ
	 v9Cv9Rx907ajUgsOyim827daT10Pkg5oPWb6H4WZS0gtD61r0XRPcTsI9vHrpE30E6
	 59Eu7pntD7bRxsea6yHIZ2OkcrPQUyVqitfz3cedoHOXDmhCbHmrxNMYXLgLAWEqZK
	 N5dUqWbY8TvaFZXFvPPVoApxhzIRdK6J8tbJovjDgnEmLrtcnerN4EFIZjP2bjVRow
	 hcFB6k7gBMejFWf7XTrzCXjiXLJ2ztkZIQtsTna0UffFuvXGyapX22ByLGftwGYNYL
	 gAkfUCvXgfgZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC16D607B2;
	Fri,  9 Oct 2026 02:21:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B972C356
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 02:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FDCA607B2
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 02:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRa4LPfVTAQJ for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 02:21:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A724260727
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791512470;
 b=kO/Av8d3+dOA+W12+rUXSyPxLOSw7/E9uyepb7FsRen06pQwqqH+b+7kqasNGkAe8rV2
 F1zB+TBI1LjmtQLVH3cJfNUylaQcOl98vL/b+TYO5Jrepu0d3FlZkHcCruDBwZIXlAknM
 8t0BJnXgtkBDQYRV+tjqShrapJFAA+2HD77Y+4f1w0N3Zn/rfzZOOyWINKeT1KVIEEOdu
 W2ALWpbJt/DTqe6TgUYIp7ISODzQ4uQAeSJFs5cxGD/CcTAZGrad5KX5bftbo6zn71/bA
 +sXVEIcOuH7kSftMRrGR1BN5/KKqNCr+94YhoyJZ5M0PN83rTcA30Tzwt3DL0QL0X4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791512470;
 h=Received-SPF:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 bh=r25K+D8cYyuWJ7fEQhY6C4xLAhMA6d0oQNz+18oQj+U=;
 b=nAsRV5QBpizn7Mc8j9voXT9mXZU8PSJWuT2LnbWtLJqZD6fVg5p1HAzh/05sTaksrSQY
 zyksfKR+B/z4ANZlxhWRxPhk8W6fMv82Bd7HXzip0QQLBIzqOVWJD9NkiuzdkXUNf3BIm
 U2zXDjOgK0BEAeKjIRTqiIqPWkQ+MvLyHZP6v9WrYV1MFdpi0ogx6FMfKqBYtB54Wo2V5
 NsLtLazh85O2Pux3UbRe6QI8qfMI9+TQAIGYIJM653D5w712H5LDIoGBYgXNFejeYljY8
 +cEMSOabZL/ptk6VjFepSazA3VywM3wVAdXfziq18joGlgNG93lQR5Tnybeau5bXBcA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=linux.alibaba.com;
 dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=cPcAbpql; 
 arc=none smtp.remote-ip=115.124.30.99
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=115.124.30.99;
 helo=out30-99.freemail.mail.aliyun.com; envelope-from=cp0613@linux.alibaba.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=linux.alibaba.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com
 header.a=rsa-sha256 header.s=default header.b=cPcAbpql
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A724260727
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 02:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1791512428; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=r25K+D8cYyuWJ7fEQhY6C4xLAhMA6d0oQNz+18oQj+U=;
 b=cPcAbpqlaW5X09VLwBtx/os3daJzNnZ9MbHu9HPSqco4rtGz1xQUv0U59I5w4CvKz/Dz80tx+pJDDR9KNzuQmaW70lnm8176+YDFiUEaky8X96p138PaRAO5MPJ4KuYe+eQB8phB/MtSMLBo4xwUyTqkB3jPjgQ5aNLrWYOZZ7M=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R601e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam011083073210;
 MF=cp0613@linux.alibaba.com; NM=1; PH=DS; RN=2; SR=0;
 TI=SMTPD_---0XCRt2aw_1791512421; 
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com
 fp:SMTPD_---0XCRt2aw_1791512421 cluster:ay36) by smtp.aliyun-inc.com;
 Fri, 09 Oct 2026 10:20:25 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: buildroot@buildroot.org
Cc: ju.o@free.fr
Date: Fri,  9 Oct 2026 10:20:20 +0800
Message-ID: <20261009022020.2337-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iniparser: bump version to 4.3.2
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

https://gitlab.com/iniparser/iniparser/-/releases/v4.3.2

Bugfix releases. 4.3.1 fixes iniparser_dump_ini() repeating the
previous value for NULL values, fixes dictionary_new() not detecting a
failed calloc() of the key array, and documents values without a
section. 4.3.2 lessens the strictness of the version macro test. The
SONAME major version is unchanged.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 package/iniparser/iniparser.hash | 2 +-
 package/iniparser/iniparser.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iniparser/iniparser.hash b/package/iniparser/iniparser.hash
index 7d4ef52266..b20f9744d9 100644
--- a/package/iniparser/iniparser.hash
+++ b/package/iniparser/iniparser.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  7a339779ddb37fafbacbf73b176ce968ef9dc5146831b87aba80a18b68355ed4  iniparser-v4.3.0.tar.gz
+sha256  d7382f72f94649afa7a9d61346a7fc31cd3ff9ae389a71f92770133d49f1b22c  iniparser-v4.3.2.tar.gz
 sha256  da809b67f3cc571433b7b97d4253ae1f9d8817770aa859aad202df6bde1d5fde  LICENSE
diff --git a/package/iniparser/iniparser.mk b/package/iniparser/iniparser.mk
index 1a6fa3fe8b..0e4dbc3ede 100644
--- a/package/iniparser/iniparser.mk
+++ b/package/iniparser/iniparser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIPARSER_VERSION = 4.3.0
+INIPARSER_VERSION = 4.3.2
 INIPARSER_SITE = https://gitlab.com/iniparser/iniparser/-/archive/v$(INIPARSER_VERSION)
 INIPARSER_SOURCE = iniparser-v$(INIPARSER_VERSION).tar.gz
 INIPARSER_INSTALL_STAGING = YES
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
