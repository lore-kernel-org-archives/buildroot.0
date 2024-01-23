Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCAFC47DDB
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 19:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40A17414EA;
	Tue, 23 Jan 2024 19:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A17414EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRsY9sTK28ut; Tue, 23 Jan 2024 19:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B4E415B9;
	Tue, 23 Jan 2024 19:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B4E415B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 604711BF35C
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 19:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A3B181E89
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 19:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A3B181E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXQh4NT6weDf for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 19:00:44 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A811D81E54
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 19:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A811D81E54
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d746ce7d13so20903475ad.0
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 11:00:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706036443; x=1706641243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09rmr8jfCJkFOV7CnJoD/W1FpetNR0DUZmvLgdOOobk=;
 b=DHl+fIgtVbLnzj2UXprRXFX5msKkH29j9VRuIE0mHPDNvFm/DZxXkTUcnIHwjikx91
 GQMAOpXhRUhcnb6sbP7I+uNRSO8WDASi0kVLoFnYsCj06OYefIegY4g008Ij1LSebU/t
 q7poVM+zpAsAiuro2KeV9us7iTaBFDa3I0YUVLhFN3Y8K0ZSBj77ufUc3cWTRDhNULRe
 xONLoCNuMxKtt+9306CEfCA3hd2TfWhl3QbP/mWX3MeGaKN1cUKLhncvTj9zIgsEhDCV
 8epn33Pw4pOcR1L7F+sgPLWX5DmipNuY/HMCQ2Y4+PNbOs6O47+UVvaMJOhwG39Aif9d
 giIw==
X-Gm-Message-State: AOJu0YzFjYO0Xx34HRofncPiph52PM0eMqomH5RNaG5ANtILEiZ0AhPd
 8HkWqJwkbw9vIZuV1UvTBmnuxAxTAnO+vUVKEERLSET0NSY7G3q632XacaqF39r6jVsvYV2eulP
 F
X-Google-Smtp-Source: AGHT+IEBPg9m7jmTx6hnr8xRRBKp4UK+znn2ugc4a+SLizQWEontAmAjJpg0x2E4qYUxPFb+nSx0dA==
X-Received: by 2002:a17:902:ea8d:b0:1d4:6dea:9ad9 with SMTP id
 x13-20020a170902ea8d00b001d46dea9ad9mr6193482plb.51.1706036443670; 
 Tue, 23 Jan 2024 11:00:43 -0800 (PST)
Received: from fedora.. ([75.174.129.54]) by smtp.gmail.com with ESMTPSA id
 km7-20020a17090327c700b001d752c4f36asm3708638plb.78.2024.01.23.11.00.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 11:00:42 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 12:00:34 -0700
Message-ID: <20240123190035.904936-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
References: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706036443; x=1706641243;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09rmr8jfCJkFOV7CnJoD/W1FpetNR0DUZmvLgdOOobk=;
 b=Lr1weKlPYbuT4dCfM4WpTaaAzubKU69NgZQshLnPCWilLKruJsBdrkrjLhGMRx5tlz
 pyayXl00fyJ9dIxyY//3BGIYtfGCoyetiDy1Y5g3e9n28LafG782yGmsBjQQwt3jjrJ2
 g3Fg8+ZscEXkaC9CjW0AfzJZXwYSoa/NUn93w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Lr1weKlP
Subject: [Buildroot] [PATCH 2/3] package/flutter-pi: Fix help text for
 gstreamer audio player
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

The help text is currently copy and pasted from the gstreamer video
player plugin help text. Change it to reflect the text from the
CMakeLists.txt file.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-pi/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
index 95b5525806..223e29749c 100644
--- a/package/flutter-pi/Config.in
+++ b/package/flutter-pi/Config.in
@@ -54,9 +54,8 @@ config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	help
-	  Include the gstreamer based video plugins in the finished
-	  binary. Allows for more stable, hardware accelerated
-	  video playback in flutter using gstreamer.
+	  Include the gstreamer based audio plugins in the finished
+	  binary.
 
 config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_VIDEO_PLAYER_PLUGIN
 	bool "gstreamer video player"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
