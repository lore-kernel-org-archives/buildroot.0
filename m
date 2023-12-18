Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311D4C46CA2
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D870441B34;
	Mon, 18 Dec 2023 18:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D870441B34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id asrxkfdRXLhX; Mon, 18 Dec 2023 18:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0902941B1B;
	Mon, 18 Dec 2023 18:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0902941B1B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CA261BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53CC54056F
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53CC54056F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bx1uoODTO2Ne for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:58 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E12B40527
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E12B40527
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5cd8e2988ddso896962a12.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925697; x=1703530497;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2zCCLnrM53V3KVtdKQM+PCC/9bE5HgGJ8ONfdo6PEA=;
 b=YwiHf4zYdKjEzPGez1DnR3UViRJUoxoCcMvQD1+Qvio0Xg3z5Lb25hnOK5cZtW4YCP
 2zxxWJuueu+TpB1Zo/5Hp05puC8czTtT5AZ5MTuwTPyGeP/NQ8fR6bTNBwK0tH03I214
 sH53rnPvBIjQ/XjF92Xb4WAQh1YVv2uuNPSiSZa2wMZVcLZwkzjePcMEcD6vHRt+8Qm0
 /Z1J8USVXJRPe8hi/AJkZptFgriJqHqNiSBV+DFAqzwy5s/o3r+uPreTPVuDR4cbxBgg
 M/kOzQuZ8MEq2ePmuo8io6obTr4HOi14I6/LU/mZ3cCq5Qbeo4yLpFVv6H5PSsryOGck
 69Ww==
X-Gm-Message-State: AOJu0Ywj5tlykrl70f9K+VCjhlhww4ciQ5ExN93+eONEojv/2TAiVaGa
 ydwNZqw7Kx2P2iu1p4QHD+umLV0p2IxGwuUWx1g=
X-Google-Smtp-Source: AGHT+IEqhh8G5kNqUqCN1Ci5wl5TH065LihvonekC7O8T3+HMQQb3mAXlqpCjFlu3j27kQmSRv/Qdg==
X-Received: by 2002:a05:6a20:5486:b0:18f:5f5b:c0a with SMTP id
 i6-20020a056a20548600b0018f5f5b0c0amr9617534pzk.104.1702925696983; 
 Mon, 18 Dec 2023 10:54:56 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:56 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:39 -0700
Message-ID: <20231218185440.506995-13-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925697; x=1703530497;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+2zCCLnrM53V3KVtdKQM+PCC/9bE5HgGJ8ONfdo6PEA=;
 b=nH+iMGQuaPbf9DRHzw97gIwLk59mPgiYG5gZCWWcL8nJyHGtOyLcC1TwAWuKiYhW7D
 8uim4d//oC47qMEkIhbnmdT84kNzbNTtCyNZBaUmS4CgkIv91ueBJqHWqUVmmCeLRfAr
 W9WY8Jznz/02Os1X2xhG8pV/XqKYl9lxkzEHM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nH+iMGQu
Subject: [Buildroot] [PATCH v2 13/13]
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
pub-cache directory along with their sha256sum hashes. The default location of
the pub-cache directory is current $(HOST_DIR)/share/flutter/sdk/.pub-cache,
which is not an acceptable choice by default because every plugin will be
re-downloaded during every build of a flutter application when building with
the per-package-directory option enabled. Furthermore, keeping the pub-cache
in its current location prevents users from committing the pub-cache directory
to git for faster rebuilds.

To fix the above issue, add a new option to flutter-sdk-bin/Config.in.host,
BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION and set the default to the
current default of $(DL_DIR)/br-flutter-pub-cache

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Set default path to $(DL_DIR)/br-flutter-pub-cache [ Yann ]

 package/flutter-sdk-bin/Config.in.host     | 11 +++++++++++
 package/flutter-sdk-bin/flutter-sdk-bin.mk |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
index 181a2ee6e5..a1ac5835d9 100644
--- a/package/flutter-sdk-bin/Config.in.host
+++ b/package/flutter-sdk-bin/Config.in.host
@@ -13,3 +13,14 @@ config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
 	  free and open source.
 
 	  https://flutter.dev/
+
+if BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
+
+config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION
+	string "pub-cache location"
+	default "$(DL_DIR)/br-flutter-pub-cache"
+	help
+	  Directory to store cached packages used by Pub with
+	  Dart/Flutter.
+
+endif
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 0c33d25089..6eea3f2a45 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -104,4 +104,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN = \
 $(eval $(host-generic-package))
 
 # For target packages to locate said pub-cache
-FLUTTER_SDK_BIN_PUB_CACHE = $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
+FLUTTER_SDK_BIN_PUB_CACHE = $(call qstrip,$(BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
