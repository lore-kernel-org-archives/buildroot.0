Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D249DC677F1
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 09:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AA6D40138;
	Wed, 22 Feb 2023 09:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AA6D40138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id busqdfdUQMjW; Wed, 22 Feb 2023 09:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A98F540B55;
	Wed, 22 Feb 2023 09:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A98F540B55
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 437961BF3F9
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 09:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ED6B40B55
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 09:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ED6B40B55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31UB_A1V2-Pd for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 09:49:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A10D940138
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A10D940138
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 09:49:20 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 k14-20020a05600c1c8e00b003e22107b7ccso875532wms.0
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 01:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MDNHLXzu325qj2JE0wyhuvMbaDu/ANOqm+ZAEFQC0TY=;
 b=7vWH2FWcbL8sF9DNyvRJ70TFxidWzjX3DWJ6RrE8MtzlU1W1IksKVi339LOq9//3qR
 iXTvBXVp45IE5FqX54qaZkayy2Dwog1s+Ukvrw7vowdCggwTgAcMdAM5S2HR+XYX718p
 GerK47UQY3tZzetSNIHsTw7Vz/9zHg+SiAE88vF6WWgahDOGfmpD8TUGtfzdrapVnuo3
 qnLiYvDj1+Z2AGI87XhtoKuP+WLkSLyTGlTs3V4esA8b3MTzCGaMiUmOnRhnNAHz089j
 lb1S4KG3lcJdL2Gsrd+8n8ntix+L+iJOCgr9XBmpjVXGStCTZqXtlgW/th48085W4PzQ
 B1mw==
X-Gm-Message-State: AO0yUKX0x/vPIYjwOsacaxMfWSI7JssuNVEj5Ho0Lf1gWrZ5CR6xXqnt
 sTJL97AQKu2kHDqxIDSW+Vyd+rYDElmQAw==
X-Google-Smtp-Source: AK7set9Yq8/gW2ImZ23RwVpdAiD2G1/cul16UxXa1Z0iDlYl2Td/c+TV89mHAzUhT/R1gdBBgNQgHQ==
X-Received: by 2002:a05:600c:4d94:b0:3e2:115f:4052 with SMTP id
 v20-20020a05600c4d9400b003e2115f4052mr5521595wmp.17.1677059358534; 
 Wed, 22 Feb 2023 01:49:18 -0800 (PST)
Received: from nostromo.bear-herring.ts.net
 ([2a0c:5a80:1c05:e900:6e29:8cf8:ef30:45e5])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c42c700b003db012d49b7sm1870702wme.2.2023.02.22.01.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 01:49:18 -0800 (PST)
From: Diego Hurtado de Mendoza <diego.hdmp@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 10:49:16 +0100
Message-Id: <20230222094916.1853413-1-diego.hdmp@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MDNHLXzu325qj2JE0wyhuvMbaDu/ANOqm+ZAEFQC0TY=;
 b=YXLTVl1hTcaiaSuI9H0icKaMctin9aVmyhJ+ikQ7EjoFyRlo1GnAvInlZ3W9I+kRBo
 8Wn/47jyherm/SByeJGQEMMJ2DB2rI1cEpeGLR5FiobWKmyMNeu7iKpsWaTwMbwBzssc
 Ja0cDfxdMFg9rokvwiRy4VbghHRXOI3tvBsK7QYZj609QJvC0MmXBlv0pQ/S9TcNtX0g
 4D0gVq1QBT1g8JMm/b7Jqk+XrR35rJxrkKuwatPVvJz5TQB/F47x4BtqyS3ml5n0/aYQ
 IvHPFw5a+R1DbmzI3VhGKMLj4vSNuSSjjbmKC4HOksUEMXckSeicX3h+mrkDyGT+8q2R
 EEVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YXLTVl1h
Subject: [Buildroot] [PATCH 1/1] package/hackrf: bump to version 2023.01.1
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
Cc: Diego Hurtado de Mendoza <diego.hdmp@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/greatscottgadgets/hackrf/releases/tag/v2023.01.1

Signed-off-by: Diego Hurtado de Mendoza <diego.hdmp@gmail.com>
---
 package/hackrf/hackrf.hash | 2 +-
 package/hackrf/hackrf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hackrf/hackrf.hash b/package/hackrf/hackrf.hash
index 16ccb9dcfb..0426009dd3 100644
--- a/package/hackrf/hackrf.hash
+++ b/package/hackrf/hackrf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bacd4e7937467ffa14654624444c8b5c716ab470d8c1ee8d220d2094ae2adb3e  hackrf-2022.09.1.tar.xz
+sha256  32a03f943a30be4ba478e94bf69f14a5b7d55be6761007f4a4f5453418206a11  hackrf-2023.01.1.tar.xz
 sha256  49b60a6288f90f49074228cc1fae0fb16871ba36b756013abdf7c2fc92f01fad  COPYING
diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index 4317da60bc..0d7533815d 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HACKRF_VERSION = 2022.09.1
+HACKRF_VERSION = 2023.01.1
 HACKRF_SITE = https://github.com/greatscottgadgets/hackrf/releases/download/v$(HACKRF_VERSION)
 HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
 HACKRF_LICENSE = GPL-2.0+, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
