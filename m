Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D75C83F17
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E76B4613EB;
	Thu, 10 Jul 2025 20:23:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgUUF7PpLleD; Thu, 10 Jul 2025 20:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07323613CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07323613CD;
	Thu, 10 Jul 2025 20:23:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E4D5114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 703CC4105F;
 Thu, 10 Jul 2025 20:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUxcsKelKueE; Thu, 10 Jul 2025 20:23:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A09D640EF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A09D640EF7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A09D640EF7
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:07 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-454aaade1fbso14559985e9.3
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178986; x=1752783786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cP9iw4SSUnvcFE3Fqd9K0aC6c/3WNNYWb0AS9ug7deo=;
 b=HhF1lZLKg4vefnJ92b64BcMSGhsO1MLAEhN6HxCairKIzNN3LFPP+Nak/6zuP4XzV5
 gG6SlITd6YLoFRlWES+sTMr9578fzLnzBksbAe/3fkwqUy3km2hmzqOWtUkTGetTDV9A
 0D4xrruqbCiBybAQck6kVlkV6YlPzrirSU1GP4er7MkTV1dcPRGsEm7jFzDB4KK5bTBO
 571LXp/JzBQGDPJzqMRjlsHv/z7gMBUfbPzEhgfEUWQC1Hor1UU+1dZEhyXg9Umhvwa8
 9XRCXOKnA/dBMQhPSMSOAO0zEZPuHrL8JQvWd04Rg3CusIgr01I02RgC8fzt1nAYwFaN
 HONQ==
X-Gm-Message-State: AOJu0YwV/lcWioWOb+VeTNd0CPtUxswJ7fxUxklILHaM9O7hKuSbCBaj
 QZSvzHRbYhRCwkO+wlObmoIGMJ6ZbCPteru5ZGsvYu1Rb4l5T7TIxyQFInq9BQ==
X-Gm-Gg: ASbGncufpGUbqUTu/bdhIwH1gZD5iFVa1isxVWud54d9TuQ+L6GnKreR55B3pd7NWd5
 UXGdFdrx2pWhdMW0KyFA1Wuwmf7HKj1PKTFr3AhiRJqBsth4RNiAuc7uCYMNxlGoL653pLOnVE5
 iYzynUbCygYgQbc22Q+FQC0Dbg0yqmZhFx88QIFbLnhhsJfOS2WtDbNfA7Pz0lAeSj8X56hU7tk
 gHecJdH5iX3JOeu+8/NKrHCpaGUOYyL4kLevINzIIsQGodSLHwFCIFjhisQooP5ZNI7xUVJ6iNE
 QYuPxtKfBD3s/8hMZVxQ43GBkq8IWtKN8aNC2hY4J5HznFUQFpspx5E0RMtDMo67o/Tzyk5E
X-Google-Smtp-Source: AGHT+IFBXuq50IkoJyLvdeVeiw1VcRVjmv5Zh9XjsvAhEeyKTuD7X0SvxgysxgH7qnlPZRzm5HImEQ==
X-Received: by 2002:a05:6000:4b19:b0:3a3:5ae4:6e81 with SMTP id
 ffacd0b85a97d-3b5f2dac5cdmr93288f8f.8.1752178985400; 
 Thu, 10 Jul 2025 13:23:05 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:05 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Jul 2025 22:22:51 +0200
Message-ID: <a5cf124d6b8c11dc6d1fbe16ede2cf57d209f9e2.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178986; x=1752783786; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cP9iw4SSUnvcFE3Fqd9K0aC6c/3WNNYWb0AS9ug7deo=;
 b=Gw8Hgn2ZZhpDJeUvsVBIcM3N5aG4WA4kc+VbyY70TwNNH0rsrJhB+L2X+ZTtcK9VPM
 OCNS4VBU3yqCMD4kF52wkiNU5M09CZjMCKqBNugWCPtaqTxTLNGv8WS1AE55jpKwIptO
 frhMUUYnGH5cEfMgwQeQlAc9B1kxNEOVs+IM1yKfkpv5Dw4trrepzRhkb5jIf9tYiGj4
 2sEbRS+bbjOSbv2TVsnjQ7k1rCq1eye8P7yep5FhLO8X0UPNb0xAkbenGgC58bJes7h3
 UpHeWazEJ5d7A3TAnil2FMkc0LkV+n5EAC2AdfrymlX6i7ZjTWYw8pz2pouZ0e3vgAhN
 V+Og==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gw8Hgn2Z
Subject: [Buildroot] [PATCH 09/17 v2] support/scripts: rename
 check-merged-usr.sh
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We're going to need it to check merged-bin, so the naming would be
misleading as it would no longer be just about merged-usr.

Also drop the extension, it's useless.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile                                              | 2 +-
 package/skeleton-custom/skeleton-custom.mk            | 2 +-
 support/scripts/{check-merged-usr.sh => check-merged} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename support/scripts/{check-merged-usr.sh => check-merged} (100%)

diff --git a/Makefile b/Makefile
index fd5fe575e7..56266a8feb 100644
--- a/Makefile
+++ b/Makefile
@@ -783,7 +783,7 @@ endif
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 	@$(call MESSAGE,"Sanity check in overlays $(call qstrip,$(BR2_ROOTFS_OVERLAY))")
-	support/scripts/check-merged-usr.sh \
+	support/scripts/check-merged \
 		--type overlay \
 		$(call qstrip,$(BR2_ROOTFS_OVERLAY))
 endif # merged /usr
diff --git a/package/skeleton-custom/skeleton-custom.mk b/package/skeleton-custom/skeleton-custom.mk
index c194108307..82e1506156 100644
--- a/package/skeleton-custom/skeleton-custom.mk
+++ b/package/skeleton-custom/skeleton-custom.mk
@@ -27,7 +27,7 @@ endif
 # counterparts are appropriately setup as symlinks ones to the others.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 define SKELETON_CUSTOM_NOT_MERGED_USR_DIRS
-	support/scripts/check-merged-usr.sh \
+	support/scripts/check-merged \
 		--type skeleton \
 		$(SKELETON_CUSTOM_PATH)
 endef
diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged
similarity index 100%
rename from support/scripts/check-merged-usr.sh
rename to support/scripts/check-merged
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
