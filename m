Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7876EDF16E
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 14:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22D9380DF8;
	Fri, 13 Feb 2026 14:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9ORb5kqzxgb; Fri, 13 Feb 2026 14:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C24281C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770993310;
	bh=oJRIn8SYaSXG7GyAoXis89d9EmFmLhmg6jfSraePDxY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=KXQvTn8b8HWxDdD5Okj+QR9fve7aIEVQgLrMDydJ7ZUzP2ECav/jaggrFmzGqazMw
	 mZJyKkDQK2t0/nf2XpEnyIrqgF8D62qVgnwabd/go5qlDFJsLQu44+QqeMCv/Lsvuc
	 PwSPJHFmpCTeAqKuS9qYB/zvvkH2stSOeDmOCBAc4rwa2bZnHy5Hf+E2/XN1VmVF/O
	 14qB39VtIkVwCah/JdfOnesL3zeHuJ7U8zwoRYbjfokqQdu6O20kqOz8EcH9BJNHOa
	 FTguKjRemstug/3Kbn5gKkzLsybBgSoBxW88gmOb+MfR1YXsyfynfqzli8ynA8dxlG
	 vY4ur8jT+eH4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C24281C6F;
	Fri, 13 Feb 2026 14:35:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8766A69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 14:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 608AF4030D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 14:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n07s0hVr7g_Q for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 14:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 399CC40056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 399CC40056
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 399CC40056
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 14:35:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48373a4bca3so3651165e9.0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 06:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770993304; x=1771598104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rroHkjhTZIFPWVp0Z5lWnqAvYS4aobdm4Pdi+1jVdeQ=;
 b=eGTcg7ms1oIPbfgbbtklaxExmGYggElo6H6UBOph6+ChB9Apz/AAHkG+wUZLV8OYM3
 pFstgf+CsN2TQPiRIzSHqkhKf/yp3cTNi3dvnAbuZEy64XuRCvYfUskOCy7C2iVceodY
 xa2XsYjLUYF2W/Acp68SQ2mQHOCGThZQYPqzeWfMvuUeH3fBFoBXbpAntIAHINA3icsf
 2qyzN5vTS5DGKlLNRg7DT106FGQerf2Y1PXONMCrQfa/WPtqCJnb2aNYAgY3RLCo8BWi
 mnJHegkkzhXEO8z9io0/ZGdu4xMicb7QC/yvh/il+/mt+GSwI99rPZ5fR5RCzb9ff4H2
 RqzA==
X-Gm-Message-State: AOJu0Yyq8VQJuPKubdIp39p4DJ8h4eyIK1r5V3+rtzHUT2sSYC4q604N
 Q7cLETyZKxbvffiTIPPrud3eIs5BD4aUkQ55dCxiK4FtPhjWIUx4YpeHmJfN44aH/hJOM2UKKfF
 pJklP
X-Gm-Gg: AZuq6aJuBZ3AC2dmAWYVaaK7fbi7RGBOsV6YiUZukZwLUhnYLZ4dtPNQM1vxknXDnS4
 evePcf8QHBsrBKnW+1zfv4At+zRerm60jcHGG4+GZHTgFWwx9AYRiw9+dzUOQqIcB2Z8JgmlBY1
 tKFpbdDv12bQENu1GkY7niZ6GCvPttLVLRJkm0P41l50+a9S5yjqATip8LKKV1Jhj9nshiVe8FP
 0P19CO4AHEMUnB29z4f8rFalvEIQYsWgmZ2ATXERdHEanH5v7F9eSTQGRcgYuPnrHxe6el/eBgx
 Wm54KVItFjGy4z2kxnlpxOM4hlBVdCHoa2GM1Fbdg40AHiNAKOg9z7iEmubxHzKI6/OyKRPWdj4
 p9boB/e+eCqwjs3qwKxFJQw+BmMI2Kh6OQTP4sRtpLvdU8nvUEmxTTyT6X0/NZJkhlJmuulyCiV
 U+f1EihuUfNgL9R3jnKW18PifpWw==
X-Received: by 2002:a05:600c:6990:b0:47e:e20e:bba3 with SMTP id
 5b1f17b1804b1-48373a012b7mr28512505e9.7.1770993303784; 
 Fri, 13 Feb 2026 06:35:03 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a02a79sm41320725e9.3.2026.02.13.06.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 06:35:02 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 15:35:00 +0100
Message-ID: <20260213143500.528726-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213143500.528726-1-thomas.perale@mind.be>
References: <20260213143500.528726-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770993304; x=1771598104; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rroHkjhTZIFPWVp0Z5lWnqAvYS4aobdm4Pdi+1jVdeQ=;
 b=fpnDI8QuRD/R4TkibPY5CutGtbYRtwrifzOJIWfrt0xdwbqaaWMlXa2CnZwPn/amv8
 6IvMR/glx37U8bY2lhYyf2xZjCc8+FIUp1iSAlyF5RnEnBqK2fMMIrpPuLdJ7A/rfxQC
 jXwNGZhUlmNs6v8jH9IfYdWqCaU04nklZ5sZ8a7SmQ000d52QEzdortgx5By6bQocFmC
 DtFxM4vYmuo78HoJGAlyfYA6uQpiE+Hmhvdul5ExsgxiLB+1DcrJSxWum1F+/3W6ILHY
 vAVw+cRaCiwbec8itOUH5+Yr0CZMcIwTf7ofZDBit4jLJyUR7C3dfFo8IHzb1GX4uGcX
 aP/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fpnDI8Qu
Subject: [Buildroot] [PATCH 3/3] package/frr: update CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Vadim Kochan <vadim4j@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE `linuxfoundation:free_range_routing` introduced in commit [1]
has a single CVE associated to it [2].

By looking at the Debian Security tracker for this package [3], the CVE
associated are using the `frrouting:frrouting` CPE.

This commit update the CPE accordingly.

[1] c4c11c2e1a package/frr: add CPE variables
[2] https://nvd.nist.gov/vuln/detail/cve-2020-12831
[3] https://security-tracker.debian.org/tracker/source-package/frr

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/frr/frr.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 4886837245..04282442fb 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -20,8 +20,8 @@ FRR_LICENSE_FILES = \
 # tools/gcc-plugins/frr-format.[ch] is not enabled by frr's ./configure, so gcc's
 # GPLv3 does not apply
 #	doc/licenses/GPL-3.0
-FRR_CPE_ID_VENDOR = linuxfoundation
-FRR_CPE_ID_PRODUCT = free_range_routing
+FRR_CPE_ID_VENDOR = frrouting
+FRR_CPE_ID_PRODUCT = frrouting
 FRR_AUTORECONF = YES
 FRR_INSTALL_STAGING = YES
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
