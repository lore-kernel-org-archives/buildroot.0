Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F9AC4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 13:48:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB9B60295
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 13:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BB9B60295
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56D3A60675;
	Tue, 10 Aug 2021 13:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWuyS1itm000; Tue, 10 Aug 2021 13:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7DC1606CE;
	Tue, 10 Aug 2021 13:48:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5C51BF5A8
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 13:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B0F660675
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 13:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8a3onCKkUEs5 for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 13:47:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D128A60672
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 13:47:58 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c9so26339107wri.8
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 06:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=STS3tCS6lnuCdHrefP8CVPwpSiKHdVMwIKLNjVkK9Ac=;
 b=Q2IMDHo6l4txqpGc3aogr6JAD3jN9+Qi4skqXWRoIWo0lA3eXNOnRzebJmw+1+ur+i
 g9TczbrOqZZlBhhDdJ1jyrvvgIQS3qe24yV3kHmez3+sV5TLYbZoELIJgRTh7PEzn3NF
 TQYc5QRbSL+eJfS644mN7R3SYd2xs5W28TXLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=STS3tCS6lnuCdHrefP8CVPwpSiKHdVMwIKLNjVkK9Ac=;
 b=CUZhgB8Eq//5AUfXoJfhmDpuxZBLVwplkCsAWOom59K8zL6hoIzK5UxDqui6KZ8F/i
 OOOvNGrW7jPGw9WBhMY7LkalEw2KnXzs23PaMG2gLem5a0rM/3doIRTb9QpxR5aB0cet
 lc7G8UhyO3tO09X0NEBICOMlhTrS1sD2rHuZkNT8mgfW14Npa+XiiWjsysxm3RqVSphb
 A2WS1WVAgmQddDDVgjQFz6Kh0n0RxKE2rk1dTGh2rkCO4xa4zF0l3/K2R05CaaeAFrf3
 jsz/gd+SpDtorlCczj1k44cmV9cHsWami7oZZEp/OxE+gumdQGXJu09/RLUCsrCMF3Et
 brvg==
X-Gm-Message-State: AOAM5313n0vesz413XJGuFLioA1Q+JNfc+GRYJTWANaJO4jIUnEdXDuz
 pghtGQAkC8B5/Hss5BuxmQE9yZAZOQhngA==
X-Google-Smtp-Source: ABdhPJx1kNjByd+Pnaum5CED7jECixXAmiBkMnxxEkx3rrEItMW+nhXzYQlyieKDNQBpCdgvh3D8Aw==
X-Received: by 2002:adf:fb09:: with SMTP id c9mr2581883wrr.93.1628603276666;
 Tue, 10 Aug 2021 06:47:56 -0700 (PDT)
Received: from localhost.localdomain ([37.160.26.85])
 by smtp.gmail.com with ESMTPSA id o22sm2538478wmq.3.2021.08.10.06.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 06:47:56 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 15:47:53 +0200
Message-Id: <20210810134753.390054-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cups-filters: bump to version 1.28.9
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups-filters/cups-filters.hash | 2 +-
 package/cups-filters/cups-filters.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index 8c2526ae9d..3b65e702c5 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 cf90b96b5c7a906a05070e757ee5566d9680db98a279e60567ea5421c38f11de  cups-filters-1.28.4.tar.gz
+sha256 5bad0b931f8293082f8773b34d5c4fed66415d2bf268b0798889e5f593c0ba61  cups-filters-1.28.9.tar.gz
 sha256 38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index b6ab7f1cda..bc69b3832d 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.28.4
+CUPS_FILTERS_VERSION = 1.28.9
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
