Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AB0CCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 15:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C360360841;
	Sun,  9 Nov 2025 15:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKx5G16Ii0zw; Sun,  9 Nov 2025 15:51:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEDB46060E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEDB46060E;
	Sun,  9 Nov 2025 15:51:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D92591CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 15:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA7ED6060E
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 15:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTz85FgE-z8p for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 15:51:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A7253605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7253605EE
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7253605EE
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 15:51:18 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b70bee93dc4so299340266b.3
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 07:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762703476; x=1763308276;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IrenSU8QLOLmlDowODhWIF/7oxCJKpC16amLTEvrInE=;
 b=I7gSdFnhmdfB5pJvbjns0WgbJ/XHeLk7Wdoo5O1Bpnld3PeEZjQNvW0U2z0LLBA11k
 iG4kESIvv2K3yVu4hT6pneYicOXDqAv+B+7soVnt/yH21OUpDujKrCW1/eMTWYTptEm1
 G5M5F2y5jbiMWgqg71sgL1l4Vhqm3iNZ70t4e8+QKl3eHTM7yQpcytP/HdZMB9MYtN9Q
 QZrD9+pW3I/eFofOhM/Mk99VA0tKOPr18SZdcQtQGdrV2mRZx3SOg6Q0Vlx7bu7Oy+Dr
 DI9zsPvrspD68co6Y+VptV9Dyut+fOh4qwkpBgkGab3y6RdpPr5+Z+kATBdcNHx0oKpV
 VPDw==
X-Gm-Message-State: AOJu0YyD1+1nssXRKo8a66Ahz+NGGDPst5zxtFtX3g2aYHFpyTAep1kM
 1YYmnHYSLfoGL4myLTkpiX6jJdlZRY/c99Fd6q3sPc87wXrs99LtTujdVPrGQeklfiicPRk7wmb
 X+dPS
X-Gm-Gg: ASbGncu9RyC2VzgmC58VKtL+CM1DjNqsp1EuxlkR4n4qNPFvS0q3VgIOU7tm4Dk1uWX
 zdejMk0af8q1dKmgRWw0nOgEMGxbAPabc3PJq+hpbLQDF2MubJkPJwX5Vph9PDqnOC21VHOdqBP
 n0qRq+6SErQL8LNimhgTjiKJRlL4Il4ywJqGQEp0vZ4gBJ5sjLTf44Pg4NZ4E+2x7GEz9k1cPBm
 MkyxoiFxu0YVi4twxVfMWOZu3tPC6uyyBci1VeLNi7bohuDRwwcdh1lhuW4tTxTh7tCPbJ98rHJ
 +XIWCVk5lnSDFYCkQ9hR48rqm2Ew+vbucKxfHxtdxHRKEz/M4EJWFB4tMi/bP+B54iqYT/wRac4
 7xizwGhGQTa3kRV691ZbPuMHEnYZrmGI93daSaDg0CtyLlqXpE8jBxdqJ1ge9m/coPuUfSraUE0
 cJNhKZlP6elZIDruictzBgVLYSLr9prt/YqN3t/mpjy09XzktuHGi5FfY5theemhOQ2/+38PXUp
 DnWDAfDJuCgYoQlTDHN3N8GENGzh74T9zeN1MqphL0netF2d1Dc5uK0MzdR
X-Google-Smtp-Source: AGHT+IH9BIEJoHSRQm5TzIXQduzPcOVA1/8UCGdnTl6yE5Bw9A9ObjIu6k3uJa8tHg9+eqDkQwcOVg==
X-Received: by 2002:a17:907:841:b0:b72:67c2:6eb0 with SMTP id
 a640c23a62f3a-b72e0562e6dmr596753266b.62.1762703476479; 
 Sun, 09 Nov 2025 07:51:16 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-62-211-171-160.retail.telecomitalia.it. [62.211.171.160])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9be009sm822487266b.60.2025.11.09.07.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 07:51:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun,  9 Nov 2025 16:51:12 +0100
Message-ID: <20251109155112.607030-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762703476; x=1763308276;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IrenSU8QLOLmlDowODhWIF/7oxCJKpC16amLTEvrInE=;
 b=EsCu2JrcvgvyctekyyjevWyQYUCl0SZg1A9GzPQ9L59o47BUWPfyzyPmBiGSV1ZkE5
 DcKZ2jDF1DQeZCxwqNqxGiVo+cFKiVnFQnbA5+SmvZlJgGQDaGOSw0Elpggm8gWkuWaj
 e4WAT8A42nSnF7BJYRKjzBxbUTbeaU34y08qg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EsCu2Jrc
Subject: [Buildroot] [PATCH 1/1] package/cukinia: bump version to 0.9.1
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

Release notes:
https://github.com/savoirfairelinux/cukinia/releases/tag/v0.9.1

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/cukinia/cukinia.hash | 2 +-
 package/cukinia/cukinia.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cukinia/cukinia.hash b/package/cukinia/cukinia.hash
index 6957c0e1b500..6824f5987561 100644
--- a/package/cukinia/cukinia.hash
+++ b/package/cukinia/cukinia.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  fec5f1d06ed4072b32fff8c7b1e9784aa1d2923d501c4066d47ac792c28e11b0  cukinia-0.9.0.tar.gz
+sha256  d9ad8e0c45b40afbcc63f6bf0328f5e2d74caf72e640f037814b58a95dbfd206  cukinia-0.9.1.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
index f5eccdeb6355..5f4caf8600ac 100644
--- a/package/cukinia/cukinia.mk
+++ b/package/cukinia/cukinia.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUKINIA_VERSION = 0.9.0
+CUKINIA_VERSION = 0.9.1
 CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,v$(CUKINIA_VERSION))
 CUKINIA_LICENSE = Apache-2.0
 CUKINIA_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
