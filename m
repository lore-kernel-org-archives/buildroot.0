Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA52CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 05:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1540982382;
	Tue, 12 Aug 2025 05:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEEKAG1XSkHM; Tue, 12 Aug 2025 05:59:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 120DC82384
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 120DC82384;
	Tue, 12 Aug 2025 05:59:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0705F183
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 05:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC192844E9
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 05:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bX-KYMjtIJd3 for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 05:59:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BE95844EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BE95844EB
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BE95844EB
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 05:59:18 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-b46f9bb92edso180126a12.1
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 22:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754978358; x=1755583158;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r7WH8L6rrn1Q5bxkC3+y881ZQC3TG4r4drLCHx2rjEc=;
 b=QYTIIe+OJ+4pjXA1f67HYVc/3fKp5JeZpiyGD8WY7gGvnl9FcQbIq1k4FzRs0x1yhT
 Rj8RribnUnKKosPu0zkh2pqMAfzIKh3j5cEFtH/hDFUvJWKAaiL2L58Q3SaACn/luzp9
 T1E//0g7VwJKwDVvNoWXZCvJcI0WkNOxwG7oQ2tTPe4LQasdhA17FfPZSUcuy4kUlUPQ
 7cjsGsIpdZEA+OFQ1SnDbkOqHEWIm0nCoz/+YMGvVCn4sz+srUOxv36F2toZFjc3NnlW
 98Glc7hZw69Kv0M2tZxgJ8/XcTbvKlZ/gGT+uS2c1O452C0DHOkMK24ZqbqF+hhdTxL0
 pb+A==
X-Gm-Message-State: AOJu0YzgxgYzRQ3poB2JouKr96UqY128fUQSPS3dtT8ChYXd51B1uSaW
 AYdl0ZC/FsCtodloHI6KN0ZnWg750XIYPilYO/wCcvbpFRtj4aVCHRADZSbOCFLJ
X-Gm-Gg: ASbGncs8jUYTpFRsk6VT0OJv1q1vstxr972saZ1LKSJzeSSZ8V2bKXuJaKc/4jU0KIh
 CD9o9bSBpbYc1Tdn6YmMcCkSM+opJFuYhiEmc/o8Ag2Nww6RYI9dnzHb8JPpJ5DbZ4rKOggu66o
 FXQDJ5XK6StPFKfzs6rfY1C+WoZXU+OLkUeOw/cmaLRLsG+O9B8cF6xJA8FtNsLNAsfGQWBYqkz
 +GBC8iDBlqnzxMDavy520UJO5BizGEzuE7YlCxSsShxe/gTTR9c1NTK+4ecK0hZAo3/Vkb4fMIy
 WzNwKRV7P77vGEQDdWz2wDQs1aqpQuWCQZauxaxwNrlLqKQKgUD0wnG6Pz7o9+dFQepXmsrtj7A
 BbPIeXl3yn4x3KN4qG3YqKE1pSFTu7LTc9UAZgB5l/8cAwoFHQfqSb+xLrbc42+vn2ykXlH4+1Y
 TBrg3wSw==
X-Google-Smtp-Source: AGHT+IE3+r0B5I6PXNIFJUFBZ4RTibE0p23Vqxrv464lCgtgHNuK4Gjofh9krqcFUf/XbFwdXys69w==
X-Received: by 2002:a17:902:f68d:b0:240:8262:1a46 with SMTP id
 d9443c01a7336-242fc24cb23mr25863095ad.25.1754978358064; 
 Mon, 11 Aug 2025 22:59:18 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f0f7ccsm288603915ad.57.2025.08.11.22.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 22:59:17 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Aug 2025 22:59:14 -0700
Message-Id: <20250812055914.1152386-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754978358; x=1755583158; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r7WH8L6rrn1Q5bxkC3+y881ZQC3TG4r4drLCHx2rjEc=;
 b=CTB4YoYCswgybOrCsIT6aLd03/eqyroStlimxdo1IsmDtyd2SkdQlUeOCLyFcn6NiT
 EHyhXQwF4kShIfgZ34hQpXWM6R2lbjcjkTzscGdsRfVBlcp//h6hrWUh/B2Jq155/3O0
 XAOES9sOfpxdXWtorE99+rnnQS+gpwi3/P4LzSLRAiuOTyaOMKi4PR9FeODU4UdVqFHy
 UDcwL7HpIH31t3NyqQIYjOGLW43MHl6NPbY9ZhM+ZqFF2cksxU2ZwaREWiI9KmyT+yq8
 0XYPvrWZPMWlw3OsJIkj21C/4vSnDJ76R9UHO0uM/5x/MAcSvhN6qOtmclPYBVYomZ/9
 OIBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CTB4YoYC
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: bump to version
 1.24.2
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/blob/mm-1-24/NEWS

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 28f395e1c8..103da30fb7 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 #Locally calculated
-sha256  50e166bb24acb00bcaed814483920dfbc5b26d5424faee974b54c702e425a7c7  ModemManager-1.24.0.tar.gz
+sha256  fbc75adcc0d7b0565f256e7ff4e8872b0a37c4413ff576665f7470932d9c1b68  ModemManager-1.24.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 899e3071a5..880ab6cdd0 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.24.0
+MODEM_MANAGER_VERSION = 1.24.2
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.gz
 MODEM_MANAGER_SITE = https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/archive/$(MODEM_MANAGER_VERSION)
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
