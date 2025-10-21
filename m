Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E3CCCD19F
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 05:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0D7340390;
	Tue, 21 Oct 2025 05:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQhW5gz47vYv; Tue, 21 Oct 2025 05:59:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E503B40393
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E503B40393;
	Tue, 21 Oct 2025 05:59:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E5C770A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90A7B40393
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-tMEV1bB7g0 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 05:59:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7F4D40390
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7F4D40390
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7F4D40390
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:59:41 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-430c52703b3so43519835ab.1
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 22:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761026380; x=1761631180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uUTD4jo2VItWK43iJZ16uRmBPmzA82Rye52udyk3l44=;
 b=GdWanGiI9aucng2IdUR2RxcNGsJI2578nZOM/lM5goiaIz/jQh73Fz91PYiTswMHd7
 VTkk0maIxulkk5o8ZOjMI9jZ/f6oUC7ckiKaBM4dbNvNpxNuyyKfL01JAFQc/zHC7kEt
 VSFxdcBlS4w7Y8PTHeqf4KTNsgSKfIqZaIAL/vd98pUNA3kiEJ3/QljDYJUJXlbezebs
 dg90r3GZSnmfnvC2wTzP1nIUUnImr7T4DX8IMLo+9pC/gvdqyypTChwKmrQtICaI6sjI
 EnM1iL1tJyrW1s9aZFUdRSZDOs+fVebWJhP/29TvRghV4F9Fcs5fyJdmWfHLyA7iMTNR
 4JhA==
X-Gm-Message-State: AOJu0YxL/m6Eh0prMe5QUsuytAjay9uEaqV0x1Etgrv7oXh1CzFYsYld
 l2x6GRM3D2NLje+Rk3/ikT3ZpOY12+Ky3Q8PzHDrPSmWPVecyRcpiewLpVFxmo/XEUA=
X-Gm-Gg: ASbGncvBAXII7JVob51eOovgZyVU103X8qOSkgbqr3v1cXHTCT3ZszJcNEqK0nr1gFM
 PLXjL9S282gVMBPbBFrPS63UDhrzv+jrbRKmkACZg2mamHILCB9xihOQ/ytzZWAlOCRd19PIUdh
 77dPSPe7yhZCIHGHM+3pjBASqar5oPK92b76HmXQUzA8ZUR8GGLauZGMX2qKTrDgA1G4e0qmgzd
 THkzub8eKRgYw8olQdtquMkZjOtK5ktnAU95rbfcE/Opdh77cUSF9gwSXbysH2IwlryCfjhvSVX
 js8+7kruVso7ryYR9Q3rCzv3Hxgqq9plHNDbck7iNI8PdCgMqWb9irltHsTdUeOT3elIY2cuNJG
 /mn8Bnw8Z0QJutNncT8fZ+5o+iqUB0l7cdYAtlQaUmbS6zTE8726yBK8N7RpJZ+8gnCGLCovnYP
 zLUcuUw0e08P0YbNAX9EhrWQOsjHapyuDvYeyeVbF8Y9xWwMuBFoU7zrTE/OKdq6kvI1DhhuU=
X-Google-Smtp-Source: AGHT+IG/7efOEJ7Kgbh6K1i6ZG6a8bujsdtmqASksHr1UQqnCgXwdUVXtjQjSGdFjpKisU05vsOOtw==
X-Received: by 2002:a05:6e02:1d9d:b0:430:ab98:7b1f with SMTP id
 e9e14a558f8ab-430c52beddbmr242493275ab.18.1761026380437; 
 Mon, 20 Oct 2025 22:59:40 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5a8a973ea52sm3727109173.41.2025.10.20.22.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 22:59:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 20 Oct 2025 23:59:30 -0600
Message-ID: <20251021055931.532861-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251021055931.532861-1-james.hilliard1@gmail.com>
References: <20251021055931.532861-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761026380; x=1761631180; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUTD4jo2VItWK43iJZ16uRmBPmzA82Rye52udyk3l44=;
 b=CNY/KSgORzurU9vOZ2Cz0UHgec7kV2Ijap6gvwX4XMGYd+keHEZJCTwBTPDEDnLl2k
 74p33ZlMVAcFQMhTuaj84B9wtZY+6+/TKezTy6pjew3x9k1nMoNvDtxlmtTfbiBfkHd9
 JqLbx4nx9UKSQa9dT6WMgH5n4dvrAByvOUp0S9B6IZeUJB1F+A0vQtBj0xrvX7TeGCbc
 p4uP800zk9LgJaPaCXSyl5IBfaSRafv+gMjVV22sx2sFWVk+ue7fD0CymVM+vFYViAoB
 g6eqHKiaF/sTxf4LnzIqh4xw8Azg90UWMvXZSa2nrTasZQssumPDywuEDOdqJBvHB0Y0
 n5ww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CNY/KSgO
Subject: [Buildroot] [PATCH v3 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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

BR2_GOPROXY now configures the Go module proxy URL used to download Go modules
specified in project go.mod and go.sum files. By default, it uses Google's
official Go module mirror at proxy.golang.org, falling back to direct downloads
if the module is not found in the mirror.

The default value from the toolchain can be read with "go env GOPROXY"

We rely on package developers to audit their dependencies in go.mod and go.sum.

The value can be configured to:
- A comma-separated list of proxy URLs
- "off" to disable all downloads
- "direct" to download directly from source repositories

For more details on Go module proxies:
https://go.dev/ref/mod#module-proxy

Discussion:
https://lore.kernel.org/all/CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com/T/#t

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Christian Stewart <christian@aperture.us>
---
v1 -> v2:

 - added more context and links
 - renamed to GOPROXY instead of GOPROXY_LIST
 - moved into the !BR2_PRIMARY_SITE_ONLY section

v2 -> v3:
 - split out GOPROXY default change

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 Config.in             | 16 ++++++++++++++++
 package/pkg-golang.mk |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index d730f2034b..23717f3f97 100644
--- a/Config.in
+++ b/Config.in
@@ -335,6 +335,22 @@ config BR2_LUAROCKS_MIRROR
 
 	  See http://luarocks.org
 
+config BR2_GOPROXY
+	string "Go module proxy"
+	default "https://proxy.golang.org,direct"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The Go module proxy URL used to download Go modules. By
+	  default, it uses the official Go module mirror, falling back
+	  to direct downloads if the module is not found in the mirror.
+
+	  The value can be one of:
+	    - Comma-separated list of proxy URLs
+	    - "off" to disable all downloads
+	    - "direct" to download directly from source repositories
+
+	  See https://go.dev/ref/mod#module-proxy
+
 config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
 	default "https://cpan.metacpan.org"
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 26da7be71b..3e388cb257 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY="https://proxy.golang.org,direct" \
+	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
