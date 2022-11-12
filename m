Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4233C4332F
	for <buildroot@archiver.kernel.org>; Sat, 12 Nov 2022 21:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C3EC400DB;
	Sat, 12 Nov 2022 21:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C3EC400DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bev-4ZbDgqon; Sat, 12 Nov 2022 21:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 498EF4055D;
	Sat, 12 Nov 2022 21:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 498EF4055D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5ECFA1BF36F
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 21:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 469BD400DB
 for <buildroot@lists.busybox.net>; Sat, 12 Nov 2022 21:20:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 469BD400DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-Q6jwiXlCun for <buildroot@lists.busybox.net>;
 Sat, 12 Nov 2022 21:20:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45CAF4013D
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45CAF4013D
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 21:20:44 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso7841930wme.5
 for <buildroot@buildroot.org>; Sat, 12 Nov 2022 13:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EClTt0jhxdKCmT2w8AXXKBiX4Nt232RSKnJ6+LD29aA=;
 b=hMqcu2xS5Knl+vysS2ExaudmtwVS1zVtDAcNlnhEC01ANqHsZcQrSa+xFSysunkBjO
 RqUXTNrGHD+ExAwNZJ1HaEd3mTMV6hBZ65wot1mgOv9H8BL5V+7VIHYjj0Gzs2RkYssp
 Zag+2UkdVhD9Rw9pdEf4yibeWJ2VmMK7j3MsoZlUiRMHUOGYKviXUYFktJ+E3u01bGvm
 ZFa7bayDC3WGhWhT3ENE5rA5vGMUCGGTx3Qe6naBzKaJre7MYD9HnpgEn1cnZ+kKKn6D
 eaivecM+7minL7fdaaCIg2Joi58vt2K1CvWJUiRp0No16F3r5+EBq6KItBQyINHM/lrQ
 4sfA==
X-Gm-Message-State: ANoB5pnEZLsscfuobrqVl/AAj6RszwTtOl21WQuSntUAf6K/3rhTGobF
 Wa+ABZUYzFKt2MdBzk5OpqT84wYOI3Y=
X-Google-Smtp-Source: AA0mqf72pzn8q2tC4blobhHa+JAScZ+j2rdFuG8vGBfcJVUL3prElJXCtKFfsrZt+7Cm4873MLUiEw==
X-Received: by 2002:a05:600c:6d3:b0:3cf:7716:8954 with SMTP id
 b19-20020a05600c06d300b003cf77168954mr4661188wmn.57.1668288041964; 
 Sat, 12 Nov 2022 13:20:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 e24-20020a5d5958000000b002356c051b9csm5145299wri.66.2022.11.12.13.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 13:20:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 12 Nov 2022 22:20:34 +0100
Message-Id: <20221112212034.5472-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EClTt0jhxdKCmT2w8AXXKBiX4Nt232RSKnJ6+LD29aA=;
 b=mvu9Ux/DZio9SIrFsrDiliXOb5N8dqCPFzuro98s1qGtk2TYcqy2Uxb5BSuGSgBguu
 +ABftJaSQ5t8A9GaSNPUGyNiL1F5U/k2AeEHfRfgg4LHYaqw/6hInvco1EtlXyEG9D+R
 h44Kit7PplZwh92ftKPpavl3oKDZT3+ilCu95HGCsPQoLwq9vRMNRdgv2rBE2N1y+vs0
 UwuHPS8fjFc5kUEdXi2pNf2QRxO/VKbHyg5Ei0XgIMcD0VoazxO/0CqOaaBCHc9EnH6E
 2lNaExHQ8MYh8RvEx/adM0VeICbHDpXoTG+TXVZXedOQgbfbLe93MFKgfx6UzqQyu//P
 iReA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mvu9Ux/D
Subject: [Buildroot] [PATCH 1/1] package/mdio-tools: needs fork
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
Cc: Robert Marko <robimarko@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 8fdf8731e727dc5c2d4080d7a56e1d71dc25e533:

mdio.c: In function 'mdio_modprobe':
mdio.c:738:15: error: implicit declaration of function 'fork' [-Werror=implicit-function-declaration]
  738 |         pid = fork();
      |               ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/c53aaeaa34dd4d6d9a57da196687beecaeed9fe2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mdio-tools/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
index f24c1a6974..237f4454cc 100644
--- a/package/mdio-tools/Config.in
+++ b/package/mdio-tools/Config.in
@@ -1,12 +1,15 @@
 comment "mdio-tools needs a Linux kernel to be built"
+	depends on BR2_USE_MMU
 	depends on !BR2_LINUX_KERNEL
 
 comment "mdio-tools needs a toolchain w/ headers >= 5.1"
+	depends on BR2_USE_MMU
 	depends on BR2_LINUX_KERNEL
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 
 config BR2_PACKAGE_MDIO_TOOLS
 	bool "mdio-tools"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	select BR2_PACKAGE_LIBMNL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
