Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5073AC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 09:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4689240E25;
	Thu, 24 Sep 2026 09:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfe_zk92aKhw; Thu, 24 Sep 2026 09:08:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0147140E02
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790240938;
	b=VHqcLGQRuOUeOhT2+2Ux5ujBvgoAeiWE8tupzy52fIRo/g8GDo/zpeWAeN+xarsRasMP
	 2Qn6F1c26KpPHt4XISt8gSqXR79B0UotgE0ItlYc5JRxr75IBe5anjFUI3VE3OMP1S1Hh
	 b1sWYLRjUAEQFKMaFjWbePzCqk8c1z11asjuoKe4QYHwpsn1lIq6dYcisovI/xG+bvPaL
	 G3Bt2J6fbw0G3+h6cBJG8vTUT+6h4RckcKAiWJ3hbDNru+xHBxNOBsMP4dYcV5afQiy8W
	 QK5nRGPHGShCrRAyTApDOvkyDhFhEivWGveJjRZyq5yMdf6DW/1x22BEkSXH14/7XLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790240938;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dPK48Kw+0A+2H0mSICEfDRI0mFkdpS/K/TLug0lS6BE=;
	b=pbAAMddeXxG7YoM7gYrL7yrY4ND1PQBNioHP+AVWq9+qMN55axZpTvvBQjGHPoXIQZX7
	 qUqthUjc1XNlOWzK3LNYq7dRRHk2OE1XwRJ3qZMj2kN1n6Fepq9fytgv2Y8iyGHmDulcM
	 9yOy518xTNUyj3ZkopDGviwSkC8smJ6BqJCW0YNrM7BV2gY7mlPajloWO95j9CY+G8pAt
	 fkvKOSrwttLG18FSHdkKv/a99NFLKKfFc6J7vsBHz+TO63mh9QyrPXtYk1q2gRZEP3E1x
	 b2JHnJsno+bPzr2yt46HJORdVSh3tw1PVsv59FKfikC0Ewsi4bgOTTYchqrJ7r7FmfA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790240938;
	bh=dPK48Kw+0A+2H0mSICEfDRI0mFkdpS/K/TLug0lS6BE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QXjudtiC+mgZeen1eEmcm62sFu9DvfbdPLuCrIWqNeJC0mHiNLmAcG1yPXRkBbkuw
	 hDfnPFpcP6W8SVG0eHKZbROdLyMQwJb6iiHQYv4tjeFRSh42cUA3VV6jzxWjlXFZYz
	 R1qEcakmx1UVlJWlW27KW6ONiisvuLLswIoiEZCkBesm2ExTBL5xuB6PPqMdxx3Np0
	 vKYuQVDKGvOHzQcmRI0KX8X1evFmfZzorSeDjsrpTyTyIZc0Q0qkw0nsrNtFe9/Iyx
	 HrWQulQffjd++ICx+JTo0K+5d8yXYG/gfN/PXB120trMgfnU60nw4pyLRvxP/SbF0A
	 76lE7lDVnhjMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0147140E02;
	Thu, 24 Sep 2026 09:08:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CE191FB6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 09:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B5E28126C
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 09:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6V_ioGngtCJI for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 09:08:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 39C29810E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790240934;
 b=LQgWIxLbYdbGbEbVc+lrDcH8msRjPWw5/qL3TB56VP0jeUL8XKDUAEKWH1gej4RUzBMV
 tAd/7hTiaaSRMDtuGuh1bVCX3JAYS35SyX2wprrqMv1rN4MMIkwNafGBAYTu4d4IFPU8f
 0s/zYcqltR/7YmPANyBwiZ2h0WJuSQs9BJ4UrKHn29Azb+hFU2j7QC5afdKIPDgYRa0A1
 7pJpL5WqObNw6PiwRYHGdc/1JI8mFENNbL21ca+iNExVgJMa5crJIDrjKPzCEnJTjznDv
 QvuqSkgicFqCjCTY3cTsEbARSUN0JPWvvEakCudZ4vsIbDQRJBIevcsop35f1hWjeYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790240934;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=SDXA6mc6utaUTWBm8YF66KMuvxDTWHT5/L9t2HYc7EM=;
 b=DGEjhelsnMj6Bv/EljsInXOLElrkaQHig4bluCo0MG9FOlByIG17nzKtW/vJ454f3p54
 T9WeKiuwERcHfmJFJqMa1xkAjycp1A5ySSqyqapDB6KOhwIYHGGEt9R91rRicEomEOTpF
 jsyrHx9I0CfeksAIFzozokNoWfxaMuGwKgHp3EqWCUBCyjbL76Id1MKKONZP1c0pkd/ju
 KoRSrcJQQWKLT6NcDk6yGKBgdC4iEzhDFq3QMIt2U63BeWaRqMwaorlmpL2t4ezVNyeY1
 dc8N5XMfukZMsB88QhC5gvESR3FFXY4fEuDxu4bnL8zeDzxuYs2K29hnE/EHO2tyuGg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YRGdA5vJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39C29810E4
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 09:08:52 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c2946aa0d5aso115604666b.0
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 02:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790240931; x=1790845731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SDXA6mc6utaUTWBm8YF66KMuvxDTWHT5/L9t2HYc7EM=;
 b=fIUQRmDne8tWuh7gRrCJLoCiPrW9+/FPjTXeE+AlufUIVquXD4g/SZKTB9XuHmIp7v
 mXIXeCeYbej1ZhKHUIWdKd47UIkr2JLmjRssCW+ZJTeA7935+aOmcZgsJUwlNX5wTQQS
 CM4m9RRtdOqeMz7NAuDRShtOBQ9MX1CQdzhUAgIMF3hZErts0DSYHLQ+GzKSd14ZJMxr
 4zEfOLlk1rWc6xXr/df7XsAP2VA86JNV5j5ZBr8rsU2V1Ix+Kzzh2IT8LdRg+BB0boc3
 gX1ilgDLX1Y10cXpH2uki6QyqV0YkoFCTFQmoHIV9LAk8mGJ27zQibvzeiexJDUou/I2
 S48g==
X-Gm-Message-State: AFuF++mI7X6fjGb+xWvjIivplFY4S/T6O5eHoUky9aJHfZh7IAb9Iuiv
 rVV91MVqKwY8VLwe6F8ECFnjG0VFIZZa707nnpx7Ykw6X1wdS/iYPfsaD4O62i50+zFq1SMIqoT
 PMLvx
X-Gm-Gg: AYBFou3uRvyRD4Roe1Il96d7EaXMpoVOPdJsubAccevFdR9tNXNumAF3yIci0Xd77UL
 o6PjOkDgjs/IgsljDwkJLdX/KdnObhfE5EbN1Hbg8abIoFua90Y9F/CdxXoGv2T0W710GCGhEFI
 mVtxZyC8nDxZNbsAcI7f8kDCsK9Ehp34PHCVtrrXTVhdi2Aq1ImE3PH8RJ7bA2Djx7TrueFyG+3
 dh8gRLwgQMmFvvEHMBvg7oSCnuyD4Ia7cwzSgA0PB9FSe6vaWVxevm4SQJiOT6z5VMnM3hfcfg/
 HXdlCmgJeyQIuKALUYvNjSh/6Eb6u9aOlARQWJnJm4h+BXy2WnPnTlkCXS5g8ZZ0vjkBRwFGISE
 9kcOsgJ2/kdBcXTGFBTHka4rZvBfIlaDhJ/AxDWaf7VBK8ZezoCowWCVwM6nWZZIHjh4ZzPxEUb
 FLX3AU0WhQD9Q5SfFxg8i/iKhLoHE0IgvpDRkMj8DqlyOdRdmt4Le8TdLE0wK/h4j2v7WqRuhgi
 cwG3YemJQo=
X-Received: by 2002:a17:907:a68b:b0:c25:4d9e:bb28 with SMTP id
 a640c23a62f3a-c2ac21f9188mr146323366b.3.1790240930706; 
 Thu, 24 Sep 2026 02:08:50 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2aae5c5c7asm266235866b.22.2026.09.24.02.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 02:08:50 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Neal Frager <neal.frager@amd.com>, matt@thewebers.ws
Date: Thu, 24 Sep 2026 11:08:12 +0200
Message-ID: <20260924090812.217731-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924090812.217731-1-titouan.christophe@mind.be>
References: <20260924090812.217731-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/xen: bump to version 4.22.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://wiki.xenproject.org/wiki/Xen_Project_4.22_Release_Notes?ref=xenproject.org

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/xen/xen.hash | 4 ++--
 package/xen/xen.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index c41f0fda60..a6c0291506 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,6 +1,6 @@
 # Locally computed after checking pgp signature from:
-# https://downloads.xenproject.org/release/xen/4.21.1/xen-4.21.1.tar.gz.sig
+# https://downloads.xenproject.org/release/xen/4.22.0/xen-4.22.0.tar.gz.sig
 # with key 23E3222C145F4475FA8060A783FE14C957E82BD9
-sha256  e2a69289d6d13c0a71d4f3a39a597741c85c0282d9af1ec5dac495bdcb2872bb  xen-4.21.1.tar.gz
+sha256  b2a14ca369e3cf26f123a455b1603f3962ae9fcee0b8640a9cc33879de198223  xen-4.22.0.tar.gz
 sha256  9eeacf4e4f91bdbcd16b3282bb86779e3122da032953ebccad4fccdfcf4cb3ac  COPYING
 sha256  aeab99f147957cd25fe8cc008992d5e5426ea73fb7d429923b5428a1ef1a59ce  LICENSES/GPL-2.0
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 729d213c02..f8a4100bbc 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.21.1
+XEN_VERSION = 4.22.0
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_SELINUX_MODULES = systemd udev xen
 XEN_LICENSE = GPL-2.0
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
