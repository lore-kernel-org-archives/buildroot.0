Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B87E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 686B580C38;
	Sun, 29 Dec 2024 14:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfzBKRbTOAUZ; Sun, 29 Dec 2024 14:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B61CA80F92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B61CA80F92;
	Sun, 29 Dec 2024 14:56:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F74BE0B
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A0C180C46
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lMYR7lgEB722 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:55:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB44380C45
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB44380C45
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB44380C45
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:55:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E81F8E0005;
 Sun, 29 Dec 2024 14:55:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 15:55:32 +0100
Message-ID: <20241229145542.742168-10-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
References: <20241229145542.742168-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735484150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mhDMxE/jtVQnhgk7Ilv/ARBeh6uHFyFaIYQosFH6lk=;
 b=HzEPIPIq+6OreIro7DOPG1MWmk7S4aGuWipXvSoU/HzgCCrz8as5UEuCjQqupi7MaMu83g
 /Yrrp1vFNkgAu5HejLg2RhM/xuMU2SYsOklH2XwGUWDe/XoW5HS3BYwGG3CTsMhVA8bqwQ
 fQPcGrVsDqHnAvXB8TB94lsYEIulcozhXPy8eyzAG1Kr3eAhBz9TLQ0bp3QtEN6B+h2Q+B
 EIFLUFydFKyvJOw6b7amMebvAvtk2v6PxK3NKem8vQ41rAqb2zPRTqX7rY1TgwsBQzFFy2
 oBvEHkW9+dX+0ChGNUxZRw3EPg3efme3X4TocdP9wldWE/W33NlVHwkOpLFW1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HzEPIPIq
Subject: [Buildroot] [PATCH 09/12] package/tekui: drop directfb support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove the DirectFB package, let's drop DirectFB
support in tekui.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tekui/tekui.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/tekui/tekui.mk b/package/tekui/tekui.mk
index 3cb7ff51e5..2ec8a58487 100644
--- a/package/tekui/tekui.mk
+++ b/package/tekui/tekui.mk
@@ -42,13 +42,6 @@ TEKUI_MAKE_OPTS += \
 	X11_DEFS="-D_XOPEN_SOURCE -DENABLE_XFT -DENABLE_XVID -I$(STAGING_DIR)/usr/include/freetype2 -I$(STAGING_DIR)/usr/include/fontconfig" \
 	DISPLAY_DRIVER=x11
 else
-ifeq ($(BR2_PACKAGE_DIRECTFB),y)
-TEKUI_DEPENDENCIES += directfb
-TEKUI_MAKE_OPTS += \
-	DIRECTFB_LIBS="-lfreetype -ldirectfb -lpthread" \
-	DIRECTFB_DEFS="-D_REENTRANT -I$(STAGING_DIR)/usr/include/directfb -I$(STAGING_DIR)/usr/include/freetype2" \
-	DISPLAY_DRIVER=directfb
-else
 TEKUI_MAKE_OPTS += \
 	FREETYPE_LIBS=-lfreetype \
 	FREETYPE_DEFS="-I$(STAGING_DIR)/usr/include/freetype2" \
@@ -56,7 +49,6 @@ TEKUI_MAKE_OPTS += \
 	RAWFB_SUB_DEFS="-DDEF_FONTDIR=\\\"$(TEKUI_FONTDIR)\\\"" \
 	DISPLAY_DRIVER=rawfb
 endif
-endif
 
 define TEKUI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TEKUI_MAKE) $(TEKUI_MAKE_OPTS) PREFIX="/usr" -C $(@D) all
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
