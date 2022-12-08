Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC70EC4167B
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 20:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17B3C60B1A;
	Thu,  8 Dec 2022 20:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17B3C60B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJ8Ei93P0QLf; Thu,  8 Dec 2022 20:03:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 533E760A8D;
	Thu,  8 Dec 2022 20:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 533E760A8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A51F1BF2F0
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64F1160A8D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64F1160A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSdAZ4fKYfEX for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 20:03:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3396C60A7B
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3396C60A7B
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 20:03:50 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ud5so6602076ejc.4
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 12:03:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g8PDjIOEeREckbwOpvX63K+5F36Kn3svD8K17UPcSBU=;
 b=6GyBRQCORHEc1Uv6EYP8z4fcjq6MnfuBlbg9xCXf/v5ax7l+0ImIJ9xOiDRLJSx3Xd
 81HeLRyL9gAcEUM+BXaOyVMOqd+3RHn0ky3V/1mrfnR6UHlEaNLcoAA7HctGcZp25YLB
 DfIPfAKF4FN8XDfoLpX1Dyh2LOm/CciP79AIFiJEEczYi4uz+vQ+wU8bNGsMaJERUFTb
 a3hVyM/9K/e8EcDfUdwKPuYl5QhQRrZVZ+fnx+eOugXMq3L3WMhyEWeS7WdhAe3MVl2J
 LvdIJSjVW7EWeIhQ44Gtn1pDBdcSFKSa6pwSgMwTQKsnPlKtbhQ3Qpuz7+gMxU6JSUnj
 BOww==
X-Gm-Message-State: ANoB5plWJOG7cvXQGRdZ/4Fe0dgLnzEUAvb6NHBboYT6PORVV7/kB3QW
 Uj9N0GAP8CYJEAPKOtuSmCll55DUnvrX7g==
X-Google-Smtp-Source: AA0mqf6K3aXH3O3/sdrag4q+YDLDM6xrk+XNwOQTHh6V2av3Pd/q8jLp5TfqyybmbQ77OXa3TO0iug==
X-Received: by 2002:a17:907:d18:b0:7ae:1438:5892 with SMTP id
 gn24-20020a1709070d1800b007ae14385892mr4202891ejc.36.1670529827755; 
 Thu, 08 Dec 2022 12:03:47 -0800 (PST)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 vs21-20020a170907139500b007c0ae137404sm9187021ejb.97.2022.12.08.12.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:03:46 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 21:03:40 +0100
Message-Id: <20221208200339.12108-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g8PDjIOEeREckbwOpvX63K+5F36Kn3svD8K17UPcSBU=;
 b=PURfdp2jbdQzhH6x4GWNKkAgyahTH6LXIYh1JGhX5hE2wS5ZAbgCTgZ2iGZgwYJRNL
 +c68tMuk9hzud5gKb2GblQNz7rj0l90E9WGi1Q6fjgWSJB62uC983hTwAPx/VywlBVdD
 hb0ZTfYLPbDc/bY+mRmwpHKh4Uss50IYcZ7bEVqNwtfxTSsGWTCeYsfjgeOBmO9gZL/z
 UJYSYtUDV5LVvrY6ONWWSMR9cK6PDVC1psbM8VHBkPsL8QomzSMO+EWZ5F1wVk5xoJuB
 Aznkcj3mXWt3Eqwlh1BbbSGkFAr8Z0DNeQg81f1fZMa4Rxg0nEv+uzfXFrUfkRDEqrn9
 3eCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PURfdp2j
Subject: [Buildroot] [PATCH] package/pkg-meson.mk: add 'setup' to meson
 command in config step
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Guillaume W . Bres" <guillaume.bressaix@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When building/configure meson packages the following warning is displayed:
WARNING: Running the setup command as meson [options] instead of meson setup [options] is ambiguous and deprecated.

This warning was introduced in meson release 0.64.0 [1].

Follow the advise and add the 'setup' argument to the meson command.

[1] https://github.com/mesonbuild/meson/commit/3c7ab542c0c4770241eae149b0d4cd8de329aee0

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/pkg-meson.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index d675f7f733..4aa6e44afa 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -149,7 +149,7 @@ define $(2)_CONFIGURE_CMDS
 	CC_FOR_BUILD="$$(HOSTCC)" \
 	CXX_FOR_BUILD="$$(HOSTCXX)" \
 	$$($$(PKG)_CONF_ENV) \
-	$$(MESON) \
+	$$(MESON) setup \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
@@ -169,7 +169,7 @@ define $(2)_CONFIGURE_CMDS
 	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	$$(HOST_CONFIGURE_OPTS) \
-	$$($$(PKG)_CONF_ENV) $$(MESON) \
+	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
 		--prefix=$$(HOST_DIR) \
 		--libdir=lib \
 		--sysconfdir=$$(HOST_DIR)/etc \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
