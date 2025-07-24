Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3192DC87FC5
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 19:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECCC541AB2;
	Thu, 24 Jul 2025 19:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRtIFVQQCZF7; Thu, 24 Jul 2025 19:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EC1141A8C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC1141A8C;
	Thu, 24 Jul 2025 19:27:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 584A1115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EABF613C0
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhqxEoqvEVwc for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 19:27:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D67F60896
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D67F60896
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D67F60896
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:27:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F129EA4C10C2
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 21:27:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58438)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uf1bP-000000000S5-1zwV
 for buildroot@buildroot.org; Thu, 24 Jul 2025 19:27:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 21:27:38 +0200
Message-Id: <20250724192739.1193136-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250724192739.1193136-1-bernd@kuhls.net>
References: <20250724192739.1193136-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1753385259;
 bh=1te7fS2BYY4QlW2fau+9fWr51u8N2dnbDkmLv5YX+G4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=LBTs+enVSQVyzl9dYt7FOzYq+OHSViGdNgo1Qb8LZ00iiRV9dGq0e1AcBKQUqAuYU
 +SGya2LXAV0eUtiVG7nrBMKyfr18XXKX5QbQtmKUprJbjtjPYrQHe5NFSUoXq2io3j
 Nwm7uOWP6nSXMmKIG1kO6zUuJ/GqlCh1U+HOyCaZ5xASQiBzYlVYRX6+zO0yHdl+t3
 GSDoqKJxAFcfBbE5mMbrgSBac3vlWErmTedGt0QWwWGU8Q9zooeMvZzGLsailaj39+
 rmpDkcMv/WaCsapQTBBlLeoJEXQ6fFQYGMyoNSjrXM8c39SVNrW9QAlCgkSYbs7epl
 +tI6vqJ8wsNSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=LBTs+enV
Subject: [Buildroot] [PATCH 2/3] package/intel-mediadriver: bump version to
 25.3.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 17563caff3..325b608f0e 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ba0f124c8e08e0675725f9631b7b1b1c371944b31b7a58a62d2c99338e7ce230  intel-media-25.2.6.tar.gz
+sha256  be269f4c4edfbb5291b97073966e6b51291a9cbc8be710231586f8845851a06a  intel-media-25.3.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 468f8ba483..1759c681db 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.2.6
+INTEL_MEDIADRIVER_VERSION = 25.3.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
