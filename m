Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B1BC61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 14:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A537400E2;
	Sun, 19 Feb 2023 14:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A537400E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98lCSWPI8ewn; Sun, 19 Feb 2023 14:25:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DDF740AB5;
	Sun, 19 Feb 2023 14:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DDF740AB5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD2BB1BF386
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 14:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A70F2404A5
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 14:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A70F2404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbtFaLVmYoyW for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 14:25:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2491400E2
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2491400E2
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 14:25:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j10-20020a05600c1c0a00b003e00c739ce4so486001wms.5
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 06:25:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nu1Tv3Q5qkxEsVLRoplk1UGAaGScg2pWWVPYX47gzOs=;
 b=wxRA+JtePpk7zTf6FLKr5Z1iHSXlPAAsILJi1OGMN4eQEhLPrMOFLsBGSwgVIQy4Os
 LVEWz2fn7IrSoqW7HGuHYgjTEWqg5xWSDF1p7XLMzkIkq22b03LaPrvnfKiYW68QfOow
 s/YVg5tWqcC8mJxEMpYl23BLctg9sm9Q6U4UzTCpUPGM6MVZhE5UfErJ/34WphFkLgfz
 8kMrah3sR7Ih/f4ZC0T6q1zql+uEN3sEyFMDcF4+sgJqW0SKlzQG5xqJrB1V7EKeQs+5
 vu6BXP3dwBKlOS43nVQ4p9Ogb9rIJOC09PIXFptnpNEVGeZYxrkHlTDf+55eNuby3iCW
 OwGA==
X-Gm-Message-State: AO0yUKV1F+/mqpamJ1NQTT7BWcE7FOhOlGiK05EYDeETLC2kbKUWA+91
 7ewBnv5IsFxWD/iOO7G4VNIFIJMP8D0=
X-Google-Smtp-Source: AK7set89kr2GlH5gsOA2Jfn35rJVSOA3OwgOj9QU19YuwlKdZED2WzmYAbrMUGnSTooDByc8u0mc4A==
X-Received: by 2002:a05:600c:13d5:b0:3e0:39:ec9d with SMTP id
 e21-20020a05600c13d500b003e00039ec9dmr5422393wmg.23.1676816751461; 
 Sun, 19 Feb 2023 06:25:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 u10-20020a05600c00ca00b003ddf2865aeasm6172774wmm.41.2023.02.19.06.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 06:25:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 15:25:47 +0100
Message-Id: <20230219142548.626439-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nu1Tv3Q5qkxEsVLRoplk1UGAaGScg2pWWVPYX47gzOs=;
 b=nMFGuV5Ip1rTgre+H0lpLBekrSCSPrm1CI+1O0kcSqS0kj/kK1LaDDwU8ZUzc92pyA
 3NEQadL3+s0pqBe/cHupnzCQniC9llkYbojauGNhmtHFNM61DqU/olnysBO4bmD3HhSz
 Vg1Idmz1SWGUrJKCVgi0jgst+z6jCmJgEKUC71Dr8V+WW39gIZ7qyTo9/6Cx1ak5FOdF
 1VQ6gjLfwYHrb5uqQeHnbUHgloF3F5CtBDjnsT9lgLAKYhT7uNs+ap0ITOQk1QvrKTih
 bhe5S35ODSjl3ddBTegIzaWWMuyVn/TvX2OuR2RPr8GUBEoePd5E0EtS7LlOW+ZKeE/0
 3k7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nMFGuV5I
Subject: [Buildroot] [PATCH 1/2] package/speechd: disable kali support
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable kali support as it is not needed and raises the following build
failure without C++ since the addition of the package in commit
9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:

  CXX      sd_kali-kali.o
/bin/sh: line 1: no: command not found

Fixes:
 - http://autobuild.buildroot.org/results/2f6c8b3674753d6a9f165117c70e7dad88505505

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/speechd/speechd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index 0d43e4b6fb..46c0672f59 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -12,6 +12,7 @@ SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
 SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
+SPEECHD_CONF_OPTS = --without-kali
 
 # fix missing config.rpath (needed for autoreconf) in the codebase
 define SPEECHD_TOUCH_CONFIG_RPATH
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
