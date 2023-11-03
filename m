Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9353C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 21:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E8DE82206;
	Fri,  3 Nov 2023 21:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E8DE82206
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dt8omYlklBwz; Fri,  3 Nov 2023 21:41:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A717E82204;
	Fri,  3 Nov 2023 21:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A717E82204
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B90E81BF616
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 21:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9080040134
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 21:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9080040134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IUxFCyq_0oEc for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 21:41:01 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5BD8240015
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 21:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BD8240015
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32da4ffd7e5so1569614f8f.0
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 14:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699047658; x=1699652458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vykB2dPKN1/2mloeooJONef5QK1SOCVUU44Wqk7u1MQ=;
 b=QH35APG+QIvpWQJPvqb59pVqtujGqu8z0HThJKhTCJnVdp+g2UYuR7ZQ6OFqV2W24w
 g51LJ4gts+u8rG6FEq+XDEKinuC7wh02eyaU1WsXUVNS3FGF3KFGx7TTReJK3QnRXlPR
 Iy2Yc78Cvl1k58mytHCL2T0cmJFvnsbxkWXrREuL8S/DydrjNWkRB4mB/pIUfOiaTFPj
 KFk10CxpIqOkPIUnlVr0hyNt5eyM/aENIAvdpREo531Oq+b6+dZvnt5o5cOdKw80Eknp
 +wXEsGFTPlzDoKRaaGZxltORo8/+qFz4Std2jWPHiIi3AObDYVUqWhK2AU/xRt2mwrCG
 G2Dw==
X-Gm-Message-State: AOJu0YxQZP1fGEB2WvHvH6InJoxglODJQxbLmvkJZbsrg2WZ1tLO90lc
 JTwvQYT0Ms3/yK/m5pvQfO1TH560AVQ=
X-Google-Smtp-Source: AGHT+IHydL99JmgCMGU6M9lDayelHOFAhiCAD/Ad9txg9yBQrhTvEiusPwyPvJJNhYAfT1daKlttjA==
X-Received: by 2002:adf:d1e1:0:b0:32f:6d91:989f with SMTP id
 g1-20020adfd1e1000000b0032f6d91989fmr4678815wrd.15.1699047658428; 
 Fri, 03 Nov 2023 14:40:58 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v3-20020adff683000000b0032da35baf7bsm2737656wrp.113.2023.11.03.14.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 14:40:57 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 22:40:55 +0100
Message-ID: <20231103214055.17650-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699047658; x=1699652458; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vykB2dPKN1/2mloeooJONef5QK1SOCVUU44Wqk7u1MQ=;
 b=GZn4rSdV0bJlctFDHIC+NsFoXG101paThJd8l4OJlAyhKNwcapzMDW+uIfwrWskBMY
 R7bAZ5QkA+i5HfiSU7Elak/oByeDE7fjIasiZOWpsldvMQMOq265/QQF9yTbqnG4CdCl
 G5kucFWs/131EAyvFoR6lhJsfCSwJeqxUDG5YRrKCt9SVtKNPAQbWtR2Doy7UUKME73f
 D17JCl0WyXxpgn34AUHCEGq6A39GYktoyKLZ14ROqK7mmYHCglpM2EyV34EKZzUN7wbY
 fFiC9jlYDhleZGQWbq8nZumgaTE0sTACSoSRYaf1tjJoEItOIsYbl0FVc5N8qUMOR85x
 l6Mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GZn4rSdV
Subject: [Buildroot] [PATCH 1/1] package/valgrind: bump to version 3.22.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://valgrind.org/docs/manual/dist.news.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/valgrind/valgrind.hash | 4 ++--
 package/valgrind/valgrind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
index d406babe35..d236c7b4a0 100644
--- a/package/valgrind/valgrind.hash
+++ b/package/valgrind/valgrind.hash
@@ -1,7 +1,7 @@
 # From https://valgrind.org/downloads/current.html
-sha1  817d769743d278b5d07526e85115082054e9bf9c  valgrind-3.21.0.tar.bz2
+sha1  60894cbf59d480c1794674da24a8406518a8df59  valgrind-3.22.0.tar.bz2
 # locally computed
-sha256  10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971  valgrind-3.21.0.tar.bz2
+sha256  c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c  valgrind-3.22.0.tar.bz2
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index b168651319..40bc05d87d 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.21.0
+VALGRIND_VERSION = 3.22.0
 VALGRIND_SITE = https://sourceware.org/pub/valgrind
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
