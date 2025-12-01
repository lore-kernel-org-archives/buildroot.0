Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4717AD116F5
	for <buildroot@archiver.kernel.org>; Mon,  1 Dec 2025 14:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A75582C04;
	Mon,  1 Dec 2025 14:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhbFJXTZabNp; Mon,  1 Dec 2025 14:48:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2857F82CF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2857F82CF1;
	Mon,  1 Dec 2025 14:48:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4D23D3
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D666782CF1
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgFAxFjcp0bm for <buildroot@buildroot.org>;
 Mon,  1 Dec 2025 14:48:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D190C82C04
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D190C82C04
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D190C82C04
 for <buildroot@buildroot.org>; Mon,  1 Dec 2025 14:48:28 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-37b95f87d64so37714261fa.2
 for <buildroot@buildroot.org>; Mon, 01 Dec 2025 06:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764600506; x=1765205306;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mk1snyfiiVCO7lKr3L7TpKzRWDI2Efa1xYEfcwPUKzo=;
 b=Pr3N+HxitVksmKwPOiFb5snA4KYKJytyeZmIbzPzgQ8USLq2ZUj9P2hn7ML9YVZLTR
 FOK6WgY1ihzJY6xck47DfvJJoRYy1tv7iNvA0shTqsYLxuCzMn0lRMjnbpSLYBVS8l9U
 iPUZ9HfOcfHUdAA5ZVYnRuTmJbPEnagqPREIpzzMGV+Sy6NFMQFVVuakWWZchZ1riQ8i
 zjlPs+C928tQ/P61roUV88mCe0UnS90RvGckdb7wtXkZvIllprOAzTseGkp941e8ruZM
 atTk4XRYr9f1/3+YP5H2RABFbZIcxPk387JLHU/S+/DQncM18rJGYvCU9mz/+YFx4aJ8
 YYPQ==
X-Gm-Message-State: AOJu0Yw2PUJ5TaNTqIdNMsZOPj0SmvqZmXHp3a/bcLa6emKZ/UgqPIKX
 kINZ1tqXOvNgCl3NH+RYyeZek18w28WkMvQHqfCNXlkgHJQ+0GeqoEd5GEiSnA==
X-Gm-Gg: ASbGncsnnViYVJgHB6ozwyEO/PeA8kQllOn82M86SEAb42y4wCvvs4wUVkaURtXrfq5
 gFAxavraPxh+Kikvt2pjiBf9o/hrgQ2SpvMLSGcQcFoTIWf3YYrTL0ZhSuMmHryKDTqwppEYB++
 YpC8/75k/I2YVxRGVdYpCoPn1bsobUjL0xQKuV855qiUZdlXQ0Rs+LON25YKLdPCYI/0zlCJGRM
 ujmFWhl058+EcZ87+YhZ2nlQDlJClG1iDM056n5MRA6bMajSIgO+NtXElM/iPnZdzgWzpV/Un/l
 3Bt1tHP3H61kU6aCAHydaOwCCm1uwH2W+SLM2p3afTGCbtU4QlPu2ADJQnPhixk/zlS9UkDOzmf
 XVsueSOI60h5mAAVUYZqdTtekAbpNfZ6jGxwixvbdObQwsjgK4ilK3AWHL5/0Nof57+puYz7I74
 W/4sc=
X-Google-Smtp-Source: AGHT+IHlcF6bDrLi3mojszuoQ5bF48g3Ho4VNgYMLgmvHcMXSKxQ8Gt2Bg3B7gKMpQ50pjxmr9IGeA==
X-Received: by 2002:a2e:8a98:0:b0:37c:dc91:6287 with SMTP id
 38308e7fff4ca-37d078bc289mr63591791fa.36.1764600506241; 
 Mon, 01 Dec 2025 06:48:26 -0800 (PST)
Received: from freepad.. ([2a01:e0a:6f:bdf0:3ef2:5482:bc9d:e21b])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37d2368e543sm28487831fa.7.2025.12.01.06.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 06:48:25 -0800 (PST)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Maxime Leroy <maxime@leroys.fr>
Date: Mon,  1 Dec 2025 15:48:18 +0100
Message-ID: <20251201144819.193967-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201144819.193967-1-maxime@leroys.fr>
References: <20251201144819.193967-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764600506; x=1765205306; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mk1snyfiiVCO7lKr3L7TpKzRWDI2Efa1xYEfcwPUKzo=;
 b=WtKkUoGBGSGbMD4H34yqZI+PVJBhKwG9HdfM37U2fYyspvSXa4csLKHYAgDkILybdR
 TjyLT3bJr6IKrAfy4zn9Z0yps20kVR/0xAmV62ySgWbQ2y9Mvdq385akGx/3DzHzTh/5
 UwmYClIODiPNaI3oR/wwUOOrHzZGKL2EjHoYjBH+od/R6GP1fiNgyERVEF7PBcRqUc5A
 XgjnDHxt1p2NmBMfR5CbLs8csEx9DxhR40LynikbZA/k2oTikJ1iaXO+O0RlIAUEgHxv
 Th5wj5Zx4VGmz4b0iViPmTwgggPQKhS+tQ40t1akCJLj46ONQCzrYpWuq0/PVUq0VMoR
 2EVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WtKkUoGB
Subject: [Buildroot] [PATCH 1/2] package/frr: bump to version 10.5.0
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

Update FRR to the latest stable version (10.5.0; see [1]).

The 'lib-make-getloadavg-optional-in-late-timer-warnings' patch can be
dropped, as it has been merged upstream in FRR 10.5.

[1] https://github.com/FRRouting/frr/releases/tag/frr-10.5.0
Signed-off-by: Maxime Leroy <maxime@leroys.fr>
---
 ...davg-optional-in-late-timer-warnings.patch | 49 -------------------
 package/frr/frr.hash                          |  2 +-
 package/frr/frr.mk                            |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch

diff --git a/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch b/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch
deleted file mode 100644
index d03f64882e..0000000000
--- a/package/frr/0001-lib-make-getloadavg-optional-in-late-timer-warnings.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d76100a2b9a2ec814ad0a1fb844a395a6dc2f6bd Mon Sep 17 00:00:00 2001
-From: Maxime Leroy <maxime@leroys.fr>
-Date: Mon, 11 Aug 2025 13:44:02 +0200
-Subject: [PATCH] lib: make getloadavg() optional in late timer warnings
-
-Commit ff76fb21d7b3 ("lib: improve late timer warnings") added an
-unconditional getloadavg() call. Older libcs (e.g. uClibc, dietlibc)
-lack this function, breaking the build. Before, no system load was
-shown, so skipping it restores prior behavior.
-
-Fixes: ff76fb21d7b3 ("lib: improve late timer warnings")
-Signed-off-by: Maxime Leroy <maxime@leroys.fr>
-Upstream: https://github.com/FRRouting/frr/pull/19366
----
- configure.ac | 1 +
- lib/event.c  | 4 ++++
- 2 files changed, 5 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 87eba6784a..b8ef7bb777 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1369,6 +1369,7 @@ dnl ---------------
- AC_CHECK_FUNCS([ \
- 	strlcat strlcpy \
- 	getgrouplist \
-+	getloadavg \
- 	openat \
- 	unlinkat \
- 	posix_fallocate \
-diff --git a/lib/event.c b/lib/event.c
-index 1eb41d07ce..22876574fb 100644
---- a/lib/event.c
-+++ b/lib/event.c
-@@ -1924,7 +1924,11 @@ static void event_tardy_warn(struct event *thread, unsigned long since_us)
- 	double loadavg[3];
- 	int rv;
- 
-+#ifdef HAVE_GETLOADAVG
- 	rv = getloadavg(loadavg, array_size(loadavg));
-+#else
-+	rv = -1;
-+#endif
- 	if (rv < 0)
- 		bprintfrr(&fb, "not available");
- 	else {
--- 
-2.43.0
-
diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 12030a0df8..3ba034606d 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8e4003eaba168626c5ea7a6735f2c85c87b04214e6f8c8f2715b21f8ae40970b  frr-10.4.1.tar.gz
+sha256  a84b973e713349dca09e2009f33dc499564f2e9faba01c0d3cba9204802b0cd5  frr-10.5.0.tar.gz
 sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING
 sha256  f9e0c21faf738da586281c0beaad3cd56204c19085a10fe05e4d3d7f8b5863d2  doc/licenses/BSD-2-Clause
 sha256  aca297b8fd3a43e3bb200f1e2e043c0db6c897325f5ff7f23f7530302a6bf713  doc/licenses/BSD-3-Clause
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index e41ee33caa..9282e13fbd 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 10.4.1
+FRR_VERSION = 10.5.0
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0+
 FRR_LICENSE_FILES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
