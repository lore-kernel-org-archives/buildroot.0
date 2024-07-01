Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAD1C3065A
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 17:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1371B60A8B;
	Mon,  1 Jul 2024 17:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbTZKIRvXBGi; Mon,  1 Jul 2024 17:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21CB160A9E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21CB160A9E;
	Mon,  1 Jul 2024 17:53:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15CF61BF342
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 038D681D18
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 17:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuTFGmBD6AGx for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 17:53:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 118AC81CD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 118AC81CD0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 118AC81CD0
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 17:53:21 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-376069031c7so13663735ab.0
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 10:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719856401; x=1720461201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hbcAsiTsQydBw8IxNxNlDiHTeyTkKXkRZxMPqZBh5vo=;
 b=jPReCU8izI5c/NGixC8dXTJJAqUL/Rj3BEjYoW5x9d6R76t+hcLMVyjjjAurOY8l1T
 bSjYn2LQ1cg1mKKEs/xPQ7uho4+bm+auJbIn4RUwVgqlrps9c0NoSraUSC28Lh6BnrOT
 3kOM0Dh2y2U09B5dB/TEFoO3GHijwVGURDeADjtsjHBFyi+G2GbMOV1pl32Rb8Qg/f24
 2DVi37f7MXNYD2u+bSvZbjTeVC587n/2gNic8Y/SFqFQ3hzbqeoMWN3qUM3rkMI79h/j
 TPu4v58Pe3Es6TV3lFiZMPHZL6c5f3iNg5SqQcAQARnWbuiB/+68vGT/cw71mBu8jO4z
 XfLg==
X-Gm-Message-State: AOJu0YyNHeQ3lhqJPFkv0reheQUAs4IcyITzvupJ56+il4h0wc/rQpPZ
 Ox52rzJA0AChnNmLnmo6VIsr2odIxbS2ZIUS6MMaFGKUj/OE/+hufE8oGg==
X-Google-Smtp-Source: AGHT+IFyRwU3aVxst455ldWpkVzpt4gj2sI88ByG06uiVxJazyHlOuPDPsFaVSewqdrK5x7NY6emBg==
X-Received: by 2002:a05:6e02:19c5:b0:375:8fa1:529a with SMTP id
 e9e14a558f8ab-37cd0fd5c8amr75667115ab.10.1719856400876; 
 Mon, 01 Jul 2024 10:53:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-37ad483bb05sm19746155ab.73.2024.07.01.10.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 10:53:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 11:53:19 -0600
Message-Id: <20240701175319.1729258-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719856401; x=1720461201; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hbcAsiTsQydBw8IxNxNlDiHTeyTkKXkRZxMPqZBh5vo=;
 b=crrHJRcxJacOIzjZ+MjSHPUBSqvsJxPd8HRHhmYPk+K1AWFTinZdkd+X5KvBLIof2A
 Jji7KDRz20OYStF1mMihH3qXLiJye9PdycNipWI6DR/IIbtUuo14b3ItYVb3tqal2orC
 b7HjeiD3AbxLP9bW7CtRYeWfhqj4b8IbwIcTyvuVV+sXyXooXrkQ8u+OxoUHqjU8qj1z
 eZGkVV3TUdQv6LLfpQ76q9OYDKDOG5UHBogqg3RRyDPl0jXQFFsoAYFbyPGBHALIGJMM
 1d1ZEoUq5HgA4vVRRa0OBhFm62fmA1gVskq4CT3cDXbzB72lWo2x0YdWJ6/1CqLiP8L9
 ve7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=crrHJRcx
Subject: [Buildroot] [PATCH 1/1] package/python-hatchling: bump to version
 1.25.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index d49bee8bfc..b01d3df254 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  63a3c6480c0805c55ce396e1ad246e78  hatchling-1.22.4.tar.gz
-sha256  8a2dcec96d7fb848382ef5848e5ac43fdae641f35a08a3fab5116bd495f3416e  hatchling-1.22.4.tar.gz
+md5  ac265366ccd17365db319dc95a9e5bc5  hatchling-1.25.0.tar.gz
+sha256  7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b72e734df6c74f4262  hatchling-1.25.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 91f6597dfc..2ca2caf67c 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.22.4
+PYTHON_HATCHLING_VERSION = 1.25.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/4f/2a/c34d71531d1e1c9a5029bb73eb3816285befd0fffd7c63ffa0544253dca8
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/a3/51/8a4a67a8174ce59cf49e816e38e9502900aea9b4af672d0127df8e10d3b0
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
