Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7086CCF2E3
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 12:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6728B6069B;
	Mon, 19 Oct 2026 12:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTy4UnIUgXVL; Mon, 19 Oct 2026 12:19:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8B8D460634
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792412397;
	b=s72/QK0dz/HRUDvTOhCowChPayHyG3Neqwisua31025hmt+oSShEsUMH8hqmOQ80kzsz
	 OLirkE7E9OCC5HRnlIe4wMXY1wHEdCoOiEWE46CrHuEWoq+3IBQEpMfEbaXnPpTJA7i91
	 G3y9BuAAyQs52Mse1xFJwu7JZ+Vm3RdEPeQT+XjYEoN5Vvv5a4Hevwdm6lmb8EoG2Yiw1
	 qIeAgI4WUZGrslHnY+eC5Qn7zKXRxG0gM7e6D7qqCJ4OULy6qsih86QHjj0Fc3Q5GF+KR
	 OvnSIFimWXPssOiE2nsekkBuEga2A8OcXmk0INXW9dd9KSVYmCal7F0b7INjU2Xk57A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792412397;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=773eJXUY+tBo67opBqiSsYFttbriqIfsaiANULBXhiY=;
	b=SlVXKiYZOnMpy7bTfm6E0h+SPRXst8/Kddmpe1ezqyq2KzhbTf5WoCsWYhJt8mblJkPI
	 0kClqiKO6etqjxw5mI7ResJYvVYZB7i8YBjb05/k88yIjAqoU/gb4QRz7x6DCa3VK5T/q
	 8RE5Jcdt8rYMt7iBjLR9Dm1A8/lKXNY+16xficPtIJr3C2Lzq1tpkeqL8wJPZWjXgzdzP
	 vUcD8ZIuwA837adC+4icquPPepbnlp3+aMEEIGKBIenfpLDF2/+zQ+b6wFktG8pwAedZQ
	 XGVfxAuESK9uC1g8JGC23RdGFLyQHHtUA1dyjp1wvRIPVtXZ2UC4OPFfao+mvnOJ89A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792412397;
	bh=773eJXUY+tBo67opBqiSsYFttbriqIfsaiANULBXhiY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rLkJf35m/ygYDQEO7oWUSSAN6aaBhI5zL7E+qMPQ5xNZvT4xskscVXQPU908nz9Wy
	 v5vTzGCoybWXvIM07vCjbPjhiH4rHmHRRaoYcTt1CxqL7dtXGJxKZNLlLpaj79VLwQ
	 +Tp+yw86uoXEFrYhfhP3iUYxCNaDB8jEGI8bChtVBBSPyc/cJHf14M0NZ0MF9GIrjh
	 K/jizUDe6nnqohpepXRasRkTyp1P9LUqpezauc+/0LOhPF6f5WWvoJAnpBFme6/309
	 BJrG/g8jd3yXLwQxWUj/hidKXNiU2NfVcVhqSZ8VEOqkPnUcmTNtdHNr2Ckh5YN+mP
	 YcV4vsLBlbAgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B8D460634;
	Mon, 19 Oct 2026 12:19:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FD2D22B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10CE380DBF
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzV50yRYpDZb for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 12:19:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C154480DBC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792412395;
 b=cq2W/6JyXjBWsTZBEe4e6mfvbK5aYWpNus6PpRBMwkOvJvPXJpqu6YXApDkz2HQCVdTq
 poLZMrda/7GX5lvyp5Ojf3LVa3naSDbeXiqOo9muBxnib7MEoNa5/9vwwC3ewIBwbOl6A
 Ku8MXVnNlIHi5hHhSCS2HcLnISvHuO9TY5A3lhBF3Dz8d8xotHE5O3sVJ3xzWaKBKztVs
 5+MfS8rOrM/S+OWlSwqsdsca0tQ9ytOcy39BTzqzumPDHuBRYEJNB7NFUym9QlxS88dap
 BhGL98jlrfOfItcxvFMTrWKGOSH1rsP5WlJGIv/RSfmR6HyXYeiuD2NE7+9VCykJPJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792412395;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Owzs9j2C5wAK7gblIM0H8089XiQEH2WESZa62ZXRGXQ=;
 b=m43649wGJDbz3oRXbml8JrLKZtJ3CcOMm2vijdGdZL3iGDAWDinbkDBo2qyE8WP2oXex
 3+bN6qJy2d0TsgSkiHza3CKJPlLPnagMJy0rH7scduQOUeNmtTDxnwlCRmpZppVn7Ky+/
 zBnWVQdRczZRenJJhyfi2fBKvi3mqx+FX6+E0u6WMlJPTo3J5qttDN8/UCTouUOAn7xNL
 N3g2w601nNFDMdA8m85bOD7DgUNk0a0AkbMcqedYgvjm1inDgeHwCLIWZMtBue7z63VnO
 w0Fm1LWkFH0MNadqsd2z+5Pk7JDw4LH+3k7219kZw4LGzDCbWDwQA5tzajLosKP5/eA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FU5EvIlj; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::632"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=FU5EvIlj
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C154480DBC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:19:54 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c37b612635bso238637866b.3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 05:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1792412392; x=1793017192;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Owzs9j2C5wAK7gblIM0H8089XiQEH2WESZa62ZXRGXQ=;
 b=FU5EvIljlN4NQChhlfQM2Z4FAhEMPOGOMldWjb5uZRRl7oLUQBkRFbD8EE8RVmA2bH
 lZRwREpKn0z15jyZ9P6UKw56fE9h5Tr4mGDzDnguWxDosOdMoazHSs2znaO6NfEznC85
 pfCECpCRcAg3Aha6Wk60rTsAP8N6rAC67iXC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792412392; x=1793017192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Owzs9j2C5wAK7gblIM0H8089XiQEH2WESZa62ZXRGXQ=;
 b=UPhiMz4ONQiEWjoUAZ9dU8mLuUc6y6gp+797Y4Q8+KDGbRr7UNpwH8zLQQ45V9ylsf
 fA8FOaTVyMxEs34lPT4FBfB1R8UD9llIWBiY/TtR8I6U7670E0/DrstVhUrjlGNUGTVO
 TUiTDPen7dDdIkPEafRUO/5qh6ikGlGy6v+ypQ74Uri5OmxChfl/bBH1xGadnrgKdONm
 U2TbwhTteFxe1arXPQGHA/Gl781YpMtTzlTQ8CCMATdkKL7IVpUZfnjGP8SanYmCXnCI
 mnjmOPkHu4gsOujWuBoYIn+QZcYLUm0+oyTEvF9QKZLMw01mYmA5bgrOda81M/zWDBsN
 uPHA==
X-Gm-Message-State: AFq9FYIelmaq43soYu9Qp7ystRqUiz4ajCMw0nrdSA36IyjikpKb8kOh
 d7KR476gi9y5Bo0vsCh4aI0JVFsAdFtgW2HJaU1kRZFvvDwqxPgU/5IoFaFHYzuwkTgHzISFs6u
 APRRA
X-Gm-Gg: AYBFou2SQLs/aZJoC/pEsoTPCMFKwZdri/sx1axeXlW/7sBqcoU4AO+27IpTFjBI+Wi
 4gZ/ecuxwhiV9kKMSmvkEAdizxcncxZlK/UGwNu+Pph4+jk3U8Srttpmuz2BU6OB319gFNJs5g6
 PubT6Cl2I1FnAGwGh/6OboQUszPPz+jqmbDnvrlvvs8o3349nL3VsoyEaYUmkgSxEazjtABes2j
 79byYAiU7tXvG480dIu8rDN2U/72Yzcdv5igLEas1pMMXxZ900ze3zwuceTg7lEL1zXH3Yv3NxO
 WmwEXwwnN8Gmrskk3qwZ9WhgzZgDbEfnuT4cwhR2QpzmWaMypM6TjW9YZl6oR28DeEStluO6ZCv
 FcD1pg5nl1S177JbaeyaA5OHbRminoylpdmCadnukpGso9TtEpT+0rswEvStXJWMhtan6tqqdlR
 rhPwmvoEg4+/07fr22yvHrkWV+SkRSg7mKdzgkGVEogqGKQypVxTX57tSVBtexJFj8YpfbOKorD
 Bf7CmbkdumybPK3eZpr1rjNil2De5azdf0kOxgKMaV4rzl5LmycIjuwFF16GxXvmXvBj6YvDad+
 H9gGKKPgvuWSbP9khZKC8lUrkgJyvrVFC97aYWxhJWffWTt/Kyy2Cvq1W33uPaeX2qiv1Wg=
X-Received: by 2002:a17:906:630b:b0:c40:91fb:b76 with SMTP id
 a640c23a62f3a-c41a0202480mr523979666b.33.1792412391650; 
 Mon, 19 Oct 2026 05:19:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfdcc0f20sm22437258f8f.11.2026.10.19.05.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 05:19:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 19 Oct 2026 14:19:45 +0200
Message-ID: <20261019121945.1672247-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/armadillo: bump to version 15.6.2
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

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 4fdff326cbbb..fa420ae3b264 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  58fa258d0e1f93074c9afa792027fc259b85cb974ccc0b932b061d4ada5bd83a  armadillo-15.4.2.tar.xz
+sha256  63ee9351b54994dff7b4e2094a86ace48cfb41354cb65893a9dab7c8a16382c4  armadillo-15.6.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 15704952d3a1..fdc6cc39d745 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.4.2
+ARMADILLO_VERSION = 15.6.2
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
