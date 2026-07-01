Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0464C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 12:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D8366103D;
	Wed,  1 Jul 2026 12:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmyYOC5mWuA2; Wed,  1 Jul 2026 12:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9987A60824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782910094;
	bh=ETjAUoOre4WVDiT7Rca0cmtUdFJtecAYYpOK+f2+e1Y=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VUrMNSpRaRSTn2KW6J4nq2nJnMnLdmiZvH/QaDvyI+aCxwbHIi5zwO5+24peISoF0
	 YxHbuDMXJHJ4lse8UpK2nA2y0z1dGlvE9q3CapgJrz3UX/cEOXHIj9ewukfi4OeHMl
	 iJL1loFL6PB+AgW715Ncvuty5C+46+O4JQR/IFpbpJ6IiynnJbCYtEu8TrENTf2ije
	 Siyu90I+tLjjrnr0CHu+BVBQS4mJFNIIAYkoIzlcRxvusSjSS/sSaklz1RYQIr3Ccj
	 D3zqQKwWZ/VHmwqCXQDN05ZhkfGWFUQMx6f/aC6xjeiEi1byU5+2pWL+r1BudDDpNO
	 Y8pVSxlfCevcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9987A60824;
	Wed,  1 Jul 2026 12:48:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A1892D5
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FF1741738
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgES74iOgJ8q for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 12:48:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 40328404DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40328404DC
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40328404DC
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 12:48:10 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-472493849a3so758753f8f.2
 for <buildroot@buildroot.org>; Wed, 01 Jul 2026 05:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782910089; x=1783514889;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oo/+kx2HtOl06gAMe/0qh40PNthfwEbu+Xg1NLcwsrk=;
 b=lbvduxHf2Gm+S5A7x78X5BnbvW0XczoOvDUtA4t5jvFprAu9MukombNKnRyH2Kgomo
 wv4XzPACVcNpSLodERR7AXuJ91od2Yqu+vXZbdzJ+x/NvxhggnSxjjUbu4bt/wXLl8Vm
 XMmE7vWd/Q1i5SrwYiPJ6FLmVoA/RskGxRFyKukEulBNFatQ/ZfDZH1SG9VjjGXJ5323
 DZmlwqre0voAgi3xRIw8oVw/BdO0hYnKGOfT42jdbQDrlOi3owxr6j4O8wlkkoufUwZa
 SKfoY+xFJXmkqoaj8q7OOMgo08rk+7Y7A7mdOGF87uaC7UldSZqlxeD9hbuMP5/vVCdl
 oXcg==
X-Gm-Message-State: AOJu0YwuovMaYlWuNW+6ZhtUt+Cj3JlaP965czny4LRXnL5AuIjCSejY
 3S6q13V3mpakucQ+1U4kEI4dKqlT0x/MNBhGEJCehpqGvfgtTdtqZW4ks1gJWBdIRfE6NvpprNH
 kc8+eXd4=
X-Gm-Gg: AfdE7ck4fNNmoX8AfD7BbC4CEPhxGtkt4uk9rBHUbaBcInC6awBsuP+2N9D+EL6OeYn
 86qc75tWmQR1/Qx6kIerAc8e5Rk6cbkMeryuhUkwGEnnUyvUfBbppTr484JEbwUtByJmo1JJ3Vx
 zD/3GiqbEdMLPJiCk10xP2LdUMSg3IKmw82zh5GJyu65rqyG3Mgwhdhkp/tLE1oBXLbzhNCWGTO
 mS2eAomWyqMjJDVKZpcHnfQXfxg2lvUv/swI4BvXNKDit5+lL48sFz0fm2ZLb2yilEvXBO4TgN/
 HUsga7rRT5KUU/20msSqNPBMSrqrSsvxrzQpW9gMbDPEXgrZA7I/6N7Y+QFDR3tmEJepU/2Y2Og
 UhM/BwFL+ucw7EbZsfkimtMn/or0yNh4xpiDIaE5GpY7AThxwhsAx4eYp0KQ4N79sayAP8/Sj8I
 lhi2QxE36eiyJfmCT7kw7iO8yOO68De02hVaiD3MpGDVvpKEhui2JcUyNpFuaJbvQ1trdalCkhL
 cXXH5ij5Ukv00zwib/q
X-Received: by 2002:adf:eccc:0:b0:470:eb60:bed5 with SMTP id
 ffacd0b85a97d-477af5ef989mr624842f8f.20.1782910088737; 
 Wed, 01 Jul 2026 05:48:08 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47563e0eee5sm17284470f8f.5.2026.07.01.05.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 05:48:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be,
	Dowan Gullient <dowan.gullient@smile.fr>
Date: Wed,  1 Jul 2026 14:48:02 +0200
Message-ID: <20260701124802.4062980-1-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782910089; x=1783514889; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Oo/+kx2HtOl06gAMe/0qh40PNthfwEbu+Xg1NLcwsrk=;
 b=nI11g3mCUtX8UxHveRX4aQfnaAzWtmkcQ0N/WNaoua1hNVXciVCtw19+h0Rz4q+Vkx
 wiYOr3uGRE9csOsHZQqOopUvz/RE5lK6l1beGURwUnFbDxvppYZnavXUXtYbQqe5t3Yo
 MB1rbnF7NNoha3nXaL9Tslx+XsVVYY4G5g/MA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=nI11g3mC
Subject: [Buildroot] [PATCH] support/testing : test_gnupg2 : fix build
 failure
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the precedent patch "support/testing: test_gnupg2.py: use assertRunNotOk()" [1]
a small typo (OK instead of Ok) was introduced in the test_gnupg2.py file,
which caused a build failure.

This patch simply replace "self.assertRunNotOK(cmd)" with
"self.assertRunNotOk(cmd)" to correct this typo.

[1] https://lore.kernel.org/all/20260626145113.1FE598649C@busybox.osuosl.org/

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 support/testing/tests/package/test_gnupg2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_gnupg2.py b/support/testing/tests/package/test_gnupg2.py
index 6f862c31ce..c8fb029c95 100644
--- a/support/testing/tests/package/test_gnupg2.py
+++ b/support/testing/tests/package/test_gnupg2.py
@@ -108,4 +108,4 @@ class TestGnupg2(infra.basetest.BRTest):
         self.assertRunNotOk(cmd)
 
         cmd = "gpg --armor --verify {}".format(asc_file)
-        self.assertRunNotOK(cmd)
+        self.assertRunNotOk(cmd)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
