Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCAAC0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 17:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEAC460BC7;
	Thu, 27 Jul 2023 17:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEAC460BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqBtPWrresfF; Thu, 27 Jul 2023 17:20:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240A360BA0;
	Thu, 27 Jul 2023 17:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240A360BA0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 372551BF41C
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 17:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DDEF40385
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 17:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DDEF40385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RQF8xnQYDoIl for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 17:20:51 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 322EB40297
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 17:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 322EB40297
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7869bcee569so46024539f.0
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690478450; x=1691083250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rFR7ceST5XaxWb/bQ3YbMHJPMRci6S08/Tw3hDBluJA=;
 b=iQuixBUJbJXZvyU+NWyViL81beZgX4mpW/lfVUW1NNAmIqptn0NSR2v6yiHoxXGxb7
 VILP9Qg/aLcrv1pOPTI2PcUM0RDuQM4HyqWE0cmLBXWBswkwaOypsXqpuTPaE2RXZ8Jj
 9xIai4OkaK7mOeC7IbZDBZJyf3XpIFkO4N7JZL/R5HHhbj9aRu+rh9X1u6B5iVc4kEjp
 Dy/P8q470DGZ49cqkPbCn4qOPhnqqJ/HNcPkjzRwk08ogsaDU1DQo6cIjHxn6KUeOj8d
 CjigjkAxhm+2z6a7xseC8Fdwf+Fxo40gNOB7Rd8Cy4hzxfWO4LlX/IvEgSL8S9yUDpIj
 nXSw==
X-Gm-Message-State: ABy/qLZBBW9iPNgq5rlK/HOz8N0d2IwAHMEsWlj5qUOXyNxf8twKLvrJ
 fS6tHG4Y85r/kXj3MpGk9vRIx7Fw2rQ=
X-Google-Smtp-Source: APBJJlGN35lYldPjOWlZGhvCPITm57OVDZT8lyQv0A95y+VwAg05qJDMcz91qCuLLvarxA+2gBourQ==
X-Received: by 2002:a05:6602:3b87:b0:783:72b9:ed67 with SMTP id
 dm7-20020a0566023b8700b0078372b9ed67mr180770iob.10.1690478449746; 
 Thu, 27 Jul 2023 10:20:49 -0700 (PDT)
Received: from james-x399.localdomain (71-218-110-92.hlrn.qwest.net.
 [71.218.110.92]) by smtp.gmail.com with ESMTPSA id
 el3-20020a0566384d8300b0040908cbbc5asm557956jab.68.2023.07.27.10.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 10:20:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 11:20:45 -0600
Message-Id: <20230727172045.1990932-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690478450; x=1691083250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rFR7ceST5XaxWb/bQ3YbMHJPMRci6S08/Tw3hDBluJA=;
 b=SbMP1UwqZA37QWrYZA/BR+Z12jGDQ+v8noyDss2fajPgxGlEEGHJL94td+YtQ2IVb/
 HeDpqtvhGIEcKx3hK4v856TmyW2x0vzCCgqecv7PmV8pnaoDOM81lHIcPjVXYrILnaEz
 5lIQQKHO1oKESifbMmAwV6P+8enWnDJkGqxER9KxuNimYFML8p4SO5v4KayyzaJaz/X8
 CeF+Q6Rni1X5dNJ7jjlp7wK8x0XEQXZRM0C/qcP2scch7Z1Jr5gUDQDu9MceSM1wN876
 sM9C4DFJwnvbEdJlX1+Ih/qDMNnb10R8AE35prbo9zOT22OD9tj1Ss8/xTRuQRaDOBFI
 1zmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=SbMP1Uwq
Subject: [Buildroot] [PATCH 1/1] package/seatd: bump to version 0.8.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/seatd/seatd.hash | 2 +-
 package/seatd/seatd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
index 7500036e5b..e1db897d44 100644
--- a/package/seatd/seatd.hash
+++ b/package/seatd/seatd.hash
@@ -1,5 +1,5 @@
 # Calculated locally
-sha256  210ddf8efa1149cde4dd35908bef8e9e63c2edaa0cdb5435f2e6db277fafff3c  0.7.0.tar.gz
+sha256  a562a44ee33ccb20954a1c1ec9a90ecb2db7a07ad6b18d0ac904328efbcf65a0  0.8.0.tar.gz
 
 # License files
 sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 96caf63b30..141a456116 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEATD_VERSION = 0.7.0
+SEATD_VERSION = 0.8.0
 SEATD_SOURCE = $(SEATD_VERSION).tar.gz
 SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
