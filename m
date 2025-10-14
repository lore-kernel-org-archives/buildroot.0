Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A56CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 19:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D72B413C8;
	Tue, 14 Oct 2025 19:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isMbWqMjBEug; Tue, 14 Oct 2025 19:18:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1A7A413CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1A7A413CB;
	Tue, 14 Oct 2025 19:18:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D10B44C4
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C375941341
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_MNtjvF00tM for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 19:18:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E277841360
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E277841360
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E277841360
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 19:18:39 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso119665f8f.1
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 12:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760469518; x=1761074318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KrBKyK+FD2Ayt5N/hXgKT+cXjHD3gxMT/jAvuqC3Ecs=;
 b=eKgvfWnuC8JMLaNjrBILEp89FtZOPb2XfSLZrpNDVweJJ9UL9mv11KGStw1TpP+UN/
 s1ByC5nNzrOgGDwlkqy52uBo3NblImFAySXhFwv3z7ETz7UHTvYuGl2rGYS0gShe/8/x
 ZOKyoEotcuIXgCdHVGsbDVw7HLo5HUeiE9UAF+X7ZJwXu1qO56LRxN90WmrZyPxxesZU
 dJNbMxRi8pn43xsuzJVc9iJ8nsbkYG4SwL96uB1zM8AB688A1LBmPK8HhIETQtVCsD74
 hjxXTZcfZIfnuK8pEvW0TE7oCeg1aeYzo9EWRpPbsvcg5l9p2Od8poTULxv3Ilygnskh
 rM2A==
X-Gm-Message-State: AOJu0YxOWEln/OtJMm9OFKEXIJDJEkGXd+xvCkIw8Md0Xtaj31TQdCco
 tfixOUD1166c89guRVgaMqNMUIwZj1Np4PGWQp5BGQrs9N4ZfzXfxMNFtJ7zcQ==
X-Gm-Gg: ASbGncvNNWvqSllT/WjaqhcOXmttldyJaUcZQNr8IasZ3J5t2zIdkbfOZ/A0asPvZzq
 AFaQl2wnkXLBs+Q7V2whOy9vUSZl6/XPYKzf0Txi7PnyZeeaGpzSOsrGmdskEQQjXXqL8H80r2a
 vBUxpbhCcB777tpkJqMd2uy39jKvYJ71v8n/1Ry4wcQgJK+qvuMc7Lpol0GjgeNaOHOuLA0utmY
 DD2ee5YSucdBMLyM0tLqNXAvdbEIan6LcIdKZqB1D0XL+k8YnMajmUmKAPMAvZapjznngwyrXIF
 FyQKU7K5pNvkPPIIdZV/Mn9PglC3NDH7EYhr/IUmEBPQFx4OhbcVKv6ZdF/LKK/HJXu3FUp1Nva
 Dr3tmhacTVFffrF6LKfvBMQ7eWKD3r66Y8RJYAoOuhjEu
X-Google-Smtp-Source: AGHT+IGZtdjfkpb8h4wepk4sEuVrDaDKZ1uG0HNPnfEgCqw7ufRFhe46ZpGYgjAkEr3ipePKQjsPBQ==
X-Received: by 2002:a05:6000:2483:b0:425:70cb:9ba8 with SMTP id
 ffacd0b85a97d-42666a9f3aemr16808057f8f.1.1760469517787; 
 Tue, 14 Oct 2025 12:18:37 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:5505:2845:5a50:c0c0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426d0d9050bsm23343262f8f.13.2025.10.14.12.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 12:18:37 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Maxime Leroy <maxime@leroys.fr>
Date: Tue, 14 Oct 2025 21:18:28 +0200
Message-ID: <20251014191828.442802-3-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014191828.442802-1-maxime@leroys.fr>
References: <20251014191828.442802-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760469518; x=1761074318; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KrBKyK+FD2Ayt5N/hXgKT+cXjHD3gxMT/jAvuqC3Ecs=;
 b=kFKDK6X/3yWZzlJsyB15180Mja3DxKrGHXh0KItlm98Iy17NmQHZoHo3ufLw+Q9ghc
 sb66/WHJvqBHhjln183YJNvhIZK42rF6QIvt02GURrZUI0jXkq1Xh866gOLLXXBzpK7w
 NPQDCDOUZNUisWYOGmKSr36aMujuqZwBKa3MoKS4nsFnHYiDymkZkXy52LcNzFJMChaL
 V/UWqYx0ur7PYbqx7d0PCCsPq17vH8e+oiwTfpdieEHTyy07E9pykG84lTcFLsDosEQK
 piDanNFzE6dP3L4jDKU3ITz8Su0M0vJF3lGidtYn5KxonBa25ikKLxHPtdEHE9zF7Sqx
 0YgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kFKDK6X/
Subject: [Buildroot] [PATCH 2/2] package/grout: bump to 0.13.0 version
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

See the release note of the new versions:
https://github.com/DPDK/grout/releases/tag/v0.13.0
https://github.com/DPDK/grout/releases/tag/v0.12.0

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 0c036b05f6..248c375710 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7bd7caecc3451aea3462a86c31d2ee953a9b7789975b5522dd5f09204558f99d  grout-0.11.0.tar.gz
+sha256  6d1ba4fda3fec6cbc5d4f4d48fe2435fabd36b27540a439a01a44361f6998971  grout-0.13.0.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 5abf265f19..07ea585a01 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.11.0
+GROUT_VERSION = 0.13.0
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
