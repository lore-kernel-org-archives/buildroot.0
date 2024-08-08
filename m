Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939C6C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 14:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7E5940B41;
	Thu,  8 Aug 2024 14:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fW7kgH6FaHD; Thu,  8 Aug 2024 14:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6984440B5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6984440B5B;
	Thu,  8 Aug 2024 14:17:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE1D41BF294
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 14:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C6F960ABC
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 14:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcKzFWz-J1mc for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 14:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7707560ABB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7707560ABB
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7707560ABB
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 14:17:53 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-52f01993090so1316101e87.2
 for <buildroot@buildroot.org>; Thu, 08 Aug 2024 07:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723126671; x=1723731471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n5rBindH0UUdlXJQ3F573jd7gNWCWTGTERhKcSMBXbE=;
 b=EHJ9/pDGHinBVVkODB+xSQEh8uKWE6wiHXuuLrQnfDaGBjYd4NiG9Z4F2dS/MNOyV9
 uEPzr+3RJbKEuwnwAili02teVKJ8+lu9vgI5rpJGxEMQTAIbc6GH+pH03BY8xmDtss24
 UhQUOfYT91prgVnJvBmm5u5xLfNFYJKTdL9RDw1ESUTbN3fBids88Zl6tA27bC+dncij
 2rRmHX41hnSJDzxhAGZ4oVqHlg4amCA8mHrUSYo3DSiUQ4+EPqgnMPfeXH887nrBnGro
 Zh6GHu6k14jOdkeNIiRVpoFDp1w1w9HPpPl/Ne5WcVbSqwNAZytKc9p/ElVfnBA1hY0k
 X4zw==
X-Gm-Message-State: AOJu0YydaYq1+cleB57qHWx1EylGO853kRbRteYwdxW53lHdm/1PaRiO
 TcCFXfySEUbNhKotiaPakGvUn9UjLGOJLuk5XyN/V15dKwAkRzWUmpwqSre990DhqxMAR8Utyot
 vfeVd/nLq
X-Google-Smtp-Source: AGHT+IEKrIR3VNd4Nkb431B/G8bkPTxkess45Nm+sbXIsjmMkRMM11fUc90yIlALARPH3al1AE5r8A==
X-Received: by 2002:a05:6512:3a8d:b0:52c:dc25:d706 with SMTP id
 2adb3069b0e04-530e58962ecmr1537333e87.52.1723126670677; 
 Thu, 08 Aug 2024 07:17:50 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2a02:a477:a7d9:1:3678:e036:10d9:128d])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2d34a74sm701780a12.69.2024.08.08.07.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 07:17:49 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  8 Aug 2024 16:17:44 +0200
Message-ID: <20240808141747.1770035-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
References: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1723126671; x=1723731471;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n5rBindH0UUdlXJQ3F573jd7gNWCWTGTERhKcSMBXbE=;
 b=EMW3nfGylQzjioQFjps1blQKSBVb+b0ZG7KrANxJqNoPa4oVbPbDG7WMdib1pAbJEw
 teNtZ65jh9b3W70mAgeezAkJNo28gcT3ps6MJtZvJ9PW8SLByvIf3nH7+qxOElkOd+5b
 aektmvVMS3IGzn1yk7TP1oaM9qO8K0CsqJR40=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=EMW3nfGy
Subject: [Buildroot] [PATCH 2/5] package/flutter-sdk-bin: bump version to
 3.24.0
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

As of https://github.com/flutter/engine/pull/51943, by default, flutter now
uses and provides the AOT snapshot frontend server instead of the
frontend_server.dart.snapshot.

The depfile produced by dart has been renamed from kernel_snapshot.d to
kernel_snapshot_program.d.

Flutter programs must compile with the dartaotruntime binary instead of the
dart binary, or else errors occure stating that the dartaotruntime must be
used.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/flutter-sdk-bin.hash |  2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index b697b9cc90..4f3622e725 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6590607e7f2fb23bcc7e0a2d6aac292f9208cbf12a40862c281058c758604fb3  flutter_linux_3.19.5-stable.tar.xz
+sha256  d52a5d12f17d8bcf868d1ccc01fe0f7ffb05b53d9628aa21b07a18f9d33621f2  flutter_linux_3.24.0-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 321c08680f..26415551bc 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.19.5
+FLUTTER_SDK_BIN_VERSION = 3.24.0
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
@@ -68,11 +68,11 @@ HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = false
 endif
 
 # The Order matters.Taken from:
-# https://github.com/meta-flutter/meta-flutter/blob/kirkstone/classes/flutter-app.inc
+# https://github.com/meta-flutter/meta-flutter/blob/scarthgap/conf/include/common.inc
 HOST_FLUTTER_SDK_BIN_DART_ARGS = \
 	--verbose \
 	--disable-analytics \
-	--disable-dart-dev $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/linux-x64/frontend_server.dart.snapshot \
+	--disable-dart-dev $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/linux-x64/frontend_server_aot.dart.snapshot \
 	--sdk-root $(HOST_FLUTTER_SDK_BIN_SDK_ROOT) \
 	--target=flutter \
 	--no-print-incremental-dependencies \
@@ -85,7 +85,7 @@ HOST_FLUTTER_SDK_BIN_DART_ARGS = \
 	--target-os linux \
 	--packages .dart_tool/package_config.json \
 	--output-dill .dart_tool/flutter_build/*/app.dill \
-	--depfile .dart_tool/flutter_build/*/kernel_snapshot.d
+	--depfile .dart_tool/flutter_build/*/kernel_snapshot_program.d
 
 # Helper wrapper to run flutter when building flutter applications.
 HOST_FLUTTER_SDK_BIN_FLUTTER = \
@@ -95,7 +95,7 @@ HOST_FLUTTER_SDK_BIN_FLUTTER = \
 # Helper wrapper to run dart when building flutter applications.
 HOST_FLUTTER_SDK_BIN_DART_BIN = \
 	$(HOST_FLUTTER_SDK_BIN_ENV) \
-	$(HOST_FLUTTER_SDK_BIN_DART_SDK)/bin/dart \
+	$(HOST_FLUTTER_SDK_BIN_DART_SDK)/bin/dartaotruntime \
 	$(HOST_FLUTTER_SDK_BIN_DART_ARGS)
 
 $(eval $(host-generic-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
