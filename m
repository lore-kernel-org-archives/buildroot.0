Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613A7CCA47C
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 14:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C76E5424E5;
	Thu, 23 Jun 2022 14:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C76E5424E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epI8dtQUxqGo; Thu, 23 Jun 2022 14:00:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B87D424D9;
	Thu, 23 Jun 2022 14:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B87D424D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B64D1BF405
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 14:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 441E4424D9
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 14:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 441E4424D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpGjpbROWezV for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 14:00:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4553E424D4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4553E424D4
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 14:00:36 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F1DB1C000A;
 Thu, 23 Jun 2022 14:00:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Jun 2022 16:00:27 +0200
Message-Id: <20220623140028.1315712-4-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623140028.1315712-1-kory.maincent@bootlin.com>
References: <20220623140028.1315712-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655992832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mpTw8QsTqNiYZj4Aoq9Zwq9XJRBkfZRUu4jCd6lK+PA=;
 b=VfbqB/NYZHibsroDfZAZCUGSduZagv79eQ9GtOOf55u0mLHZpBLf8Zr5ziDfK8woGh3C0Y
 I7qjC8CJEaNnHpFm4MbnAu0sGvXnPBWzANd8QNPo2f9Iek7/9lEmPj3jcvpzGxbGfFJAaU
 YT519ZUEWFbNxyr/5G8uAJguFrN3K6G0Kpsgq0KafOLQDUdj8CghVRVlSjmeSkTY0vR6WW
 Bo8fjMIK7VLe/MJ7acG0eZlTfhtnF4URVC+zRXcXYymY8VVXjHSMFx6QAmK4oWXtAEVhRk
 Wvp4/w3zLunQuQOpGE248daDP8rt9ERipYlz9NI3fdI1YWc0ebDLnkH1aPy10A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VfbqB/NY
Subject: [Buildroot] [PATCH 4/4] boot/opensbi: update condition for custom
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Alistair Francis <alistair@alistair23.me>, thomas.petazzoni@bootlin.com
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
 boot/opensbi/opensbi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 8e055633a8..01f0c3ad40 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -6,7 +6,7 @@
 
 OPENSBI_VERSION = $(call qstrip,$(BR2_TARGET_OPENSBI_VERSION))
 
-ifeq ($(OPENSBI_VERSION),custom)
+ifeq ($(BR2_TARGET_OPENSBI_CUSTOM_TARBALL),y)
 # Handle custom OpenSBI tarballs as specified by the configuration
 OPENSBI_TARBALL = $(call qstrip,$(BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION))
 OPENSBI_SITE = $(patsubst %/,%,$(dir $(OPENSBI_TARBALL)))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
