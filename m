Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61672C6379F
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 18:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B926119E;
	Thu, 19 Jan 2023 18:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B926119E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Axuj5aBF2dgW; Thu, 19 Jan 2023 18:49:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41B6460FE5;
	Thu, 19 Jan 2023 18:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41B6460FE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 057D11BF33E
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 18:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5ABF60B5D
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 18:48:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5ABF60B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76YuM_MbkWcm for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 18:48:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3BDB60B36
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3BDB60B36
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 18:48:51 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 f19-20020a1c6a13000000b003db0ef4dedcso4207930wmc.4
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 10:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mwe+mEo3TfGct8RYnmv0fLXIaf98iArOm2HHj0gzLGI=;
 b=42WU1Lx4ZHZbH1UdOwUcMwws2drYwJBXsxI+dWLQFPGSNpnKKPztm4LtQbkGwcxIvu
 WLJ/Kla9YTWXMWN8GGX4zOZFS2nZSCc9HMz9cS7hpZLU90eV1wm1rl8PwrSzdZcgWYXd
 18i7JzYf1WZTZODL7s/N4SkTwqfvnb8VQNd8p/y6zhNC0jQoQ61DcaX2WhLA3MioFACs
 5KHccanuQkhtFn0c1jKSKXxMsAPvL6R7f7mBMx3/y1ycdmWojPzuG/leSOUC09lsy+BM
 XJwMorFci+fYr63lAikwJCvzHPvMaj1BmYZSaAAV21TgScFOWuG3gkPzkBuxWX3XEsXZ
 TlXA==
X-Gm-Message-State: AFqh2koUuUf38C3Ov/FbSrBmQaljP9kA/jZvGPH2p6gXBptbKUalsWHH
 E9sJNm6pTDueJuMAmn1uVrJq1m6wch0=
X-Google-Smtp-Source: AMrXdXu0scWJoMC8z0O9VAiBjG6c72klWXen1UI2NPQs7P0e5uz+qs/qoucBOaZCnGaZZdrDELeSrQ==
X-Received: by 2002:a05:600c:5118:b0:3db:1e4f:7cdc with SMTP id
 o24-20020a05600c511800b003db1e4f7cdcmr3469352wms.15.1674154129874; 
 Thu, 19 Jan 2023 10:48:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m10-20020a05600c4f4a00b003d96efd09b7sm5965251wmq.19.2023.01.19.10.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:48:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 19:48:46 +0100
Message-Id: <20230119184846.3693-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mwe+mEo3TfGct8RYnmv0fLXIaf98iArOm2HHj0gzLGI=;
 b=COFqANtAfvR0FI6dZuDAfl6sv1bVjRKkdsw1KFgEIBjsHLMSnFgcdrp8r7NCzSYkNi
 syKU93v2JphM19VQcxVoIO3Lg3L3sVE7oxVYnFXwEhOe5xduqP6hPJ5JJNnXV+XAy9Em
 uVBYah/Fxy9d/+fbQ/k/t086gdiKkm/ZDVU2/0LTLK/CWC0Gnjw8MtgC0pa+Y6XosSDg
 vhZoBxytCPsKEXBZbZKqAN0KnqrGtJc/78WweZs2Uivb32czlmb2KrnTiTubBU5mNomr
 DnfxNfcQ3h6SfLuDVz4LCFFZd7kPhTDQCi8Xtbsjh/RhorFYqfh9wNZh+e3ACKzBOzIu
 f8nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=COFqANtA
Subject: [Buildroot] [PATCH 1/1] package/xxhash: set MOREFLAGS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set MOREFLAGS instead of overriding CFLAGS to avoid the following build
failure raised since commit 94b66fb49cd57d0863245fbe0a3dc0833e76aad0:

/home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: /tmp/ccabb8cF.o: relocation R_X86_64_32S against `.rodata' can not be used when making a shared object; recompile with -fPIC

Fixes:
 - http://autobuild.buildroot.org/results/953133575d8c13266f1450fa545e70e4a518508d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xxhash/xxhash.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/xxhash/xxhash.mk b/package/xxhash/xxhash.mk
index 40e3c2696c..75d375a2fa 100644
--- a/package/xxhash/xxhash.mk
+++ b/package/xxhash/xxhash.mk
@@ -28,8 +28,7 @@ endif
 
 define XXHASH_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS) -DXXH_NO_INLINE_HINTS" \
-		$(XXHASH_TARGETS)
+		MOREFLAGS=-DXXH_NO_INLINE_HINTS $(XXHASH_TARGETS)
 endef
 
 define XXHASH_INSTALL_STAGING_CMDS
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
