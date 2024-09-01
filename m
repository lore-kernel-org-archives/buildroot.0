Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81FBCA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 06:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EBC88137A;
	Sun,  1 Sep 2024 06:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulOq9xyGH7a5; Sun,  1 Sep 2024 06:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37EF6819B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37EF6819B4;
	Sun,  1 Sep 2024 06:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB20A1BF5A9
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 06:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A813240169
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 06:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oL3eU1SAJ-ri for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 06:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33E4740117
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E4740117
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33E4740117
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 06:36:40 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a86a37208b2so361250566b.0
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 23:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725172598; x=1725777398;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bQX4WQZ6ZoKSvZIa2YYRQZFyyerWqxovZ05eWvbOmnA=;
 b=L1T/t6Zpd70SbK2t2sZJ6rJ6Zlahz/J7GTtVHVM9vaI7CXrY4w+svIPXLAAByBbJzV
 dPXvNUI+L46Q6WQkyKJPGGtIAP3CGMYOi7EbSLXxGw/KnD5UOk2xoyq+QSKfUlAL9R4Q
 //9+ERAxNjTsqorWJwMc9529KWZXp5Ud0xWWqwJFw6xu6CS+yEisvL0Sppbl0sTsNc9X
 3V0zaxOqoCXBxtP63UG//iuNSiU2efMJlglwN5lNvzErRvZn1+4waxkAL/q3SL35EWkL
 Et7lMuLy5hz7ES8UQ//5Z7GD5e0McRoLZ9Se9EFMOfPtCSqq2aqrQ9DES96eUmkjLz6r
 /yFg==
X-Gm-Message-State: AOJu0YzPhr2rPqz5Qe4moTDzv/i3Wtl3xbHyXBJ+95C9+KeGPDLaMQnE
 of2MaZEcwSF+TMKIuWndQBAV1cku5w+goj1af2NdgyYE7wJVxYZNjp6v1Yc6w8TQBXZh4nhtvFX
 BYzE=
X-Google-Smtp-Source: AGHT+IGkG0dqyOqShifUeGFszJ4/Gu0mg4P0avuAwcDF4I7P3yrIgu4RiGTvcFJb5Y7AVCeKFXbV2w==
X-Received: by 2002:a17:907:3208:b0:a87:31c:c6c4 with SMTP id
 a640c23a62f3a-a897f83623fmr828541566b.24.1725172597735; 
 Sat, 31 Aug 2024 23:36:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-52-249.retail.telecomitalia.it. [82.48.52.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f055sm401702466b.67.2024.08.31.23.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Aug 2024 23:36:37 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  1 Sep 2024 08:36:33 +0200
Message-ID: <20240901063634.3504315-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725172598; x=1725777398;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bQX4WQZ6ZoKSvZIa2YYRQZFyyerWqxovZ05eWvbOmnA=;
 b=dZUHAUDOuU9u9pxzQDYVRSPLLCniO5etFPHyjA8caGmACFdnpRbhOs2YOVvKgvtF9Q
 Fufg19Lh7om7LKQPg931ipJxJpHKUUF5ZZO5NrTJ6UhfjVixeJgqLzoS2y7ipN5cC9B8
 a8Qxa77RYPtQY8in43YCEAaIxxKxuSa2rENfc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=dZUHAUDO
Subject: [Buildroot] [PATCH v3 1/2] package/babeld: update URL site
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported in [1], version 1.9.2 has been moved to another archive, and
it is recommended to use https://github.com/jech/babeld as the official
repository.

It was also necessary to change the sha of the downloaded tar.gz.

Fixes:
- http://autobuild.buildroot.org/results/2447060c86acf1bd8d6ee0bcf8f9b6adcdfc50c9

[1] https://alioth-lists.debian.net/pipermail/babel-users/2024-August/004187.html
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v2 -> v3:
  - Fix the way the github macro is called.

Changes v1 -> v2:
  - Don't bump to 1.10.0 but update the URL site.

 package/babeld/babeld.hash | 2 +-
 package/babeld/babeld.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 2e0513efa010..e725b1fe310c 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  154f00e0a8bf35d6ea9028886c3dc5c3c342dd1a367df55ef29a547b75867f07  babeld-1.9.2.tar.gz
+sha256  c8c8c3698afb00caa5a5c9bbbb0a22b56d79ad3f9775382915ba979ac88c4e8f  babeld-1.9.2.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index 785fa2bce9f1..3f9a944ed063 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BABELD_VERSION = 1.9.2
-BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
+BABELD_SITE = $(call github,jech,babeld,babeld-$(BABELD_VERSION))
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
