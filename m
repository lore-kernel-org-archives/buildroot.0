Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BF1CA9ED2
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3A7D8088A;
	Tue, 13 Oct 2026 08:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7n1S5VgtkAP; Tue, 13 Oct 2026 08:37:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C593D808A6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791880674;
	b=WunFLk/+9GvQuUVAerX+nH15X5GeW8cVSB8e9vT/KCTZ37c6BIpKttG42ytXHhSP7nK/
	 JqFz7NILZvVffKvCcbpfScz2iTlwq73GjX4PtkWD9zqPMZE03d34bkfTOT/agDr++2hHw
	 EbG0O7rbTUuEjXbowhi9x0fAGei3TwSbzqHV1z9hLTafHExCA11CVsy9NFjXsUmP3ma7n
	 Q6hXsaNo6r0pKeH1uCIAwMr4YkGF9tWCNqTXDfRgJjkn/vCtx8ee5Wf2g2mmr50HwvUlQ
	 0dI9X+iCx54H9pMJLolAmVHfVA9BAyW3/0VN2dv690aJ9GgcX8Fg02V3dkm9NHKKTHQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791880674;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:X-Google-Original-From:To:Date:Message-Id:
	 X-Mailer:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=jN4uublIz8skyyWFiIumbE/r0kdnvlA1BFSxuZVWSXE=;
	b=VjH6cXEjb109VBO8ChfaK3MyTA+HFv2fBVSqa8GkR13qOfuE2AMHnzjOYGcfmuZLbiqb
	 lgKR78jjtTVGkY1tiFmtFJgMyvZgMrb55y6rTadJ17UUziMcKxHWmK+YoulIZpXwYvfAs
	 bU55rMhTac7dE+5w5lwWki/qbLlJ4Oh0m57UvBlung8rhy50T8WELsF1+BLUzhyITdxZK
	 BF3M8z1l8dvOU6X1lNGkwH2IRZdkq3S5fgLdjgOvvNF5zN2bozzMr6MIqXHmKxCrHpus6
	 NY+jhLkv1UGVnK46x/geVPQP234AtkvMwrrCmW2dIjTulk1ouQ3/VHRy8cmsvAV+15A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=JHFGZ780;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791880674;
	bh=jN4uublIz8skyyWFiIumbE/r0kdnvlA1BFSxuZVWSXE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=nz9fZwxFeqk91p/FH86V66jbTQtYWzDdo8gGuf4j31kH0QVw2vPBf5N6mq2UYrCtB
	 Rx+JuE4131q+h83Ia5GYyumU6glPIUoR2h6claRdEVlibfd1cCd2to8cLbDX1tWXZf
	 ubxFwkYyZBDX9Ig2dW/ZK5tGy9pz2Vl2Wvvxc1Ht4Bm7rt4IP2QojHVmcDkg7ibiJ2
	 rPMyhMVEJ20goh4quQrKcWybid4r5s3iIMRVri74yliMV/PAfb9FyNnAMUc0GRM348
	 k5OGdOdJJHQTgZEyU3N1gb+vKwJWzlpeulH+SP8Ov6V8CqcnE8NKAXXHy5wVqy4wRM
	 haqzzCiKnK8Eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C593D808A6;
	Tue, 13 Oct 2026 08:37:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1C3B788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2B69808A6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndu760rI_-78 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:37:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6BD4A8088A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791880672;
 b=Jn53/oNM/pUQ9evnmCPPNn4m4tbX5M/+6fal01ndwyICk7PHqQHex9hp0Vv23hAI3haa
 RxEGOWHKpOWptjJZqIXqcYYqHrIo5YU/H9M620apTa33AC7vtLzigC0gKjCkEk6ONhMC5
 rfWCRxMOsUxYcllW0IDdK7FCjSVDD8MqtUshBvCrf6jeRR3QF3p2zI9g5VCj+Is/v5YoG
 IRzmZTgxlu5ZQ/rhvf94G1EbFvlRtnKr+3I+FvTFPkWk0XEj5cRRUdqIP6uC2EkDYYTqM
 oWzwk7mITTBd4fAv4ZzK8KP15bhfWWAnvOIVvfYajtRLdt9XtfNweFzlrDOa/p4Gn6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791880672;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=uD6maTC1osiMehEZc3RalcJY0pMsTeCcBgnD8v+VasY=;
 b=YStEtMD725bzCxe2sitmYNZkAjKFVnD5fb8z4iVA3P2fJaxFK97KKkys7KqYA0clsla8
 d96wddmdmb5YPohHOx6zzweqKaqupjcqBUkSIG6+LcvkXK94rIsYtTJg4ZfRK4TMR371v
 ILufGBkVMkPaFTrNI3GE+GpYBPc0CcLX0STwW0t4GK57uaKJDZgxb1iGO65FSeVuw7ZgO
 B989BAIVhF4ZdDHqi9H6tLoLy62NFcK/euVn2oVeOi8V/3bk+xKhgx7We5KdYktkVbSTS
 S+BmyAuhzfvbhs771PXpgyHFxdyurSRRWND7AQAEdz062Q2vGH8lrxcVgbEtfgeYtYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=JHFGZ780; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::633"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JHFGZ780
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BD4A8088A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:37:51 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c2afa22e1dcso373747566b.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 01:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1791880670; x=1792485470; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uD6maTC1osiMehEZc3RalcJY0pMsTeCcBgnD8v+VasY=;
 b=JHFGZ780w2SbSWYPN+YS6bV6kE9jxtOm7TCOMDJl1krBkJ/NKSYJmrUTspmlNskTTF
 k5uvCpLWQ0FLhBbHQ9unxck+pwwq6MpFGbb9oygGQ4RtcbaYLkMYuVD8WvPFG3sVo5QZ
 gd7eih4G/mfVb6kDhGCgjtFlKJle8N+IDe7yOW9IEcMVDriYoOwfhxfb0YcC1Siu5WCx
 ZPRlhJZ3Hd+SgXIfHwDyGY9dkC4uBK3FfzS4qHcgahX1cu4vDHbBl6I1Vwm2I3ZgRgAQ
 oBz0oLmHuXsGdqAUIJA2nloaV/1YUBpC1PghxK6ZfslPsNbqCzj6mn9449OwpHVAKv39
 TOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880670; x=1792485470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uD6maTC1osiMehEZc3RalcJY0pMsTeCcBgnD8v+VasY=;
 b=GHtrRJF+J17kHH2TO1JKbHVGOtk1ZN7OHkchTJ3/WWpoaAY/vdOaKNMWSMHBvoJ11Z
 k1C41lPCnlkcpnj4D+a41kyXERR79OADUr8dHyWSLdcdmMW9PtN6vtewpNvScxW+fpNH
 ijED+gPsGD4kbFKT84pnozYaCL4XPbv07gIaYBD0qfWe5aA7kgOypHsnpZWhuZ9srL3U
 swLfAIup4uFTl5GHv9qpIgy6IOml8slfwNbl+dUDRKF+a26/FUBwJAdg1jpbH/jhDF6o
 U6ACXDCay/3hdhzbL4RSqlb5ny/SznzHrVFFCNO2aio8RiNwEXmTZoDS0DaeYt+tSC2b
 iEiA==
X-Gm-Message-State: AFq9FYKVMgWwqIYDzkvLwJ/dDDi5ZTytgHpQ/r2luSxLZKKXom52fUdT
 BB6mrhhcXtpUQqpshJrQ/jjW4bNorKvLT8QfH5FIlaE9NQtVW8wRdLVuVSVUzQ==
X-Gm-Gg: AYBFou0DieGaxAvRQnJDzZ6FkBM7qwsX9iI4yFB+pAirkWw9didSg7CFWBEZAUQNDn1
 tioDndFIpExFY1M5RRNe15Gdapju+kKNIDI5lLcGSqKdK67tJtt7i2UcpNS/qTUfagIfWmBKh+v
 Jw1vZgDZa1IUYCsSIRkvPeH/7D4kcNFjzF5W9CJaoICAQT87kfwB93HpLbqreXYLqy7TtxNM//h
 nSBByb2sdJlBqcDhaC26deJiQzfvS0QEQP0F2D/uuSDuxIrPf084HCokMrVrarYVO+X09zVCrkV
 EqAvAY2o7/CChWIIgpHLWaCAdUoWwZquVwhCIoXwf0ROCoJmbHN3h5rHCTybSRkfJBBjuH+Lhxn
 UX6N15moVCMOg1A9wmLzbTiEdfe+7xlObcOoNjzNVbRrDtyP+8/ts6aR9+3VgghwAW3N0Ukl+Ro
 2QDrqNqSXV/cEtlHHM9iVWTijhZUF4kErokryhUwu2cgpbkOy9XCvc7fnz0i+dyM1xtV0dhlZWq
 QMKWuDqYAwe4drABY1m2THg7nHWElFZQY3tW1eQXwp0d4U=
X-Received: by 2002:a17:906:c105:b0:c31:5bb8:4b3b with SMTP id
 a640c23a62f3a-c31a9a335femr1159431066b.2.1791880669546; 
 Tue, 13 Oct 2026 01:37:49 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c34feaf0751sm201933666b.35.2026.10.13.01.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:37:49 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:37:45 +0200
Message-Id: <20261013083745.1590149-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libuhttpd: bump to version 3.14.3
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
Cc: bernd@kuhls.net, Jianhui Zhao <zhaojh329@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This release updates the bundled ssl library, which adds support for
Mbed TLS 4.x and OpenSSL 4.0, and fixes HTTPS connections that should be
closed being kept open.

Drop the patch, as it is included in this release.

Release notes: https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.3

Use the sha256 hash provided by upstream.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 ...1-fix-cmake-required-minimum-version.patch | 34 -------------------
 package/libuhttpd/libuhttpd.hash              |  5 +--
 package/libuhttpd/libuhttpd.mk                |  2 +-
 3 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 package/libuhttpd/0001-fix-cmake-required-minimum-version.patch

diff --git a/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch b/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch
deleted file mode 100644
index 097a44cf85..0000000000
--- a/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b9bf3936b3778912444eff7f7866db1d66f4c50b Mon Sep 17 00:00:00 2001
-From: Thomas Perale <perale.thomas@gmail.com>
-Date: Sun, 6 Jul 2025 20:14:31 +0200
-Subject: [PATCH] fix: cmake required minimum version
-
-When trying to compile the project with CMake 4 the following error
-shows up:
-
-CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-This commit bump the minimum required cmake version to meet the needs of
-CMake v4.
-
-For more information see:
-  - https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
-
-Upstream: https://github.com/zhaojh329/libuhttpd/commit/b9bf3936b3778912444eff7f7866db1d66f4c50b
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6719e5f..0392f25 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- 
- project(libuhttpd C)
- 
diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 7f0ecc0030..d1c003058b 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,4 @@
-# Locally calculated
-sha256  ce2abbc599a922c4bac12f1cdf3e9c9740f387f819a54ca01e9fed60905baa40  libuhttpd-3.14.2.tar.gz
+# From https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.3
+sha256  ba54b06e63da50e493531bc342624195668c2ec8215f37b66f00f83f1e260297  libuhttpd-3.14.3.tar.gz
+# Locally computed
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index dca26fc3c0..7932ccc2ad 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.14.2
+LIBUHTTPD_VERSION = 3.14.3
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
