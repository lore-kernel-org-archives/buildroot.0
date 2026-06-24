Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DC7CDB471
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 12:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737DA40B48;
	Wed, 24 Jun 2026 12:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyHMTSG6IFJD; Wed, 24 Jun 2026 12:52:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74F5640B62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782305529;
	bh=X3IEqcv8HkfG+aGtiYYAac/Jo9zSio0ypMSVZfj834I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QgT70u0fWH5noQPaoDKnvZ99LNOS6wrqtlb92ElhTL/DSc/yKl8Ey6N4YHCOzaqek
	 Jb0dxjBcuEKNvR09jgW4Ihgg31SF6pVubJDmvo91gkZwBaJfh2roYe/c19cD0d3SQI
	 olFLRWTILHqJzH6slUvCs8CkxCnfAzOxcAxMfYC+O2hoCLMM5D4KAH4Qyc66IaNUbr
	 M6WHZhMDHd5HZsXTym7RtEJfPqwpagFGTN4UQRjnwKZbYJimZqJQxqOVUZ7LEUhTQj
	 83QET8A2u8sZMixrHn13X8vyPv11afHxS55XZayERJgYzgxhzYirE1slCiEh3NxlJ2
	 pO2qlXTkm1q9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74F5640B62;
	Wed, 24 Jun 2026 12:52:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D9A0D256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B73E381F1B
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vykhBs5bWHxv for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 12:52:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D44B8818DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D44B8818DC
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D44B8818DC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:52:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45fd461e4a5so859917f8f.0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 05:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782305525; x=1782910325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ex5pNsxVNyd+bt/9pJPiDWm7lbhHRA7hDFgNtO4Fm0k=;
 b=TpVATLFoWpfjcrPWU2XA1rn6IhXNdShSaaXmuZaqClUBSs8NJavYU36SMQ/5QPc2v6
 9oY0MMyRAA1lDXVxDpaYD7qapETc14Xxcv6aCQvah2PnAvKDfEGEAlIE5JT1/jmGDMR+
 6F8ad1fi3qJfbBETAOY0DoKGcLTGstDwEYhyLicWJMLL5r6fVCnG7w6KD6AIgjSB9fST
 hu2OewEuWYa16Th6ZjvWIGHwVp1tPjtwmkZZ1Tp2fFZhNbnPtuswPvT+koQWX1YQrDWL
 E5z6i9PGeK8V/5Yr3Sd8AXhddivdxYPdWVrMun/Xnl8YO+yS7AnUA25uMfI+g2ezkBAN
 oKzw==
X-Gm-Message-State: AOJu0Yw303PuY3J+IxbJH09SSPFMvj6b1sPYiwu9m1JnSpn1yNZwtYtF
 9/n5PMN1Ap6Y4aqaJruzdsctmmNpFT/43KIE5vdqV4EGmn9zan5t2tvd4Xy9/m3n3PF44iLr+J+
 bYq4/
X-Gm-Gg: AfdE7cmGADZp8oy2XnpACBHkYf16OkNfmzE4aGC9CsLSV8/h4Zdt19K+d2WlSpVNjTb
 JbELT5NWriQqlukb92LWq2m+61kQRb8AkMcP1UO2UEDhneu/TYXEa0RTzz8cw01pGPc8TtSbAF2
 sIrKAfixR9lpAlsENamaNXMAEdIHE0CX0GoNjPGP7skusBN8JDiLZH6nFgh1IohKURL5I9sWRF0
 KtXFflCWtWGrm70kodg7f/iqZvrFulNsFRqyxS4bSdiFDsHDf4upU627Ij4E3bCZ1I/ZAQpBogU
 Wi8Iy3nZlDar19e+rhZwWS5l1Pg39W5+6E3Sho72QyhB5g1XLWu3Y4upX3OiNC405JgTQ4S0dp4
 2MOqXPsss0tLP9EMoGbweHmTY3bBwT5OhtGMd2mhrn7dUWHaGtqUt4BafqlFED3s9rNYEyaLpX/
 YIHHsGQvU6Y2htFWXpbBxb7fLgwA5mkPMO2fx/puVd/ZkfOkRNUnXgloD/NPKzvK7jItcNklYmE
 4ede1CN4o1bEg==
X-Received: by 2002:a05:600c:c8c:b0:492:3291:9011 with SMTP id
 5b1f17b1804b1-4925b389fdemr116676835e9.30.1782305525520; 
 Wed, 24 Jun 2026 05:52:05 -0700 (PDT)
Received: from P-NTS-Evian
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924923392dsm722946235e9.2.2026.06.24.05.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 05:52:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Wed, 24 Jun 2026 14:51:53 +0200
Message-ID: <20260624125154.1869177-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624125154.1869177-1-romain.naour@smile.fr>
References: <20260624125154.1869177-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782305525; x=1782910325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ex5pNsxVNyd+bt/9pJPiDWm7lbhHRA7hDFgNtO4Fm0k=;
 b=2L8udIDOExelUT4aKjpQe/n8aopnjNGuwTqsPRRB5vAkTCE8F71MYesxCWThFuDbP/
 jrQdII8t6ogSFKaNODo0uYiG1BxkiGrtNDvNx+Cv7FO2VEKWsVlzxqXLZvKpxXgtK5Tm
 I7ubOjl3IV5MxRx+qOEGI5dc7VT1Y/8mE/Z64=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=2L8udIDO
Subject: [Buildroot] [PATCHv2 2/3] support/testing: TestIptables: check for
 netfilter legacy tables enabled
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TestIptables expect netfilter legacy tables enabled in the kernel.

Make sure we use iptables-legacy:

  iptables --version
  iptables v1.8.11 (legacy)

The test would fail if nftables compat (iptables-nft) is enabled.

  iptables --version
  iptables v1.8.11 (nf_tables)

Add the following configuration fragment to enable iptables-nft:

  BR2_PACKAGE_IPTABLES_NFTABLES=y
  BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y

Acked-by: Fiona Klute <fiona.klute@gmx.de>
Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
TestIptables should be extended to test with iptables-nft by adding
a new TestIptablesNftables test case.
---
 support/testing/tests/package/test_iptables.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 72f2dd71a4..eeb4ccb5dd 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -38,7 +38,10 @@ class TestIptables(infra.basetest.BRTest):
         self.emulator.login()
 
         # We check the program can execute.
-        self.assertRunOk("iptables --version")
+        cmd = "iptables --version"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertTrue(output[0].endswith("(legacy)"))
 
         # We delete all rules in all chains. We also set default
         # policies to ACCEPT for INPUT and OUTPUT chains. This should
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
