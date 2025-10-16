Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746B9CCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 18:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AA8740417;
	Thu, 16 Oct 2025 18:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pYmAjgDkZGcP; Thu, 16 Oct 2025 18:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7129F40418
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7129F40418;
	Thu, 16 Oct 2025 18:31:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3114DEC
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17D18606A6
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1lgs6kcU3uz for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 18:31:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CEE7606A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CEE7606A7
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CEE7606A7
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:31:27 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so1030939f8f.0
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 11:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760639485; x=1761244285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ixQDnx5WoQICj5vo6jJj2x3v6+Vmh3S6NBb3wFBLogQ=;
 b=pcBUIkt0sECUWWtDdlfw4YpMlauVRHIaqH5riOZjuhPzywmucDba/t+tyHWjLRgzD0
 z9PFUGNYsaEjbzO6tkaYElHoBElc+w4Y0xZEzNcCNC0oIxnZ3mElI9KiuYbSlOPeaL0u
 fohaA5DfjXwDGCgmx9lBEDm35wP+iIHlrDwu1klv+cIT04sH9QS+TZesO/W33qGMIfrY
 OzUiv3ecoFgx4/tynOlky/awnzWHSZCmbiekTXdOz/XfQCQxRXAbDCWxtZYBAKfSJzHS
 u1GomHLmQ62Gz05dSl5e+rQgljFTbUWhbTIu1APMX7YRgohwY4fuDNORPi6ZvEmJzEYa
 ByJQ==
X-Gm-Message-State: AOJu0Yw2kBnhcG/tirEM1MNysHlsXKd4ush5QDr5/c9guojaSDnR4t/I
 H6ti7G/sMknEfkS8wHf2TU0RJnRnxzX4/IfkgCp18/Xt7452LRaCgsnUsb0K7OmN4IWidz6QL9T
 fL0B0mOg=
X-Gm-Gg: ASbGnct+kEes5eYMVsxRKS0PP9Bg1wESHshQKlLcWCQl6BBbNaoF2PDBMpQv8bHz5FF
 ulAJTZhhmcWGzl8gwqDML1vnDU4oIrZJn7P+i40ywvRLq1wtzX+v1INueCTrUg0lfjcNrhb35JK
 qAtrTyikDdDmaG4BIM2LU2qqwneo5L+tOooPAJ8WHv+kBYZLbNRSuEls3u8zLUqtTKxbis0GYqK
 dJVGDyT5UjgHyVlZueWmrII3k26BF0Ok2OU6xo+AVDdXETChadE/6S5b2Obq8hjldtm+CWcmbfd
 rIn78KyD2ORQdLeE1Mnf+vmb8jfsDNSjp4683rkt/lxn1+fcQtuwFvtWvlRtDwH+gPT0VwYiNxU
 EWuvRC910ocb7eCpjr4aQDs6sA5z1gT+8sbGYKMHJb6G2QkuGG/9GC5kwdnLWobXUVTq9BYFeg/
 WcjomVl6uq8fH2hcB4D/aSu9MHX204cKAQldx2cbQ=
X-Google-Smtp-Source: AGHT+IGsakw/ISswQ10o54fKf58XPA98+Ke3jOFks6AFkjidxuEyD0EmdfpfdjK8KsCgEkAAZiBtHg==
X-Received: by 2002:a05:6000:2387:b0:3e9:b7a5:5dc9 with SMTP id
 ffacd0b85a97d-42704d6d12fmr871061f8f.23.1760639484928; 
 Thu, 16 Oct 2025 11:31:24 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.252])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb36e7csm29655815e9.2.2025.10.16.11.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 11:31:24 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 16 Oct 2025 20:31:20 +0200
Message-ID: <20251016183120.168270-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760639485; x=1761244285;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ixQDnx5WoQICj5vo6jJj2x3v6+Vmh3S6NBb3wFBLogQ=;
 b=LPVVROYXOZIcHQGG6ciiKBiJ7OJGqg1v4/kwYNUfGvTo4uqkmTP6mgDpt0UQVVzzWc
 VE8xkIwNeH682F/1vPYRCF4eiIZ9UV2Kruyh1yV4TRjbKHcZW3/si2E6dRk0uBUlKC8v
 4zLT5f525uSiMST64PkoU/9tgQutgHjoLDBcw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LPVVROYX
Subject: [Buildroot] [PATCH 1/1] package/jpeg-turbo: bump to version 3.1.2
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

License hash changed due to year update:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/f2d1f1cbd431b5b5e3c0c354bddbf8360cdcabd1

Release notes:
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.1
https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/jpeg-turbo/jpeg-turbo.hash | 4 ++--
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 821e78438b3d..d6373f499850 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  9564c72b1dfd1d6fe6274c5f95a8d989b59854575d4bbee44ade7bc17aa9bc93  libjpeg-turbo-3.1.0.tar.gz
-sha256  96f5b328adbb78eeaaec6980d73fd558cb1e4d62560ed615646bc3cf5e532430  LICENSE.md
+sha256  8f0012234b464ce50890c490f18194f913a7b1f4e6a03d6644179fa0f867d0cf  libjpeg-turbo-3.1.2.tar.gz
+sha256  2189dc45a8fe96204069f8124caa53a148dfdc193f50f584c6ca7849a6072872  LICENSE.md
 sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index df76e4d92a23..a25f9e3f385a 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 3.1.0
+JPEG_TURBO_VERSION = 3.1.2
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
