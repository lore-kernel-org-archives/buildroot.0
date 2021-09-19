Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1311FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 14:54:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84DB561283
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 14:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84DB561283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D2740442;
	Sun, 19 Sep 2021 14:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TydRYc33d0qv; Sun, 19 Sep 2021 14:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD0B140430;
	Sun, 19 Sep 2021 14:54:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D25A71BF27A
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 14:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF9AF83F7E
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 14:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PuhUunhlGuDW for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 14:53:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D540183EC3
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 14:53:49 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i23so24054519wrb.2
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aDivHp7bY8fdZHykcoO42Wdx4iChBOh2XVnW5LEnGck=;
 b=KO848daHfQWLo6o3qHkxJ5vtsh61cHIUv9n3orOM9JqLL6hAsvF/FA2fx/HEqgYOwT
 dng2RvhtXcpz3RPKUmwxXWei0Qi70jCLDPEcQy4xCBRoy9pNZQblcq4icsGCQZ2IGZao
 3mlFO+45PYplhWMrq6GFeckRvYcPFgwXmZ06UT0PDxsAbynZBVPhi4FqeSVMdMBXLtLO
 towXHNtuH0vgW++65+mMqSKPJACGNM7xybC9C60Y2f4P3Ve9zPu9Ddyfnicp7WAkAcvY
 2qB9YRgRMO6Vt3h5KZAcSj3PAsiuhtAJ4dc7iMyqbx/1YTKXNedQFTqEORVSCbc1Fvp2
 /8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aDivHp7bY8fdZHykcoO42Wdx4iChBOh2XVnW5LEnGck=;
 b=JdISl+b+PVGF/TxsEbB5KI+Tcfx4Zh/7U0fQGmebsuBBOjEn9MqINsUAWrTqIkxd5d
 2jRJb2bOtD98bVMtz+jFYLGP2GnHTFsbIGBv2sYDioMuglO1q46oEocrdmHZeov09xnf
 1chL9obnUHECOLgunAiU15f7W/SpScZ3Nee4mTEV0O4UDzdOnwaC0mKkkdiko22ClRvU
 ATwOYFg89B3KHMNmQqS1MMJSqWo40AD3DVwQtxIy83wtSj0PBUoOoiO5+a+5r2/tLw8A
 /XCT4p23rmC5gek8htgk10RT5dsgt/7j7CN5pS6Y9xzLB2vftLedeNzNGDEddq2QLH5s
 oZNQ==
X-Gm-Message-State: AOAM5327oQfpmF4/Yspz6btaN3BUi4mnJqK1zTlVnsa6VZ7qbaq0dY/b
 TSiXCqelxvGeMT0wTiHusPtxLPdsvgI=
X-Google-Smtp-Source: ABdhPJy2H453vVcMjQtabsgX+JK3NyL2przUzLHG05GCgDimEbpZHNRlWzW0vdP/u7cvrYJnbvu7jQ==
X-Received: by 2002:adf:c184:: with SMTP id x4mr23478461wre.266.1632063227823; 
 Sun, 19 Sep 2021 07:53:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id z5sm17079571wmp.26.2021.09.19.07.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 07:53:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 16:53:31 +0200
Message-Id: <20210919145331.3492573-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919145331.3492573-1-fontaine.fabrice@gmail.com>
References: <20210919145331.3492573-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/wavemon: bump to version 0.9.4
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Use the new LICENSE file added in version 0.9.3 with
https://github.com/uoaerg/wavemon/commit/2251870415c5be3850ce59d99d0e352e55a3280a
as COPYING has been dropped with
https://github.com/uoaerg/wavemon/commit/bfa12c46c773e5fe49ec4f91fc6260aa4f66e258

https://github.com/uoaerg/wavemon/releases/tag/v0.9.2
https://github.com/uoaerg/wavemon/releases/tag/v0.9.3
https://github.com/uoaerg/wavemon/releases/tag/v0.9.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wavemon/wavemon.hash | 4 ++--
 package/wavemon/wavemon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
index 455e64cba8..7c685f6500 100644
--- a/package/wavemon/wavemon.hash
+++ b/package/wavemon/wavemon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5ebd5b79d3b7c546bc16b95161872c699a75e9acdfc6e3f02ec48dad10802067  wavemon-0.9.1.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  e7e4167292136ca7ff12ddeb880904c10f33e97620ea6aa5f7838e859fdb40ed  wavemon-0.9.4.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index d2af6c2bc0..50e3fd275e 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-WAVEMON_VERSION = 0.9.1
+WAVEMON_VERSION = 0.9.4
 WAVEMON_SITE = $(call github,uoaerg,wavemon,v$(WAVEMON_VERSION))
 WAVEMON_LICENSE = GPL-3.0+
-WAVEMON_LICENSE_FILES = COPYING
+WAVEMON_LICENSE_FILES = LICENSE
 WAVEMON_DEPENDENCIES = host-pkgconf libnl ncurses
 
 # Handwritten Makefile.in, automake isn't used
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
