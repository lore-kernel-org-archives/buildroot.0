Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB960C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 17:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 357B082275;
	Fri,  5 Jan 2024 17:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 357B082275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZEeUGd0CAxHb; Fri,  5 Jan 2024 17:53:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95777820A3;
	Fri,  5 Jan 2024 17:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95777820A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2961BF3CE
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 17:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 685338209C
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 17:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 685338209C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTBt9at-Vt3Q for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 17:53:41 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E19482089
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 17:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E19482089
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3374c693f92so1304083f8f.1
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 09:53:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704477218; x=1705082018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rcNjQ5LmyN+x9BbHmdoE5uKiLXz4ricQyVcC2k5d9Fw=;
 b=NyyNKifBNUWMdMazdI/NCsZkr+3o0OIG3YAQ/n7bYZjHhgoNjZ1v9VIeAv4yqtlw1J
 XF41NYOR6xd0RaqWmZ/w/grMQbZDtFR04JqS68e3OWIxI0wwP8q+3zTpURxCyGYsNlKA
 swlyvJkzkX9i+Bc6TA/G5aXKkDC8tjBXdRwUYujPEfiJIq7gYoeA6DiNCDYXhvWxQST+
 CsblgJ9CQ1Xq93Aavgf1nbMIMNCGlZRk+m0PnoKP/QGaHFs5H7atR6Ct7q+jEAPakieK
 6qecQG082WWIzOEatGEAY/D2FkQc2IrJWRUaYI/pXL2vFu5IvaAjrLfMs9h93mGWy02G
 w8Pg==
X-Gm-Message-State: AOJu0Yxj9cKuqVA1fBoIf8T0Y0mOIxj2ug0S5YYHVIGQ5/LrY792JP+Z
 7VGYr2iwqifcDPxKhOPt/MTu6onrd48=
X-Google-Smtp-Source: AGHT+IHmZaxInckrj8/mt45jhF9N7diorTrhYcXkfAO2zVN9ChP2wgDWyLENbzzTEOcBO0sfaFaM6w==
X-Received: by 2002:a5d:5005:0:b0:336:5f07:5968 with SMTP id
 e5-20020a5d5005000000b003365f075968mr1548941wrt.96.1704477218490; 
 Fri, 05 Jan 2024 09:53:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i1-20020adfefc1000000b00337464bf71bsm1810492wrp.39.2024.01.05.09.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 09:53:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 18:53:36 +0100
Message-ID: <20240105175336.737690-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704477218; x=1705082018; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rcNjQ5LmyN+x9BbHmdoE5uKiLXz4ricQyVcC2k5d9Fw=;
 b=IoDVj4QdN7KsypdQ5Hkex9Kn6j7yuVQ/73NjKAj1yeWuew0rvvlLtYGVeWuSPZ8nTo
 SFOi2/iJDEK9qBb0D84Nw93bcy/c3EtUlcHZIb+OKe1UTacfjn9rVOVA3d7rka7EjBTl
 FgAvYT/14JostWHJpLU8Yw5DU0euR/KNDavsnmAaTLG+g3WfY5jmKQwNsRkV5nGR4+ft
 MgEty7CGmdIEfVUi14dz5Xbx0E6odtYtVGR24TAwLy2kwZb4N+PSbaSqtdRAxMHtno/6
 2LYcSdizBouEN+9Ea7kjxdYoI66xGh6dx2woHnA1jFvVWGy9+3BRmMd5svRS6r299pCx
 k3Kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IoDVj4Qd
Subject: [Buildroot] [PATCH 1/1] package/tcping: bump to version 2.1.0
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

https://github.com/mkirchner/tcping/releases/tag/2.1.0
https://github.com/mkirchner/tcping/releases/tag/2.0.0

https://github.com/mkirchner/tcping/compare/1.3.6...2.1.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcping/tcping.hash | 2 +-
 package/tcping/tcping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcping/tcping.hash b/package/tcping/tcping.hash
index c97c0fa2a4..f706599c2d 100644
--- a/package/tcping/tcping.hash
+++ b/package/tcping/tcping.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a731f0e48ff931d7b2a0e896e4db40867043740fe901dd225780f2164fdbdcf3  tcping-1.3.6.tar.gz
+sha256  b8aa427420fe00173b5a2c0013d78e52b010350f5438bf5903c1942cba7c39c9  tcping-2.1.0.tar.gz
 sha256  4a35620e27ddb8de27898e4206c8f93633d877c1e128e98e95a035f760d94428  LICENSE
diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
index 5eaf702ef0..9a068f5668 100644
--- a/package/tcping/tcping.mk
+++ b/package/tcping/tcping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPING_VERSION = 1.3.6
+TCPING_VERSION = 2.1.0
 TCPING_SITE = $(call github,mkirchner,tcping,$(TCPING_VERSION))
 TCPING_LICENSE = MIT
 TCPING_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
