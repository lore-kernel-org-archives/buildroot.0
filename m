Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF64CC47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 19:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96E1F4194F;
	Tue, 23 Jan 2024 19:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E1F4194F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yp0WgnLYlLWy; Tue, 23 Jan 2024 19:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAAD241922;
	Tue, 23 Jan 2024 19:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAAD241922
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6941BF35C
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 19:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58DC7415B9
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 19:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58DC7415B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNZEC1wbtrsB for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 19:00:45 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA4EF414EA
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 19:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA4EF414EA
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d750660a0aso12710195ad.0
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 11:00:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706036445; x=1706641245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3yVLTho6JoGKhVWRu4AAn+5FPCWROSWvrqPmqAWN5YM=;
 b=gp9vnOfqy8MwGt58dk10z/pJeNYxpjdAn+7Gw0tLhI35U/+PThaDfqGGGi2jqEN58A
 XaXqARZIgFC33OKwEpsvVrnhXq+oBgmcH+Q0oI4ZUDc6K+EaS5eHou8wdDnVwcQRv/U+
 Gjo5uTegqUOtmbObjtUkETEwfCR8CMV8cR8FIpJhKW3zT9oZncPav0NE66CeI0yFfvTr
 xgR7OB9yJHEeShdFafksn4EX6puZ8JT/GjaSQ99s7IsM4UC9E0Xzt2V4ljbWo5Rt895L
 wkICGTgw84GtML9SeQcrSy3wfZhsN+lz2G4IcSlC3KRqb1bLAVYtb+wEqul2igRIvsSs
 dhcw==
X-Gm-Message-State: AOJu0YwH96fSBrOYlFboAZVAVJk4qOq5zVqPnuDxRRCv4uX6TR5vUGDD
 //24n9kZcrNbi6YLq4Gxxln0Qxea8vQnuK+Q7leuHmfg3NL+4r9Oj4td+Db34Tea9oNPgOkxAEp
 2
X-Google-Smtp-Source: AGHT+IH70eDQ97tMDUmYofgSTCMZqCKXJ9CU5ePJPxqZcLOYjso1LeXC2Q/w7pPbYhmncMrPhkifkg==
X-Received: by 2002:a17:902:eb4b:b0:1d0:98d8:955c with SMTP id
 i11-20020a170902eb4b00b001d098d8955cmr4229118pli.124.1706036444646; 
 Tue, 23 Jan 2024 11:00:44 -0800 (PST)
Received: from fedora.. ([75.174.129.54]) by smtp.gmail.com with ESMTPSA id
 km7-20020a17090327c700b001d752c4f36asm3708638plb.78.2024.01.23.11.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 11:00:44 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 12:00:35 -0700
Message-ID: <20240123190035.904936-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
References: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706036445; x=1706641245;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3yVLTho6JoGKhVWRu4AAn+5FPCWROSWvrqPmqAWN5YM=;
 b=JiAyuL0lm5Gf/BGNI2aAy85K4vGaMl9tX9nwZxnouudeAsd2GkylY7ks3YKekVSZtM
 QYPsntQbB/0+KrkTDsdG/fag2vTpxRFlJDi4fL6y2Zv5HSgH3xS8TvutHwnltUOCJnNT
 zQN8Kgtv0pJFIIHhDBWKaSEE5bRY9v0t642OM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=JiAyuL0l
Subject: [Buildroot] [PATCH 3/3] package/flutter-pi: audio player plugin is
 not compatible with pulseaudio
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

According to the README.md file:
```
[The] plugin was tested to work with ALSA and `pulseaudio` might prevent the
      plugin from playing audio correctly:
    - Hence please make sure you delete `pulseaudio` package from your system.
```

And from plugins/audioplayers/README.md:
```
...
- Make sure `pulseaudio` is deleted

Please note that plugin was not tested with `pulseaudio` and it is up to you
to make gstreamer work via it. As `pulseaudio` takes full control over audio
devices, `ALSA` will no longer function correctly with `pulseaudio` installed
```

As such, it is best to ensure the pulseaudio package is not selected to
ensure the audio player plugin works out of the box.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index 223e29749c..379b1da45b 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -47,6 +47,7 @@ config BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN
 
 config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
 	bool "gstreamer audio player"
+	depends on !BR2_PACKAGE_PULSEAUDIO
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
@@ -57,6 +58,9 @@ config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
 	  Include the gstreamer based audio plugins in the finished
 	  binary.
 
+comment "gstreamer audio player plugin is not compatible with pulseaudio"
+	depends on BR2_PACKAGE_PULSEAUDIO
+
 config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_VIDEO_PLAYER_PLUGIN
 	bool "gstreamer video player"
 	depends on BR2_PACKAGE_HAS_LIBGLES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
