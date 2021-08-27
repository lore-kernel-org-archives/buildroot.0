Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB268C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:48:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62FD660FD8
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62FD660FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20A8E606E5;
	Fri, 27 Aug 2021 21:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3d52JS5cjfCE; Fri, 27 Aug 2021 21:48:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 208326076B;
	Fri, 27 Aug 2021 21:48:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7061BF479
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26B4242791
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:48:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAv1DOq0qCez for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 21:48:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE8DF4278E
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 21:48:11 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id n5so12369539wro.12
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 14:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PyoSv/MXbmTV7l5Ua13qpjeHgWnEjlhpERBUztIRs9E=;
 b=JODg0nZdn1/1ByvpncPnjnurEwazSuGM9/yAX3AV4M5nCFvt2myYVlIwI3y1yyyd7T
 4unqXCZz949VZ52MxOLA3uH371UyYLjOW8AxIeRgqL9r4vVriw7fq2+je2eoEOcPGmGK
 wUM5OqeKKLhU8H4qTCxskVBLzLNH8Vv3OrWiwvyWJ6YWYnYPcVtwyV0GL57a2E4xptFK
 5+Ynd+tX1QpTEmhQLZZ4v7ThPnsJLqYGMZqSQw2MYj4ZBzLLTkRLvAZ0E+CW/yUIEvZ+
 OFiDUnUpFs+XN4PsftmGEq7/KFedxeNdU8J3avy/jmQPq3LvX7YEnST3mIALLEDdHa17
 cjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PyoSv/MXbmTV7l5Ua13qpjeHgWnEjlhpERBUztIRs9E=;
 b=pfKvsgFOb7bQK22BPgaQ+E4dr/zaDNHJwf8unS/YZucVv5tJXFHFZmvWyJqlNeWmKJ
 cRhA5uiMNFpqqc3svb5mLSfwGXDyem0+eGOPodsMb1qiijCHvVjIWYBzN+26jCfLcQyK
 5W5UJv6NibG5DRDBIeYvkhsxN3xvZl6Kd2T7f2U1cH4QNYwZ3nLJHc51CYeDalX9jw4A
 YWVMO2oeJDgf83tiaDeXJ15sTduwInOysMCzDD+MTk1YHlMIxBisHwAAhtqklDJ9Rfgd
 YTuS7auArza+QpYiD/M7kS+m/lsbG4M1XhRWBixz8GUUPdbYqkQT5zvGr/7SeK12Gcvs
 L/Mg==
X-Gm-Message-State: AOAM532UNJTHBsjBszAdfgxBBTox0HCYVlKpoxsPLpLCd7/XQScorL/F
 lxWuNV2/GRXtoLFNemTu0PZ3K41Rc4PFHw==
X-Google-Smtp-Source: ABdhPJzJH3lWxi3XQB9FbnsEBRqzmzcwTN2rmpju89t5dVfTVGgNoAegbyHJG01ivtBUTnGjjMPsoA==
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr12470113wrg.386.1630100889932; 
 Fri, 27 Aug 2021 14:48:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id k4sm7558375wrm.74.2021.08.27.14.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 14:48:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 23:47:38 +0200
Message-Id: <20210827214738.49557-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mtd: add ubihealthd missing comment
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Commit 42a3fee35e67d8d946f52a82bfa88ee6fd9f04b6 forgot to add comment on
headers 3.17+

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtd/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index d0ca3ba663..c45dd1e2b7 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -148,6 +148,9 @@ config BR2_PACKAGE_MTD_UBIHEALTHD
 	default y
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 
+comment "ubihealthd needs a toolchain w/ headers >= 3.17"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
+
 config BR2_PACKAGE_MTD_UBIMKVOL
 	bool "ubimkvol"
 	default y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
