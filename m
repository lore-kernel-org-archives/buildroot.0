Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442EBCD13DA
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 17:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C285610A4;
	Sat,  2 May 2026 17:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RV-2_zaFdTHn; Sat,  2 May 2026 17:38:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AFFF6102F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777743512;
	bh=UDOFJSDY/ERThiuk0CcgDL8qkc9U0pKA4di4cKp+cuY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C6fZWUTlLll3fkXnLFbwnDooS60w4igQ/pV2J76O2m2Lf/o3AOFXGEqIcsyP28rHE
	 bv16+MCbz/iYKnAL1HYjAKWqcolX1rGqbhoBoGndv+zj40xa+Ouf+2veEn1PIVZ/sP
	 U4LcIZw3L+/XlXLdeGiw62ktyIyGHFGPs0MbhjbvA+lgAS0Dhl0K6nbvP3s9bbN2F3
	 1c7+rZCDgA8cYiws0NJaQdWom3EWpi0SsgaUOgH9aeTFqqrnZuo74ypjpCjcYKd+dL
	 u9fVIqVI+y4+8gVeP2y4R/eq/P9kngQq6kD9mTUrE2nmqFJSM1ZcdT0hx+5kR1TUHx
	 mYYRKQD1sItMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AFFF6102F;
	Sat,  2 May 2026 17:38:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B6771190
 for <buildroot@buildroot.org>; Sat,  2 May 2026 17:38:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C23F40060
 for <buildroot@buildroot.org>; Sat,  2 May 2026 17:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oil4FfeF64Fw for <buildroot@buildroot.org>;
 Sat,  2 May 2026 17:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A697740029
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A697740029
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A697740029
 for <buildroot@buildroot.org>; Sat,  2 May 2026 17:38:29 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-82f68b3aaf7so1182031b3a.0
 for <buildroot@buildroot.org>; Sat, 02 May 2026 10:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777743508; x=1778348308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5xwagSm5JmcU0tb6nCy1dVj5BT43OAApMRMwdlHkdsM=;
 b=bsRA5ft+2c4s2RiSrb77gwux7nZIMRVLYZmXnfe66upu5h8IVuLRfHBDm1pGj8tQSf
 UnfUB1SH5ZWmTBtfb5xL17e7WwfN25DCa8aTJOYUlz4u0RQN4P1NBSJ2egt4kePUQmLk
 +eUq8t+QIurK8D0GSWOcvQ9eU5uPInA4sFmnEls8CM7UfZo9bmXTJPKgTj/OWZ9Z+PEY
 XO+f7CbSSBHYP3Svle2cYLHgXZfw3HcbLUrfA8b7sWEqFI6XyOxxKoBG8xCJxDk1g3IQ
 O/8FyAB9dDVb2nNvkrt6URs+7EPqSeIxZlKDKKTfNwuGDdT5xKadybBAm+HZSfg3cN9j
 312Q==
X-Gm-Message-State: AOJu0YzIP2ivZMEha5Dz+J7fesJOJ5FqsQa00Nwnwgv597qNpoEHhFwF
 haMoAt2m4cYFQ6hPGxAJh5lcQYjiIL5N1p1Jx40dwN4gp/wy9+wk7H9J8Vr3cuWA
X-Gm-Gg: AeBDietbBT6pMZs4adnQoQuo4LhaffjdwsObZ/r4HEgLVEKCWjxHHZmwWA3tyWEgB0T
 SK3dXQnaxOBKZwXYaXVQ6ZX7pN4SWPsfULmA4wNpLrval2acrtQJVcASRguO6PmN/ZXFNhYVJJx
 J7wdwJvsgPImo5PA7981m8Fwwn0d+o8Xyi5rTUk5vlxjlVlhytcM69PCwfQSIZbK7p/3HvOI+Sw
 Tw2MZqPObvZWOOqYLriovsROrhbm6xiYrfZtmpQOIROobKkQGpZsf6dnKA0vQ4Iy+5wLcaHVqxI
 PR1g9/NScn5JCDrMk/YT/i4FUI+ss8k2LoAT00fRE4y2WILqTuyriDOLiYp/e1VHd0zPOGyoEXU
 06rn22bL5CblK82Qjh/saZOgQrvmH6TPPhiI5Ml5MlEdenO5mSKUIuDlwBBR4vyvVMEF71cfDyq
 lcT40uNa4eeTfKujylKveuwgOmaqd1BIiajb3UckEaGik=
X-Received: by 2002:a05:6a20:a103:b0:39f:4d08:7555 with SMTP id
 adf61e73a8af0-3a7f1a1db92mr3588696637.5.1777743508366; 
 Sat, 02 May 2026 10:38:28 -0700 (PDT)
Received: from fedora ([47.31.93.144]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83515afca48sm5479008b3a.40.2026.05.02.10.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2026 10:38:27 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat,  2 May 2026 23:08:05 +0530
Message-ID: <20260502173806.2666814-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777743508; x=1778348308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5xwagSm5JmcU0tb6nCy1dVj5BT43OAApMRMwdlHkdsM=;
 b=i9DrLJVjgceeY7Ylhu+ZEv1OUJM4DVFuqDY0ebZbenPdtDCZsQZL1OfmwaRTnsjWrn
 YXTd9GY5y5SfuDzkwUOpV59opWrS7AF5rKeaFl8nhzZLh1AOs02DqlYvVVRntgMDKsic
 tR+e30lrbh/czXQnHrR5HCl0KpzBgKJvvA2vqqEFiOUwj6TU8sBiGRLkOr/SbKikCTVU
 05SnDq3KMdSkqNO56AhzQNMgUAr8l+LWVt+w+fWLLEqjRT39SrEnYTCBzMPzUENVvT0J
 HWA9lhKbWAKnQNAGEJAAvZecndiRLvMtN0oXp5hefbfruulfccGk3Dw6WZo7PTDh75AI
 j8pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=i9DrLJVj
Subject: [Buildroot] [PATCH] package/ncurses: bump to version 6.6-20260425
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

- Fix poll() handling for closed input with proper errno
- Security fixes: limit-checks in _nc_write_object, _nc_trim_sgr0,
  read_SGR, and _nc_mouse_parse
- Terminal updates: konsole-direct, mintty, linux-alt1049
- Various bug fixes and improvements

https://invisible-island.net/ncurses/NEWS.html

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/ncurses/ncurses.hash | 4 ++--
 package/ncurses/ncurses.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index fe9bdbe915..ec43b2ce48 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  9796dfb0e790bac2a994a86df83adddc1a96021cbc02c44c4f2ea886069bd91d  ncurses-6.6-20251231.tar.gz
+sha256  d1d6c09657d0de3a9d3bba4fea3309a6523d4c1de1a787a9294c817b4da154c6  ncurses-6.6-20260425.tar.gz
 # Locally computed
-sha256  708999f95527e1ffa670c6fce288c6c600cb477dd04afcc1171422b3dd4ee226  COPYING
+sha256  a85ca5bef8ce71f013bc5f4306c681881b248450f3b63722589891f0b69ea52d  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 5e2077500a..448b2a7f24 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -6,7 +6,7 @@
 
 # When there is no snapshost yet for a new version, set it to the empty string
 NCURSES_VERSION_MAJOR = 6.6
-NCURSES_SNAPSHOT_DATE = 20251231
+NCURSES_SNAPSHOT_DATE = 20260425
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
