Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241FDEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 05:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C35E60E51;
	Sat, 22 Jul 2023 05:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C35E60E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DtI-8oPSTU30; Sat, 22 Jul 2023 05:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCF660E4B;
	Sat, 22 Jul 2023 05:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDCF660E4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8771BF2CB
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 05:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2A4660E4B
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 05:02:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2A4660E4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OBAuuaR8yzYh for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 05:02:56 +0000 (UTC)
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7856860E13
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 05:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7856860E13
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3159d75606dso1941229f8f.1
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 22:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690002173; x=1690606973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i24taI2tZJUsYbpbYooEfCUez8llTPiAiTvAW52alhw=;
 b=AlvNMPBZPVSNk6jgnjaZfcFkFH2hzgE6zNSeYqMoxBe4Kl98qDZhSrR2Mo422c0JrS
 poX55yH87ieR2g2Vlz4rBI+192ljt03sGGuDoLje8FULbmF7iFzEz3jXSgGYTkabzYlZ
 cGnw3hwdD2oNDXn7RBWkJGsGDAjRXkgDdRlT47V0+ajXjNjuMAH1XtvQNtxMCdSI4M50
 BHs6wwfRcNF1cgMjRPNCOatCoBin+0RnmfGT9HA8OtdNIZYmfW0OmJ8oRdEDmmlvSGOj
 yDxsqhbjFHCVX74I5vsypTNC3z2tOZxm2II5dFJ8KeIuU00CxL4IlI1/0bLzUZO8FwnB
 mhMg==
X-Gm-Message-State: ABy/qLbrJvWtSnXnRAjUntzkqaj76faCWJTQ4IT1WcFXlJbgA0d3g5VH
 3XXrhpM5TS080yls/ygf7sL3PGTzUEF+Pw==
X-Google-Smtp-Source: APBJJlGLbd0kvVC17yZPvuHvCVT3yKRN6TvDutb0+nL2n9U4WfQNpPzIk+JjBw7dgEz7wWR+eK4ofw==
X-Received: by 2002:a5d:4e8b:0:b0:313:f4f5:2ddc with SMTP id
 e11-20020a5d4e8b000000b00313f4f52ddcmr2436361wru.62.1690002173109; 
 Fri, 21 Jul 2023 22:02:53 -0700 (PDT)
Received: from localhost.localdomain ([147.235.53.124])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a5d4fc3000000b00314329f7d8asm5888917wrw.29.2023.07.21.22.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 22:02:52 -0700 (PDT)
From: Ramon Fried <rfried.dev@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 11:02:46 +0300
Message-ID: <20230722080246.429168-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690002173; x=1690606973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i24taI2tZJUsYbpbYooEfCUez8llTPiAiTvAW52alhw=;
 b=jY+zS9uEJ62Ov7v4GcqEaUo9iN05GvgCoQKB0BcO1HICJQOtYAyMuyicdYkTJUl/iB
 VJU4Xp2Cuh9Umro65FNcRNR2fOJlQQNwNLNud+/TgAuQeF8frIocHZR7BNTyDZeyM8Tx
 vQm1vEySXESYKfm8JcVBp5uuMz7nBDeB16FiUWAnfO9kDBRmZVgjWa2flbBlW1hHi+GD
 qW/hqsJN+ylvyKkZDSVy/T/g/wf2QGy73sEuxgXovzi1GDGtPS/7djhAhE4hCxx87ZV6
 jyCDhX3TOm4igEpz3EoxKInmjJl3AkJZelZF892e+rZ4kWatM59gN8KPshczjEQ297b6
 axHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=jY+zS9uE
Subject: [Buildroot] [PATCH 1/1] package/bitwise: update for 0.50
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
Cc: Ramon Fried <rfried.dev@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 package/bitwise/bitwise.hash | 2 +-
 package/bitwise/bitwise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bitwise/bitwise.hash b/package/bitwise/bitwise.hash
index c8daa0aa64..9da1a4c0c5 100644
--- a/package/bitwise/bitwise.hash
+++ b/package/bitwise/bitwise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f524f794188a10defc4df673d8cf0b3739f93e58e93aff0cdb8a99fbdcca2ffb  bitwise-v0.43.tar.gz
+sha256  806271fa5bf31de0600315e8720004a8f529954480e991ca84a9868dc1cae97e  bitwise-v0.50.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
index 33d8f6776b..5bce92fcf7 100644
--- a/package/bitwise/bitwise.mk
+++ b/package/bitwise/bitwise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITWISE_VERSION = 0.43
+BITWISE_VERSION = 0.50
 BITWISE_SITE = https://github.com/mellowcandle/bitwise/releases/download/v$(BITWISE_VERSION)
 BITWISE_SOURCE = bitwise-v$(BITWISE_VERSION).tar.gz
 BITWISE_DEPENDENCIES = ncurses readline
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
