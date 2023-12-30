Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1AAC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 18:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDF6E60ECC;
	Sat, 30 Dec 2023 18:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDF6E60ECC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5xdHi-t_myvz; Sat, 30 Dec 2023 18:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 023DD60A7D;
	Sat, 30 Dec 2023 18:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 023DD60A7D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0E841BF29F
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8750181BBD
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 18:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8750181BBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_PM_g_u2BoL for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 18:21:34 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15C1481B6D
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 18:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15C1481B6D
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d5ac76667so30835395e9.1
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 10:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703960492; x=1704565292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gViGtrRdJ8ccym/r3ZaTSyqYIXHFvVH/E4KbB1GZros=;
 b=vFDMVSETw3mSMx0+QNdR2UIjGcCs3ctwcdj2Zr9AD/yIH45Yl2/ULm1UGtTX3/BGz7
 1V6u1Jv8rviHiD3cwCCI7NysIJyeJY4QwOlx0A5pz2gGiQCgE/PYLwGmx+UV12k67OxS
 6t1AMWBp7rukzFJfwytVo7agQdqdOHFY1gGjb4tZ/xaLC+zKhb0RjKL4q+SjKcw5foGf
 V940YvtCSzQAPZt+pzcDGJu5VO+vjJ8/AlUXdecFJULPitR7Ga6tbPR1jBgEfMTn08kD
 kbkPn0a4cPZ/n1JQQC4BJvpyLtHvOFEmi6RVIbMeULC+mDwu1JwU1SeeBi7NMAvkXUYW
 HQtQ==
X-Gm-Message-State: AOJu0Yz4bfzhJZ7MZlT9RjwPM8R/phWsEolvEvNDaYXuVWNy7d7XYC3W
 69xE97HrQUuOzLX3uKlzfZduB/YVnWA=
X-Google-Smtp-Source: AGHT+IFgB/9MZxz6qiBQNAoKs9GiLxKi0G/tApqDEgLG7k2IhPW3R2PHndXoM3ZtJyXt6E92r7XZOg==
X-Received: by 2002:a05:600c:1f95:b0:40d:6453:a910 with SMTP id
 je21-20020a05600c1f9500b0040d6453a910mr2120258wmb.104.1703960491663; 
 Sat, 30 Dec 2023 10:21:31 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c350700b0040d2e37c06dsm34746119wmq.20.2023.12.30.10.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 10:21:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 19:21:29 +0100
Message-ID: <20231230182129.1038499-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703960492; x=1704565292; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gViGtrRdJ8ccym/r3ZaTSyqYIXHFvVH/E4KbB1GZros=;
 b=IqKV+kAchPPSWtn+P2NI1bbNeyttpTGeNw0V/xY1hFzIeR355AnyYsd9P82VzN6Zgm
 GyFEuP2UgFLAVLqsVMliWdebB9/qUB2bnAo4CTiEvkIlfF8V8h5oUnYWdZ40D+M46zmR
 9QxGp7dHpTTAjXN14q/X6+7fVtcRz26hkC6VdjQIwibj0oLEs7XboqYucl9J8SdT9iNa
 tRgiPrjngiOxwq4DSP6FG6SLZ0flm2DbIZAJpqo8nueMwORCTffYBw+pYtY+xtNLwytb
 LoxRzyXQGrvLWrsEP1SU3PqunkmYkEJriiVPHtCLEQKwOF55NJufZATjd/IKVSRv8w/e
 V+OA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IqKV+kAc
Subject: [Buildroot] [PATCH 1/1] package/neard: bump to version 0.19
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.kernel.org/pub/scm/network/nfc/neard.git/tree/ChangeLog?h=v0.19

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/neard/neard.hash | 2 +-
 package/neard/neard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/neard/neard.hash b/package/neard/neard.hash
index 1ea95c938a..b739d7289b 100644
--- a/package/neard/neard.hash
+++ b/package/neard/neard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c013e3115315e2e11d16b5f0f1c8ce9afbcdba26800aad91245fd9b4a5dc938b  neard-0.18.tar.gz
+sha256  129bbf69488fdb599d480356765941f111d7799495d0d64095b25e893c4d2be7  neard-0.19.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index 51ba52fb90..c1804c48a2 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARD_VERSION = 0.18
+NEARD_VERSION = 0.19
 NEARD_SITE = https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot
 NEARD_LICENSE = GPL-2.0
 NEARD_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
