Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D75CCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 18:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABBA840508;
	Thu, 16 Oct 2025 18:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPm3Xfkiyqbc; Thu, 16 Oct 2025 18:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 222BE40418
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 222BE40418;
	Thu, 16 Oct 2025 18:30:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 26BDDEC
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23F8780BBA
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKWYAhQ9lhbt for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 18:30:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 10BA180BB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10BA180BB5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 10BA180BB5
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:30:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e504975dbso8903555e9.1
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 11:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760639401; x=1761244201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Esqef97u9YFKXZjl+P4zlhagujOiRbE3F/UaoK2A2C8=;
 b=kv8D6wOp1kzi/JL+ZyTkPvE16WSCEtOe48ghu+fwkovt1MZrS1Qmrz3uZ3Lp9pypOU
 yUFNwGuVimeeXi5ZzR90ip7FnHhyFpqdOGrXK7PCnCu4ZfZuKNO+Yf6T1tBxkJovSqnu
 EXAIZZi/qoA2bCNrv85cw2NdKlXKxhbply0LfBiPCxhxOz9ETAER3msU+Ir3zCmCaSpr
 QW+RShdHqDwSPRL/9pA69kTC2b/iGR5YDUEYVdlEGqViESr82cxmpsi74AmM58hRm7TA
 5xxq28EQHI2FDoWHzlVVDUoi0vdzeTJlWXi+wGpp9JHgJolvlNZlZhW18Enir2CW8uVJ
 8b0w==
X-Gm-Message-State: AOJu0Ywil9+geCrdsStcXrjfVbRkwZhNc6ujjZTtMHorTkqKtcG5HIt7
 1T9fM0F+Mu5LUdNq2Qa5OoeW84crCdwwB0svSdxK9fnDVGL7zRF+MKX1hswXFrtbWrmjW/IsyBY
 eq9ggsEw=
X-Gm-Gg: ASbGnctVuueP16TK0B8uC+dmWwYmPDj7u40/JbdFU7ujFMZiD/lqHA/rUGeHZoJcjoK
 g8+e31Ce8q3ABKhubtS8pcjH8jCBFtRfD4WU6vX5dJzI+Ump/O0wG/6y+jGrWBRKaHA5Xv8LxQY
 Qpm/8x9OF7voP8pF4+H9Hzdciy7mZ5D/01ctWViGY7Wc/Fni4KP11QCLwZKd4meluX3nJK2uB31
 dg5MTWZtd0+B6SqtLZmNKo53YOZrENA4C8GFpxVzc4cqGFPYCkYkymFJnXNC1I6102QgACXHgTi
 co3p4JqvZlx6m/HrVI0XDmgg4dCgBxuR25RBWYB/dBYevmBzqVXUXpK2pryzCl+9K1owftdTHoK
 Go19y/1pOMpm96u0kSYnR5Lr5IxaYziswNVj/PfT1a+PgTREiWGgFvpa91HuywVYfipPB2EB0WH
 nP4TysKZHNXbwuq+lIeMnR4WobeskPgdQo6V1vkPTui5D9ZOxHUA==
X-Google-Smtp-Source: AGHT+IFC2gd/0LvSSH73Wr8BXolfBx06THF2FfQhmJp+MdkJRNMJpSMkntst+N6R+KUMNoqmaf7t/Q==
X-Received: by 2002:a05:600d:41d0:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-4711792590bmr7477425e9.36.1760639400786; 
 Thu, 16 Oct 2025 11:30:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.252])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711441f975sm40832695e9.4.2025.10.16.11.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 11:30:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 16 Oct 2025 20:29:56 +0200
Message-ID: <20251016182956.167483-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760639401; x=1761244201;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Esqef97u9YFKXZjl+P4zlhagujOiRbE3F/UaoK2A2C8=;
 b=Y/mTRcGs68Z0PsaFfHJFx7fP14s7/0Ieb60hSHgMcWK62DRYcq0ZAijVrxPMcSroRE
 1BXJTee4zpTkH8BpYrys6KOatrpz6VKBY4l6NLIFZVN0YsikW1qVzaEmzi8XihkYNRgg
 fgg1EKbzA3OWmEM8BXB9v6Fy6b0Zz5A4lY6vY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Y/mTRcGs
Subject: [Buildroot] [PATCH 1/1] package/jitterentropy-library: bump to
 version 3.6.3
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

Release notes:
https://github.com/smuellerDD/jitterentropy-library/releases/tag/v3.6.2
https://github.com/smuellerDD/jitterentropy-library/releases/tag/v3.6.3

Update file hash due to update license dates:
https://github.com/smuellerDD/jitterentropy-library/commit/92d3c68cea4b82f229a2407cfe45303fcb62c05d

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/jitterentropy-library/jitterentropy-library.hash | 4 ++--
 package/jitterentropy-library/jitterentropy-library.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jitterentropy-library/jitterentropy-library.hash b/package/jitterentropy-library/jitterentropy-library.hash
index feb15f0fca87..91ce4d98fc27 100644
--- a/package/jitterentropy-library/jitterentropy-library.hash
+++ b/package/jitterentropy-library/jitterentropy-library.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  ddd23429cb6bdabbfeafd2b6aaabfbf1959dd7288887334dfec5ff099a2e9f3e  jitterentropy-library-3.6.1.tar.xz
-sha256  adbfea86223ce2c1f410353054fbbe8d7936dd900ff0d373301c959300c2214c  LICENSE
+sha256  9dd50f94387efadd05a10f25f3224fb959b125cb8e9c188356a74944034f0ee5  jitterentropy-library-3.6.3.tar.xz
+sha256  088d208b9d22530691f1e9406a85dd7f6f5a42e3cf23d3d6df6582408e3840f7  LICENSE
 sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  LICENSE.bsd
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE.gplv2
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index 28a0f7da616b..f1ef36d3b358 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JITTERENTROPY_LIBRARY_VERSION = 3.6.1
+JITTERENTROPY_LIBRARY_VERSION = 3.6.3
 JITTERENTROPY_LIBRARY_SOURCE = \
 	jitterentropy-library-$(JITTERENTROPY_LIBRARY_VERSION).tar.xz
 JITTERENTROPY_LIBRARY_SITE = http://www.chronox.de/jent/releases/$(JITTERENTROPY_LIBRARY_VERSION)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
