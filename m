Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07974C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:32:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B723860FA0
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 10:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B723860FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85A614010D;
	Tue, 27 Jul 2021 10:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbBudy2-J5VX; Tue, 27 Jul 2021 10:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DAB5401CF;
	Tue, 27 Jul 2021 10:32:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1471BF279
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45B9882F49
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 10:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EADzWfVVlrEA for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 10:32:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38A8182E5F
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 10:32:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so1493644wmh.3
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pFhAqJ5JTuEW9707LZ7ezFLGkoGgp65bFduEqBKK2DE=;
 b=auReOnzPe9sXd9RlncMmMFgm/IsvbU6fxNGZ9sq6FL0gstwK9yUjlV0Ho4Rdk3D0Sb
 HGw+AurNK1TBVVsL9VR+NGTe0GB7t2mG1JYBQdnnFHIPq8I2g98z0UTvK/5aATAcEvCD
 Mo09HLO/Ot4aNP0IuiZyjlEFUdpUJWMyZJ5Q183gUv7hMY6y3Bd3Os9Eynf9Hc8Abt+P
 BiNt9Ez/UkDM2/YYzM7iVkv46V6B/jfzrEeW9jByjMmJ/41v4WTjq/N2p7+XyEUcOHjj
 ffiZUrnnd9icxIPLk2encHgpJSAJE7KOXcmBtTGLU02WQWInXpXUWc8gGuMtCYCbwiul
 MAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pFhAqJ5JTuEW9707LZ7ezFLGkoGgp65bFduEqBKK2DE=;
 b=jkZS8CVF2eyM9+zdCIox/3KeY+rXfdCP1CpZY+7+RVqXTuHx5LzQkzO44Mn3SNwqgC
 BpCklTOUFPrwJ5OFz624hopsR6+35rErNywy98ifgQQcGw0J9Qd+rs+RWo7DiXbZCWfe
 ZKmPvX+t/xIBb3ytJgIp+OoN6DeH4kstrFWhmhokcIweoK0lpDOYe+8DV2HGh4uL6wMO
 l3EUrvq+j+oRqjLYM2+HJ+9jmLeKxlOUj1VT367ijeGEuYJiEec6LwEvROsSkCGnC8iQ
 B1CgbsZf9o6FFH5Fk3oTKkgecuslyqoBWFBypnxSIsjKSfvrdYRQUwof5NoiX50tX4/w
 12cg==
X-Gm-Message-State: AOAM532KJ9qd9wOEYy/vks2rKsprYV77Ugu5Pgy9rIMXgQMCkiOOr7RK
 JXI8CTjbzMlm9DgfTbEr1Wkf8d5bW0Wx4w==
X-Google-Smtp-Source: ABdhPJyFILrZnMVPnLHr4a55izyUxANb2jtitaseYdu0/RGxXI3pNGIVcy8t2Z0ixo7tjspd/FhzAw==
X-Received: by 2002:a1c:2642:: with SMTP id m63mr9036234wmm.13.1627381936023; 
 Tue, 27 Jul 2021 03:32:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id q20sm2496425wmj.27.2021.07.27.03.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:32:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 12:31:16 +0200
Message-Id: <20210727103116.2372005-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/minizip: bump to version 3.0.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.0
https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.1
https://github.com/zlib-ng/minizip-ng/releases/tag/3.0.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minizip/minizip.hash | 2 +-
 package/minizip/minizip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/minizip.hash b/package/minizip/minizip.hash
index f150770ae9..b006f32bfc 100644
--- a/package/minizip/minizip.hash
+++ b/package/minizip/minizip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c2889690b1a1f55898d37d3fb51f05183a4861fb7d53ab702c6a5777bf232b75  minizip-2.10.6.tar.gz
+sha256  6ba4b6629c107c27ab526e517bdb105612232f0965a6747f60150e5a04c2fe5a  minizip-3.0.2.tar.gz
 sha256  675181c03fc1302a1c8554c00f7be9bb420c5dbc9dcc2013433cec144413de03  LICENSE
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 53f33fb9c1..351aee464c 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINIZIP_VERSION = 2.10.6
+MINIZIP_VERSION = 3.0.2
 MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
