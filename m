Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACC4C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 02:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1861442F3E;
	Wed,  1 Nov 2023 02:14:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1861442F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X0LIjtJentmj; Wed,  1 Nov 2023 02:14:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CBBB42F45;
	Wed,  1 Nov 2023 02:14:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CBBB42F45
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06BD81BF277
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 02:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3417408E2
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 02:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3417408E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EThR84WDNGxL for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 02:14:14 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5318B41734
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 02:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5318B41734
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6bd0e1b1890so5269042b3a.3
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 19:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698804853; x=1699409653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=swZvHnxnqUj5hJUv33Eff/JjI/K6EUh0JHO0bme86Cg=;
 b=dssiwc56++Fm7lOylMjhnKb7ss2Nmlmp51c0U0xyl7MhKKHq5f9BM1Kgo6xelwjVrn
 tumURl+2LKyRHKJytTfQqIMU/ZWvKtPwUfLbdoUPqCtWIa8oHaLOjtT7xoVYv3id/QAR
 YOsMZZLaN3N2hQwLuIlK9paUkv+5SvSc9LiruXDCamv/pa7ff6lo2pjUXEQgcfG6PTPA
 fWtt3FTzYC49plH9DG6Cw3+nHS8/4a5BFpKDIPKmSRrePWHl1a2/GXCA/O2tqbj3fpFe
 G5bqIeIRIYfXDunBarEFUoOcR22sASNd0Z/x7NDGiSGqw1GXfg5OdGKfDMaLnpuLA7R6
 gWoA==
X-Gm-Message-State: AOJu0YxhA96GwXCT6vWvRyjVaumoPhW5sty9Ns8yw49yphh73O0yLGMp
 x4dXkt3LrJXpPMyIwpcTpeMcyUo8wlI=
X-Google-Smtp-Source: AGHT+IEAzaHUO7bjdoIlN4Tysvr1o3FYLz2+J66ks/MTdHHd57hAmsX0gJemDQwyXCNJEUz1ytYWnw==
X-Received: by 2002:a05:6a00:16ce:b0:692:822a:2250 with SMTP id
 l14-20020a056a0016ce00b00692822a2250mr13778898pfc.17.1698804852736; 
 Tue, 31 Oct 2023 19:14:12 -0700 (PDT)
Received: from localhost ([142.171.12.18]) by smtp.gmail.com with ESMTPSA id
 q14-20020a056a0002ae00b0069023d80e63sm255903pfs.25.2023.10.31.19.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 19:14:12 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Nov 2023 10:12:38 +0800
Message-Id: <20231101021239.16313-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698804853; x=1699409653; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=swZvHnxnqUj5hJUv33Eff/JjI/K6EUh0JHO0bme86Cg=;
 b=ZficBKNv6ixPyCXupPVdFGMPqqpMfhl9yjW1YSmujJ3hRUn+P5oimHkHsYuKdFDixz
 rqeXnL9tgCOfN0UOUZk5VoNRhV4sj9DSkS1OT2QHBeLpdwyc4JSRaFRKvlJrwL5f6Clt
 c9QMLVNT/U2Mi8kpwn6bq9pnZxGWHFjk/l9/1eC1YLewm7f4Oz3wuFwl5zAcx8Xy1Hp/
 cNGvoE489GAp5jp9lDZe3tlhXe314nW867KAxT4QZ7jHFaEk7f98mkYeJjXy6nQFN5XV
 8nH152iQhHkMcArVQcZ3eCJo9LLrFjXGFwROFCjTUGGQlFEal+gzbYZnS9yvmshvC0iK
 D+kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZficBKNv
Subject: [Buildroot] [PATCH] package/openvpn: bump version to 2.5.9
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
Cc: Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/OpenVPN/openvpn/blob/v2.5.9/Changes.rst

This is a small bugfix release, and the last version for 2.5.x

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 0959b7f838..a60362a09c 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  08340a389905c84196b6cd750add1bc0fa2d46a1afebfd589c24120946c13e68  openvpn-2.5.7.tar.gz
+sha256  8794b7125998c68f30de654267a702b9581454ca1e7061511fcc5f99fea4bd32  openvpn-2.5.9.tar.gz
 sha256  1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 5c602e0448..1e47b75557 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.5.7
+OPENVPN_VERSION = 2.5.9
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf
 OPENVPN_LICENSE = GPL-2.0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
