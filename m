Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7D5C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 13:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56254811AC;
	Mon, 15 Jul 2024 13:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0qOZP60bCIs; Mon, 15 Jul 2024 13:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6978481232
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6978481232;
	Mon, 15 Jul 2024 13:41:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46E461BF3BE
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34A3681236
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 13:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id erkzr1B9IIBZ for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 13:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1937981232
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1937981232
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1937981232
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 13:41:18 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-367ab50a07aso2705988f8f.0
 for <buildroot@busybox.net>; Mon, 15 Jul 2024 06:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721050876; x=1721655676;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xbZg8XokNLQa6fUEZBJimo9gErZnRJNWx0W/Vt392ZI=;
 b=oxKR8sjSOjKUgIvTlDCnsZH8XJisaACLCLeGDp7PjFS8qa5/chmwjLJXJWJ4sLsQ7u
 yCHTNtnYQK3jzwi9VYKyQtC4P26N1Modn4ueVZopf8GKw5wgVXd3kmAyZN0CoEIOJiHP
 CC/b7C+evXQiyBUb2Me3ehkaMOMKdSCwlek9Oz5vENeEwCYZyCeUPny50THJ7Bf+6euL
 sTuSyGrkWIAkyOaxPNhU/oEdgJYWVIk+CDs/rZlHiXqQQJVbXS5EOSGxrXAcCLBRYpyO
 OUVVnxe6vxYgF12i2iW+y1pl60SW3r5AQmOSBIZbLVSOw51kNypJTaRXEzMQ/3oNg7uo
 HRmQ==
X-Gm-Message-State: AOJu0YxF8HlAIjOUE0nuAFh553UUeWv+ZiLzvErTVzlq6IHbmf/0sJI/
 fAybuIZOjYe0FMgjFVPMFTyluwdFH8Fsv8EmZe0it54kDL9fND+rLGtlgUtLjs2hMNZjGCH0s+A
 =
X-Google-Smtp-Source: AGHT+IGmNsIJfxDLDMg0cd5yxXNQLDGNfy5I/wOiZx8VgNUZE+0GkKDcSVoIjmThaQtL6u84iJuUmQ==
X-Received: by 2002:a05:6000:1848:b0:34d:ae98:4e7 with SMTP id
 ffacd0b85a97d-367cea96786mr17303522f8f.41.1721050876445; 
 Mon, 15 Jul 2024 06:41:16 -0700 (PDT)
Received: from vm-2404.. (140.33.66.37.rev.sfr.net. [37.66.33.140])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3b2bsm6435598f8f.20.2024.07.15.06.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:41:16 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 15 Jul 2024 15:41:09 +0200
Message-ID: <20240715134109.508868-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1721050876; x=1721655676; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xbZg8XokNLQa6fUEZBJimo9gErZnRJNWx0W/Vt392ZI=;
 b=JNQUYAROFEU1IxxSDacBgOkH8XYdG4zguwx81OT7RQxUieUJXltEItmGr/MUs7FmVu
 qxUX8++OxjK/cktgIwfmyeG06JjsIGUXVjelzqbniwzgWvdli8nND2QR05XzyUoxWDzu
 56FbbjwR+ODxXEa8aANLs1O+s3cq/wCDeoHIcF1M3AUAuXoyPszpexJXw4lBYWXnpcgx
 nLJozF5UolGfuPjZDItDqZ0IRAK7MNG8ACbIz1BXdYpu3HSlUZZHapsHEvfMzgKlXi46
 0BU8/OC2WbPc4zZOfN/ywT0OvQWlkFJVshId0Rt4mub6A47ggH25kPmZkblSJ1nE++T/
 6Q3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=JNQUYARO
Subject: [Buildroot] [PATCH] package/gdbm: bump to version 1.24
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
 package/gdbm/gdbm.hash | 6 +++---
 package/gdbm/gdbm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index 7449d5dc9..a9df48908 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,6 +1,6 @@
 # From https://www.gnu.org.ua/software/gdbm/download.html
-md5  8551961e36bf8c70b7500d255d3658ec  gdbm-1.23.tar.gz
-sha1  50ba1b1d45ce33fd44e4fdaaf3b55a9d8f3dc418  gdbm-1.23.tar.gz
+md5  c780815649e52317be48331c1773e987  gdbm-1.24.tar.gz
+sha1  7bd455f28c9e4afacc042e0c712aac1b2391fef2  gdbm-1.24.tar.gz
 # Locally computed
-sha256  74b1081d21fff13ae4bd7c16e5d6e504a4c26f7cde1dca0d963a484174bbcacd  gdbm-1.23.tar.gz
+sha256  695e9827fdf763513f133910bc7e6cfdb9187943a4fec943e57449723d2b8dbf  gdbm-1.24.tar.gz
 sha256  690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index e807a8e1e..1a2c352d7 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.23
+GDBM_VERSION = 1.24
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
