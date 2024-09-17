Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8779FCAC595
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53D1D610C5;
	Tue, 17 Sep 2024 18:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YGK65bvodpD3; Tue, 17 Sep 2024 18:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7541761130
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7541761130;
	Tue, 17 Sep 2024 18:23:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B21FC1BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FF2B412C4
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHlf2SEOhsPJ for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:23:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 758DF412B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 758DF412B4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 758DF412B4
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:23:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0e02.dip0.t-ipconnect.de [91.58.14.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7B385A4C1FCF
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:22:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39060)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sqcqm-000000000wy-2ucu
 for buildroot@buildroot.org; Tue, 17 Sep 2024 18:22:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 20:22:56 +0200
Message-Id: <20240917182256.3009821-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240917182256.3009821-1-bernd@kuhls.net>
References: <20240917182256.3009821-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726597376;
 bh=5qWsP6xALlZvBcZUCKbCu7dTNl9/3rD6DO/vbRWZmJI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IJu75WvYZf5U/OGQUhQYXqi7oTFtYIfpzfNdWn56YRsLCfiFW3ezhexN8Oi/5mp0U
 LlA9b9JUJ3ZK7lEYMFAb4Uv+FZOrQRfEcfeZNmosp2r/5P4pPwKb27Z+GRKGS1jHF6
 4eCVk3pN9H/i5/faKdMZ0gQdzd65PTtglqwHxZPNB7D6/08e9MXhHJ1E+7IpIrdCar
 3uhBF3Be04fuMKbcBoBE0faFZK2ruveutumCj5bmQdExO6dhqUhive3uTTvjXJkFip
 W2J8Scd4Mr/cKCwwEBCcG+/HfeDMDjznOunN6TEGuLdDt1Vr+2oINk+VkoNqdzsaSt
 ykomecpnyDhig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=IJu75WvY
Subject: [Buildroot] [PATCH 2/2] package/kodi-skin-confluence: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-skin-confluence/kodi-skin-confluence.hash | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
index 487aa7e5f1..560b38ea2c 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.hash
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  816010973378faf7ad45e8b7fb97e190500fd5f8a6adaaea032f8c877424113c  kodi-skin-confluence-ae94e6e92c1c67861701e6e8a70f9ccc4dca9f13.tar.gz
+sha256  0f1459727e50bbcefae7330de21a29debb4fde1da83f5a0f28d68ccf3d14a94e  kodi-skin-confluence-1128703261f3fae5f26b0ea5e052897e3d7a663b.tar.gz
 sha256  89931c1fb1f3716694175763cf3221cfcd63d6935031cf6b4512d17ffe5d9860  LICENSE.txt
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 59e5f10875..1344c8156d 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_SKIN_CONFLUENCE_VERSION = ae94e6e92c1c67861701e6e8a70f9ccc4dca9f13
+KODI_SKIN_CONFLUENCE_VERSION = 1128703261f3fae5f26b0ea5e052897e3d7a663b
 KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
 KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
