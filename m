Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7AFCA1009
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 11:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A6BB418DD;
	Wed,  3 Sep 2025 11:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jsee4SlPpr7; Wed,  3 Sep 2025 11:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 547754179F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 547754179F;
	Wed,  3 Sep 2025 11:01:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D70D62BA8
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCF9C83B97
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7jGARCdILkQ for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 11:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A05A842CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A05A842CA
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A05A842CA
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 11:01:02 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-61a8c134533so11572588a12.3
 for <buildroot@buildroot.org>; Wed, 03 Sep 2025 04:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756897260; x=1757502060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8OKO2u/nI1vLIBRFnKuY4RssCSnryvgk3dICCOqEPaQ=;
 b=P7fH3Z+UAO3vc1MJWeiRxDqwTv8oitx7l6bJQeO9IjqxPBwero9M9COOHoFxQ3y/Jf
 2H8gmhMMu+XVlbQxXmNhTceTcaD8jeU/1lBB1x7dP2uh9QSefVph1MHcChccTYrAGn6Y
 P+YryWrZHtXkg9Q1aT7nFzmKqbR8+WPF5zlSnerGV9vKFce2nLi9DC1mpCkL49vD6VNF
 SZQ3GN5iziqnYU5IT9vYKVaWRD/Q6MLl80LrqrKlzScJQNyw+LcetyE1c4ip2i18WVPe
 5heQEXz2IQxRdy236J+lVBa6P9i6Dm7Gvbb0kO0ZbJ0fAbAYk+zZdj6I3+Y1U5K8L2FS
 x7gA==
X-Gm-Message-State: AOJu0Yx7TM8Q2mKPHt7y/8Iqisxkh3KN1Agti2ZuJG9Nuk4ithIswIxc
 r2w0vFbWhFADO3L1VsyZRDr7icxiG97zwYPFBJIn+iCBgSfSAMXNQMqi0GbvPt0/RStxaQBigiW
 ko8GkG3B0TreT
X-Gm-Gg: ASbGncsEC10mvco81HsxlwFdoV02wZHkBdEDVnZD7Pa9CJqRgsDWLhqMrwaTlcz9e0s
 g1FrGPd2PfK5ZAK/cam2yf88R+ylL362XLRoESeOgIIkGZxA8nroZL1Wj3NHLnfUnwDN6LpXL/9
 I6ScvfeeDGyvvpyOkSce0782S9GOJIXqAoSDPX21euuaFxTuEchNSD9SemDGxO0qJbZY3x1i4Nm
 YXbaAatjFZ/xQrqaPvGb9GONClalo6bTIwjHvtct+rnrAOhKYBtBsPVUSS85qwGY+ylw2O1txAF
 MWm4taJfK2BUtVEu0Czvj2PNtpbHFnznLJSlNVPt5ol/D/QTdt4awocblEGaibMBlMXslkehk3N
 3XdJJY8bqdIEYl75Vxji1O/8/+HPMH5qILRQG
X-Google-Smtp-Source: AGHT+IGgyFD5LxGPjigJX/vH/ptw2N7mcuxK+wpC/fOjh1fk02EEOCq+BzMrH109SSOOSQ8jmDpd1g==
X-Received: by 2002:a05:6402:388f:b0:618:6af8:3f71 with SMTP id
 4fb4d7f45d1cf-61d26bf9162mr12862269a12.9.1756897260130; 
 Wed, 03 Sep 2025 04:01:00 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc4bbc9asm11863399a12.25.2025.09.03.04.00.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:00:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  3 Sep 2025 13:00:47 +0200
Message-ID: <20250903110048.441164-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903110048.441164-1-titouan.christophe@mind.be>
References: <20250903110048.441164-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1756897260; x=1757502060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8OKO2u/nI1vLIBRFnKuY4RssCSnryvgk3dICCOqEPaQ=;
 b=NRx1tOEdCEX5YXYj3pJBqaUqzxXYcTvkSD+1awwHLb9bUmuKSFW+/iKOmQ8dbEVSL9
 vh7sxzTLTRfVik9lXgZH6/UkyBxW0wGMzjx8db/IegYxb+A4HCqzIRatpvdMLefMOQpF
 qcZpuGaWkiaT4bQ0yL7iTj41L4djdGfwr8bEdiaHqBNtXJGdD8kqC8ivYyjn9JNx2g4C
 Smv2CZu2b6mlH7BQX7SfxoInDGHqUQz0fx/9+O1V30UJPohmDPpjoL/otkWyfaDM4PVN
 FXPGO22tk9ZPj+iO+AzhK5y80ppAnXqphOJ+pSwZtmP2nzpDIuvjesdGRqTb1LhFK0mn
 TZLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NRx1tOEd
Subject: [Buildroot] [PATCH 1/2] package/wireshark: security bump to v4.2.13
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
- https://www.wireshark.org/docs/relnotes/wireshark-4.2.12.html
- https://www.wireshark.org/docs/relnotes/wireshark-4.2.13.html

This fixes the following vulnerability:
- CVE-2025-5601:
    Column handling crashes in Wireshark 4.4.0 to 4.4.6 and 4.2.0 to
    4.2.12 allows denial of service via packet injection or crafted
    capture file
    https://www.cve.org/CVERecord?id=CVE-2025-5601

Also update hash for COPYING because of Wireshark commit
614add27f29269e681e4d32138bea4951985fe0a that changes the FSF address

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/wireshark/wireshark.hash | 8 ++++----
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 8b3245551a..f1f2f58442 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,7 +1,7 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.11.txt
-sha1  f4e908e73ab90982e7f712e0a9b5f4cce85ca058  wireshark-4.2.11.tar.xz
-sha256  dd80f30e9853105dacb5357e5832d960437160bbb4b147e8f1a7ead168afaa18  wireshark-4.2.11.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.2.13.txt
+sha1  e5a08396a98d5dfba4078c66677aacd50d47ec90  wireshark-4.2.13.tar.xz
+sha256  2454aa650276264d23aca28e1b62eb5d4bd12b64aa261d38c06b33f97b8fa3dd  wireshark-4.2.13.tar.xz
 
 # Locally calculated
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
 sha256  fce67c1558e448fac784ce9a30cb47956488bc3ef6ec16316c38b0668b3cad2e  README.md
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 72415448c4..bd81224ae7 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.2.11
+WIRESHARK_VERSION = 4.2.13
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
