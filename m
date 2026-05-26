Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793A9CD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 19:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24476610A8;
	Tue, 26 May 2026 19:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2Iy6y0UPFKG; Tue, 26 May 2026 19:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13F8961099
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779824864;
	bh=vpqPVu6IjQAbKNev1D80oj1c8N7ZFH53q/1cuWINCH0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ciXDvUFnvdBDfA6Ap5kixE3kFp0MTZDKXYKblvTCZYb/dOJHW2TjWpmxPh7o+Yv3R
	 533M7+jFJrdu2qlwsEGG4smqcKbdpptC1PqZgGqgb8Cm5ZzvV2SuDZqY2Rx+YgkqlD
	 H3EUIF7BjW+NFhePARRvfoLEL6PfENETrhw3Q15KiIKV6KROmrhmWGcldCU4Sm6IuG
	 K1gAweuEPP/d+ATHjo2kIE1o881NkbNBWA386H/ILgTPL83XTsP542pZcxU0wdv4zS
	 xixr1EILcxRoCZgqMdnOa/yqyamXMjAhz7bJw8/BUch4KVgP1uyXywntqEHS1uJCIV
	 ZB1pUY7RExMWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13F8961099;
	Tue, 26 May 2026 19:47:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 871B3297
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 781128207E
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LqU-wblvuaNB for <buildroot@buildroot.org>;
 Tue, 26 May 2026 19:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A18C681DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A18C681DF9
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A18C681DF9
 for <buildroot@buildroot.org>; Tue, 26 May 2026 19:47:41 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7dcdd1b492eso10847527a34.1
 for <buildroot@buildroot.org>; Tue, 26 May 2026 12:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779824860; x=1780429660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S7KysyfnZIbyv905N7rtETxdC6rBvwzkb75IRJk/Pw8=;
 b=pv5fgy9UaYt9j35Sf0s/9sll2reV/udur9EbGv2ZiOFeruyKaxipZFz5VEu6Ps0t0c
 6E9cpnKxNPolMtqmsQNj3iGDYIfW7ewCW2w0FQTrGUK1lLKadJSYb42mIx4luiHG09k7
 PssGO1ZlSIi+epVG9aPr5TcY3GTF16y2TOaCoUJtexdUjrAxBLCuWICvefVaYrejnCLc
 VgDajDXbtNMF/5O+KesNlSkoqblaezdup2vwqzBzR3hTlkBUdLOo50+a6p3Cswxkjqzc
 8+inL+ckuOp4mC1gBrAKbG1WEe/rTqu1rdMrrB9QFmDVOScCRM9orJdG4H0byT4AXoyv
 s5kA==
X-Gm-Message-State: AOJu0Yx73mZjeS/jC+GJlH9CvrW9vmWW5Mc8HIEQas8rHuBk5NewWCaL
 ZQkXGN1c9flcvSOTN/MlSrn9hM0R9nVEzB/aiIrDciQ91dY8uIoNlAhnFhZTuQ==
X-Gm-Gg: Acq92OGs6spmOpBO2XMV2qnlgpRiMXrDUfLe0LGh9kgxFqxBHywJuRsuef93qVh55Mg
 8/FIGSNh+gWv7SfbcIbQm9wk5wYjvB7C6FCuobz8WRPVvDwJfRZFs/HTT42vAo6Howx4e6lI2oG
 vQnkf4ZZ9kGDPfd8JjjLkRorPDAOIDyhejAvihBUPjJCx6vG/kCGtOXmLcxHySz/DCyjmeqCbL9
 RMyzf65EGvmphC0gqVDQq2LLA5B+d+mfFcjElaFhGeixfzmk9pBXQ8Yl6oqjqwQ7WqAYOKwDiFO
 v5sQPJnD3AbsOd/O1YMBIrhPnaMkabh6yFIy1bIZ+88puO75n6gb1kf5evLGAfnOhhhKKBmeHin
 oFKnBWgfAKRRgsRX7pCZAa1waQg9BLl/devw6k9Opb+FtTurgN3aLuSZ4iG+HHuFpFKiUD0rPp2
 3gGo2gX6U3uy7ZoNCY7FW9LQYhM0qgR23Bdv6ZECbqK4ct3sNfkwPKt5Fhl1I7C5za5lIgTvdtc
 nEcjdV3PeqObPxXmG6CrrQDOws5H5ENvGfCC5TQvxGUNWKfHlHq6ZcREbJl6YTMi3Ff9b2DwEhd
 Fboe
X-Received: by 2002:a05:6830:451d:b0:7de:c870:46d4 with SMTP id
 46e09a7af769-7e5ea310baamr7367009a34.1.1779824860393; 
 Tue, 26 May 2026 12:47:40 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (184-96-131-78.hlrn.qwest.net.
 [184.96.131.78]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e606482b65sm9999837a34.10.2026.05.26.12.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 12:47:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 13:47:37 -0600
Message-ID: <20260526194737.333647-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779824860; x=1780429660; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S7KysyfnZIbyv905N7rtETxdC6rBvwzkb75IRJk/Pw8=;
 b=ZqmNC3Giykfwo+GKtrNTK4Kv+Ur5S5upDz2xbeuLrTno0cmVEUk0Di3ntlG95vXx3c
 l0qtUtUtEMaY+7luEcsaVknP2HhR1WHrw+xM+ubBD0tiTHnTCy7DnE9XJzF/BdanComc
 sihyi4wiPlCpeyuo9h+Rshp1AiuQLzcVDQR2xCjYPFtUEnxU5HwKjYB6RRb0DGkOk6np
 ecSJe7s0OKaEreEAA7dMF+bimJaiHCA1SDFPaFN2MGuTnqzpNdud/iNDiGkdP9A2IRpd
 nc+st4K0gMPRZBbQ13gFq/rYhWiFE4Vc/QW0S3iz0OsBE0eZC6lChg5HS2sLrK4PElup
 gwVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ZqmNC3Gi
Subject: [Buildroot] [PATCH 1/1] package/python-dbus-fast: bump to version
 5.0.14
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 4709b7ed18..8341aab93d 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  af7d1d9f9b169f07fb4f185c6a78d664  dbus_fast-4.0.4.tar.gz
-sha256  43137f0b73a7adbf7d5c0e9eb9d8d34df9e6e0aeafade2166e641c52dfe0a853  dbus_fast-4.0.4.tar.gz
+md5  e7c3a629f252de1aeca447c79ba40399  dbus_fast-5.0.14.tar.gz
+sha256  9c30a134be1a1e4021630e551de040ec38705213c0889ecfdb0218f83beaffa3  dbus_fast-5.0.14.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 895d5fefd5..91c6679e1d 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 4.0.4
+PYTHON_DBUS_FAST_VERSION = 5.0.14
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/5f/cd/402b0e524bdf37d8b1d22b1d926c538bf1d2eedf115ea1d401c6c08a7d81
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/7f/6b/d4c8871e772ddf73e76bfd725dbb6fa82eb11492b370b423892016f0e579
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
