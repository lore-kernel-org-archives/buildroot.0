Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1777CC001E0
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 09:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A32EF414A0;
	Mon, 23 Oct 2023 09:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A32EF414A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hj-_FMRP4ECk; Mon, 23 Oct 2023 09:25:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AEE9414BC;
	Mon, 23 Oct 2023 09:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AEE9414BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 216C81BF35D
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED0EA41453
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 09:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED0EA41453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OKna_Ymm18do for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 09:25:08 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76AEF40A94
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 09:25:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76AEF40A94
Received: by mail-lj1-x243.google.com with SMTP id
 38308e7fff4ca-2c16757987fso44447501fa.3
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 02:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698053106; x=1698657906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZKhHGdUHvv2l4hYLVPvMmahqhKhaKme52GTOIMF8QA=;
 b=UHIZOkT+ktN9xwLwQaC21V7oUxxHRqrPkX3bniml8VTbQEt7de1DvYz8dXToKIjt8S
 4RoyCI8rOkcaG6UHZGComi5biRVcCsQddY7gKH9L8q4MA4jhsrOrFrBmGdhxN/10uxNB
 DLnbauIoQy9kZR5eq3+fvNCu2vd7lNjzpe+K0zvHI0yYXZmg71REAIUarHFNCLQGZHFf
 sRPmdIEWHsCSD5W9F5gOT5vtsIfq5ds+gAq7ZvvQ99da8z4NLxsR01UNZTSVeZhVAmXS
 WlPGoeEOHgHidCJ7dUp8ZfcSH+4xPoE71MmNXyeRVMf3dkJg/ekjO6b8TqJtvdcD0qtm
 z4Hw==
X-Gm-Message-State: AOJu0YwOpQ+CwOV5zL8Gu01IoQNW9podjhEylc0dxkC1j6ZFUV2JULk2
 NOSZAFV0bAvgrsiSKeZ4yS3DROE6BDOcoJ8/kzpR3PfXFVlHxA==
X-Google-Smtp-Source: AGHT+IHBS7GurzeEGw+A3ZMhtKs4Yd+hLs5kh+Mkihm+6TT+x71lkwhGZTLGSDNjH1N4KaJzUOoHGA==
X-Received: by 2002:a2e:be2b:0:b0:2c5:1e3f:7379 with SMTP id
 z43-20020a2ebe2b000000b002c51e3f7379mr5852559ljq.48.1698053106126; 
 Mon, 23 Oct 2023 02:25:06 -0700 (PDT)
Received: from fedora.. (host185138219236.static.fidoka.tech.
 [185.138.219.236]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05600c1d1600b004042dbb8925sm13911859wms.38.2023.10.23.02.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:25:05 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 11:24:55 +0200
Message-ID: <20231023092501.481436-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698053106; x=1698657906;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZKhHGdUHvv2l4hYLVPvMmahqhKhaKme52GTOIMF8QA=;
 b=m/xQTZNk3c+Q5ER1JUmMr4ErO3CiM0T5g8NTozG65e/WOC/mHklTOdv3C981d9McT5
 OP987gwvfrlwEM82Q/tFW/ZyeISoqYJYTkaZMg4oNA3TxUYBAYdgjOoyfRAfYwRLCSXQ
 1qP5WWcfe/bkeG8hXiRFyDQMVsXIKVPCKaHy0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=m/xQTZNk
Subject: [Buildroot] [PATCH 2/8] package/opkg-utils: bump version to 0.6.2
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/opkg-utils/opkg-utils.hash | 2 +-
 package/opkg-utils/opkg-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 29671f9609..7aabe4d1a1 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e0fcaab51bff2149bd6560fb4238319d502dd99b581f66763d702e75c224736d  opkg-utils-0.4.5-br1.tar.gz
+sha256  ad4fb6d01f2f18e986c556cca1ade584b109c277794af15977c354d2ecef9b52  opkg-utils-0.6.2-br1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index 384a7323ee..b077e0dcce 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPKG_UTILS_VERSION = 0.4.5
+OPKG_UTILS_VERSION = 0.6.2
 OPKG_UTILS_SITE = https://git.yoctoproject.org/git/opkg-utils
 OPKG_UTILS_SITE_METHOD = git
 OPKG_UTILS_LICENSE = GPL-2.0+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
