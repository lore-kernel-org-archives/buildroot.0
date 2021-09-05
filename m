Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8B5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 19:33:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C86860F92
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 19:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C86860F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A5E26079E;
	Sun,  5 Sep 2021 19:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fb9DsY_HkZQf; Sun,  5 Sep 2021 19:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 793FC60786;
	Sun,  5 Sep 2021 19:33:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8AF1BF3F9
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 19:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A8D560786
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 19:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_6bvv7o6fPk for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 19:33:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25DD360746
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 19:33:12 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so137921wms.5
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 12:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=afUMm19hKKjHCDSls9ql+crpYGX8gxrue7cMI71IzME=;
 b=cpLX/NTDrv33hvnZXr643QFmcDG5XeDDUBEiBAODGsXzEkkGDP6HTXYuvjVPOLZsVz
 MbLurz/uInoMu5LhkDV7gyjxoL7VZHCHZCkiVjGOo0BpuEu12HMTwrEpAyYm+QYgLmJz
 FmOibVt2pc71jy8UKT9IhdGB6iSYUfU7wS0mwOLwnIQT2PKQQBtrp3aZHLqQOab2Zvxj
 sna1iRzOLTBFbKZ8tAPr3ukHZ6Wc3kxsXDhipvQ+8xxkhyEkZF3vx22/UvHFKcDoakoW
 cKmXZ+0ZSNRRgcWwtaMi3gkoAlqyj8yPxEXipMlBVn9Auhd+dlAeNav7DpemSIhJHy7K
 qyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=afUMm19hKKjHCDSls9ql+crpYGX8gxrue7cMI71IzME=;
 b=dgnQnJWyOX/LeThTPuXSVUBZVn7/2r/wak+UCTk3jxqR0Flu8W+UST0aRAbrMspYKA
 Dv3kOp3pGVLncz2o13uEXZCwUntOsFz0Hb2uW+H8Yy6xjORKH6bUvW0CpMEPvFIVQZJm
 j5ug/7wkE5tZ1yMY8yAFtkgCkD3mDvvJ4/ReVw/1/4WowcljjGMmj2pXSQ9WpJOmwFPa
 mmsdROqIfsr8bFx3GJVdNpPC1WZauIVn3p0RoHyL8cnCJ32g5dVgeadh56bdVe3wsThj
 iACZm0BnuLk2LexYQVkFSv5CtATdqqy+R4lraeB13ftmkfcJv+IhUj99wXRRB3xRSo/h
 AHUA==
X-Gm-Message-State: AOAM531CFlAOt66GDryB61jlVVZgesJmZQEnhI8L5GXpQUmRO9aEMR0/
 zAaYi0NaZzitOxoGquJE1AswVhDRbbSE4Q==
X-Google-Smtp-Source: ABdhPJyqDFJ8AIpl+6FKHaUD5Dv3PV2SWqvFdcSXuFlgqOSPpTB+gD6LEtyKjg8hCo3uduE9qyPHhw==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr8133274wmq.39.1630870390126; 
 Sun, 05 Sep 2021 12:33:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id k4sm5796330wrm.74.2021.09.05.12.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 12:33:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 21:32:52 +0200
Message-Id: <20210905193252.1379329-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rwmem: needs wchar
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

rwmmem needs wchar because of fmt dependency since its addition in
commit 51a282bcb8dfc26d3a27723383c5a1767653a19d

Fixes:
 - http://autobuild.buildroot.org/results/1c06c27d70aae8bdb39ae43fbe74896e536293c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rwmem/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/rwmem/Config.in b/package/rwmem/Config.in
index 0fd9142e92..cd9a7f78f1 100644
--- a/package/rwmem/Config.in
+++ b/package/rwmem/Config.in
@@ -2,9 +2,14 @@ config BR2_PACKAGE_RWMEM
 	bool "rwmem"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_INIH
 	help
 	  Simple program to read/write from/to any location in memory.
 
 	  https://github.com/tomba/rwmem
+
+comment "rwmem needs a toolchain w/ C++, wchar, gcc >= 5"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
