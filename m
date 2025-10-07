Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F18CAC5B0
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 07:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CADC41B3D;
	Tue,  7 Oct 2025 07:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brRoRKEeWJdE; Tue,  7 Oct 2025 07:05:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D76A41B3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D76A41B3F;
	Tue,  7 Oct 2025 07:05:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42BF0119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 07:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27F82826E5
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 07:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfPPNi7n6Bwk for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 07:05:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1550784191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1550784191
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1550784191
 for <buildroot@busybox.net>; Tue,  7 Oct 2025 07:05:36 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b3b27b50090so1087709266b.0
 for <buildroot@busybox.net>; Tue, 07 Oct 2025 00:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759820735; x=1760425535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPB/kt8BuKfrf4YpIAsnsOEY9yLm9WbxCQFXjQgNAEg=;
 b=wZfI2egFR1U93+wp8OX77ZV553pvCvsFVyu9RVFmmXsx9XaX0ZcWTXN1rQqQgQkSAx
 CC+56D8CI1A/4tX16TekaBg0YNO/yd2SCXh0q6K2DRHKR0szNzrT8DuhZEmcgwMjxUMk
 9iVglVMQ7AwtR8BzPUREAEefFoNLyaFBmiQNHUpaaYBckTgqBcJzSGxYcG+V7zFFNxzf
 BlJghbx9Mfuqm7EXIRAuj4EEuvdlFSprZY+bCpvAz1jR095ImAS0wiCc5L0mO5Us7EkQ
 CEiBpg3HmS2kXvoymSEGuZYCLeKA6g3GlUv/jfcZTNLpcoAA5bzZHMqmdlbXJhCp/V6f
 NPlA==
X-Gm-Message-State: AOJu0Yyb47vUnC9QiADl3p2akAHrhDhZLtUeWh3riMQApa5oVd/S6Erk
 CHnDc3WHlO4jxzS6KIQsDOLKwxijyXU27k5Em5gVok9bMsPux/nbfC33Zjotk//+ScgsnC1voOl
 +NqdzVA==
X-Gm-Gg: ASbGncvBQhrscTa4TLXbTnoF8INoETjJ6VaXbBpfzSH1MbzaEsYu4J7r9QR79AjNYRI
 YyDZ0UwHVTv+riqpE9sBrJ2joEER8cXapyV/ZKj9Db4aqQkFumMq+LDaLoF2LzTyxDLtPAjCNRY
 kVAs/dxdjYiblHuWj5wdK/IiK6D5UvkxEGxo6pV86PDtUVX+z5iPD8l0t+Z3LI9I/RyeXIG0bWZ
 xtbraavbPPeVkZrVYJvnrpLt6qSmPlZFgFOkhs2XPiZDrUrYsfkQIG22+kqWDvR1hNo2zIfR5Qr
 iz1GBBpWkBdqu7ZyjbuROjWowPG9gEWFYhQbjhCJIr9tehjDTDonGrRKna1/VDSH2FUYU9gwjmC
 wL/bxzjVTG9ZEJBGvU/aFHC1zgTfZLAZYjNHpPevraAfexzyp16wEL3Dg9CTrNpJeHzYW9cOIi6
 waZ+1I
X-Google-Smtp-Source: AGHT+IGYE2zIBUoIMfpE8yEoTowDOkvninQWr5uu/TD9MFSu5dfmbdDNEKKhotE8leSsaWNF4BnrCg==
X-Received: by 2002:a17:907:3ea9:b0:b3e:f89e:9840 with SMTP id
 a640c23a62f3a-b49c2052ff5mr1877595566b.20.1759820734606; 
 Tue, 07 Oct 2025 00:05:34 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b2basm1319891366b.51.2025.10.07.00.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 00:05:34 -0700 (PDT)
To: buildroot@busybox.net
Date: Tue,  7 Oct 2025 09:05:27 +0200
Message-ID: <20251007070527.335465-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007070527.335465-1-francois.perrad@gadz.org>
References: <20251007070527.335465-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1759820735; x=1760425535; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPB/kt8BuKfrf4YpIAsnsOEY9yLm9WbxCQFXjQgNAEg=;
 b=K9WK/68eP9itCD8HBkQbSzSWErTPy83X5L2js9qwrBrO9JSu1oHvK0oZgcaQYehnzw
 mLMyWSa9vbetpEaSgt/uWMQ/++kp/KFIHlOaRnGfXuA3cn1FSinOgdYr4IabKBvNyV8w
 Hr4cz+oXm7+aZOxPbeSEbRqbYDFL3RnqZso6aRTltnMo7n2PjGl9dZ7HH0dLYwHrF9B7
 GkBRAoI82TRaVfmini5E9MRxDpLMZBAXK7gfBb/HTkbk1rkNWS1/n9AGJEthOzq5Vl4h
 WTaYsqe+na7Ynzb4dRPr1gIZ/b4PvI56stvClyhTdP8o50GgsQlwaZTD/mcRxYEd7q92
 joxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=K9WK/68e
Subject: [Buildroot] [PATCH 2/2] package/4th: bump to version 3.64.2
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/4th/0001-avoid-regen-during-install.patch | 2 +-
 package/4th/4th.hash                              | 2 +-
 package/4th/4th.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/4th/0001-avoid-regen-during-install.patch b/package/4th/0001-avoid-regen-during-install.patch
index 436cff1fd..ea9cdffe7 100644
--- a/package/4th/0001-avoid-regen-during-install.patch
+++ b/package/4th/0001-avoid-regen-during-install.patch
@@ -4,7 +4,7 @@ Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 
 --- a/sources/Makefile
 +++ b/sources/Makefile
-@@ -120,7 +120,7 @@
+@@ -122,7 +122,7 @@
  	ln -sf $(SHARED_LIB) $(LIBRARIES)/lib4th.so
  endif
  
diff --git a/package/4th/4th.hash b/package/4th/4th.hash
index 8a3126347..50b81170b 100644
--- a/package/4th/4th.hash
+++ b/package/4th/4th.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f96ea74cdb2aadfdc3bebf8d6d2cf7b8976b5d56c1237387479bffaecede9fe3  4th-3.64.1-unix.tar.gz
+sha256  b9f422b910cf99c63315241fd7a72e652ace11b1f78adabbc99628f3bccfb358  4th-3.64.2-unix.tar.gz
 sha256  8c6111b645a02219579ea66e84aa8e78a0ed4f4dd80857ffb91bcda5528717d4  COPYING
diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 08b3dbdeb..0153f2dd9 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-4TH_VERSION = 3.64.1
+4TH_VERSION = 3.64.2
 4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
 4TH_SITE = https://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
 4TH_LICENSE = GPL-3.0+, LGPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
