Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DBFC87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 18:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD02C40A4F;
	Sun,  3 Aug 2025 18:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Pgxfr75VJUf; Sun,  3 Aug 2025 18:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5D3C40961
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D3C40961;
	Sun,  3 Aug 2025 18:01:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A935118
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 18:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE2BF408CA
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 18:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id invYs9LYn748 for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 18:01:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 064B240B06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 064B240B06
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 064B240B06
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 18:01:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-458bdde7dedso7953335e9.0
 for <buildroot@buildroot.org>; Sun, 03 Aug 2025 11:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754244062; x=1754848862;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ecE4aG+Gl3K5CfhxCp12I0u454yL39eGJ2Ak6JK9/6Q=;
 b=XbRqiFSH4YR7TiAK7Bboo3q1Iob7h0UsR4IR/yexQUNDpiCw4igOP9RFKFrdg1Qtq6
 +PvptExRbLseanQ4OXY7alWpeXTvHgOWRCSRNb6uzBzWhoa++4stM25PilbwrEG+cNK4
 fgMiAyHCQRrNwhkD5LWJccOLpXrgUoNDYzQiZ/QuMKobhAbyCI1RpxrJK2c8Vw9TTqzc
 4NBef1oEJ44XYmQGa8t+JjpklkzFwh7vspMTOta4pUn9T8StKa19/AaODE1z6AOIX25p
 5S+oj+xxYhqGRPDRVJYd+xX0LchERxBgE2HnEu4zgjvTfrXkbGjUElpL8J+u8P4v3BTf
 lx/w==
X-Gm-Message-State: AOJu0YzLG/VqmISVnvLHFvJ2ZxrW3AlZkvYLs7KEhPZ4ScBYoYL1uRnb
 qrJc8QaAohrOGj/mNXg9C8NJenBqx7eFVr6XTGJO5yoxsSxy+CHK/NZUWeweag==
X-Gm-Gg: ASbGnct6TlBh5oebWNyj1g4Gh5N8JD/vq/VUIstV/bAYssVh2NarXQ2ke6nQM3ZgQBJ
 n9s1gt/lErvvkwTJMgj8exNLTRK6SpVCR8677NU8UgJjObS0ndfh9N96qtlZpOEQoDjCAd1CAmf
 NoFC10gREyH2CIGXEU+0Q6vlVM6Oi1YTthChD2LR65IRBLInNKouDkxTuDjf66OXj2eUfWUPIbw
 QZ6XNhxRZPpuFlK+78rUA6iq7TbgV1VUKo5oOcT9vcvbxNmvBy8Lgfy+GYD9PT8xiRbgsK9TaPO
 LsUnsQut/4SWDeU8LcmBuq21G3Pln2Fg6DVvASaWP1uh4VL4T88NsE45cDLLgks0VEVwZ8/j5de
 w9zjUGR3Ztlt8FOpYjhJA2ft4nqt7Oln8oerk4dJ7Q1CdZ6g=
X-Google-Smtp-Source: AGHT+IE3LvPepAHuy8I2eLXugnGfZ9XY/ymbxAb8jg5DHBCKer7/VefCeoWHzvxX42YFJnikztouLQ==
X-Received: by 2002:a05:6000:2f85:b0:3b7:9c28:f856 with SMTP id
 ffacd0b85a97d-3b8d94c3f4bmr4466209f8f.48.1754244062062; 
 Sun, 03 Aug 2025 11:01:02 -0700 (PDT)
Received: from localhost.localdomain ([91.243.185.204])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abec8sm13351445f8f.8.2025.08.03.11.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 11:01:01 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun,  3 Aug 2025 20:00:58 +0200
Message-Id: <20250803180058.338677-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754244062; x=1754848862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ecE4aG+Gl3K5CfhxCp12I0u454yL39eGJ2Ak6JK9/6Q=;
 b=VPvmVkGpvq4252armuedmMQt0LUtHY+7LgnMc2RPbTxl2rczVmYVAvYKU2YtOw5ez3
 K6k1lJlw9VldN0rW3Fup4rj1bGuw1HBEowgTN3pfYHcD65uYfwJlf2LyBO9TyQ+S1TCf
 nxk7YOfXcrHRVku7HAKi8D8IS0yP7wCECUIdlm4Wjmt/yx2zvqElpWLm0D0gu4p7Gwha
 fPSACaqrGGWv47D/BDbvHQ4VHrse4+ykDLqeyySmEwR3NeuOVhclmIneiiiyWO9XJ3z0
 DU3Bbf6BruILQyGixjW4KafTHYck/7+zKd3xIAt04iPXp2zF7+7mjFRSNV+HEGFHI91I
 amXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VPvmVkGp
Subject: [Buildroot] [PATCH] package/htpdate: bump to version 2.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Changelog:
https://github.com/twekkel/htpdate/releases/tag/v2.0.0

LICENSE file hash changed because of the copyright year update.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/htpdate/htpdate.hash | 4 ++--
 package/htpdate/htpdate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index b711773af5..efccaf0097 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  88c52fe475308ee95f560fd7cf68c75bc6e9a6abf56be7fed203a7f762fe7ab2  htpdate-1.3.7.tar.gz
-sha256  7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
+sha256  52f25811f00dfe714e0bcf122358ee0ad74e25db3ad230d5a4196e7a62633f27  htpdate-2.0.0.tar.gz
+sha256  74096c67e102bb6545b84487b5e7f18edd038fd5fc0199c8a0b25efb3c522f06  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 20be904d3d..7040500a3c 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.3.7
+HTPDATE_VERSION = 2.0.0
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
