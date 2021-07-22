Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74343C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:12:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C65960EB3
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 21:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C65960EB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E806140600;
	Thu, 22 Jul 2021 21:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jo2VpM9fI3a1; Thu, 22 Jul 2021 21:12:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11B784031E;
	Thu, 22 Jul 2021 21:12:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8D01BF39A
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B7468268F
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 21:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PW86-gaLzE0d for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 21:12:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D1468266A
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 21:12:41 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w12so84759wro.13
 for <buildroot@buildroot.org>; Thu, 22 Jul 2021 14:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+CY1G0gLNctQAc0W1/LHd6QqzU2U+r+c5a9djK9X+vE=;
 b=Z4zsvRzb7CCerAtHFna8zH+cI+6tBO3SE/DAGmyJcN/eTRTqJmE194PQ5V4bum997R
 bD89bLDZrAd9FOPhey4dJv4s+UH74qboJcjo1y9r14Z3wjuZ2VwOm8sPVGWzywBB2x7+
 gXJt/mPbVg840iCDqbbx4GNS8amhjvpZ/tdZ1FGLWZ293dL/INS7jYSHmAcjhOcu8HC9
 G/44VZpLccKOGFhoi0iwSHMfozVvw+7NNV5Xt8RMuGbegIG+iapKjT1NjVWJTfa+Imrg
 RzMhhIV66legLTg9aGaeFj8pykDOtz2kytQh2qIwqNTP5fGXF/A/k2DixyAOpMV6ZAYC
 zngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+CY1G0gLNctQAc0W1/LHd6QqzU2U+r+c5a9djK9X+vE=;
 b=bFYv8JTHnZCus8hPwJNMb4ihLTxtDIMSBHSSI/M6WZv86wt61tzzJhvzX5xY1FbpWI
 ErY/UCiekW0bUtpi9EvwimeJP1d+DmvSzaOvmgalDUp9/cVXeR9eBDJJacIAZfAE0vsC
 rJWrmZEih2cseVMwtD7BzdQoAKdsNcZzE3xmtQlc5HEOgE/KsPqi77n9VTFY4BnmtgWX
 yxo7n1dF8wtbXt1MNjzKs+MZBDImsY/3liyFqyqkzTmInJOmU6b/W+GIV6qogDaLUSQb
 6HVQcqT+UWnYlQp1drQMnLcPyTJtOyNOPpK546kZsksp6f5ObPoxjXudTFu2iZa10Dqt
 mHqw==
X-Gm-Message-State: AOAM531iUNLecvYtIs954hq+0Y2k9EhygapqhE1WG0Cv5IORFeejGk6Y
 dtURa88ldxbjRYAvM0JLc1SfRIqBMTpMgg==
X-Google-Smtp-Source: ABdhPJzLuL1skPd83laCk7SjUPHaVKr9RVuERhe3Yt4TgYfGIsa7TAKDGnbEfmwY+WGLuWBkZK938Q==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr1902471wrp.254.1626988359108; 
 Thu, 22 Jul 2021 14:12:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id a207sm4093526wme.27.2021.07.22.14.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 14:12:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Jul 2021 23:12:30 +0200
Message-Id: <20210722211230.1219332-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/samba4: needs host-flex
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

host-flex is needed to avoid the following build failure since bump to
version 4.14.3 in commit 7df2611e9e93f9c3efea39bf0b5c217564618a28 due to
https://gitlab.com/samba-team/samba/-/commit/942c0d2128cb8e64a9354dde6bdae82a1c1c3d88

Checking for flex
Checking for program 'flex'                                                                     : not found
Embedded Heimdal build requires flex but it was not found.  Install flex or use --with-system-mitkrb5 or --with-system-heimdalkrb5

Fixes:
 - http://autobuild.buildroot.org/results/b9ed8be51a0eef77d6e48755861ae266c3b9f811

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/samba4/samba4.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 409e2c7a18..e5dc608271 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -13,7 +13,7 @@ SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_CPE_ID_VENDOR = samba
 SAMBA4_CPE_ID_PRODUCT = samba
 SAMBA4_DEPENDENCIES = \
-	host-e2fsprogs host-heimdal host-nfs-utils \
+	host-e2fsprogs host-flex host-heimdal host-nfs-utils \
 	host-perl host-perl-parse-yapp host-python3 \
 	cmocka e2fsprogs gnutls popt zlib \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
