Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9955C47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B5E142112;
	Wed, 17 Jan 2024 22:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B5E142112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHuoJY13gXQo; Wed, 17 Jan 2024 22:51:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9536842115;
	Wed, 17 Jan 2024 22:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9536842115
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 345811BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CD3D614F6
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CD3D614F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9wyq3kaiGee for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:50:58 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEF1061589
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEF1061589
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6d9b267007fso6922752b3a.3
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531857; x=1706136657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lldr7QgsflTJMryJ7ILXvMmWnfuMxF/bmxRMkn4rRBY=;
 b=QspeNG906qhuN6knw1L+Pi/W77oioVR7XZh4QlzrjCyIZQ5qokZgd5B8DBT6SkreQw
 yNqFqmEG6WzmV1Mkt5iSKw2XPMJ0hctZXlcD4Gq9SbgttuqFgwjv3FOzYADGrf5YlmIK
 AQKpOZhTlxYhMGKCNIMtf4XXWpYUH3GNROzJUyPD5wvX4YN8tvxlIs3pQyA5HitrhBqN
 a1hyCfgl30ZbdPWlfGvQ3pOcInUlJ0Comg8msioFPH33AOh9TaF8orEyFdPbr1j7MEiM
 GSSZ6pZkVzAibX+17OTGq64YI0YIPo+aVjAdPbz1/4C0y2l2RdshuZRa7Zn9CzLelsEy
 Q8ZQ==
X-Gm-Message-State: AOJu0Yztds6X5PmS5gK1dDBt7sWMBQz5NvWvJoVfoGVZhx1LQfmcx+0+
 qLiWpSbeCTdxySKjqxh7JrLhjQ5nl2HaFgc6xa4n206FnWU=
X-Google-Smtp-Source: AGHT+IE5gmRR4MhQ/uKX51m+Pnu4kcgwbM7UfFsNMF2b62y4CPHpuzZBETQY6WqpPyWwjBTNAqAVUg==
X-Received: by 2002:a05:6a00:e0e:b0:6db:a166:ff12 with SMTP id
 bq14-20020a056a000e0e00b006dba166ff12mr1114397pfb.15.1705531857368; 
 Wed, 17 Jan 2024 14:50:57 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:50:56 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:40 -0700
Message-ID: <20240117225049.28443-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531857; x=1706136657;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lldr7QgsflTJMryJ7ILXvMmWnfuMxF/bmxRMkn4rRBY=;
 b=R/+6vm3qVIQZohrFurL9oWEfxPBwT+KwQBLuAzrVbYZVzpROW4rtPp1iuaMkrTUHI4
 PV9imsYfVHz10QgxenUBeeNDHQ4KcW05TMEXgIdeOG+t6N1tNwTUBg+gEzfXreTbJc08
 SSHAE5njbBFrDjVW0aAT0iHgWKc9sd3wImH5A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=R/+6vm3q
Subject: [Buildroot] [PATCH v3 01/10] package/ivi-homescreen: add
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
