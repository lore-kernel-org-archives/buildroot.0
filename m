Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11E1C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 09:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEBD281A1C;
	Sun, 29 Jan 2023 09:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEBD281A1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alVt-Hu3lCWQ; Sun, 29 Jan 2023 09:45:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40502818E8;
	Sun, 29 Jan 2023 09:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40502818E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 327111BF3EB
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 09:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CF964015A
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 09:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CF964015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vI30_kFcV1Tg for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 09:45:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A02401C9
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7A02401C9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 09:45:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso6255251wmq.5
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 01:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8GyE5PMfTKTk7LomuP9/UER07JRm9q4457WpWPYMEI=;
 b=xbEU0Q7JOhtzC3xX2yWPAFKrCYT3TI+hCFhlNsCDhffPMkbqB2TKjdW9xWA8prFddD
 jxWShw0n/kI7ZiAtogboe2aeoUThqVWT9y/gZIJ9PbzfjUds9+lgFYpUEVCSpll333Iw
 qDbfoEKNBAsNloAQuKaABnDk1siGzG7hBLycMULtXZIXgJxVWWc3hUhLKMtn8X/lolDc
 v4r0Uk1m1YGGHikcfL+3B3GG13KFvsb/gQn4Qv9ztruSpp57jofXx3WINIUj5x5AlF+x
 bfYTP7v+XaAvYhUHS5fdXRv/G8V7Yx7YomSb6lPnxWiv0D/HtrgeLscUhSd9eZskGNKf
 MRsg==
X-Gm-Message-State: AO0yUKVRQ2dK7WWMXURn3IFuiyaxG3R9Z57W0QMdh+sgzCJLJaeUo5D0
 AuGT0W4VhncUGAONB2X8yh2tbAjiS33Zfzzr
X-Google-Smtp-Source: AK7set/CZnoKRvO/rWqSQPg4VHzxzXsexFhJS9Y7imTfQJ3k8dpYWuSpGEWEnBjGfwRD/sb1osL9QQ==
X-Received: by 2002:a05:600c:b50:b0:3dc:557f:6124 with SMTP id
 k16-20020a05600c0b5000b003dc557f6124mr1017650wmr.5.1674985543127; 
 Sun, 29 Jan 2023 01:45:43 -0800 (PST)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 d11-20020a05600c3acb00b003db30be4a54sm12634713wms.38.2023.01.29.01.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 01:45:42 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 10:45:28 +0100
Message-Id: <20230129094530.884944-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=d8GyE5PMfTKTk7LomuP9/UER07JRm9q4457WpWPYMEI=;
 b=nbWe+WegVi6OGfJU7c7/UJL2FZ6NULWRISV7QPJ5Xn/WGFs0r0Ojg4F/nbqV9lhZX6
 beT0dZMskcDu5QLUCqpR3bYqhbctL0XIf07R1xlW8v6OG2wjTrlqTWPL6dL18nBxroxz
 7SO/ETymnrNiKgDvjLPDxgvXCOgzSr0pCK3zIuDIkG/gHA8yhT2Pi7yMUSeL2KtScGJq
 K0LDiWGijaZV3rkEWkPVHeIRsCdQy91axJNje0m/I7KnzZvnlVgRpuaQuDNEprYq2aHT
 VosEdF1oiErYMljddtJrgSaM4Z7CwxPS21E/2q6Xw1Uxrb6CURr8Mxgkg0Q4NJy9Cnd8
 UfrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=nbWe+Weg
Subject: [Buildroot] [PATCH v2 1/3] package/fluent-bit: needs C++
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@gmail.com>

Fixes:
 - http://autobuild.buildroot.net/results/007/007c7c69e54b8ff663891da4535e2e95d40c42a2/build-end.log
 - http://autobuild.buildroot.net/results/ede/ede6f9fb67c0c26ff02e71a3d20e3d4344ea59f0/build-end.log

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>
---
v1 --> v2:
 - added package/ prefix to the git message

 package/fluent-bit/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index 11ceb55d4f..bd89c05faa 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FLUENT_BIT
 	bool "fluent-bit"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBYAML
@@ -8,5 +9,5 @@ config BR2_PACKAGE_FLUENT_BIT
 
 	  https://github.com/fluent/fluent-bit
 
-comment "fluent-bit needs a glibc toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+comment "fluent-bit needs a glibc toolchain w/ C++"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
