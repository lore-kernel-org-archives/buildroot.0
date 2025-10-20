Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49758CCD19F
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 22:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCB6480373;
	Mon, 20 Oct 2025 22:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZdDsD2341yU; Mon, 20 Oct 2025 22:54:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A1EF8036D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A1EF8036D;
	Mon, 20 Oct 2025 22:54:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7226E70A
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5844640A22
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCpEvRrJIqM9 for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 22:54:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF5AA40A1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5AA40A1F
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF5AA40A1F
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:54:31 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-424da17e309so52738705ab.2
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 15:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761000870; x=1761605670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dlP4Y7nfp2LB+6pLs4hxNOvCv0ql4YFgSthc93ULe30=;
 b=mEnYs8zUHN8vhfhdj+KZhpjyWwZybi+aHulevjpL7JK6JnZ7VurW2Q/SbRolgPtKda
 hfxX2EcUupOXueReRqdHq09PkYZAN+xPOeiuVFLPLuAld+NrArztDvoHtAMaxgdXLHmS
 c2jcut/Lvx7qyMcBYc/wmYgNtX8c71+bkGMxIXsyvNXFQl7x+49QR1vGSFjFvCbhM0Jw
 vNr71Lze8iSbNjzJo3s9F/IBfSIbVTOTxPCeZtFZWX2d0oyIr9zQbpY0b+WbGcQLvAWv
 Gmwj8c2ko6E5cy7HGd+pVx9ICqBWhbKjZgAwZQ4NMAq/2ELcOWubSgP4YGTi0/sCmAg2
 ZZ4Q==
X-Gm-Message-State: AOJu0YzJRjPuq3Fgw+sq3YEyUtZ3stIhcGaWPWgRK++jQN2vzeQh+FcP
 BUmyw7FDOhcyZBXwTXp3tEJA6cSmTO/V37GJLQisFLuFt7sZNLA7leuZuz+Ue5b3coA=
X-Gm-Gg: ASbGnctdN2QHAud66FK60jMOBuXvWYIkHWWACPiuzFKH6CYGqiT/p+AEJKWtMa0ig2+
 1yqFVaXx5lf7TvWO+jTqbZHolo+eMjhMyuuCM4Pc58s8RrnzGhFXTcox6bMRRhJG5hndIaBY+T+
 f6vBNlKYQ/tIWrPWxtojOngI5CbKV3ORA74r0O0WnfHFqBJl+AH4BPIW3HS79vJ1YhKs70ZbEs3
 Blb6c5VojiJVvCITPsVxsq2buT8e5ZRjff5cAHAUqLAYcgyKWehhhNt5E5tT6Fpk3TTpYv1Lcpr
 3gRJ/kHcfncf4oCHOOhnwo62rmRYvWFoFnD7yekLyk6FBWhEQxxypYoz3T0YhbBO/kAR1lumYZI
 LRSSjv4SzvlltBMl5sXbrPB3XDn5/lxIocSqR25boeS4LvQuSA6rP03zG4HtKMVaeZVpYEPmelW
 woJBil78auYNHnKpalZMINp+tyPd/VqmND3M6KK+zQlsituR+SGyil85AaH544twFZD70LMe0=
X-Google-Smtp-Source: AGHT+IGcFPUaMqhES2lehi2ynZB0ZocamcLlESGFw+huiDHEkU48B8TWlxzlxggasleiAFK+Ih9Wjg==
X-Received: by 2002:a05:6e02:2183:b0:42d:8b1c:5740 with SMTP id
 e9e14a558f8ab-430c5208341mr30075805ab.5.1761000870365; 
 Mon, 20 Oct 2025 15:54:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5a8a9630bf1sm3457282173.17.2025.10.20.15.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 15:54:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Oct 2025 16:54:24 -0600
Message-ID: <20251020225424.98853-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251020225424.98853-1-james.hilliard1@gmail.com>
References: <20251020225424.98853-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761000870; x=1761605670; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dlP4Y7nfp2LB+6pLs4hxNOvCv0ql4YFgSthc93ULe30=;
 b=e9AW3J9jdk0HhgPCOLDhJififySDXZoIkdWUsmbOriTgYiAWy5ZaPzBULeVfCFFrCt
 u4kXghcgksm4Grh1u++tGoHG7GCv0h8kW1qtML64Ugr5Kve3acUERRav2YmiKiO53CDC
 s10DxRu8fDnY7dQvsM2h/0otaEKZ4xXmfwmgQAWcfuZyUZqCnh+aH0L5JJvjRxkseYOG
 EoLzECmzLx2ENR2ybAr3vMJNA4POi1Kli4IP7SJYdrBHMhZG4NkcpZaXintulYfLAOJ7
 Vw4nJG+d6bN8ryfgrSED/7YhZJjB3XjAOFZ07QyQwvTXgR7lmZkJ/8bbvbJRefUEJ48z
 XJ7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=e9AW3J9j
Subject: [Buildroot] [PATCH v2 2/2] package/tailscale: bump to version 1.88.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.hash | 2 +-
 package/tailscale/tailscale.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tailscale/tailscale.hash b/package/tailscale/tailscale.hash
index e2d600f03e..444412f8f4 100644
--- a/package/tailscale/tailscale.hash
+++ b/package/tailscale/tailscale.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4830cd822a838d5d44fd5eeebd07a2aacaf0255fb3fb7d3852d57659f54e51bc  tailscale-1.78.1-go2.tar.gz
+sha256  98b51e95e84378ab280c5a8706508d493ab9152a0215f00f0f69e3ea2673ea0f  tailscale-1.88.3-go2.tar.gz
 sha256  d1ee1c7947d4b2c1963ea214d5324f1d4c89f2f1d0f0224889b4dfb868dad725  LICENSE
diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 3c6c7bce1e..141a5b98d6 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAILSCALE_VERSION = 1.78.1
+TAILSCALE_VERSION = 1.88.3
 TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
