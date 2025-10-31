Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126BCCCF9F8
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 11:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 833F783376;
	Fri, 31 Oct 2025 11:29:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XV5fZdGfgS3; Fri, 31 Oct 2025 11:29:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3CAB8272D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3CAB8272D;
	Fri, 31 Oct 2025 11:29:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63581CD
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 11:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60C704067E
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 11:29:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrGueJCu6I1H for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 11:29:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E1FF40C15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E1FF40C15
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E1FF40C15
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 11:29:06 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-63c0c9a408aso3248603a12.3
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 04:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761910144; x=1762514944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8J3DbMWshndAO+hNFyn/T3e9jHCCAiaPnT60YDxpkXM=;
 b=Y2esfAzDJV4oFWiVXRPrmI1JWTvOCtgkWgdufv22qnkBjlZ9MzkY709R0lhVnRPHzT
 pccjGVN4buOxlMTFTBgNfh7bI/RNQlevyHNBaAlbFvwCHwDxZ8CbnJFk+2q+BqQ1ORca
 SUcfjqRLjNd0h8O/ZrDhbBhRUysd4S/Egi8z5ba6P8OFTvp8Vc1WIcUvFfya7flJ5e3Q
 1Bvdrx/XLb8wm8iyFq91mWDrUUtL/NNfxULTi4TuDJyEqGTIkQAfYak2Z7oYI1fCGA5U
 hZJwb39omrOLzNYtLKUUy9SdqNTW0xh3IUGggPYmXyidXIuLB0ON5nzzBWerSI5pyZz5
 YjTw==
X-Gm-Message-State: AOJu0YwpNF3YKHUjGYfPUrICqzPAFlQR5QBFYYqwgZGQOkuGVIbk4CYo
 8TnO/PebAOKDev0bN9nDrQhHYU0LK3AB0E78Rs0x28pRHFXHHv2O/EKKyuYPY3kHGGzu+PctjGu
 qryLt
X-Gm-Gg: ASbGncsAkfk/lw8ZhRQ09eK2aMloc1MCi0pKlVcrZ6HaViU76HRuTNz/hkuaaIgRfqc
 kiCMQMW18isqrWRVoLWtH0+IRYBdfzB6Nc5PqncOXgYak2PB96m070Fx2fqdhCsKFwfkam/hj5v
 /iafPilAVvIUEIfTDwBpiQC6ULQsl4gO1Ek7nM75sX6Ab1XfZ2EGNwHd14oO4Ic2Oc56tMGlxHA
 IRIj7syrswAINttbFF7z9/C1e4JHrKN6ZAI4WyVwcHYm+ZAiOfPY9F4g0bD0wHbeaYljtv4UMyW
 78VxFVB1G8NgH+eE3Zxs2oOBjQeOsToN3Pl1osS8Af/YvYT7HfWitH423De7sGVB9vifp0zMl1Y
 uPgCtraC/1/TnTpsqafXVbrg95dexggF42O7U/Qm3RD48KH0ITiytCkr1oPr7+cxF3T32ozigPA
 EMLgdmAY6zZiefK2iDraQt2ZDFwN/qR+U980Fv9UZ8tblC3GJDRJj7XkH2r1N638StaXCTwiaM5
 Ow=
X-Google-Smtp-Source: AGHT+IGx/iAoEG0/tRzK01a2ZwY4E89LF9Og41Q6sgN/kWit3x6UmBLxdblNVASbTHvnCyO4Vr84tQ==
X-Received: by 2002:a05:6402:26cf:b0:63e:914e:5159 with SMTP id
 4fb4d7f45d1cf-64076fada3bmr2477199a12.13.1761910143903; 
 Fri, 31 Oct 2025 04:29:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.188])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6407b34a735sm1356062a12.1.2025.10.31.04.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 04:29:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 31 Oct 2025 12:28:58 +0100
Message-ID: <20251031112858.2351416-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761910144; x=1762514944;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8J3DbMWshndAO+hNFyn/T3e9jHCCAiaPnT60YDxpkXM=;
 b=BAJFmQtoyiOWmL215hskE1YNqf0oWL2DfwgDr5LQmxqoYyBpp/UgSW1sgGYlh4vkEk
 vg0leENocU+RjSLI1ZPPyWy2FbYg8pfter3S7G/2FYzgvVcmy4e0bHdaYAdiX5tT8i1W
 9xP/GK3jcup5aUlbIGP37btjayoUJYXTQndsM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BAJFmQto
Subject: [Buildroot] [PATCH 1/1] package/bcm2835: bump version to 1.75
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

1.74 Timeout in bcm2835_i2c_write() increased by a factor of 10 because
     some users have reported spurious timeouts at slow speeds.

1.75 Patches to bcm2835_aux_spi_transfernb() from Sean Goff to deal with
     the case where the process is interrupted between filling the TX
     FIFO and reading the RX FIFO.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/bcm2835/bcm2835.hash | 2 +-
 package/bcm2835/bcm2835.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index 802f34335bbc..56190986ef3d 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e67a986462618988a5a86752e36e3ebdd7c5cae66940ff7330aea243b2762525  bcm2835-1.73.tar.gz
+sha256  e3ee8fd0a6b475ea71ca362fc2587fa1ac9fd03ed31c285654837731e93496fd  bcm2835-1.75.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index dcf21cb5f031..fa08358ac1d9 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.73
+BCM2835_VERSION = 1.75
 BCM2835_SITE = https://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
