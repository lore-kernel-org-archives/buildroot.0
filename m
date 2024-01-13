Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA178C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F2BC60A9A;
	Sat, 13 Jan 2024 20:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2BC60A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Du5GA5uTO7Je; Sat, 13 Jan 2024 20:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7FE260ACD;
	Sat, 13 Jan 2024 20:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7FE260ACD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F6341BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7E8C4026F
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7E8C4026F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4G6b3Zwoc3UC for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:26 +0000 (UTC)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E424F403A5
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E424F403A5
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3bd3b34a58dso3242563b6e.3
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177224; x=1705782024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lldr7QgsflTJMryJ7ILXvMmWnfuMxF/bmxRMkn4rRBY=;
 b=v2Po8prlPp5EXewzwpYhQZepFsbbtPkmzZsPnKyOkDl0K9UAqos5kxphL9OPQ2kqWg
 9gSHLydUqaH50CW7xHsaUEdhhFFh8CHEELi+NH050S7w6b9kcVoSnyncLp5x/fqtO8pK
 aKUd51/JHC+SbVqcsGcCL2aZECj2F0A3h+HKQQF1FeTY9YbVWMjPB6OAi+5Gwkd5qG8n
 xaevBtvuw2tPCMMAzHL/cxwTzFtiM4u4o9AObuJxNM7p5EbqqpHnmgSkkYh9x7FcirAp
 7LDOqkE+MrUdnAKkW4URdxy2hHm7WhIxadsLzF91r2GXjmtOyKSMTwcTUDuijIinJ0ok
 qExg==
X-Gm-Message-State: AOJu0YwQu7d+OxuSrL/be+ja0TWV1IJh3fgU47Y/u4AZJzKNN5TSCJEc
 Pq7cbVxFStm203nGpAALNFQxr7zE20VkT962dBIrq6GxNUM=
X-Google-Smtp-Source: AGHT+IH0ciE1iXmd3ux1KhhporAJLyLKjC0Gm2DOTIZ6/RB+42IZv4+xkL8H6VcKenPI0WVjCcsouA==
X-Received: by 2002:a05:6808:221a:b0:3bb:bd57:b59a with SMTP id
 bd26-20020a056808221a00b003bbbd57b59amr3693521oib.15.1705177223906; 
 Sat, 13 Jan 2024 12:20:23 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:23 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:11 -0700
Message-ID: <20240113202020.21747-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
References: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177224; x=1705782024;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lldr7QgsflTJMryJ7ILXvMmWnfuMxF/bmxRMkn4rRBY=;
 b=mpkgBmwH85JhB4lR0ZnV6TRXJERb0NW9TbT7ILUNW/tujdeRmaC7FFbrCxhHiDKMer
 FzX90AhL6YG37YbWgBe3lvcCIXAmGuCeEAomcjeBDczflGjUPxO9rQIiAPBFs6XL0MF9
 mKjyp0XARXS7pCdixqaXUzxyIGLgsHlH7kCZ4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mpkgBmwH
Subject: [Buildroot] [PATCH v2 01/10] package/ivi-homescreen: add
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
