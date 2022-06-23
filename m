Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2608BC43334
	for <buildroot@archiver.kernel.org>; Thu, 23 Jun 2022 14:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 600C3424E5;
	Thu, 23 Jun 2022 14:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 600C3424E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfDYxFd_MsIp; Thu, 23 Jun 2022 14:05:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B0AC424D9;
	Thu, 23 Jun 2022 14:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B0AC424D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5E1B1BF339
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 14:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF747613F9
 for <buildroot@lists.busybox.net>; Thu, 23 Jun 2022 14:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF747613F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HMIbIjtUSAtZ for <buildroot@lists.busybox.net>;
 Thu, 23 Jun 2022 14:05:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC8A7613F7
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC8A7613F7
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 14:05:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 7CB5CD5AB4
 for <buildroot@buildroot.org>; Thu, 23 Jun 2022 14:00:35 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0A0051C0014;
 Thu, 23 Jun 2022 14:00:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Jun 2022 16:00:25 +0200
Message-Id: <20220623140028.1315712-2-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623140028.1315712-1-kory.maincent@bootlin.com>
References: <20220623140028.1315712-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1655992830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BmdEMAbjtZLVBhOdH6lpGDK6VZ2yAwwNOJrEKVKSRDQ=;
 b=Epq6CyFTyJjJEQ/EA8IL9rm5fHSuxSivgNjd7tNNFvNi22pgci718rZT5+GGCpA1ZXQvWE
 /FLbnDX8cFntAjbgjopYljYtiay8egCJV266TUUZyQ3OfrJPjWckKAG54vNYNYFgj/RfhH
 3XCO7V2pmr1OsrIzDH4AyEQ+nadXFhde/jwa7CUrGUrFB/NT0hgQ25oE0KQX4xjiFhhW6x
 VjsYMAFgUwIK8wXm6uJ72+FIl7aslqOSZ4J+VslTlcnbAt+skDj6qN+cASsX4J/gM47i4d
 /3anSaWvk0fLuopdQBGNDDuq8G0fUv045jmGugOJtjUKFBT/ZcDrOX7NdlFyJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Epq6CyFT
Subject: [Buildroot] [PATCH 2/4] boot/u-boot: update condition for custom
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
 boot/uboot/uboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5808e30818..ebc8384d1d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -20,7 +20,7 @@ UBOOT_INSTALL_IMAGES = YES
 UBOOT_DEPENDENCIES = host-pkgconf $(BR2_MAKE_HOST_DEPENDENCY)
 UBOOT_MAKE = $(BR2_MAKE)
 
-ifeq ($(UBOOT_VERSION),custom)
+ifeq ($(BR2_TARGET_UBOOT_CUSTOM_TARBALL),y)
 # Handle custom U-Boot tarballs as specified by the configuration
 UBOOT_TARBALL = $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION))
 UBOOT_SITE = $(patsubst %/,%,$(dir $(UBOOT_TARBALL)))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
