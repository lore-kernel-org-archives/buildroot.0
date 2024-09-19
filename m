Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F14CF395D
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 16:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F8BD607A7;
	Thu, 19 Sep 2024 16:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTHrRMWa7ili; Thu, 19 Sep 2024 16:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DAD5615D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DAD5615D5;
	Thu, 19 Sep 2024 16:20:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62C941BF40F
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 16:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51B76615D5
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 16:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0V5a7LYe0_eJ for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 16:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02EF7607A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02EF7607A7
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02EF7607A7
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 16:20:35 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cba6cdf32so8913075e9.1
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726762833; x=1727367633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BKofBkKau0p1AL/bxckHL+eAmOvzO0xrSufkLlH7Vjo=;
 b=vzGmch2K6tbJuuN50Tuf4eTfzsel1sCQFFVKQlPd0xmBkYBcZvN/ZQhzXXXUjYMElg
 l+/XcSzleKXW2BUuqznxXX7GgTDt580msnzlEHqyIhosabEfRwMYrP/ADcb1mKrS66eV
 Vhmg1DvMoAmVXj0Gu5j2nSBJhNUu6iDtxb9ac0JJ36MOsGEciMW5EiWzVx4FA+4GgSb9
 qGZZln3kHTqLNithloTSHnuLHWKpPpbgb1qLVqVDIy5xBNpuPAaDO4hYenwrei6FwjFv
 sKGRJ/jmRnw/ykG3fEAFlBz4Sz/dE07CCaJerEFBscIeaNrnOqme9XwziHtuFvBQFSwd
 AdlA==
X-Gm-Message-State: AOJu0YzM2e772JD2t4iLfXn97fv1nC6zBVrFZAwJVxmMSPAQfJQgMs5Q
 DUPUIhO/EOA6XOL9lRQ+x7Z4Fmne+8yMUJ5nxJx+Ril7eqjGtcBrdnR6zth+73adI0QWHn5fq8r
 pG4o=
X-Google-Smtp-Source: AGHT+IH4KZeQncZjuVPttn2EV8+4EEHKDHIT4zM3Ppus5nUahhm7PolfDxXEwNu2yjlg4RZlQeFLLw==
X-Received: by 2002:a05:600c:3514:b0:42c:bae0:f059 with SMTP id
 5b1f17b1804b1-42cdb531943mr199023605e9.5.1726762833349; 
 Thu, 19 Sep 2024 09:20:33 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e7545598csm26115045e9.31.2024.09.19.09.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 09:20:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 18:19:08 +0200
Message-ID: <20240919161908.125007-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726762833; x=1727367633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BKofBkKau0p1AL/bxckHL+eAmOvzO0xrSufkLlH7Vjo=;
 b=Tx8JOoqA7DcoF+dLp9nE0M1zJKweP5NZsnsaH/+yZSV3TN6mXhEXLYnIB/KA58YdmQ
 0WBpDZB60GKFn5cYKo8/wxFC7q0i2vKmG4++Y6oXA9B7V8Bc257QzftuBKbx7EXpLRBO
 KfaZfDX54jr38+5BKe3jVsNnLLc9Q1KRlgkmKKY8Bv9YLwD7SccyEoBhE61k3Ea6lQuo
 sZBrq00MA1lr2DnLvNpI3jJIYk+0Hx5xac+sSiBJugk4GDqABy6cAdd/sODVUZ3ybClB
 jzGaCNQHOAFwg90RjZvnZwAOT1J0KOQiV+FDO5Sh6b+TfjHqEh4Tj0OntTr4C0429JZW
 ua0g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Tx8JOoqA
Subject: [Buildroot] [PATCH 1/1] package/espflash: bump v3.1.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Torben Voltmer <mail@t-voltmer.net>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following error:

error[E0282]: type annotations needed for `Box<_>`

The issue came from the `time` library depedency of espflash
(see https://github.com/time-rs/time/issues/693).
The `time` library has been bumped in the following commit
https://github.com/esp-rs/espflash/commit/233490736646ca7bc29463a98df98d7ccf53439d

Fixes:
  - https://autobuild.buildroot.org/results/321/321598baef543b84ce82c09a88e51ad745a15dfd/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/espflash/espflash.hash | 2 +-
 package/espflash/espflash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
index ebe24ef51f..0b1e160a47 100644
--- a/package/espflash/espflash.hash
+++ b/package/espflash/espflash.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8e5da5e90d03135a1b2af6c0b551e4f2504ad64e659b0e88e8a4ecd98cc6a6b6  espflash-3.1.0-cargo2.tar.gz
+sha256  f91a3e33e874bac0d7687d87c3cd692a54325c0dceaf35c983bd3d94519dee25  espflash-3.1.1-cargo2.tar.gz
 sha256  0886cf791a43c02d71c105b4835b53293704ec407a72f84a87f73e20cb2d3251  LICENSE-APACHE
 sha256  a75018ab59a13738ed2024a0090ae8f91b7693ae84568aa0e52c3dff99e6748d  LICENSE-MIT
diff --git a/package/espflash/espflash.mk b/package/espflash/espflash.mk
index ad2294e1bf..bcb343fc58 100644
--- a/package/espflash/espflash.mk
+++ b/package/espflash/espflash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESPFLASH_VERSION = 3.1.0
+ESPFLASH_VERSION = 3.1.1
 ESPFLASH_SITE = $(call github,esp-rs,espflash,v$(ESPFLASH_VERSION))
 ESPFLASH_SUBDIR = espflash
 ESPFLASH_LICENSE = Apache-2.0 or MIT
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
