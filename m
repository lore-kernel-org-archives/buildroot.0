Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A477C25B06
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 20:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA28461191;
	Thu,  4 Aug 2022 20:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA28461191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JSwXyPBTA1_q; Thu,  4 Aug 2022 20:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC74D60E90;
	Thu,  4 Aug 2022 20:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC74D60E90
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC4081BF402
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A53AB41D02
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 20:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A53AB41D02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqNJtQECaBNz for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 20:36:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0747C41CCD
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0747C41CCD
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 20:36:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 35D2D240003;
 Thu,  4 Aug 2022 20:36:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu,  4 Aug 2022 22:35:53 +0200
Message-Id: <20220804203555.29029-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659645360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=o1PFleHbALKfsZgU3cX1U0rHETIMX3tWXrzwksrtZWY=;
 b=aztgqWRDuSiUh9fcj7ibti7EDELmXKkDlujdH+2guJtcNtaz2Kjru1Wbz8Wr2IvlaKUxVN
 +raXhulKTiopY3j1A1vhIC71TZvD6/RhFpmmVngtWOYr+c9K3LnZRGXq3LHlw9iebsJNOL
 w7i3MmdLN0yqAH7UUPGg6WvxDnqvqd46f0w4NxojdGthCzBexW0hMvQ9xFxKeHZce6fcAo
 rpzpytDPhaPENQ48qWz2RZR9i5VVen1dTtVd/DKtt3kf/ggjIjK9NEHfVucwoyTm/JTXyZ
 755iyUAsd0vC2fNFxjijEzVoKrLecn21O/SyiTl64ohW2ziGHm1F4XcwGFn21w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aztgqWRD
Subject: [Buildroot] [PATCH 1/2] package/pistache: fix dependency on
 rapidjson
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Ruschival <thomas@ruschival.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

rapidjson has been added as a dependency of pistache as part of commit
2f3218567953185008ec862f814bebecb9d6ed82 ("package/pistache: bump
version & switch to meson build"), using a "depends on". However, as
it is a library dependency, a "select" is normally used in Buildroot.

rapidjson's only dependency is on C++ support, which is already a
dependency of pistache.

In addition, use = instead of += for the rapidjson dependency in the
.mk file, as it's an unconditional dependency.

Cc: Thomas Ruschival <thomas@ruschival.de>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pistache/Config.in   | 2 +-
 package/pistache/pistache.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 806c27077a..53a4b73a58 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -4,9 +4,9 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_RAPIDJSON
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+	select BR2_PACKAGE_RAPIDJSON
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
 	  for C++. It is entirely written in pure C++17 and provides
diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
index 65d9b2412c..f4de5e3b2a 100644
--- a/package/pistache/pistache.mk
+++ b/package/pistache/pistache.mk
@@ -10,7 +10,7 @@ PISTACHE_LICENSE = Apache-2.0
 PISTACHE_LICENSE_FILES = LICENSE
 
 PISTACHE_INSTALL_STAGING = YES
-PISTACHE_DEPENDENCIES += rapidjson
+PISTACHE_DEPENDENCIES = rapidjson
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PISTACHE_DEPENDENCIES += openssl
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
