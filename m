Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2675CCDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 21:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1A0461427;
	Tue, 17 Oct 2023 21:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1A0461427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeZRndrrDWZK; Tue, 17 Oct 2023 21:01:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAB0F612D8;
	Tue, 17 Oct 2023 21:01:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB0F612D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B637B1BF397
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 21:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C15661415
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 21:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C15661415
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KccMp71Ge-1l for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 21:01:23 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A69A610C7
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 21:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A69A610C7
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-32da4ffd7e5so2177962f8f.0
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 14:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697576481; x=1698181281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZS54NqKHQ2DSBi2C9CaYeS0CDhzp8N0xZXmqFlM3kNA=;
 b=QIrymX/GA+4ENM8VZv2dZUhjLemG5s+UA1utJQo3de7xNkiSrxiqhYPWpBfG2HcITc
 jyLbcWAHU3d9IZeWqePvwJlbzebyN2BH5yCAzcl39d5NOdZO99KWXn65ZouKdOxf3a/X
 Phd/wjIj2FXuZj0pB2CSNXeF1sVGX9LlJM/hE7vYI+QWnXzO5eTZnCMteqvaNUkMkPpf
 OG0QTYkxfw2ogNgQ9s6m5h2O7fP38FKBuRfjyi7zkJ6E4IP5uiKRGHHwH8YoaIyFMfJb
 x/i0OgIX6KyrI5CS4L+5ldRupEUbCzcfSkVEk37jEAxBcqucayUoefgCQgao2x4B7kOl
 NPEw==
X-Gm-Message-State: AOJu0Yzgf+EDVEVMtdiRJiySsVmbUxu+GZF2pJul+4ynFbxGhUf0zJzs
 sOR204Mgs0rwTg9U1KGRAZoJ1jFdmW8=
X-Google-Smtp-Source: AGHT+IGjhsmPpjRZ176DbxvagxLaPKxY/u/EjKxX7AL1XkgFBiOupBuN7Dqa27NJsOEymBAkFzrO5w==
X-Received: by 2002:adf:a383:0:b0:32d:84a5:bf5f with SMTP id
 l3-20020adfa383000000b0032d84a5bf5fmr2581000wrb.28.1697576480928; 
 Tue, 17 Oct 2023 14:01:20 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8290:3800:fb7f:2f7a:afad:92ed])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4712000000b0031984b370f2sm565486wrq.47.2023.10.17.14.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 14:01:20 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 23:01:19 +0200
Message-Id: <2b6e31b7385a7d104f7318010bdcdfbc1a2fbf25.1697576472.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1697576472.git.yann.morin.1998@free.fr>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697576481; x=1698181281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZS54NqKHQ2DSBi2C9CaYeS0CDhzp8N0xZXmqFlM3kNA=;
 b=hsld/tno19vXaQ7OqeQgqf9wJiJ2QIdNoc0FMoR1HVEIh2IkOVVFSAJagyqBlGY5UE
 zvNyE88QzA9GEgJc6EJ7PrgjBCD55cDKX7TDVtKI2mLxzDNu9bFZ5zBIzIpviiPwzbh6
 QU1KDTTzDbmqr7do3RaEtIagaQILtA+DX4EteXOdmo4c708nZZMxR8+Qk2JugK9gZU7y
 mC/LFNresBroq2gh4oPeBnpwPaoPH0XHNJffLpPlNsgluh7KPsntzfZ0zVzt9FLB0UbP
 f9DUwec/cIsn5M7H2G/Ogw6N51dMq3dm6Nx/Fl+dXjllGcZ2GCo8qrBtEKR5F2VfM3vi
 uu/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hsld/tno
Subject: [Buildroot] [PATCH 1/2] Revert "package/pkg-utils.mk: break
 hardlinks in global {TARGET, HOST}_DIR on per-package build"
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 21d52e52d8de (package/pkg-utils.mk: break hardlinks in global
{TARGET, HOST}_DIR on per-package build) stopped hardlink the source and
destination when rsyncing per-package directory, on the rationale that
modifying files in-place after the rsync would also modify the original
file, and that break foo-rebuild and can cause issues with post-build
scripts.

However, what 21d52e52d8de did not envision, is that copying instead of
hard-linking has two nasty side effects:

  - the size increase for the build directory increase with the number
    of packages and with the depth of th dependency chains for those
    packages: a (relatively small) build that was previously totalling
    ~13GiB in output/, now totals north of 122GiB, an almost 10-time
    increase;

  - the build time increases, as it takes mopre time to read+write files
    than it takes to create a new link to a file; the same build saw a
    increase of build time from 5min 10s to 7min 30s, a 45% increase.

These regressions are both serious, so revert the change; we'll come up
with a stopgap measure in follow-up commits.

This reverts commit 21d52e52d8dee0940d28b3a38551eb183be37813.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ba3da68a7b..5d5980b098 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -217,7 +217,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define per-package-rsync
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
-		rsync -a \
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 			$(3)$(sep))
 endef
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
