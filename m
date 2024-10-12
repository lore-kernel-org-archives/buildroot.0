Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E93BCF256B
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 227B1606FF;
	Sat, 12 Oct 2024 15:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyvoQlZSa7MW; Sat, 12 Oct 2024 15:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A79B60719
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A79B60719;
	Sat, 12 Oct 2024 15:24:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2A611BF3F3
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE97D60635
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JprGCmjz3-rb for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:24:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 330516060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 330516060A
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 330516060A
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:24:27 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a99422c796eso489588466b.3
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 08:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728746665; x=1729351465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zcLygWkooPZgDhk4NqGAqf+LKufI0B6FjyZtfpC+0vU=;
 b=qyU8g7jmRXky1ZFcjgk/Hwp3+PRbmKAbfS1KuN68nHaeO5FcQdxmrG+3tWtZ11knFF
 sSVJpDIwUaJ8FEa7VpHEcVjYEh1FwCcJ09xK607gPVz1GdE7kAohuzODKzAvP/JgcRaK
 JIeyG9bdPWHhQbzdIPMIMLP6rQvVIUUzbBoIyZn5seIWhVLrO0VKms021tg0X44/Njxt
 4TblwVJ3TxLwXYnzKpr37CV/RrmKEoo1OJy7A6NTW7vxQzGs0P/f0pNFoNaMR6hAo/6w
 YBG13dkc6VpZo4n22iyO2zEtT1w/N8vcaJzZFUltiWQMKMxc44Rj5q03UF/OuBwQVDFQ
 gnSQ==
X-Gm-Message-State: AOJu0YwNMAvIBe3Nce9Qo6KT3acWtq/5V8RD4GU2qpFMP8YuDFZBxass
 9/5gtGmDVqH7d/y2fWqdgUnohb1p9TDIsvYkot6NI6jksbNdfAlT4tO4qbOu7HHFcEJ4IvJf1+y
 Yrb8=
X-Google-Smtp-Source: AGHT+IG86ewo+4LSx9JOmJqaIEJHcDEiEBFHFv2n05utk0KmhVcwiv2Bt4dUOoQN8IFVnMLKgicvJA==
X-Received: by 2002:a17:907:9451:b0:a99:5baf:12a4 with SMTP id
 a640c23a62f3a-a99b937b0bdmr499858366b.17.1728746664826; 
 Sat, 12 Oct 2024 08:24:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.51])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7ede936sm334538966b.35.2024.10.12.08.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Oct 2024 08:24:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:24:16 +0200
Message-ID: <20241012152417.986582-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728746665; x=1729351465;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zcLygWkooPZgDhk4NqGAqf+LKufI0B6FjyZtfpC+0vU=;
 b=gu/NY12MESOPHtCgoID2N6RcbzPY2xmOXIDIVDBJEmAioTPe1kn+MdCvrquJLKtLZJ
 zGFPnKVrkGDznh/Mu8gv1nyeGImcwTYbAhqWwmiAeCsMNHe5Js4/HRl+TeRmctEh4/tW
 7a0RuzOGdttNGmhOApUgV3W+pvm8IcvuGWP4o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gu/NY12M
Subject: [Buildroot] [PATCH 1/2] package/aespipe: bump to version 2.4h
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aespipe-v2.4h     May 14 2024
    - Added assembler implementations of AES for 32-bit arm and 64-bit arm64

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/aespipe/aespipe.hash | 6 +++---
 package/aespipe/aespipe.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/aespipe/aespipe.hash b/package/aespipe/aespipe.hash
index 4fe7d0753baf..cb60e7dc1ed6 100644
--- a/package/aespipe/aespipe.hash
+++ b/package/aespipe/aespipe.hash
@@ -1,5 +1,5 @@
 # From https://sourceforge.net/projects/loop-aes/files/aespipe/v2.4g/
-sha1  fb6b0108176d653f0e5b3be2385b132be791d800  aespipe-v2.4g.tar.bz2
-md5  c216c6c9e939fac69f859af0ad2fd8ef  aespipe-v2.4g.tar.bz2
+sha1  f1148f4aa82979755b13130b74643b449de55f6e  aespipe-v2.4h.tar.bz2
+md5  6c4552f10771eda471c964b34b1fae4a  aespipe-v2.4h.tar.bz2
 # Locally computed:
-sha256  bfb97e7de161e8d7ce113b163bda1d1a8ec77d2c1afab56dcc8153d7a90187fc  aespipe-v2.4g.tar.bz2
+sha256  eab311fc26ea43289bc3adf660d6270492494960725d2026ec4917294a1aba49  aespipe-v2.4h.tar.bz2
diff --git a/package/aespipe/aespipe.mk b/package/aespipe/aespipe.mk
index 4769536d2f9e..054849a14779 100644
--- a/package/aespipe/aespipe.mk
+++ b/package/aespipe/aespipe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AESPIPE_VERSION = 2.4g
+AESPIPE_VERSION = 2.4h
 AESPIPE_SOURCE = aespipe-v$(AESPIPE_VERSION).tar.bz2
 AESPIPE_SITE = http://loop-aes.sourceforge.net/aespipe
 AESPIPE_LICENSE = GPL
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
