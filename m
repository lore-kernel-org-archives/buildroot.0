Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A25BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 14:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A096F61405;
	Thu, 23 Jun 2022 14:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A096F61405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M3dxQBNThDxO; Thu, 23 Jun 2022 14:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF85D613F7;
	Thu, 23 Jun 2022 14:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF85D613F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37DE51BF405
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 14:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6C3D424D9
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 14:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C3D424D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tTJSzuDVy81 for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 14:00:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 841A6424D4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 841A6424D4
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 14:00:33 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6813E1C001C;
 Thu, 23 Jun 2022 14:00:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Jun 2022 16:00:26 +0200
Message-Id: <20220623140028.1315712-3-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623140028.1315712-1-kory.maincent@bootlin.com>
References: <20220623140028.1315712-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655992831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1PO8QI/MR/TN1pT0UkEYzQNTL/p2+P4ctzhjydRcnGw=;
 b=Q4+z5sqm59/x83JsTiPQUG9GBMys+gnf7Kq9L9EY2vKQJEdxDcQphZmYURxqatLymQkie3
 Fwmf/OTmdRGrRUFNNuy8SYO6ynu1et78tm9KsWEZ14SKtntc/DWgtwIKErjlZ2BW8MuQtV
 Vmp9JL6YxwMP4B9GE3bP5mCvCaram4Rxo3ozDvsC0VeNBR91nlX5SjNKoQmioCe/NTMdVh
 uGTPqUCZB+FjFLJTxVl6VU2AmgnVSzhKDlf4iG4gV4SqZB37pkUKZaPE5jQgWh91Zhly1I
 54jcXJG6ZyF8RbGxbBvc8QoT7PE36YxNkNW3ZctLsyj+dWJA3yKII76rxRCrLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q4+z5sqm
Subject: [Buildroot] [PATCH 3/4] boot/barebox: update condition for custom
 tarball management
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: kory.maincent@bootlin.com
Cc: Kory Maincent <kory.maincent@bootlin.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kory Maincent <kory.maincent@bootlin.com>

This patch updates the condition to handle custom tarballs as specified by
the configuration. This change is made to have cleaner condition and for
consistency.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 boot/barebox/barebox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 6506294d6d..da151d3c25 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -17,7 +17,7 @@ define inner-barebox-package
 
 $(1)_VERSION = $$(call qstrip,$$(BR2_TARGET_BAREBOX_VERSION))
 
-ifeq ($$($(1)_VERSION),custom)
+ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL),y)
 # Handle custom Barebox tarballs as specified by the configuration
 $(1)_TARBALL = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
 $(1)_SITE = $$(patsubst %/,%,$$(dir $$($(1)_TARBALL)))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
