Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D155D3B7F3
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 15:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ABC9407A2;
	Mon,  8 Dec 2025 15:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqFd1EaEdeUn; Mon,  8 Dec 2025 15:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1635A406BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765206872;
	bh=+LDQ+UKyX2DeCtMXHlKeoP2/qqXd/juVU0wH8NoucZE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JlDA+W0GjL13WhTR7hgcHCfPVJBrxnjEb+nncdhed4FE5A8vWyX8jJAyVr/C5PFkX
	 bj6M0wP63HaMlaIqqGkH2fwhkPJxu/kq6oBp8pLTJDHwpE4Aw/5+y6P4TPsLjvQLAG
	 Cc/PN/L+mHuLZ9oiJxIivZoWnr9QEPTGCFUP2rvGDMUyEQykwezJqPlTjE/sNcH+At
	 DrnQjO9QcQMcE/WufvaBUw3BGTuQ1aAk4SIjabvKeWG274KNJ1he1m4WjQNGJPC+3B
	 ystgRKP4XIJ4bQqLRKgWPcy4vIQ9+WTDQFN77uZAe9jbZlcwZt+oJfIuWxu1/ZHpYa
	 f/ea5xwAVzBXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1635A406BB;
	Mon,  8 Dec 2025 15:14:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C0014151
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 15:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD0A240182
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 15:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNKFoy-COxfa for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 15:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF99A40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF99A40153
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF99A40153
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 15:14:28 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b79ea617f55so854132966b.3
 for <buildroot@buildroot.org>; Mon, 08 Dec 2025 07:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765206867; x=1765811667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7tNvJlTQA3jJpQVZ6ZCpzE8o1RYRLVZsLpzy5Nwtcpg=;
 b=StZXghqHKUHFyrWBz/vF4to1X/ArMuHsSlw0zKchng0V/v5VNL6M7e/7+xv50T2yrJ
 Tl5hsYwl3VyIXdrvDwCzEJVHKD42pIE77rrNPQ+UWmcDq4gXSGznpfHX+EjWpkMVEIag
 liy8+Mekt5mFeY/Bvd0jk03VKpOxDmlXKYv6nQAlilKLPK/pW4Jt5EJApWIXivDx7a2P
 wFrXc8Hrf+GtvEIU/WIQBay175KuUYHZiG96ZeRU/U1B+rGqKLSuuiC5eqsGC5bV2/0v
 /bntA4XSmG6oXTMOif24Z98KRC1pK1YOnHmYHxd9eg3aPwY68sCFJfRQt5q7dihTKZ8c
 4qbQ==
X-Gm-Message-State: AOJu0Yzw+h1ddWXor/nHeEauNCNfYBEu3boHIGVLfJt+ga+2AheXM49S
 uHiSzVO0R591c9k6HKA3N/NwJ0TCtoIxOgvgBLHJvDWtkBOo/D+0GSmZdQhCUamtOivbzmHoYBH
 racw0
X-Gm-Gg: ASbGnctgq8Ry8SZEti+MlGFy9LRRMM1SsZ+gHO6n3sTJsC1xb8BEpF+yJ639+Nktj61
 3Pt7OeE4PiHl14tgCLhq1Pn3+jQJ5d2+TM7Hh3bWG/PVRkkM2j1kspU4WceneSDqCQLjw3H9YF+
 NrIQPRCyp748bX3lDoWJTJ9JJvmy45atg2XF/druJOoGql7JreqVc9PiJiooDtZX0Ti0YFVIXjX
 Rv1L63MprtK7g0NlgBjd4JdXCZz0IdbysIp9uyW5MRjzibAsJkvbordxZWAWQfLoHK2OZZbRZVa
 EKHHhgR4ggWBI8+L33e2NhVSeO7c40wVQIZGqiIDn2jiYnP2X3Phki70QbFuP7l1Cqd8mL6ZhC1
 Vvlr6x3SbUOUFUkCq81BZ6uPT7P2e9uNABp2aZTWxyjrqpje5CYtYzbsTzT7dsf1LAGFMVRX0aI
 HGKkXL9ksmJyFGeVk7erQj0rYLVFYXjuy9SZbMlRARRg/jefn/ISrokA07qjy0qjbEH+U5tJK9j
 iycvxGkIBgddMFflARJofkoFUBLj4/YVxXV9Ht8D5ZwVIKmS+MJ
X-Google-Smtp-Source: AGHT+IGi8jEb0c2J+zb/uzc+SwNpOt0We2eSzQ9W+LQ5setafhFTh8R7OquwhLiXLzTpbXpOdiqA1Q==
X-Received: by 2002:a17:906:c10a:b0:b73:880a:fde8 with SMTP id
 a640c23a62f3a-b7a242beb86mr782601666b.12.1765206866523; 
 Mon, 08 Dec 2025 07:14:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-30-99-31.retail.telecomitalia.it. [79.30.99.31])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f49a7951sm1138061066b.49.2025.12.08.07.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 07:14:26 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  8 Dec 2025 16:14:23 +0100
Message-ID: <20251208151423.309131-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1765206867; x=1765811667;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7tNvJlTQA3jJpQVZ6ZCpzE8o1RYRLVZsLpzy5Nwtcpg=;
 b=pYcbKot6wnDPxn2mohx4y0el0wtnplc+VHKmytkPrt7fJ5IEyg6YC80G5dVpBUtnBI
 nXJ9ZVadTF8y0hAsit7xwIhZyDyLc3XKxfFFcDysr1k4emh+icpdeC5F+9LBrrz8UKAq
 P9/lpMfA9aXz36TAYcYT/aj+fKsOoENWv0BSY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=pYcbKot6
Subject: [Buildroot] [PATCH 1/1] package/cmocka: bump to version 2.0.0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The license file has been renamed [1].

Release notes:
https://gitlab.com/cmocka/cmocka/-/releases/cmocka-2.0.0

[1] https://gitlab.com/cmocka/cmocka/-/commit/01cd73ee646870ba5c94a4b53a873229956a2d02
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/cmocka/cmocka.hash | 4 ++--
 package/cmocka/cmocka.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
index 8dc0532388dc..92bf673d4885 100644
--- a/package/cmocka/cmocka.hash
+++ b/package/cmocka/cmocka.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  58435b558766d7f4c729ba163bdf3aec38bed3bc766dab684e3526ed0aa7c780  cmocka-1.1.8.tar.xz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
+sha256  b5686c51ea92d142958d68e5dcb932f9bfc32cd3dd01c524f9d4aa863ebc3d9c  cmocka-2.0.0.tar.xz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
index 04a0640f4cbd..0ee18e29311f 100644
--- a/package/cmocka/cmocka.mk
+++ b/package/cmocka/cmocka.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-CMOCKA_VERSION = 1.1.8
+CMOCKA_VERSION = 2.0.0
 CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
-CMOCKA_SITE = https://cmocka.org/files/1.1
+CMOCKA_SITE = https://cmocka.org/files/2.0
 CMOCKA_LICENSE = Apache-2.0
-CMOCKA_LICENSE_FILES = COPYING
+CMOCKA_LICENSE_FILES = LICENSE
 CMOCKA_INSTALL_STAGING = YES
 CMOCKA_CONF_OPTS = -DWITH_EXAMPLES=OFF
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
