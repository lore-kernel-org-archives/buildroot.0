Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF93BC433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 19:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A50C418AA;
	Fri, 11 Nov 2022 19:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A50C418AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tfdJpXDEStEC; Fri, 11 Nov 2022 19:51:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4FB04187A;
	Fri, 11 Nov 2022 19:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4FB04187A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93B1C1BF5DA
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 19:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E24A4187A
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 19:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E24A4187A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BbcH1YmqobEL for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 19:51:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E93BD417CA
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E93BD417CA
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 19:51:18 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id e189so4305226iof.1
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 11:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PUffZqDFKua7kCzWo0Gef3HR9JaTN3/r6iA/VV5QXbA=;
 b=HojBy29trlAoWFbxgfG1r8Et2hQWaYyq+sXKgePyh8NNZ7fjGaUS3dIQ3YDw9uAMz7
 oi1Z+TDzqbIB0sj0ym2QBlEZ6NOc4ZpJfIf0tgKPXEHMsSE6v7qw3qPBYUO91ucx+yp8
 PS995VRLAAwdiV0EYjDVcHZrx9aJHr6yU3D3bwa8OsRXApdvxusMQhW7T61R2JJ/Ft43
 bfJzz7rDtRI4GwQrTNlQcygWz74YxPO2OqeXM1HlLgsRPG8y0nULMBU4J6Gi7mQTtfTO
 6XZV37vd97BvJai51/4b+ynvaMVXqhSuSa7aJxATGUf2b644QZslR+TcpEXLO0oVC1vy
 myIw==
X-Gm-Message-State: ANoB5pnpDVVVsgG9ppNF4q+Y4Lmjw5Tmzx/95yZI9kwGrw0SGLZfOQhG
 dx0KbknnNvqc22g+eOpeNNMamgJP45l6Zw==
X-Google-Smtp-Source: AA0mqf6dbVGMzwDpcvkuOKOTdafndsUW6TZI3UMviNUz2MKYy7b/WI91/JvGvA+mOA6gPsx/PBNSNw==
X-Received: by 2002:a02:a08b:0:b0:375:9838:239f with SMTP id
 g11-20020a02a08b000000b003759838239fmr1464131jah.179.1668196277614; 
 Fri, 11 Nov 2022 11:51:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 p23-20020a056638217700b0036348f096acsm1079307jak.6.2022.11.11.11.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 11:51:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 12:51:15 -0700
Message-Id: <20221111195115.3918675-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PUffZqDFKua7kCzWo0Gef3HR9JaTN3/r6iA/VV5QXbA=;
 b=YJ/Y9RnXbMWAKSf5HToTPFYFHcM50HOQeJohHUiy3TAFsDwrANjaPUD6YD2fcBZSk/
 o9cgEAKtih0NYs29c0M/6Ff3mZbvxPnqBMaNg+VIARanEyhZdrbLjOZfJvRSQldBEnEZ
 qvQPunSODLB+txquIsNS1fNwrQJY+Q9zlqVC/7++LiXtJzMZjtuxnQu6Zh+WEzzpRLdT
 wIA819DuVPbKWyDAltgPAmdlZMuGaz0LL4U2kSShngx+cMZpTWfVflRMCG+rC+4hefpp
 juqejFdaLM9lVv7bKIbZeKXpx4mPUpYknEkhh4jworD66ajMJg0gyU/vWl/qa4ZPdIpN
 Xfyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YJ/Y9RnX
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.60
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for new optional bluez5-backend-native-mm and readline
config options.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index 9bead47bd9..4585534569 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  32a6db3f42f00eb95a07369160a614420443ca4f4e90ac628db8ca508e08538e  pipewire-0.3.59.tar.bz2
+sha256  8164eb53c9eafedfa22fe1adc4b8e38f3173c6f33695c735a17ed1a3d43c664e  pipewire-0.3.60.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index d7ae07170d..9fef605878 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.59
+PIPEWIRE_VERSION = 0.3.60
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -105,6 +105,12 @@ endif
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS)$(BR2_PACKAGE_SBC),yy)
 PIPEWIRE_CONF_OPTS += -Dbluez5=enabled
 PIPEWIRE_DEPENDENCIES += bluez5_utils sbc
+ifeq ($(BR2_PACKAGE_MODEM_MANAGER),y)
+PIPEWIRE_CONF_OPTS += -Dbluez5-backend-native-mm=enabled
+PIPEWIRE_DEPENDENCIES += modem-manager
+else
+PIPEWIRE_CONF_OPTS += -Dbluez5-backend-native-mm=disabled
+endif
 ifeq ($(BR2_PACKAGE_OPUS),y)
 PIPEWIRE_CONF_OPTS += -Dbluez5-codec-opus=enabled
 PIPEWIRE_DEPENDENCIES += opus
@@ -189,7 +195,10 @@ PIPEWIRE_CONF_OPTS += -Dlibpulse=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
+PIPEWIRE_CONF_OPTS += -Dreadline=enabled
 PIPEWIRE_DEPENDENCIES += readline
+else
+PIPEWIRE_CONF_OPTS += -Dreadline=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_SDL2),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
