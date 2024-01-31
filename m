Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E738C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 18:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ABCD400A4;
	Wed, 31 Jan 2024 18:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ABCD400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5UlFOGeV5IK; Wed, 31 Jan 2024 18:19:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4690A4359D;
	Wed, 31 Jan 2024 18:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4690A4359D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7903F1BF59E
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 18:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B6BA60F6C
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 18:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B6BA60F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SVXS2dR-xDLn for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 18:19:09 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7E2860F31
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 18:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7E2860F31
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a359e6fde44so620766b.3
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 10:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706725147; x=1707329947;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uQPXeZ7izR5CZKU+R2b25qmgkQZzI2MbYqjAnNa9H44=;
 b=EGpL/ypy8r3j1BOSO2erK/Ko46KuJVC5/kD9nzP1xg2gTDk/ZGVfzcloXypjN1PXWI
 QpoASiU9UeTt8td6/pDCfR2p4aTa62E0HMTVL7KWsTxlzicoemD6nu/xZKHrdF1ipSSc
 97L7qeXrRP6SUlgh9rTiXWb8jUzEXfYqBROxe6mER78Xuj9K9ScNpU7dUEWy1kuRNeJQ
 SnOSLxUs0tjjaybtipxaU8CPNrFumbXEJN0/v0PyIcCASDcrU7RrZ7+/urxCPy1BM/f5
 Lh6PXjM4QSSdMv9GbCJedU3yxrSz7jVY/E8/fz0cauf3LbuLkPXzyF6wn4+HM3Eynmje
 CU8w==
X-Gm-Message-State: AOJu0Ywng1kZA/k7Zib/hcz0LvZWC/THvDJsqQx46f7CQpiuipFMlgSW
 Mr1XeaWKt3pPGi7WRuWZbbtz80N278h4lCOwdRbEzd/uDOrOhEwh16N2ek/2
X-Google-Smtp-Source: AGHT+IHy4T5P1OHjN7RzTY2uaO34/MTgN2NwVIPCVu6nKrT7n47cgtN9oNedvxf2eejR5m5ZhO4xnA==
X-Received: by 2002:a17:906:1110:b0:a36:af:3939 with SMTP id
 h16-20020a170906111000b00a3600af3939mr1852414eja.17.1706725146714; 
 Wed, 31 Jan 2024 10:19:06 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 vj12-20020a170907d48c00b00a3672977b7asm857817ejc.144.2024.01.31.10.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 10:19:06 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 19:19:02 +0100
Message-ID: <20240131181902.26975-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706725147; x=1707329947; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uQPXeZ7izR5CZKU+R2b25qmgkQZzI2MbYqjAnNa9H44=;
 b=aQ6viqSjeLjS/8hGqdfjKWhh+6FQi3x+1zvUNVdv5BR5BhF3OQgpFredHePQzTfebd
 fONQlXwMXHMG2N+46fl9ov5jejTMBVKFHPbGnQS8z5kMFB4He17ohzuEhLTP5mBcd2Vu
 r94vwf07FMZ9BLvPsvbvUNiPSTveUaTS/bnuXv/PPZaCJ3bwyD7+NfDMlJCk3qhQcviS
 Ivr0ZObBQ/GD4/DFqLUC2QRcxgQ6FR9ys7XvIfjCYRDvu/xnLHLQniGBlWKGhAqBYijB
 pgbZjQpPGdQKEWXgdbMmhLwqg6pPFG5mmbafScnpIh8ddpqTD1/NGiEqOi+rqu32dO4s
 Gbdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aQ6viqSj
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: bump version to
 20240129
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 2e84e978d1..1562f346b4 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,4 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20230929/ltp-full-20230929.tar.xz.sha256
-sha256  eb161ff8f1966a1f3428fd4561eb20ebb9f83b7519e35cc12fc66bcfa7983b6b  ltp-full-20230929.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20240129/ltp-full-20240129.tar.xz.sha256
+sha256  c302f6b2ca09cbb7835f549777bdb9233fe31f7086d7ad8e65472a0804e3e025  ltp-full-20240129.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 2a8c12fc25..ea57686a9c 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20230929
+LTP_TESTSUITE_VERSION = 20240129
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
