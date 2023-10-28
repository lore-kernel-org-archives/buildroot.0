Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE23C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB15F4017A;
	Sat, 28 Oct 2023 21:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB15F4017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Igs8MSSIOFLC; Sat, 28 Oct 2023 21:10:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C35BC403D8;
	Sat, 28 Oct 2023 21:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C35BC403D8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7272F1BF869
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B70C42F22
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B70C42F22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlvAvre2mEup for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:09:11 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 387B9408FB
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 387B9408FB
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-313e742a787so1840166f8f.1
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 14:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698527349; x=1699132149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tVxaAdsKQlYvYtc8+mPKGOZj6h9ATW/j6vltAl7NJmo=;
 b=BWAkP+da1tlGMRv6RY5iuk/oZmsIIM+BIN5KAHeYP6f9D3IE68jQfHk82uG44+aexp
 IDrkNUc3+s2cBRvZId5d5ns1p8KyqpI7SZvNWhup6ZPCIwn8mljKyZnZnASkqobduTqY
 COt3NBZTiohtP968jyX1Tk3oLV7BOpiHYt93RXCD2viKYXbNeKeVCPj6jOl6wYf4tiv/
 MIpInU7kuuxUabS/QSK6/W2SY7ttea7d1s/n6KwyLEfWlsqO0Zvu4M+EQb0uj8Q5cwOy
 NwIn0DvHPXDmYTS8ChVG7lXvdgbw9jceMcEXfYh6ZO5Th7HrV+H7igK3B37woFeMRyK1
 ta6g==
X-Gm-Message-State: AOJu0YwAVV+2nfVJ6A55Aia+k0wdDN/Mo8pQ6tXRTLqopq5d3PBmUdkR
 cSDHIJqQklDIHLruD1aVMkf0NXiAflQ=
X-Google-Smtp-Source: AGHT+IGnQV48UfFvtnXKbTSQU2NqZ//FFueTpnwYuKsTncKhVPNer04cvXRlkxwZ4uFBqTtFUtEK1w==
X-Received: by 2002:a05:6000:1004:b0:32d:a4d0:1364 with SMTP id
 a4-20020a056000100400b0032da4d01364mr8992429wrx.29.1698527349293; 
 Sat, 28 Oct 2023 14:09:09 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 by smtp.gmail.com with ESMTPSA id
 n17-20020adff091000000b0032da4c98ab2sm4604050wro.35.2023.10.28.14.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Oct 2023 14:09:09 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 23:09:07 +0200
Message-Id: <12e7348f0897e91fac5ce1b331939424340e7e27.1698527340.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1698527340.git.yann.morin.1998@free.fr>
References: <cover.1698527340.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698527349; x=1699132149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tVxaAdsKQlYvYtc8+mPKGOZj6h9ATW/j6vltAl7NJmo=;
 b=hCjTQywHVwYe9AenKNseqD/VPAD+uiTvBEInT8k/J2sn+GmlG57reR3yv3KG11Xmt0
 ADJYCd6ArxDRteouHsUkKOmHG9yrMNKmzab6eYKrvG/2AbZhfigONaRV0T+Xe1YMBZtg
 T9+/g1lOA3Ykhs98xMp04EAxPY4EnDbvm57vwdFxBDkgHl0JhKxUNR/LbHGPvovJyP0c
 ql9Zw/NPb3lerjJZcZDJuyAwpICABTkZGBPKNpwnjyi/mqjaV5F+eJRgRMgol89mglAL
 PYPiU4O67RXRSELUvUzyZHFKx6fL7S5sny5YNeO9/niA54UeZZQmLGxLh8F/6pr420OU
 POJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hCjTQywH
Subject: [Buildroot] [PATCH 4/4] pkg-download: add option to enforce hash
 checking
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Martin Zeiser \(mzeiser\)" <mzeiser@cisco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, when a pacakge is downloaded from a custom location or
version, Buildroot excludes such a package from the mandatory integrity
check with hashes, because it was until now not possible to have such
hashes.

We now have a mechanism which users can leverage to provide additional
hashes, and so custom versions or locations can now be checked too.

Buildroot has no way to know that hashes have indeed been provided for
a custom location/version, and so will still happilly ignore an
unchecked package.

However, users who do provide extra hashes most probably do expect that
no download is done without an integrity check, and thus expect that a
missing hash not be ignored.

Add an option that users can select to make Buildroot forcibly require
at least one valid hash, and no invalid hash, for all downloads.

Reported-by: "Martin Zeiser (mzeiser)" <mzeiser@cisco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in               | 19 +++++++++++++++++++
 package/pkg-download.mk |  5 ++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/Config.in b/Config.in
index a808e51a68..7808947a05 100644
--- a/Config.in
+++ b/Config.in
@@ -700,6 +700,25 @@ config BR2_FORCE_HOST_BUILD
 
 	  This option will increase build time.
 
+config BR2_DOWNLOAD_FORCE_CHECK_HASHES
+	bool "Force all downloads to have a valid hash"
+	depends on BR2_GLOBAL_PATCH_DIR != ""
+	help
+	  For packages where a custom version or location can be set,
+	  Buildroot does not carry a hash for those custom versions or
+	  locations, so the integrity of such downloads is not verified.
+
+	  Say 'y' here to enforce downloads to have at least one valid
+	  hash (and of course, that all hashes be valid).
+
+	  Those hashes are looked in files in BR2_GLOBAL_PATCH_DIR,
+	  using the same heuristic as for the patches. Additionally, a
+	  file named 'all.hash' can be used to store the hashes of many
+	  packages.
+
+comment "Forcing all downloads to have a valid hash needs a global patch directory"
+	depends on BR2_GLOBAL_PATCH_DIR = ""
+
 config BR2_REPRODUCIBLE
 	bool "Make the build reproducible (experimental)"
 	# SOURCE_DATE_EPOCH support in toolchain-wrapper requires GCC 4.4
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 0d38ff7a5f..a7d856d2c4 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -66,9 +66,7 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 gitlab = https://gitlab.com/$(1)/$(2)/-/archive/$(3)
 
 # Expressly do not check hashes for those files
-# Exported variables default to immediately expanded in some versions of
-# make, but we need it to be recursively-epxanded, so explicitly assign it.
-export BR_NO_CHECK_HASH_FOR =
+BR_NO_CHECK_HASH_FOR =
 
 ################################################################################
 # DOWNLOAD_URIS - List the candidates URIs where to get the package from:
@@ -110,6 +108,7 @@ endif
 define DOWNLOAD
 	$(Q)mkdir -p $($(2)_DL_DIR)
 	$(Q)$(EXTRA_ENV) $($(2)_DL_ENV) \
+	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(2)_DL_VERSION)' \
 		-d '$($(2)_DL_DIR)' \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
