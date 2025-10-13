Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E91FCCD185
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 20:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E335441025;
	Mon, 13 Oct 2025 20:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_ru8HWbtU9U; Mon, 13 Oct 2025 20:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6393B41007
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6393B41007;
	Mon, 13 Oct 2025 20:20:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5AD0294
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9783441007
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YTxl8XWFUQUD for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 20:20:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A3BC241002
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3BC241002
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3BC241002
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 20:20:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so25235105e9.2
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 13:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760386819; x=1760991619;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w5n1IZkcK8GBAOIqASt58mizEgZ3A7sLqUjku+6VTcc=;
 b=akDKgRfxmnYmGM1SfZnNXEWM4HX9pS9/n2kkFeVukbsAJqohNSSQe4PmTZy45p3NRe
 2AXIXXmN3FLJbpEoZabEHYd/LwG6qQ4zTNtBUU+kHDie4Y6+W/y0okzdG6XmOBtGrH0z
 heFOesxOSoXvrsOwRgmyQGXS/w6W5845AvGIIALMT4u8LU+Tqoi9R68+UC4ddceBD34i
 j6deat1P6VZkAmUh2DIgQ17xoD4PDFncBHUi5QyXt+kpxQNnHfhZZTb37S2Gw5XjR02R
 wlGMOPWWg3UUpkSXNhBQdDBLgU/FTsf2mz22Jh8WPo5koxPfNsX/MViOCG2IgCRk7QaF
 OLZg==
X-Gm-Message-State: AOJu0Yz9kJpCApp5cpTPKVbz3zLDL72VuzScA1Lf/ZWlWAbb9jmvQMSO
 8NmiblI5c9AupMHs5qzyCAWeThmE2PME/MjPhiXwHF1uHmH+URGlr0HUiQ0/EhbExw8NVjUouKC
 MDxAaS0k=
X-Gm-Gg: ASbGnctU9bVyzgai/mRK0aCAsmB/ArrrPsCr7IX9UyuSpjYNOp/WJqMCjTBcF0aGQzn
 ax1O5q3BMbPMF5Xtv4L98wGiKzvnOhvCIPYp2phgxHdbTSjcShnkDQnxBpMkFnvH7SYVhQDKrE5
 9uBu0RTnwUUgFi22gtvWSDWEauWub/7i3Y0LoMcrouSKWPw3rrf23IgTW6n584dxWw6nJaitmTd
 YvanAWiUtnV3Bfamg2g/c9aGJqU6rNAG5CEy8820zS922w1cQNZ3npzZZP9YR53H/nw1cwhF9wG
 /I6LjqRWZpKjw1YJU7gl1Bhs6//DCmv5fx9hBlUeQLb09TIsqEYsoryvcratAwCHVvc7JDMZRaC
 AF8zhkHOzuo5mp/5s4kh5U++jGzyLECCgLbIxaHS1Sa9ic0wpq4E5/LJlZE4VRb+Qz/aX4k+jMV
 bETClxLfz86+0W3Zici+8BgCM=
X-Google-Smtp-Source: AGHT+IESiz3oDfwXUpj4JCvvvQ5FAHQPaS5xQXw77UW6RRo1VdwlFndgBLMImL9d5YC+QG0Y2dgSuA==
X-Received: by 2002:a05:600c:a43:b0:46f:b32e:5094 with SMTP id
 5b1f17b1804b1-46fb32e50fcmr142013325e9.32.1760386819537; 
 Mon, 13 Oct 2025 13:20:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426e6f03a76sm4376878f8f.36.2025.10.13.13.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 13:20:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Steven Noonan <steven@uplinklabs.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 13 Oct 2025 22:20:15 +0200
Message-ID: <20251013202016.3834946-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760386819; x=1760991619;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w5n1IZkcK8GBAOIqASt58mizEgZ3A7sLqUjku+6VTcc=;
 b=hmysviUxRf9rwkYBKQC2z029/Dq4WqLihMDZTWplcs6oC7QTIguxGncOISQ57BpGSw
 1jgUCpdUcDDtEgciqd5zxfhsaWi2cPPff2KxIKBamsvzeAihhRQ+HpVQdZYYeL3M89a0
 6xKT9QfWzE4uxtbJvvvkHl4QMO7uZUr8iZ+Hs=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=hmysviUx
Subject: [Buildroot] [PATCH 1/1] package/hwloc: bump to version 2.12.2
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

For change log since 2.11.2, see:
https://github.com/open-mpi/hwloc/blob/hwloc-2.12.2/NEWS#L20

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/hwloc/hwloc.hash | 6 +++---
 package/hwloc/hwloc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index f85508b7a644..0e5da51112d7 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,5 +1,5 @@
-# From https://www.open-mpi.org/software/hwloc/v2.11/
-sha1  8c15d9707c2390bcdc564df11395a36c8fc775be  hwloc-2.11.2.tar.bz2
-sha256  f7f88fecae067100f1a1a915b658add0f4f71561259482910a69baea22fe8409  hwloc-2.11.2.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.12/
+sha1  be96a4b54da92fce34e5c7f68c719ab778e058fa  hwloc-2.12.2.tar.bz2
+sha256  563e61d70febb514138af0fac36b97621e01a4aacbca07b86e7bd95b85055ba0  hwloc-2.12.2.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 0d03757d8353..fc999b3750e6 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 2.11
+HWLOC_VERSION_MAJOR = 2.12
 HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).2
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
