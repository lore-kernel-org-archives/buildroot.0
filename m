Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA139C27C52
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 08:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7834540218;
	Wed,  5 Jun 2024 08:15:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kPdONltLOCa; Wed,  5 Jun 2024 08:15:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51D9A4027A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51D9A4027A;
	Wed,  5 Jun 2024 08:15:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 53AC91BF5E6
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 08:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 414E1843A1
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 08:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiPq5vnEXha1 for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 08:15:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2FFCC8439D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FFCC8439D
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2FFCC8439D
 for <buildroot@busybox.net>; Wed,  5 Jun 2024 08:15:47 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a68fc86acfaso103279566b.1
 for <buildroot@busybox.net>; Wed, 05 Jun 2024 01:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717575346; x=1718180146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BF2zrvNDjO5VG2KuAu4knYgJ14ab9VNGE/gNNzNddkU=;
 b=iUFamDZxkm5KRK7D6RaQkucwhVUfSHjH2/Fdun+ePEiBSguZMVA8aTE74HjiCwvdp5
 8+JpF+KDW2DiRlIceBUPk/YPlwf730BV1nPsVlmsrGjDpLpkxo0htanCBb26FMa9S4rW
 JZnEW7kwvC48deP9S8INovTTTZky3xToSj1yY3dU/1kit0hu+OB22ILE4WHYpz2gkW03
 6cRqInFWyxkHQ01RWo/RnllNsOdM061ZSKKDLj5HR2dyHOJ6OcFCGSoO8qhfDqUdRZpE
 THi5HG/DP0PFsIDQvP/F7m9j3FgSyHTIK7W+9P/J0qljClRaTysP1XgjZSUG/fuE81GV
 orwg==
X-Gm-Message-State: AOJu0YyAIVn+ymkiu3uFGsc5N0LoKwxOKgWRnXrTuJIBqAwT83sWvnxq
 2wKJ2vUrjH5GTLWULC5dEHB4wxWPt1iPMmIEURAeGQHSW7XpgaWY/GUqJ9ZqUjaKbFaH0/B/bo6
 A0Q==
X-Google-Smtp-Source: AGHT+IE2A3xioNp61tbROJ0WnwSPDL0194LoNPQ+d8yxvRgJLdyilVLAGCYUowxLdQBuj+ZMKYUIjg==
X-Received: by 2002:a17:906:c24f:b0:a68:be46:742f with SMTP id
 a640c23a62f3a-a695414047emr399240966b.3.1717575345761; 
 Wed, 05 Jun 2024 01:15:45 -0700 (PDT)
Received: from vm-2404.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a61b4e36dsm5140720a12.75.2024.06.05.01.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 01:15:45 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  5 Jun 2024 10:15:41 +0200
Message-ID: <20240605081541.1181630-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717575346; x=1718180146; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BF2zrvNDjO5VG2KuAu4knYgJ14ab9VNGE/gNNzNddkU=;
 b=miH7LSAQpJXMn6qnNJYoujiUMY2fyvlsyiU7MtpVpqp+VEZx+ThrpfLFnc8Ubb11LY
 npV7fOI0b+Fgw2SE+RgrZoig2r1jcSAqH9qof3vZRBNC8ztaQh7VJbUnJwm5E8aoi3px
 PmXxuW/QgGW58meCQBe+C9WH5mVaSm1mqijI3EbGjYd9sXONYp0GxJ7sXhPrcU/pmJ0D
 jI1hO3hPsMbZf2Zoke9zqqBwNY2XAw+nrTasZSCYIbov77FNoWfgenrrZfwLeEHKJdl5
 Xw5qYRbm14gEbdLqn/VKuvI/V9+1bNNGSaTqfYFQG+YuiIe8FtBHXLawuxwv6nvsLccp
 dKSg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=miH7LSAQ
Subject: [Buildroot] [PATCH] package/iproute2: bump to version 6.9.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index d57a93de7..a716bf75a 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  03a6cca3d71a908d1f15f7b495be2b8fe851f941458dc4664900d7f45fcf68ce  iproute2-6.8.0.tar.xz
+sha256  2f643d09ea11a4a2a043c92e2b469b5f73228cbf241ae806760296ed0ec413d0  iproute2-6.9.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 3db2ab925..525101aff 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.8.0
+IPROUTE2_VERSION = 6.9.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
