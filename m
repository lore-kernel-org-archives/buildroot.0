Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA45C4167B
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 17:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33756400E2;
	Fri, 30 Dec 2022 17:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33756400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJtMih2lBwJe; Fri, 30 Dec 2022 17:01:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 852E4405C2;
	Fri, 30 Dec 2022 17:01:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 852E4405C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74C2D1BF4E4
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 17:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E7CE409C3
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 17:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7CE409C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o3EgUyIspGST for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 17:01:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF1DF409BE
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF1DF409BE
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 17:01:29 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bs20so18229828wrb.3
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 09:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKrxzm8hU+1+jxCcy+4dlyu4NQi7U1eVLHfSJe7JhDE=;
 b=bnGBK7VE6LraN/0sMglT/9saJP972WHlJ4uXDdy8h1ynCfvY5vD1ugg1iiqB7YiZu1
 EpbGCKWe9rJC++2dRyqGW1dLk/ebX/FNJ7bxJx+cc6kYWqvBr8CWLy8UGSc+IU+iRlTU
 zbN7IONmpTuTysi95RFGBepRccReVTucKvezaPTm7afDaPvskGIMp8MPWcuJl+tf7T2h
 U1n1wxCVSJG+UMjYZrVKv5YzkZpzMAg0o5nSDAi5yAyr62ZkuGRnVbHCvJxPS7yOuaSt
 tNNFnfKB7QgWw/+7i82kld+GekIXuVHPnevphqtV1A1OmgcYoEfe8psu0dT4SUkdVtgL
 0FGw==
X-Gm-Message-State: AFqh2kpA+KQEX613pRTaW701dcCLPDg5YefkihHaCjNm2lU5mtr9UKyu
 UTYzqQaT9D3GMa1K9OKlkHZWKRqif/8=
X-Google-Smtp-Source: AMrXdXuCYJ4c079TWdlw+Q39XaVJ1Bm1hmw4uLOC+qQqE6llrSZPkChTtBoSXQKFFkzijjdkQSE8Dg==
X-Received: by 2002:a5d:54d0:0:b0:24a:e56d:e20 with SMTP id
 x16-20020a5d54d0000000b0024ae56d0e20mr19938415wrv.29.1672419687605; 
 Fri, 30 Dec 2022 09:01:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n14-20020adfe34e000000b002366dd0e030sm21279768wrj.68.2022.12.30.09.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 09:01:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Dec 2022 18:01:24 +0100
Message-Id: <20221230170124.18368-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tKrxzm8hU+1+jxCcy+4dlyu4NQi7U1eVLHfSJe7JhDE=;
 b=C+7jiZe4SDubbUY5r4JLLmU4rXf6nWKgLxSR3/rTLDGkqjh2+k34ludEzaNMmIutpP
 phY5L5DhnB9CW1xrVmO4GqNLTF/x8cvkOjQmeMTWv4Cqi+BvuGa7G8DcP4uxsE7aTfxa
 lv8G1ABYt+Sf/WLSUDIRlxIc/5qrkIZ9uQIwMWK8Gnd5NtVCfQk+wSMfNcYl1K58Yyf6
 EwPCi2zKXFlaXKI4IBnLGQLSvrJALYSwd/Zhxpe3uQZdkG+ufI44u3ME6/ToDT7hkVmE
 Bc3lzTRgmY6y5opAHii1qZd5pDfeQg4CT+MvYPKGRcv7Gkje3wvieTW0WyhURm6vBxnl
 +PbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C+7jiZe4
Subject: [Buildroot] [PATCH 1/1] package/check: disable doc
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

documentation can be disabled since version 0.13.0 and
https://github.com/libcheck/check/commit/8ca1f79a73c374e9e9172937938947584c921659

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/check/check.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/check/check.mk b/package/check/check.mk
index be82539469..ccffd08ee3 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -10,6 +10,7 @@ CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
 CHECK_LICENSE = LGPL-2.1+
 CHECK_LICENSE_FILES = COPYING.LESSER
+CHECK_CONF_OPTS = --disable-build-docs
 
 # Having checkmk in the target makes no sense
 define CHECK_REMOVE_CHECKMK
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
