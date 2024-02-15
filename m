Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7ACC4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 514BA605D5;
	Thu, 15 Feb 2024 14:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDTW4y92bxYY; Thu, 15 Feb 2024 14:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 620E7605E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 620E7605E0;
	Thu, 15 Feb 2024 14:24:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8101BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45B1740197
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hora_KGFEBlZ for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:24:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 527F54007E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 527F54007E
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 527F54007E
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:24:32 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-607cb7c44a7so8095877b3.3
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 06:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708007070; x=1708611870;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=28Q0npMAnggUCQkEmSKsM/wX+m+8WUKcKai7UQ79sp4=;
 b=RtGEL1a222XypK9CvFbpADCCuznfztlP5ByI3QqfBlY0BYy224O1Nm/8hpusrp7yqg
 m1DpnN/KRrGvslGn05OiK4bBw4YxZldmalfMbv4UuAz+ewlE2V+kdkSrP9Av2tHRbTP0
 7oRhh8HnseXi08VEMsN+aJfwO07uta3XKW9+qXZuhdKxPCUWwPeCDoCyH+ZxDovREaq4
 vjukAYGgn17qC+gdHD8X0oucu1Nq9ZaXLMXWTk44iPa59iSccE7gL6aH6nfdntq50B5V
 CQ7z+Jbn/sLlODdYDIfLI+NURxvnJhZQIdBu8BcHrnn/EmwgwF3EO1BFxjHeSNPmvGbe
 HoHA==
X-Gm-Message-State: AOJu0Yz0hWfzF+k6zsSzeUInCRL/pGdxhAR/I5mda7NDiGNvFKAi+FA3
 mF7C88ih3DMETYIUKFem4lNX4c9tbSs48yiLvCHRBsfKvHFTUMucxQT9Y/bJ/8Q=
X-Google-Smtp-Source: AGHT+IGQ2VawYZU9NH8fWqLmFySBFJyxX+HbCyyf+EE9gEU6KoTOZaC4E3m0nT68xqpoojvRpFyYFQ==
X-Received: by 2002:a0d:e243:0:b0:607:8b5c:9b2d with SMTP id
 l64-20020a0de243000000b006078b5c9b2dmr1749567ywe.38.1708007070193; 
 Thu, 15 Feb 2024 06:24:30 -0800 (PST)
Received: from gilles-Precision-3571.lan
 ([2605:59c8:6662:b310:7f4:4b02:4a36:4d21])
 by smtp.gmail.com with ESMTPSA id
 i197-20020a0ddfce000000b0060437133f85sm260967ywe.7.2024.02.15.06.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 06:24:29 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 10:24:06 -0400
Message-Id: <20240215142413.451505-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708007070; x=1708611870; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=28Q0npMAnggUCQkEmSKsM/wX+m+8WUKcKai7UQ79sp4=;
 b=kbN2dSZ5uCcLqhlucmu7jRnX5EGFCgCV8TCF1kaFfuBKTmGnj+HOcjMfWDx7+C10yV
 OUxnRi5Vv1OWUFdZc3uIdYKXVnpkSS5sF3cAn7bjAa/nlhw4qDujBAreyFTXnIzpSY45
 uOA2ZNB7oVxyfLP08Kf6fV+1fGKp8buOOJ+yQ5B4tt9K4vWsRzEXfzIsbG42uOFS1p0E
 X8CIaYyPdXnwovvL+b/9dy/6KXiC74xF4DaJ8lMxiKU8VcSparV+KdNFiZuOskuZlO4f
 bqm3SZqDML5bnQZn45hFz0EP30uVzhkah4K66Cho1C36PghHLRR36RX1xecxYA5SjsoO
 IgRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kbN2dSZ5
Subject: [Buildroot] [PATCH] package/fdk-aac: bump to version 2.0.3
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log: https://github.com/mstorsjo/fdk-aac/blob/master/ChangeLog

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/fdk-aac/fdk-aac.hash | 5 +----
 package/fdk-aac/fdk-aac.mk   | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
index b10d5f92b1..07c5561712 100644
--- a/package/fdk-aac/fdk-aac.hash
+++ b/package/fdk-aac/fdk-aac.hash
@@ -1,6 +1,3 @@
-# From https://sourceforge.net/projects/opencore-amr/files/fdk-aac/
-sha1  579b34e8174b4feb21a9c598695f5ff4a7ceef8c  fdk-aac-2.0.2.tar.gz
-md5  b41222194b31f570b3132bd622a9aef6  fdk-aac-2.0.2.tar.gz
 # Locally computed:
-sha256  c9e8630cf9d433f3cead74906a1520d2223f89bcd3fa9254861017440b8eb22f  fdk-aac-2.0.2.tar.gz
+sha256  829b6b89eef382409cda6857fd82af84fabb63417b08ede9ea7a553f811cb79e  fdk-aac-2.0.3.tar.gz
 sha256  95ec80da40b4af12ad4c4f3158c9cfb80f2479f3246e4260cb600827cc8c7836  NOTICE
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index c66f6df797..01a100fa94 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FDK_AAC_VERSION = 2.0.2
+FDK_AAC_VERSION = 2.0.3
 FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 FDK_AAC_LICENSE = fdk-aac license
 FDK_AAC_LICENSE_FILES = NOTICE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
