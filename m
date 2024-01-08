Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3040FC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9FDA83B14;
	Mon,  8 Jan 2024 20:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9FDA83B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVvDhA_5W6D9; Mon,  8 Jan 2024 20:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4198383AFA;
	Mon,  8 Jan 2024 20:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4198383AFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 916F71BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69F67418BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F67418BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kcOI0kg5Ye9 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:45:48 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CA83417BB
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CA83417BB
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3368b1e056eso2138049f8f.3
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 12:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704746746; x=1705351546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=afTg7z5MopPpf7k/zQnRe2oEUeE+v9iuf/YT+lywhDE=;
 b=YyxgmxL90UVfkcNROnnsjYctCGaETSwrcqqB14qDd69bvfylj07hJ8SOcwOn5vDZIl
 qwB8a5yFmlyVSHKwGESEWmhp5uBIC3lEic2msv+PXAoDRj5qp2VQN9AJPBJBKfLODyha
 uNqGg8yee7SEJod8LWs/GYfesu8FxNqeiRgSD3VNzeOo5P9K1dMr8J1WUhw8zV4IgM/6
 IvBHokA3JhewPN1RtxHP3rzah6Ei+rbTsZoYg8UFNo4iQABLgy1+toEwb9Z3bbBW0uQP
 y4vLvN2Vx1pe9ch0nvB9koeh/qihPeBvDyc/kWgaARsajVVm373Gbk11d0JtXy7MrLc4
 POxQ==
X-Gm-Message-State: AOJu0Yz9gPtIp0LGE3/xJ9USiCVkvkzLKd1U4jXyJRN0ohUOwbDlrOnS
 15mve3kK6SPS/TMM2pyAYfICqhhHB0c=
X-Google-Smtp-Source: AGHT+IHdfhEDoNdTYCf6/eJ/0sfrq6H2JVIkpjCcPFKssonF1/QNnjGeSOcm7+3SIZ9ItumDUBvQ1w==
X-Received: by 2002:a05:6000:110b:b0:336:71d0:d798 with SMTP id
 z11-20020a056000110b00b0033671d0d798mr5407wrw.128.1704746745768; 
 Mon, 08 Jan 2024 12:45:45 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z18-20020adff1d2000000b003366da509ecsm549685wro.85.2024.01.08.12.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 12:45:45 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 21:45:43 +0100
Message-ID: <20240108204543.320869-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704746746; x=1705351546; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=afTg7z5MopPpf7k/zQnRe2oEUeE+v9iuf/YT+lywhDE=;
 b=XuX5fIeJIHxPqF5h6yyBVyFGbl1vhJjtM1dMNBTKwVIw+EKp6pHuceMPwb5AW0zE4R
 IyzeGZ2rh/yDwQgYLYqnpMPOQ19oF8eSaUs1hF4Ef12YZ6G6wRTwTiz89s4OIIM6zA9u
 ZCoFTNh15ZbKLqc1BOGmRw+sHJktV30nWCizxEr62ds5mWrFneM/wdqZoxCg7LP/RllH
 9ntXgL0tZrWGzIOoXNu0d2UunheSnomIpDubmBCKlB+8prmlmwaXUE/W0WLwDQYgMHbh
 96dEObmD/RVYyKAAWXCpFdvM+DKkFpt8QGzF5vtFi1FhVjQjx3yXYyL2qdCbKKSD0pD7
 jAGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XuX5fIeJ
Subject: [Buildroot] [PATCH 1/1] package/libtraceevent: fix license hashes
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 1474f1b34b178defca1d16d18a2446fadda9a12b forgot to prepend hashes
of license files by LICENSES/

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtraceevent/libtraceevent.hash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
index b2ffbc9c0a..14dcf54c67 100644
--- a/package/libtraceevent/libtraceevent.hash
+++ b/package/libtraceevent/libtraceevent.hash
@@ -1,4 +1,4 @@
 # Locally computed
 sha256  1801f416b317e2ae0430ce964cf22b9ecb9fb5cd9c6c2d1073b29953c3309bca  libtraceevent-1.8.1.tar.gz
-sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  GPL-2.0
-sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LGPL-2.1
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
