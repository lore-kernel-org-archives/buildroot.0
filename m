Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205E2C433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 21:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9628840180;
	Sun, 23 Oct 2022 21:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9628840180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXCgOH_GdaEh; Sun, 23 Oct 2022 21:42:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCC064017E;
	Sun, 23 Oct 2022 21:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCC064017E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14BAF1BF33F
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 21:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E771E813FF
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 21:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E771E813FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2e18kPJZDawe for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 21:42:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE2DD813FC
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE2DD813FC
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 21:42:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso8840268wma.1
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 14:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2jrtOvKQbb8oRUhMTgWuGWR3QyfurPXiES3VG7Triac=;
 b=Dqkz+rC8nvc7pk6R+ATDrnlhnujHZOk4rnJuZ/UZsnj4feveQ3bpmRLZCS4veWLjHn
 EnsFSv8U89bOnSsra70CsBjotP6+CYOmPTZ3wY9+xyTsAmYmy5EuQM0Z3Rpj4klGrJJs
 DfhhG/BUGMvVMP6XTmVCccqjT6Tl/DLcAsU5tXYjXpgnwZlq5BocAUc/EH9D5b178gt6
 v6YsHffSnFHXHmAA07LCXEtjA7WmNZ/Hj05TqvZXviJ4bonWelH9mIrvj4g4F/Le8hLG
 knsILfaUbKSW/xEv6Qs2vpdHX0uIynu5fro84pJnuk+9e/aJaggywOTCg2cJkoA0EhBt
 Z+IQ==
X-Gm-Message-State: ACrzQf1eHSQPDt5I0tWEkTMtC8bx+So4FA7FjA561lPHUsnUjpTHSr3f
 0/8nQUNw2X58YCXe1+BZbwBTb2Zw974=
X-Google-Smtp-Source: AMsMyM7s1WT6TZFEt/15F1nbjeSY+2xJGqS6ksF6EfbsNtmnChdzjh1EznoFwEnabRFDx5/ngaPYJw==
X-Received: by 2002:a05:600c:4f07:b0:3c7:13ca:8afc with SMTP id
 l7-20020a05600c4f0700b003c713ca8afcmr11239889wmq.199.1666561342927; 
 Sun, 23 Oct 2022 14:42:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 ay17-20020a5d6f11000000b002366b17ca8bsm2932516wrb.108.2022.10.23.14.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 14:42:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 23:42:20 +0200
Message-Id: <20221023214220.70941-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2jrtOvKQbb8oRUhMTgWuGWR3QyfurPXiES3VG7Triac=;
 b=ULaGduQRlzwVYykiAi+khahbegrjcbssoAjvcwAJ8xv4wBIU8e8Q7k1bgURzxXEeZi
 ODokEr/9bwZFiCuTryl9ycIW0kNITNVbDwI/FWqYjTHpf3YSjlYpB13wdbTe+4dGzEI1
 r+lPWdWA242iSDKLtZJMQu7M7yMEOW3IpBDuv7aw28E9CTMI84kPtOw/4BCEJTxInqTx
 JvUegNa4EExkIiSrY8nOUnL7exMHwSe4J5d6CRBVkhqGLhZ1mcbB67bR0gu/yvuDkxqc
 enulrXFXr4nWsdEcImxTBFgFG6iT1n5AmeLqTLxYTIV4xsatrSNpGNryz9u3PMZtVhTl
 L7SA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ULaGduQR
Subject: [Buildroot] [PATCH 1/1] package/iperf3: bump to version 3.12
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of LICENSE file (update in year with
https://github.com/esnet/iperf/commit/76bd67f6e90e239a7686202d2b1b595159826d24)

https://github.com/esnet/iperf/blob/3.12/RELNOTES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iperf3/iperf3.hash | 6 +++---
 package/iperf3/iperf3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index c96d68cd99..15c75b6dac 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,4 +1,4 @@
-# From https://downloads.es.net/pub/iperf/iperf-3.10.1.tar.gz.sha256
-sha256  03bc9760cc54a245191d46bfc8edaf8a4750f0e87abca6764486972044d6715a  iperf-3.10.1.tar.gz
+# From https://downloads.es.net/pub/iperf/iperf-3.12.tar.gz.sha256
+sha256  72034ecfb6a7d6d67e384e19fb6efff3236ca4f7ed4c518d7db649c447e1ffd6  iperf-3.12.tar.gz
 # Locally computed
-sha256  0e1cb1921904626f0d3e86cacc0e28333140f0f9957267cff0b9d185645743ed  LICENSE
+sha256  a5c2e3d799f2835156e565a3de4fad33d32ed289cdc9e414dfaf75719fd12ef9  LICENSE
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index 8c57c61fce..9041c86575 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.10.1
+IPERF3_VERSION = 3.12
 IPERF3_SITE = https://downloads.es.net/pub/iperf
 IPERF3_SOURCE = iperf-$(IPERF3_VERSION).tar.gz
 IPERF3_LICENSE = BSD-3-Clause, BSD-2-Clause, MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
