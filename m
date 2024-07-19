Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44187C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 21:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0486283F52;
	Fri, 19 Jul 2024 21:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oIjQpYvLW16z; Fri, 19 Jul 2024 21:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0641383F57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0641383F57;
	Fri, 19 Jul 2024 21:28:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A81B1BF4E7
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77BED402A8
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 21:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifzH91ytOc5E for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 21:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2C56540175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C56540175
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C56540175
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 21:27:56 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-427db004e36so1393135e9.3
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 14:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721424475; x=1722029275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iwd6c/HhwvaUPRDC5bCQXoPwSuGxVvTUhd/UVSV5Jhk=;
 b=WTVea9LsWwrA+oBWBSa4TdWjODXAXwN6Qnp144hT8XKDGkvxO5g014Cpu6KcjqSSwz
 rwoF5YP5n4pmEeB7FxglTVuSyTSyLJ0e+MZwZ5hkjoyaES0s27T8hKnDBHuXTYNJBLrd
 HGMv0ChJE4BrKjDyB6g4pzoRDQ7VqqAgxn4r4BSMJDZ+xkkZy64UqC3JwLD3tniyLRsu
 0mSVkzkyz89U5b5QXPa3aT5hG2fS8eDMRuVCxhCgtKR4SIf3R4YvWotK1AbrkRmqzDoy
 r05Vh4/yyiLPZgQMNCt8ZqqSgInRiE25LtUYjkJI4TFTdmTlk7EeULPm7w1/M69qEz0/
 Pabw==
X-Gm-Message-State: AOJu0Yx2PdK3zzGinYE5zmrgoY8pJ3WP8xqDwLaRGevuLuL47FxA5S3z
 eE+IUgLLK4aKRfG3t8oU4P85CJUO12vLtgKHM68ZiFhwJofHJ1yU2a9lKQ==
X-Google-Smtp-Source: AGHT+IFv4WyA82otfYLqxfzgOXQ3HpcWlpzOSWlHSEXrVUY6VECyo2l8Po5Udyk4kVctmNjMmdnHnw==
X-Received: by 2002:a05:6000:1fa3:b0:368:6337:4226 with SMTP id
 ffacd0b85a97d-368633748admr5791886f8f.12.1721424474456; 
 Fri, 19 Jul 2024 14:27:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a95099sm62833015e9.48.2024.07.19.14.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 14:27:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 23:27:51 +0200
Message-ID: <20240719212751.47959-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721424475; x=1722029275; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iwd6c/HhwvaUPRDC5bCQXoPwSuGxVvTUhd/UVSV5Jhk=;
 b=OoTo1UUlsjciMh4Hp5OyGHH2ZG/Gr5fzWe97iGx969y8ppD0Ssxzy1/FnvLikfN7K9
 CZ/WEyDlsmOZKJ7D7rhZ2UTl1zMU273UXWOmy6uTUdouVt0YgZUzlRVz5bgYH/kRn1at
 whprWBdjoEgEa/UTKfJNRQPJWxgKDm+eBgb77Qn0NmUfdWxyqtS55bQDwF+l/DSjkb1v
 d8mpOQfKbIItax19n3k4SotBKivjCYXYdmZpcgfydbf8cyLLic308XPSuVtSpP/aqZYA
 /uUhr+2Jig/7XQgAEOzebqA0fqRQtiSohgPyo46/66As6zvzUGqXRoywRHgYtepzpWt3
 Oovg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OoTo1UUl
Subject: [Buildroot] [PATCH 1/1] package/libupnp: bump to version 1.4.19
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

https://github.com/pupnp/pupnp/blob/release-1.14.19/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index 6fd4678c0d..86437a7339 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  16a7cee93ce2868ae63ab1a8164dc7de43577c59983b9f61293a310d6888dceb  libupnp-1.14.18.tar.bz2
+sha256  b6423c573b758d09539f5e6c4712c1a9fd35dccf835f81d99473d50a50ad49b0  libupnp-1.14.19.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 61e52c095a..cd148d14d0 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.18
+LIBUPNP_VERSION = 1.14.19
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
 	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
