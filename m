Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37BEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 10:09:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5E161205
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 10:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D5E161205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC0FB81C44;
	Sun, 19 Sep 2021 10:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVdv0Lpuymh4; Sun, 19 Sep 2021 10:09:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C41280F5E;
	Sun, 19 Sep 2021 10:09:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EF971BF5DA
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 10:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E2D3605CF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 10:09:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HF0D2jRyHerw for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 10:09:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26C6E605C2
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 10:09:22 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id e26so10780513wmk.2
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 03:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gM+j19Zgd4gySt4LdCygG0rwtBDQgRAN6VkXYJZhUBg=;
 b=ftXByk5zILvsXi0rpMJScgB1GYrld1xlLdfxLyFf+uNmpOg0uh3TMIYVZmBh11TD10
 A9giaIxdInxm/zWleNUQP5zTFv7irIfhpxnn21ZMzP8PJpIv+2CzDirruBtTYLpvHzyq
 zm9lt4CVXDNWeL8JDaCJosBO7uhiFwMnYrEs6GMtMUHuX2NCTyRfLysY8K0s2Y0TFj/z
 S6eCsHKEDpsjW7OkF2dHkSShLUB1wVIz/O6c4YNSYvtYWeY8JVwLMCeVzG6FXDA7+/xK
 nZvnZoCCW1rjY0FtPfpOdXArI2cWLmSoOzhGtbilaHI/7RevjNIbOicJPyjNZsI89WzC
 g/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gM+j19Zgd4gySt4LdCygG0rwtBDQgRAN6VkXYJZhUBg=;
 b=MwLSv+mp/iGPAWagBVrA+ojk2+zGk5NLkG3AJLV4fDXEjmDbFaaw7RlLRHVWptEUn3
 96abU3zwsZ8HQsxnAgpgN3Ke7c6CjZ8iyfpE74CLwdo6W6p7qiq8oPNwlh55XOAuP0k5
 y0/wxzgy18HHxKrB9S9mYU4JndzU6Ba29Zlhz7rC97RR/6YehysVFV/DtPsVAE1T66B0
 VTghjG38X0VSCJ8B84r7BT+0G9hZbge0VRKONGv29ty8svZhlm/RQj8+Bqv/mZdMh5gN
 hSniXfJmYv6WPu6GLAvoHN9GpMWa1eiIApK0JAdBqj3UwZeLw11bOMo0V8OzMPzc5TvK
 1rUQ==
X-Gm-Message-State: AOAM530zZ08H1hybRmkjzRJFIxoepXn1ZO2fvOc0AeKLXhUbCnvNFEIS
 WxlAIDS+z4iJeGqWUQIRSeaiA2ben78=
X-Google-Smtp-Source: ABdhPJw+1wwhQuGWsfK4sOv1dU3B8b86PxAupaohtFf6k+hNN52UIw1JQHUm3fHqLucWOkbG5FL2sQ==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr19092596wmh.137.1632046160156; 
 Sun, 19 Sep 2021 03:09:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id z12sm12114204wro.75.2021.09.19.03.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 03:09:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 12:08:42 +0200
Message-Id: <20210919100842.2071860-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: bump to version 8.5.0
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
Cc: Julian Scheel <julian@jusst.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://www.cryptopp.com/release850.html
https://www.cryptopp.com/release840.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptopp/cryptopp.hash | 4 ++--
 package/cryptopp/cryptopp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 2774dc70ec..404d8a41ae 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release830.html:
-sha512  ad5219a66c5924d330d3646d0ff996dd235006f6812074bc4eb9e8c662a4f000ba20449d377f24b133d19ce682f7b2a3b2eb4c08857ce0f5bb39743d1d425147  cryptopp830.zip
+# Hash from: https://www.cryptopp.com/release850.html:
+sha512  090472545c74bbf0579b56b09e8b5dcd777b38f29f7199a2e68f45d4a8c687acc82f105ba8b2a38f9aa65e5997a3d846aaf2341ab74d58b4bbfd1f5f03823b93  cryptopp850.zip
 
 # Hash for license file:
 sha256  e668af8c73a38a66a1e8951d14ec24e7582fee5254dd6c3dae488a416d105d5f  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 1706108454..1d303a67a0 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 8.3.0
+CRYPTOPP_VERSION = 8.5.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
