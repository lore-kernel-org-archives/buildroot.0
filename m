Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FF4C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 08:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E88A181E1B;
	Sun,  3 Mar 2024 08:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68ybUpfdBPHE; Sun,  3 Mar 2024 08:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93AC683147
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93AC683147;
	Sun,  3 Mar 2024 08:40:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9FDFF1BF38B
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DE076064E
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 08:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9z-Lfa65wB6w for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 08:40:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B89C560631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B89C560631
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B89C560631
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 08:40:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8C2FD1BF209;
 Sun,  3 Mar 2024 08:40:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun,  3 Mar 2024 09:40:12 +0100
Message-ID: <20240303084014.156991-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
References: <20240303084014.156991-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709455222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6EcN1LfRuwfJ5TeZCBQhKyMG/9dylds2uscz9bjb3ls=;
 b=F2EV3hJAElWTV1ryERsaOgx7yivy0pw79GXbBzl1cxZxmOEwgjClYVl+6ifFJ0Ik81Rfez
 PMaslzZBS6JU3o4mm8in5Tjia2NGgD6//kjnzgaEy6CcHCKP97Z/UEQoCokLKjf2Ei/RdQ
 bRVyE4OA897PbXHbIJaJAdxDP0Y42pMQeW1Mdt6XWW2glkyAvu/ICTgixAW7+3Lf0nlRS5
 bC+jMSyXqryvTOZ5JAA0lw2WUF4bDGPVWvFOY9X0gbhLHJaoJWvSXB5NXhCNhTRKhX989X
 k7F7mfWyVtfAAZ3k4mi8zu3CWM6koI/86uXWHqBpoCWtTSvRgmWupblxD2Y7Zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=F2EV3hJA
Subject: [Buildroot] [PATCH next 4/4] package/binutils: drop
 BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils 2.39 is gone, we can drop
BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME, which was only used for
binutils 2.39. This was a blind option, so Config.in.legacy handling
is not needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/Config.in.host | 3 ---
 package/binutils/binutils.mk    | 8 +-------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 85ec9b1d11..b67e9343dd 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -5,9 +5,6 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 	default y
 	depends on !BR2_microblaze
 
-config BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
-	bool
-
 choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_41_X if !BR2_arc
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 5209da0252..d98dd7b830 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -105,19 +105,13 @@ endif
 # our TARGET_CONFIGURE_ARGS are taken into consideration for those
 BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
 
-ifeq ($(BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME),)
-define BINUTILS_INSTALL_STAGING_LIBSFRAME
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(STAGING_DIR) install
-endef
-endif
-
 # We just want libbfd, libiberty and libopcodes,
 # not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
-	$(BINUTILS_INSTALL_STAGING_LIBSFRAME)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(STAGING_DIR) install
 endef
 
 # If we don't want full binutils on target
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
