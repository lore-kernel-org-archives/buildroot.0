Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEDEC87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 18:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0541B8234D;
	Mon,  4 Aug 2025 18:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jm7FrZjRT10V; Mon,  4 Aug 2025 18:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2896982346
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2896982346;
	Mon,  4 Aug 2025 18:53:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C71D118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4221360AD4
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:53:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TTpblnT9dze for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 18:53:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6237460745
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6237460745
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6237460745
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 18:53:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf8c.dip0.t-ipconnect.de [84.161.191.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8CF01A4C2EF8
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 20:53:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37334)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uj0J3-000000001DK-3OBz
 for buildroot@buildroot.org; Mon, 04 Aug 2025 18:53:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Aug 2025 20:53:09 +0200
Message-Id: <20250804185310.3345166-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754333590;
 bh=Gr8wznZ7JgDUz2J9PiNAExQWYfe1HCH2dLCOvBAu24E=;
 h=From:To:Subject:Date:From;
 b=IcgOadrVZVUpct0bdIJFY7rwj80i9RCKwW32H9Rkh3BwP4Wuql5q9BmucwaxzhHsy
 W8c4pccuvtStN2zIKf8uofktmxO3/CYFg5GE/yK/nLIcMHocRfcyEJCDAnSLMtMMFX
 SnTgkDJ6QwE3+7JjInaJLykHk6FNC6akiUxW/6e86MzXqLgZysY2dt3PtAmyMOLzVT
 DaQkFtg8mgSv3ZH0OwEriq6htfC8QIyJk/W1dFqBCVboRoKdZHaX46z9+TtJIqVUBH
 FkkOuZ5kkgSiil1Dc3ASgx1K7Ee5nsLoeZf78Yq0m2s93VXFAyrkGEjZNv9VUJI9d2
 qQEYb3xmnOYzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=IcgOadrV
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 25.3.1
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
index 325b608f0e..9e6b14fb0f 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  be269f4c4edfbb5291b97073966e6b51291a9cbc8be710231586f8845851a06a  intel-media-25.3.0.tar.gz
+sha256  ea515121a4c758373aa4641cafef91ebd5efa947cfb7a284544263ab7e90d6df  intel-media-25.3.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 1759c681db..73f804c94c 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.3.0
+INTEL_MEDIADRIVER_VERSION = 25.3.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
