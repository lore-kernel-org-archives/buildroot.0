Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB42C4167D
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 10:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFE744F59A;
	Mon, 30 Oct 2023 10:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFE744F59A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bz_EzotyUrzc; Mon, 30 Oct 2023 10:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 362E24F595;
	Mon, 30 Oct 2023 10:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 362E24F595
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C52DB1BF313
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E89885520
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 10:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E89885520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZuSOpUew7yW for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 10:11:23 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88F1185545
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 10:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88F1185545
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxPEs-00ErHG-Ay; Mon, 30 Oct 2023 11:11:18 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 3508670d;
 Mon, 30 Oct 2023 10:11:15 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 12:11:07 +0200
Message-ID: <20231030101115.2214402-4-aperez@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030101115.2214402-1-aperez@igalia.com>
References: <20231030101115.2214402-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6LtwWq266xbtiBT0+J9oyjBs3CSile7p2a12cHaAG+E=; b=HZo0nuD2GkhUuAVTovR7mKSE12
 cwHqonpP56gG7AGSPeGLo0zIUHLwjB/6Brkm0B8RzdpTvZnML4kSw7lmy7qRujcAXzU/c2DSVUJ2+
 WmyexwRx1kzqI5VaOXChuasbLy4JM4hLdXIa6PA84j+hvcTRok+pISADiD4nuEAPNjLvm770E4Tnu
 oHOMZWdQ6ps+0uQUQEUTUqWrfIe9kMv5jbi307si72ZR5ZIF2wZgppIOFPVyZ9QLv3Lgvg0yxljl1
 jgkuUbHdgXs0n1Wu02xNxUolwBARY0gSZYWQOHeVrRSQw2fbGNMlr217bJGqAFaOwRlEVyo0RyPpW
 Ikjjc4KQ==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=HZo0nuD2
Subject: [Buildroot] [PATCH 3/3] package/sway: bump to version 1.8.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update Sway to version 1.8.1, which brings a new release series to
Buildroot and can be built with wlroots 0.16.x

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/sway/sway.hash | 2 +-
 package/sway/sway.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sway/sway.hash b/package/sway/sway.hash
index 6dfa71730f..86b6581f1c 100644
--- a/package/sway/sway.hash
+++ b/package/sway/sway.hash
@@ -1,3 +1,3 @@
 # Locally computed, tarball verified with GPG signature
-sha256  0c64536fb2883ec518e75cfb119f9300115fb49b084e3fde62b794fe2c6c8d84  sway-1.7.tar.gz
+sha256  73f08fd2cf7948e8af900709efe44eae412ae11c5773960e25c9aa09f73bad41  sway-1.8.1.tar.gz
 sha256  bd35722bff46327f5eded1d211207277bbe043d2a22048b282c42ef801593b8b  LICENSE
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 802371c827..19f90b8b00 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SWAY_VERSION = 1.7
-SWAY_SITE = $(call github,swaywm,sway,v$(SWAY_VERSION))
+SWAY_VERSION = 1.8.1
+SWAY_SITE = https://github.com/swaywm/sway/releases/download/$(SWAY_VERSION)
 SWAY_LICENSE = MIT
 SWAY_LICENSE_FILES = LICENSE
 SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
