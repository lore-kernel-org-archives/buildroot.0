Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD98CAC597
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 11:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4018615E1;
	Sat, 20 Sep 2025 11:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8fTAqHwNw16; Sat, 20 Sep 2025 11:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15283614B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15283614B8;
	Sat, 20 Sep 2025 11:10:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35161D7F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26A0E82258
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLXLMiLWzmcW for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 11:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23AB58224C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23AB58224C
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23AB58224C
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 11:10:35 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b07c28f390eso528844666b.2
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 04:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758366634; x=1758971434;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sC6G9ZuHvrfcGTfaDSJa2qA7I474uqNIfdn9IEqwPYc=;
 b=ijwg92Uz9BP/XojWwV/IJdE+nJWZIK8j1CD77CeAC5Wj2gU9OBBaw0sOO5LPYl60H8
 AkH6pAwmoiSGEweyd0TIUwonV9e7+a3Em1M3Zz6klwob6vlqZCA6sisuoNHTJcjE3t7m
 nFs/ZYAya+1CdO6IDv5AQdomic1yi7eUadJhP494pYcvRO/RgZqaIKePmKwN3wMZuJqv
 HZ7i1zIdNGOvajdpvMSEV0833YrTIbpnmn3fvvTdxEIqKifHyCEssjWtllQsX6wzwLTB
 fsdnOrb7ldfJsrD59GGxjdyOBjd8bPpjGQv/8ingFGo8BmG7xd2+bekJq+vq4Ks1zyB0
 ezug==
X-Gm-Message-State: AOJu0Yw8SFJW9qvXtxNsYi1gwG642jkDx87ZlLHZoKANnBHi6jqgs7yX
 kj5fhT+wad+cdg3O29x5oNkRMLcwwdSvXa0RaTj2EmRVQxZ74MkWZvL0BQG12Un8nqSWUDLjhPk
 HULX7
X-Gm-Gg: ASbGncu+aJsWKWK4sccG8gnQAXrL4Am2xoSrqYVbF9LnGJFibh284Wc7+DK2bKhn+xE
 bpTl4eEV+dkq+0KbOvci+Qlv9V90TfTTtkntyS7pMCNBPFVfByArDoFcp0ousIAaLl9VX1iD0HS
 9h7f0RL7j0mL/eqe1l/n5XxtiEkLAXAjq86NTA+YyR2NOB7h2yXavgxhcY4csrS2a9NZIWIZV6K
 EesvKpLFb6vwFIW5sc+jjyI2osq62OK3Lj2eWRHfwBEyqw+dMepmQeCUDVRUitkR66i8OWCuj+t
 CDRvsNYt3uW6wf8BOvW2SF8LmFuBWS9eBg3Et1zOns6PvY38SuemAsEPnr0A9wBSUJpD7E+4lQn
 uIXZjvhMXb6LcfjdzGYuLVh+MN0g6OrcSi3jLt2WpxFRCd7d8d2GyYlvRIUbqe1pfHjY5OODr6J
 VkxHQsg9m/r/DBQE72KePm5r1fVBjLXALElPUp669pS4UTwCxUQ0upVYG+ZcTq/xCg
X-Google-Smtp-Source: AGHT+IG2a4pyw7UBG+En49ulhLH9NV1LlFvE7yh5J0xksTgc1fsQRpr33fJSPmVPnC3EYyJxRpw/OQ==
X-Received: by 2002:a17:906:7310:b0:b04:858e:c1ee with SMTP id
 a640c23a62f3a-b24ed886e06mr715296566b.2.1758366633626; 
 Sat, 20 Sep 2025 04:10:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b29912fb4d2sm27474666b.14.2025.09.20.04.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 04:10:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 20 Sep 2025 13:10:28 +0200
Message-ID: <20250920111028.2574590-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1758366634; x=1758971434;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sC6G9ZuHvrfcGTfaDSJa2qA7I474uqNIfdn9IEqwPYc=;
 b=eCgFG6du+OMypEiCVzlQwyF8604WgaofrJjUTutn4z56dL7VcBLQlhgVHRWBAhDj+a
 jKcdEKc6y4Gor4i7Xo3mi34IOr25Wdl1AuUjtV/M7+q8cuCf0qIdcKVHqMrTz6ofRpRm
 v6cyIabgs7Hw8LbshFgTSa0eYqXjWrjopNaQw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=eCgFG6du
Subject: [Buildroot] [PATCH 1/1] package/atop: bump to version 2.12.0
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

Patch 0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
was removed because it has been integrated with commit
631defdd22e3b6872c440d368d7acf459150eea5.

Release notes:
https://www.atoptool.nl/downloadatop.php

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...he-user-to-pass-additional-CFLAGS-an.patch | 32 -------------------
 package/atop/atop.hash                        |  2 +-
 package/atop/atop.mk                          |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch

diff --git a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch b/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
deleted file mode 100644
index 0fc8f142b14a..000000000000
--- a/package/atop/0001-Makefile-allow-the-user-to-pass-additional-CFLAGS-an.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c8e9d2b885deca065bd7955019a6aa071974042d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Mon, 5 Aug 2024 23:38:08 +0200
-Subject: [PATCH] Makefile: allow the user to pass additional CFLAGS and
- LDFLAGS
-
-This is needed for some build systems. For example, Buildroot needs to
-disable optimizations on some CPU architectures.
-
-Upstream: https://github.com/Atoptool/atop/pull/314
-[Waldemar: rebase on top of 2.11.0]
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 3a63f69..ab44eaa 100644
---- a/Makefile
-+++ b/Makefile
-@@ -21,8 +21,8 @@ PMPATH2  = /usr/lib64/pm-utils/sleep.d
- PMPATHD  = /usr/lib/systemd/system-sleep
- 
- PKG_CONFIG ?= pkg-config
--CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
--LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
-+override CFLAGS  += -O2 -I. -Wall $(shell $(PKG_CONFIG) --cflags glib-2.0)  -Wno-stringop-truncation -Wmissing-prototypes -Wmissing-declarations -Wformat-security # -DNOPERFEVENT   # -DHTTPSTATS
-+override LDFLAGS += $(shell $(PKG_CONFIG) --libs glib-2.0)
- OBJMOD0  = version.o
- OBJMOD1  = various.o  deviate.o   procdbase.o
- OBJMOD2  = acctproc.o photoproc.o photosyst.o cgroups.o rawlog.o ifprop.o parseable.o
diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 8774fb577dea..aeb9a469d7d3 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  9b94c666602efff7bf402ecce706c347f38c39cb63498f9d39626861e5646e20  atop-2.11.0.tar.gz
+sha256  0d09ecc90c14e6ef41c22e3c57c142c3e4fb9cf3c94379077a33c961d5343086  atop-2.12.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index f7dfed5e8df3..b4a5bda52e40 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.11.0
+ATOP_VERSION = 2.12.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
