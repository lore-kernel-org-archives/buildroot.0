Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C006EC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 22:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 782D260ABD;
	Sat, 18 Nov 2023 22:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 782D260ABD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PzxkdHvH-Q2R; Sat, 18 Nov 2023 22:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CABB60E78;
	Sat, 18 Nov 2023 22:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CABB60E78
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 165E91BF354
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E42F160AF0
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E42F160AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kb0YvYdMUhqb for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 22:12:18 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1912560ABD
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 22:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1912560ABD
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6b5cac99cfdso2871540b3a.2
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700345536; x=1700950336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xxa1hEGZkUyLunK0qRd0KlMBXc2UCZzavyM2OgPfJ9E=;
 b=iSqi6Hly9rMpReC+BbBrzSTwX1qiCXp21bIK2o+RI7Gi9sIB4JIfyk/8edmk5zntUF
 ocaPApTxy+yck7AiKIAWTG9mlQ2g+v7knV/l8O1DdHnrTcXcWu3K0Ti9AIHiTCamphwC
 olGR5pi7SzX3SBRa5IsZ9qf2Fx6fDmfJUA2hPK5vTL0SzI3imCCL5+6VaWOSBWfRQFha
 Ag7zXMLjpFCO+YcNUDzT2U/fiwPBAQatPiJhAuSJikA+3Y41a3suPR8IKODuOv2HBCAQ
 4iLSpqY42zs7z40hbLHt6MDa4bXdJPYwZ98YEyTaH3a5s5sYmPsxV2qoPWpnZzttNAB+
 Fb+A==
X-Gm-Message-State: AOJu0Ywo/PG9hsB4Rgk013QkFZg6KTWX0vCMj4Uq08p4b/is5MbIQmne
 ZLssJwn6/4AkuLSFZZ1/mDkTFqdhku+5Azl7BtMRbw==
X-Google-Smtp-Source: AGHT+IFUL0NARZoat3QgRq4bpS3yMrwcJnI8hehMxBL6UIxjib56fjxBTckm0v0WVF2nKEibrp4Ucw==
X-Received: by 2002:a05:6a20:7351:b0:189:6cf6:849c with SMTP id
 v17-20020a056a20735100b001896cf6849cmr3084495pzc.15.1700345536691; 
 Sat, 18 Nov 2023 14:12:16 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 jw19-20020a170903279300b001b9da42cd7dsm3423699plb.279.2023.11.18.14.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 14:12:16 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:12:01 -0700
Message-ID: <20231118221206.1369389-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
References: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700345536; x=1700950336;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xxa1hEGZkUyLunK0qRd0KlMBXc2UCZzavyM2OgPfJ9E=;
 b=BdrYlSi70qWya7IWozRaZ3h2LYwJfMxLnKDP90/cZfYk9NsFRjOH8B4ieAYd3npx6O
 WCQWqmzUEW291DBJvvJPOiPSluZBX3zgp2qDlVtHRBLF+SpiPu5j9FzgUP7AVhlVClvr
 Q/VcXVwDSvwL+/QXpkWYKY9JAuspymwLjG/KU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BdrYlSi7
Subject: [Buildroot] [PATCH/next v2 5/9]
 package/flutter-sdk-bin/Config.in.host: add pub-cache location option
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When running the command "flutter pub get," the plugins are stored in the
pub-cache directory along with their sha256sum hashes. The default location
of the pub-cache directory is $(HOST_DIR)/share/flutter/sdk/.pub-cache.
While the above location is a perfectly acceptable choice by default, users
may want to define an alternate location to prevent downloading all of the
plugins on each fresh build of a Flutter application, and they may want to
commit the pub-cache directory to their project.

Add the new option BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION to the
flutter-sdk-bin/Config.in.host file, and set the default to the current
default of $(HOST_DIR)/share/flutter/sdk/.pub-cache.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/Config.in.host     | 11 +++++++++++
 package/flutter-sdk-bin/flutter-sdk-bin.mk |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
index a48714ea7f..0e31a8e0fa 100644
--- a/package/flutter-sdk-bin/Config.in.host
+++ b/package/flutter-sdk-bin/Config.in.host
@@ -14,3 +14,14 @@ config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
 	  free and open source.
 
 	  https://flutter.dev/
+
+if BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+
+config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION
+	string "pub-cache location"
+	default "$(HOST_DIR)/share/flutter/sdk/.pub-cache"
+	help
+	  Directory to store cached packages used by Pub with
+	  Dart/Flutter.
+
+endif
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 9461148dfb..6471c11d4e 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -95,4 +95,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN = \
 $(eval $(host-generic-package))
 
 # For target packages to locate said pub-cache
-FLUTTER_SDK_BIN_PUB_CACHE = $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
+FLUTTER_SDK_BIN_PUB_CACHE = $(call qstrip,$(BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION))
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
