Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0928CEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 12:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8236181490;
	Mon, 10 Jul 2023 12:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8236181490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0hyV1uLB0K3J; Mon, 10 Jul 2023 12:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE34881757;
	Mon, 10 Jul 2023 12:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE34881757
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 62CA91BF41C
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 12:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C25581490
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 12:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C25581490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMzIOwWtD890 for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 12:23:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E09481465
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E09481465
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 12:23:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc63c2e84so49130385e9.3
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 05:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688991797; x=1691583797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iRgMf88HkD5KxIH/5qwsCujvOZxg92Z8VN51E/LgmcU=;
 b=Dr+EqtBWvppJhf9xhZNthRvWb/qeosc/2/zzSaUBHBZgcqQQ/V7OCeJRNHFSh59vgQ
 fCmYw/4oqNDVDnfI+GuJIfvCUP07ucbOVWcN/QNm8v6Q6KcbGtDzP52eUbQ3jF6zuBjx
 +oOOfgh9oNCCD2V6N/libifEqLrROvaNyPkZd2/zo+ww3P6Yv3uWMSQfbVRn47msdkJ4
 CQlvwwe9n/u7z742Scml1StImOP+iJ4ke3lJ8KSqmRiufTu7lQavxIFSX+n65m241uGK
 MlPhaZrzU8dWowQmIyBIsvdEqIcU6bjgSE9wbjZjdjjQnWOmNz1ob2P4GPEz9ZfjSXYI
 vJaA==
X-Gm-Message-State: ABy/qLZYFqVh6nFTujsGIbDkWDl+i0Cu9yw3BZ/O5CV/LuEPHAJRVvha
 9gOA4ScOVkdP46IaDH1a6wJX/AEgEv4=
X-Google-Smtp-Source: APBJJlHVNcD94DN7bv/LLYjspRTLx3xJNSkZe1CYEMUIXVPSvWWRZ7LXDtz30nBDzG5RD3hVR7DUwg==
X-Received: by 2002:a7b:c38b:0:b0:3fc:524:e80a with SMTP id
 s11-20020a7bc38b000000b003fc0524e80amr7475327wmj.18.1688991796782; 
 Mon, 10 Jul 2023 05:23:16 -0700 (PDT)
Received: from hthiery.kontron.local
 ([2a02:810b:5a40:2a43:7200:ad55:a3ad:7bab])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a7bc005000000b003fbdbd0a7desm10145025wmb.27.2023.07.10.05.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 05:23:16 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 14:23:07 +0200
Message-Id: <20230710122306.511354-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688991797; x=1691583797;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iRgMf88HkD5KxIH/5qwsCujvOZxg92Z8VN51E/LgmcU=;
 b=TczQRY1G0Zl2Vf51R2lfvjolxjG8cVCRjYFQXZVhVUrFC3pJwwe4Es4/Ty2YJZ2nxc
 r8spZQ2y2QjAIK/8kmUDFuOn9hN/PbP6ES0luCN3019XPq/Y1dXQ33zA5L3Ity0XwRXe
 hhUxa+kVAoaSX7q1YVY4EQR12pvd+ph5XSf18n1SRu4xz9DHdDYN9StrZvITOPhePWGy
 L+3xdP+mkH2bBRecuJ7wHXnknHXcuTlcUTeaqA2odZ/Irw482qFBpNQrgTfX9qA1LDMp
 GuU2psTTWsb3smIloOboiLW5XAYRld3YW/dbmYbmvWInLy3IqouhTF2VG5YJ1FZu6FSS
 2HGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TczQRY1G
Subject: [Buildroot] [PATCH] package/rauc: bump to version 1.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release version inludes several enhancements and bugfixes.

https://github.com/rauc/rauc/releases/tag/v1.10

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 1cd5f7f314..3a1fa6f5f9 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  73802ce28d1045c757b547f5b4a222f0e825b5df77bca3464350278fc6fd200e  rauc-1.9.tar.xz
+sha256  d3eec057e74d41565bbdfa10ff8bb2edb38e39af2b2126f8ad1d2174ae034d47  rauc-1.10.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 4168d6c2db..9f0571402f 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.9
+RAUC_VERSION = 1.10
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
