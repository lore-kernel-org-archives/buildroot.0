Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC1DCCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50F5261128;
	Tue, 14 Oct 2025 18:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYBYCqq6Vp85; Tue, 14 Oct 2025 18:34:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 733DE612EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 733DE612EB;
	Tue, 14 Oct 2025 18:34:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A925D294
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A649340C50
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-KhX9Fn0nfP for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:34:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91BCF405AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91BCF405AE
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91BCF405AE
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:34:18 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e37d10ed2so52612245e9.2
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 11:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760466856; x=1761071656;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1V/dUMUHG9krIWPUW6e2Mz48jkph2OHtzMaI1eGmKNE=;
 b=oTEmolxeV1n7z2NkDBn7GttuwVnnumEC9ficLLpIY8W7cGNAyrvv52cPnc6NNh7hC4
 sNvNL4cETKRzQHP8vsp+og7dvq9dSXiNO4fuUy4ou46xB7dgLGzDbNGcnYFKIPNrVoO5
 D2kKDxtgymHRBPNRvSOZp3JLUUlWSsbdePa7MK7R8KvMqdMsoQnQxr4nTWKDVByBOAPT
 /aZr4DjtRKkoWcyXebsG/sjeBLSOkvAOsEmNdlp3tWKFb/+J6yecrB3TC6fkioX9gnPq
 JTmVrw6k8Ciru/wgU4MWv5uHnGxBoRqZda0ISHPLY5FYXg/jd86b5+gF29PlE5EwgKLH
 AAFA==
X-Gm-Message-State: AOJu0YyONR40JVg7D2O+4xDPAakMlJKWGCAws4K5wHKAraO4oVNwp8+W
 N0qFnbtJAPF8w8bvGDOKb3jd1ksrixY8nxxlXZzbcjxEbmCQb2ZvCgtEGaBdiC+gDPzVvByAePj
 H0PcLjRg=
X-Gm-Gg: ASbGnctCL8ZOpZZBLRjy5jC5Kr7ugK2F+pNJ7wBmVGTcVzm1tWfM49V/bg1SW6THQgj
 aXOL4eh/b9QUboYVGarsYLYjkZorNGY1JWnHm4m9Kz5vazvAZgOE00aa4iYRhrzQXol6RDgXQyj
 sYr1vQGFyJ7IvgP4heYl8zScrGD0x5lgwUoScLobUAGCLpAkJfEY1VEdHiiKOhTyHvJ8TWf2KDB
 0pYAD/EbXq81+FAR3gUvz7mzCF6lEWJOnDFk3YC/bj4B8IKfO2noVzQjLrfbC/OPd3JAchBcq2A
 FYgYIZbCtxprOG4EJowx+zs9NzQn+eJoprZopMCsl2luqGyBViLC00cMWkpl7wYuP040N+7KdTc
 9cnW4qM3DKZjha7EdFqXV9qsjcVl9cYhiTdFs4i2G6cWwnk48NJH205KKZOSuD82QMtIpTXlkpK
 mWuwM=
X-Google-Smtp-Source: AGHT+IF8O0ibIFAKwQzjb5+387t8OodiBZFfGUzhd27pBNsN6cSBgFvYjFv7M5vb9DxoFK78fndMUQ==
X-Received: by 2002:a05:600c:34c2:b0:46e:502c:8d6a with SMTP id
 5b1f17b1804b1-46fa9b06499mr171939555e9.25.1760466856299; 
 Tue, 14 Oct 2025 11:34:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb497af18sm253662935e9.3.2025.10.14.11.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 11:34:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 14 Oct 2025 20:34:13 +0200
Message-ID: <20251014183413.645875-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760466856; x=1761071656;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1V/dUMUHG9krIWPUW6e2Mz48jkph2OHtzMaI1eGmKNE=;
 b=EtVyIs0+SYVo4YDh4PUSq+TWqCc9Lm6O0h6kIX81gjcOnJvVEVQzHDbPDVTYNs5AEd
 1VvMpzBxI+kAV9AdDMpDw40IFX5gRRwkrRpyG0ml78uPDPXw0dgMYwKI2WxHckNMppMF
 fvd/pkHGMaABRWxMl+ggRipOxLlICQLz5sb6s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EtVyIs0+
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 6.17.0
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

Release announcement:
https://lore.kernel.org/netdev/20250929095042.48200315@hermes.local/

Changelog:
https://github.com/iproute2/iproute2/compare/v6.16.0...v6.17.0

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index eef0f7353a1a..e743b4fa0dd5 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  5900ccc15f9ac3bf7b7eae81deb5937123df35e99347a7f11a22818482f0a8d0  iproute2-6.16.0.tar.xz
+sha256  9781e59410ab7dea8e9f79bb10ff1488e63d10fcbb70503b94426ba27a8e2dec  iproute2-6.17.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index de8dbcf97f1b..6d69a2012691 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.16.0
+IPROUTE2_VERSION = 6.17.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
