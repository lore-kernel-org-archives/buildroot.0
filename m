Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9513AC48BC3
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 22:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC1C54190E;
	Wed, 14 Feb 2024 22:27:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i83p5-F7hamc; Wed, 14 Feb 2024 22:27:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F68E4190F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F68E4190F;
	Wed, 14 Feb 2024 22:27:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 223F41BF57B
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 22:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C9F982531
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 22:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylw9nJZv43f9 for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 22:27:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C416182505
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C416182505
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C416182505
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 22:27:46 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6e10614c276so225896b3a.3
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 14:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707949666; x=1708554466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jHl/PTDGWe9+0rtATvbHD43CtfLzucSm2AAKVwptxV0=;
 b=Z8+jT7JXYDBBKdtOip9F3F9eeYxWFcatAsWgaiTNwrrH4Kx7JCb3b8Sjs7xAze8afC
 mN8VbGYFS8yHebEDSgRcRoUo2YLTWm7bnessCLfjN+MuEb20S4fxgPORYEsELf+Xc2cg
 jA4SK4W0df8jDhoCEGtVH/kphkuRL457spVLKtHSI6+RexMWIdND4myAPMlWyxr1IccX
 lZx4R7gz1F6l1mHM8J9kspaKHPmuEr5qMThY+ipwsW0bs2sZ6a5AeYUwmF+9nm8VgbjP
 c50o19SLiQjkueVcsB4FB/Qwf3tFtfESVmIlAPxgxUYZ3xIE4pb2y4AuC+B6Ej8sQAAM
 O1tw==
X-Gm-Message-State: AOJu0YxrlMmiWFSWTsVqawAF3ykrbvjmAP4yT8zQQ5Fova7ZzQeu6FN+
 h+gTYUtLCn1kVvqL0a4d6hTvgMwgG5TeSA2L9cDMshpkKXyG9AUMHCAXkBFDd/A=
X-Google-Smtp-Source: AGHT+IFsKkfljSTR/tVhcsUnC4HZDpjP6/v/jg/4NnMRWUdQXgpMpmNy5UvvsPoFQv0befyvIkcccA==
X-Received: by 2002:a05:6a20:669e:b0:19e:cef9:e646 with SMTP id
 o30-20020a056a20669e00b0019ecef9e646mr160637pzh.35.1707949665579; 
 Wed, 14 Feb 2024 14:27:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVlPBJkcNb9EypCsKNOD+ooFheOvDiZceHjsMWihKkrN9mofvOZ4GxdBcqe4r6QUtayEwnDQ82PWseIxHViis91nJXlVZsT7ao=
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 x23-20020aa79197000000b006e051704d4fsm9833195pfa.5.2024.02.14.14.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 14:27:45 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 14:25:39 -0800
Message-Id: <20240214222539.2268283-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707949666; x=1708554466; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jHl/PTDGWe9+0rtATvbHD43CtfLzucSm2AAKVwptxV0=;
 b=XO82Vi+WpR/7QvaN2UFAM1hi1tP/kSTaLNUVc0aKfyaSxBvzHY9y5zbgUN4AJgsq/P
 YPitowYy/j5NFDUyKfhdqpc/zjSCUILAyHd39x3QMdWzF4A1xXwjKFw39EfhOCOPXyhK
 B/N42RnW0nuMNxG9wSQjULluMRk225jHJyrz/BEXQ6lREZvM91rIc1RBN0O81Vtei1bF
 RSmiV/jsqJBeFs8NZFs6J6Mx2TgCDjQOn5OTUnzRvzJ+HNh1WERf/OOCcvTCdImY2tF/
 sx4q+RcPbhZ+BGrch3q1Y18Sue0m5Mf1n9KTxGqzP4nwUCXfQ1fDg591xoy2AyuRz5vc
 RbSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XO82Vi+W
Subject: [Buildroot] [PATCH 1/1] package/ttyd: bump version to 1.7.4
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

change log - https://github.com/tsl0922/ttyd/releases/tag/1.7.4

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/ttyd/ttyd.hash | 2 +-
 package/ttyd/ttyd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
index 85bd71ba2d..b11327c465 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c9cf5eece52d27c5d728000f11315d36cb400c6948d1964a34a7eae74b454099  ttyd-1.7.3.tar.gz
+sha256  300d8cef4b0b32b0ec30d7bf4d3721a5d180e22607f9467a95ab7b6d9652ca9b  ttyd-1.7.4.tar.gz
 sha256  8b7e100f8311cb428c57609164d93099bada2599f948359045d1ac876a7a625b  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index d17e21d60b..d0e144b252 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.7.3
+TTYD_VERSION = 1.7.4
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
