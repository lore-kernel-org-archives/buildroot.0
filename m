Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708D7C83F17
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 417F8606C4;
	Mon, 14 Jul 2025 20:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KDjh0aVdjbh; Mon, 14 Jul 2025 20:26:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 836C2614AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 836C2614AA;
	Mon, 14 Jul 2025 20:26:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 20EB0DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07505406FD;
 Mon, 14 Jul 2025 20:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6__lgNIzrXQf; Mon, 14 Jul 2025 20:26:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37F77406A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37F77406A6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37F77406A6
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so2526651f8f.0
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524775; x=1753129575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rwuUfZNKR7pcy0TbUze2zwBUS2iSmzO/R5naitwIxN4=;
 b=ERpjwdwS4PRPXqOZwG4uJDe+HPqWx7HnOXNW5qrEiPwqtmQy5SJd3xjnbCWADp9SmW
 e1p1cnp3vhePAfhsydzlQab7jfqQgxSILkpLs3o5df1DiKrYXYbP00R1X71KFM49WFoa
 WkM3dGaslS8aMbZeZ0JMiaFPloO14es9PfYOnfELY87UT4Jk1S2jpz1KEcOx+qAFS81e
 DQvdNTJKjRIcPRZjXMDN9U385CaL7CfOSKl0jB4zM1rKCqhpCIHr2guKrzify+ExNe3I
 sz5rJSHIy/L+lLhPdwkYTzLB+SBcLO1GCmDFejEQkNZYxhZTu6gLJdfgqmHtEfA8SM64
 Dqhg==
X-Gm-Message-State: AOJu0YwYlQa7J4WA1tHNtwdWvxJac1Z38yw4DCs+e50YqXGUfiSdKNRI
 wl+1QTizdjA9+5u7bZnF0f1h1HM8TFWUykDy/pU0y+aoDjGzgXOh0zvA1CSDnw==
X-Gm-Gg: ASbGncu6Ul7CP8CNCN+9U+si8Q1KstRx2w2OhynPj/86iq31/vqiI7Z+xutefFSmMEp
 ZbjcKs7fYNQSysM97KrA5fHutGf1nnbQW6QKjHG/YhqT3LjVbaiI3YcyyH7hyY/MFaqZlY1Q3z5
 92Xs6TB3aixKOFTVdb6AKX6pADGglDiy7wDp1uXCRpmPLLCbeF1hfY6wx0B57Ylon6GUyKdmD5z
 UNftplmWzzhRm+l67Q0lGoZCzjNjp5Bq9T9sQE7U1H8vUg29gxv6lNhXWUP6gLp93H3nFCh+meg
 lbI7hXdM6AYcRRCfdqFdFnqLY9iRf2ZDlFkPvssrB6KfpBR7AeuwnW9hS/YR4ON8mAT+Z+YhLom
 OLaSqGy/d1GZKFukObGp9+24h2U91F1qD
X-Google-Smtp-Source: AGHT+IEeoV1rIjmmHIzimmnYTIKGEr01/pX5CDqqmOHXpkcYxYc80eGWdfxihwmZ4efQM6davHqsQw==
X-Received: by 2002:a05:6000:490e:b0:3b4:9dfa:b7 with SMTP id
 ffacd0b85a97d-3b5f2dd49c9mr12504084f8f.25.1752524775002; 
 Mon, 14 Jul 2025 13:26:15 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:14 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Date: Mon, 14 Jul 2025 22:26:03 +0200
Message-ID: <b4f46d2b0b1fef716c89679ac00756d078eddb66.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524775; x=1753129575; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rwuUfZNKR7pcy0TbUze2zwBUS2iSmzO/R5naitwIxN4=;
 b=nTqdJ6hI6QuZoJM9x1oo4H4il+c4yDxMZI+TchME6ztXK3VeCwHjFA4ftIMnEpRFqx
 OM5wEI6aoaB0Zt8ognWqgmw9UtX91Qraso/bPHiZuWGnxi3ieD+TSiioSbXNhAO38qeN
 KNeNuqK1PvQlydp+I6kjKRnpfkJc7Oez656JgAMUXj7Z6H2CXLEZkuXpniS1qnZTSrCC
 fXvxNpFu5eadmfhWCGpHplqld2N5oh8KTUwgJCN7ApKvOvHluIf/zCUgg1XXWCIY62dg
 HOAWAjCmoPQlCyre5G10GJ/QabhUiRnxyJZ1IjElpGGBKBvEKzVCCVTymtbf1wHl/gio
 EzUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nTqdJ6hI
Subject: [Buildroot] [PATCH 09/13] package/docker-engine: bump to version
 28.3.2
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

Since version 28.0.0, docker-engine requires the RAW netfilter table, so
enable that as part of the kernel fixups.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 07a20108b6..5d7bc51a6a 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0d071c1773c855778d85590e01b924c1857000fd786485f4b674a3be2d3b893c  docker-engine-27.5.1-go2.tar.gz
+sha256  e4828e32e474cef1b78f40278211648300071399c7498252dfe0b96e789b8a31  docker-engine-28.3.2-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c39dc2b440..28905b28d6 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 27.5.1
+DOCKER_ENGINE_VERSION = 28.3.2
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
@@ -131,6 +131,7 @@ define DOCKER_ENGINE_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_RAW)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_TARGET_MASQUERADE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
