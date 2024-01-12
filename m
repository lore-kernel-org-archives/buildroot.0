Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0407DC4707B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A1C742DE8;
	Fri, 12 Jan 2024 00:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A1C742DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQsMfFl4m0qK; Fri, 12 Jan 2024 00:57:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71A3D42DDD;
	Fri, 12 Jan 2024 00:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71A3D42DDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF0111BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4DAD42DE8
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4DAD42DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GAotB_ncJfal for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:26 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D907D42DDD
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D907D42DDD
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6d9bba6d773so5224588b3a.1
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021045; x=1705625845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lldr7QgsflTJMryJ7ILXvMmWnfuMxF/bmxRMkn4rRBY=;
 b=TxTSUuZIEBehCQdGiz0/++10fzFWbyMosX8cpuDETFGmNQP+oWn05cVRt6+dyXyYct
 4NBjQJn4FSTKNoZYy7L5RVUyYw9aX8dXAk876Fz/ohru9gpcECa8smqfwMafeuTgin1a
 WiLCfAu2jgn3ugHIJaqVoGhgXHwz6J3jngboMnw8+6yKHZlDuD0PhmQi+7a/728ZCdc3
 /mu+XSTWQv/hP/lWXJpumcAn4cJQiZja3fy/K3TKGqkcgT1wfXooPkoZIsMgh8ZwRgN0
 TkdJmGfBxAEFoV6TOD+iKPmU1SwddXDC8Dz+PPp2ctLxDR444TpCL6BxIKW/4rlsrnx4
 MRUQ==
X-Gm-Message-State: AOJu0YwOuz4FoqgM741P+yTKSEa5fK2AGkLhRN6U5RHGk6Du73lnWlO2
 p9XoEhzutL0bUEZLBt4wN5l1hBSHUk5bW6ESBXYdvRo5z+4=
X-Google-Smtp-Source: AGHT+IE7AMlZ+l/l4Yds39cmzgsj1LPzvJ5GZZBFlkIPyVSjXwITS6lBrbRxx+6dBXeu2Nq71tJqlw==
X-Received: by 2002:a05:6a00:1142:b0:6da:b959:3782 with SMTP id
 b2-20020a056a00114200b006dab9593782mr214965pfm.35.1705021045200; 
 Thu, 11 Jan 2024 16:57:25 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:24 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:10 -0700
Message-ID: <20240112005719.1082305-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
References: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021045; x=1705625845;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lldr7QgsflTJMryJ7ILXvMmWnfuMxF/bmxRMkn4rRBY=;
 b=YTBj3iJWn42FvF2IPby3UQoFB4NfgCOF1RyAUxduTcje4rBYsoQSZjiJDI9nWOBkdq
 MA9SdnssNynfpLJkOHs70nW7u3JstLzjInV+eNRuFTrqqWyW5rOvaiT+zIg78E3NGNrd
 iL8yMEvhvrmycpb6x/bmDZQWKeWvNwfdDHBV4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YTBj3iJW
Subject: [Buildroot] [PATCH 01/10] package/ivi-homescreen: add
 standard_method_codec.h to keyboard manager plugin
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

The keyboard manager plugin is also missing the flutter/standard_method_codec.h
header.

  - Add shell/plugins/keyboard_manager/keyboard_manager.h to the patch.

  - Rename the patch to
    0001-add-missing-headers-to-the-audio-players-and-keyboar.patch

Upstream pull request updated as well.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...rs-to-the-audio-players-and-keyboar.patch} | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename package/ivi-homescreen/{0001-add-missing-headers-to-the-audio-players-plugin.patch => 0001-add-missing-headers-to-the-audio-players-and-keyboar.patch} (77%)

diff --git a/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-plugin.patch b/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-and-keyboar.patch
similarity index 77%
rename from package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-plugin.patch
rename to package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-and-keyboar.patch
index c26fdba7f2..0d308b786b 100644
--- a/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-plugin.patch
+++ b/package/ivi-homescreen/0001-add-missing-headers-to-the-audio-players-and-keyboar.patch
@@ -1,7 +1,8 @@
 From 7e35ea4fbd94a1604907069bb9cc2e2dff4b43c7 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <adam.duskett@amarulasolutions.com>
 Date: Sat, 6 Jan 2024 14:18:56 -0700
-Subject: [PATCH] add missing headers to the audio-players plugin
+Subject: [PATCH] add missing headers to the audio-players and keyboard_manager
+ plugin
 
 Fixes flutter::StandardMethodCodec not being declared on the following lines:
 plugins/audio_players/audio_players_registry.cc:83
@@ -9,6 +10,7 @@ plugins/audio_players/audio_players_registry.cc:94
 plugins/audio_players/audio_players_registry.cc:152
 plugins/audio_players/audio_player.cc:257
 plugins/audio_players/audio_player.cc:623
+plugins/keyboard_manager/keyboard_manager.cc:25
 
 Upstream: https://github.com/toyota-connected/ivi-homescreen/pull/133
 
@@ -17,7 +19,8 @@ Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
  shell/plugins/audio_players/audio_player.cc           | 3 ++-
  shell/plugins/audio_players/audio_players.cc          | 4 +++-
  shell/plugins/audio_players/audio_players_registry.cc | 3 ++-
- 3 files changed, 7 insertions(+), 3 deletions(-)
+ shell/plugins/keyboard_manager/keyboard_manager.h     | 3 ++-
+ 4 files changed, 9 insertions(+), 4 deletions(-)
 
 diff --git a/shell/plugins/audio_players/audio_player.cc b/shell/plugins/audio_players/audio_player.cc
 index 56027eb..a85e9ae 100644
@@ -77,6 +80,25 @@ index 6c9ef33..00c4f45 100644
 -}  // namespace Plugins
 \ No newline at end of file
 +}  // namespace Plugins
+diff --git a/shell/plugins/keyboard_manager/keyboard_manager.h b/shell/plugins/keyboard_manager/keyboard_manager.h
+index 74b4e8d..cae1954 100644
+--- a/shell/plugins/keyboard_manager/keyboard_manager.h
++++ b/shell/plugins/keyboard_manager/keyboard_manager.h
+@@ -17,6 +17,7 @@
+ #pragma once
+ 
+ #include "flutter/fml/macros.h"
++#include <flutter/standard_method_codec.h>
+ 
+ #include <shell/platform/embedder/embedder.h>
+ 
+@@ -45,4 +46,4 @@ class KeyboardManager {
+ 
+  private:
+   static constexpr char kGetKeyboardState[] = "getKeyboardState";
+-};
+\ No newline at end of file
++};
 -- 
 2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
