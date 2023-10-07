Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A83E95A62
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 19:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CDF183C0B;
	Sat,  7 Oct 2023 19:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CDF183C0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hY7CYWKQiv2I; Sat,  7 Oct 2023 19:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9777983BE1;
	Sat,  7 Oct 2023 19:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9777983BE1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD391BF25B
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 19:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5612783BE1
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 19:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5612783BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VMiLmgR8p4c4 for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 19:22:24 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E94A783BD9
 for <buildroot@busybox.net>; Sat,  7 Oct 2023 19:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94A783BD9
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3226b8de467so3073801f8f.3
 for <buildroot@busybox.net>; Sat, 07 Oct 2023 12:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696706542; x=1697311342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QFFKPh7kVcf1EnFgF2oi4BrCT5wFKb/NNQcCKwCgM7I=;
 b=cYEQK9NsjWDZkMP3o7fE0SX04w0h2mX15wSmIsZqCVBgWf/NNG05RDM2YH9cyknkXs
 NYeRmeZtwldUQ+5k/ybABJw2HG2N2ylbqqLM8TRW5UnZrJrh3Q8AyjlHIcFA4Pf6IUYf
 5VLaE/iQzaPP6m98+t/FLeissviDdI0OTsj472G10nMBI5SUoU7YFSSrCknRbG30IdUP
 7O/0QXHoXn82HPezNhyCJC+qALsNdplX/FDLOHmR1v5hrRgYm1S/Yg5dzM/ewVy6Aoel
 APfLLM219qWVPdxoFSLPapVPSllStmqAfUL5Nux2kjl3WfPZG9zUwdyCmioOppvtMWlI
 Xg/g==
X-Gm-Message-State: AOJu0Yyh73/CJ4ZcTN2j6Ykoq3JEcF1zqdiwMMykFtotOf+Tkx+7CvFU
 k+T/UsErb0bdmmLec5xiEzPo7d/gpnQ=
X-Google-Smtp-Source: AGHT+IF24ySW9YRHuo0Vr8FFwMYQDO7cJr579jv1V1tOcsED6yloDnqTzv7xgo4b5Z0PORWbkFJOJg==
X-Received: by 2002:a5d:4c8c:0:b0:328:2e73:5bc1 with SMTP id
 z12-20020a5d4c8c000000b003282e735bc1mr10103617wrs.9.1696706541548; 
 Sat, 07 Oct 2023 12:22:21 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 q15-20020a5d574f000000b00323384e04e8sm4931461wrw.111.2023.10.07.12.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 12:22:21 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  7 Oct 2023 21:22:14 +0200
Message-Id: <20231007192214.3670075-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696706542; x=1697311342; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QFFKPh7kVcf1EnFgF2oi4BrCT5wFKb/NNQcCKwCgM7I=;
 b=LBL44abgadjPLsyULYr1XoMocbRlKPf7UXur34a5xfYBa9fJBLBtThaKmBRryrJcGy
 r/sOsm2obXF9IkyMGMk93uUIqI8IJ2liJJltTLvzYPsGm8BsJthFfPEBxj8SQuZraTWS
 kt07s7CN1F0SIorbTRNKoEhC2CCTQyKnoxYKrCUbDsxnzSiAPrqQ1dOOHhCLhoQpGL/M
 j+PC25X2Gk3U666UK8LtkSuciBUXqgH7oBBrpciA+HIwh/KUT5lj7bvd59+IGhfDGAM/
 Vu+ps+2rJzQV7+6malbCkMxyuMKWe8iSj05djDgUsYs7X0c1Xw4FR8f0sAGhg7KS5mwX
 8m5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LBL44abg
Subject: [Buildroot] [PATCH] package/libsoup: bump to version 2.74.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libsoup/libsoup.hash | 4 ++--
 package/libsoup/libsoup.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 2f44e63d7..5f687068a 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,4 +1,4 @@
-# From https://download.gnome.org/sources/libsoup/2.74/libsoup-2.74.2.sha256sum
-sha256  f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159  libsoup-2.74.2.tar.xz
+# From https://download.gnome.org/sources/libsoup/2.74/libsoup-2.74.3.sha256sum
+sha256  e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13  libsoup-2.74.3.tar.xz
 # Locally calculated
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 026ea3a8b..81bf42cab 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP_VERSION_MAJOR = 2.74
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).2
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).3
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = https://download.gnome.org/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
