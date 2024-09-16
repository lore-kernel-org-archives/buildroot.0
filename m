Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93121C3ABCE
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 15:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C912E40BDD;
	Mon, 16 Sep 2024 15:12:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6nV4lx2-6uD; Mon, 16 Sep 2024 15:12:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C28140C21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C28140C21;
	Mon, 16 Sep 2024 15:12:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E558D1BF41D
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D04ED406EB
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 15:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGK_HViaLRN8 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 15:12:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9974A40315
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9974A40315
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9974A40315
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 15:12:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-374b3632ef0so334596f8f.2
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 08:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726499531; x=1727104331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6iSn2jwCoUgCYumfoPzFPOyyFBudK/wdjWNn32x+aIA=;
 b=Gdkhd9nkn3oqjdPq5DzsnOmSeWM2nP/wYyFdp9ojl4Oni10DK24IRpZQCDjmkW4RJ5
 rsE0Ocpy4tOUilInvAlK4PVPk98ZVSSECHvRMmZ+dERSks7sWkJvRt4YEY9PvNedExw8
 HGK82jggiEsXTEvZFVA0SR4fYpdxVkClpeSuGBKWpjbnuIDnJ8cL33ICZNIHH35YNCd/
 yELhNX71vHRiS2Xaca1k45KbK9MHHj1i+j/Nj0so/ERi7vYQmeWTqBR+ZvU9UUTFRmOs
 3RjGheZF5IsB3OCxuP6j3iYRX5jxhcrn4areYSfcC/T3Od9OATc5SKwfK13pL114N0Q+
 T5Bw==
X-Gm-Message-State: AOJu0YxFBDONC0ZvZIqSwJDj7djzhnBKqB4IMhA+P8TKJBydegkgpnOa
 OV3GsbJqpLQEhcaAf6UYZCn4gQadW/9eEuoNpd+GXpMrYINN0qzmh8FFqLf+2C8TQ+TB8ZReerb
 ZDNYrRtWX
X-Google-Smtp-Source: AGHT+IFPFYCJ6lNGiR7lksB6c36lHgUAjP7xqzw8pOemlMWkSmwcGheX+10Mt1LXzkJNChlKXGM19g==
X-Received: by 2002:a05:6000:184a:b0:374:c8d9:9094 with SMTP id
 ffacd0b85a97d-378c2cfee8bmr5477191f8f.5.1726499531255; 
 Mon, 16 Sep 2024 08:12:11 -0700 (PDT)
Received: from adam-laptop.ipgroup.local (212-57-59-66.xdsl.deanconnect.nl.
 [212.57.59.66]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f440bsm330460166b.86.2024.09.16.08.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 08:12:10 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 17:11:56 +0200
Message-ID: <20240916151206.947484-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726499531; x=1727104331;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6iSn2jwCoUgCYumfoPzFPOyyFBudK/wdjWNn32x+aIA=;
 b=mDZaO8Z3pWfAw32qmvHVvsPK7s8GcXJoA99bHg8U1bWdSkuyIgCKp20JCQxIz1ZGSE
 PE0dwwY0eSEPXt92Vzzt2IolH1uT1e8Vl0ZXLoXesLV336Tk0JP/e5nXiKbY7yJVkJ3x
 EfrH950f+Xm4dGaWEhYm8jOX05s/P+rpU+nFw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=mDZaO8Z3
Subject: [Buildroot] [PATCH 03/13] package/libselinux: bump version to 3.7
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Antoine Tenart <atenart@kernel.org>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/libselinux/libselinux.hash | 2 +-
 package/libselinux/libselinux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 4e0a2ca317..fac9d3cef2 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  ba4e0ef34b270e7672a5e5f1b523fe2beab3a40bb33d9389f4ad3a8728f21b52  libselinux-3.6.tar.gz
+sha256  ea03f42d13a4f95757997dba8cf0b26321fac5d2f164418b4cc856a92d2b17bd  libselinux-3.7.tar.gz
 
 # Hash for license file
 sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index f07498d739..360ab063ca 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.6
+LIBSELINUX_VERSION = 3.7
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
