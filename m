Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE112C47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 19:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA89415B9;
	Tue, 23 Jan 2024 19:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA89415B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xd9SRB_XFH4i; Tue, 23 Jan 2024 19:00:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB6C84156C;
	Tue, 23 Jan 2024 19:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB6C84156C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B08991BF35C
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 19:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96CA281E89
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 19:00:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CA281E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nr-eVkHtMq3n for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 19:00:42 +0000 (UTC)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4704181E54
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 19:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4704181E54
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5cddfe0cb64so2352133a12.0
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 11:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706036441; x=1706641241;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G+ek9+qkrKcGLuQy4tWtXMYSqhd7WqLTQJlf2HHYEUo=;
 b=JMR7ZgeUj/Xhjx4ogtzMXJu7qCZFEhnStR58V/FMB+kcGGbttQa14A42krNG24j0yn
 osUYmtAiBhNf/5Nh/a5dknru4B39jTXEwEtOKVeQRaAtYI2ewIAh1VKxwBhEI7x4rka4
 89kvUGA7hr85Aoii5PIZQ4aH3yrmRJGBTjzLgaHO3VYhR+d7/9hUmXvSaZBASE4VfDjI
 P+qxVqIgWp3S5L+RoimWD1u+V6/iwTAlgStzyfeboEkiDo0NbkBXS+BFio8dPxbyvmhX
 2egOOO5g7t5ERiISmt/5G4VoejMjVBlkc5sTjjhNQ2/zfVkiqekeF2ZgTWi9f8gQaBMp
 9ZDA==
X-Gm-Message-State: AOJu0YzlpxNe0EEXmWvJKc6KYea2Z3q/oKTYicnuJYL6MERzeFe6FN3Z
 FeufscR4F/Qu2mcRxAw7cCrmZZmuKeURbgB2t1dlUokvQjIRQFlZzpiSkbY2O7Xw4PxF8pt8wrQ
 b
X-Google-Smtp-Source: AGHT+IHBtUldrPOo+E1YFTH6HBpJWvTSEmq9uBcN/Wy/87hf2eZFsho6nm2SYz6NP74lOT5vwCypMw==
X-Received: by 2002:a17:90a:6bc4:b0:28c:4f11:a29b with SMTP id
 w62-20020a17090a6bc400b0028c4f11a29bmr2682427pjj.59.1706036439261; 
 Tue, 23 Jan 2024 11:00:39 -0800 (PST)
Received: from fedora.. ([75.174.129.54]) by smtp.gmail.com with ESMTPSA id
 km7-20020a17090327c700b001d752c4f36asm3708638plb.78.2024.01.23.11.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 11:00:38 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 12:00:32 -0700
Message-ID: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706036441; x=1706641241;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G+ek9+qkrKcGLuQy4tWtXMYSqhd7WqLTQJlf2HHYEUo=;
 b=R8mQ7x14GMmEXdyprlRV9+B0x3igDYq0lmifn+3BcF1HgMQjMunjmyj346kYE69coA
 tG0ONpTD9KfPgZV3r1TrBXAP5CLtixDCVdoUCDmxKNMTlA40GQmPYYGQWNO9A9k5aRVN
 Xn7wvJ1PyzLgWH/8Ayl+Rg40b+JOrWeWULghs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=R8mQ7x14
Subject: [Buildroot] [PATCH 0/3] flutter-pi audio player plugin Config.in
 fixes
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

I noticed a few minor problems with the audio player plugin in the Config.in
file for the flutter-pi package.

I copied and pasted the video player plugin and forgot to:
  - Remove the dependency on libgles, which doesn't comment on the erroneous
    dependency.
  - I didn't change the help text, which matches the video player plugin.

Also, the last update added help text in the README.md files, which explicitly
states that the audio player plugin is incompatible/not tested with PulseAudio.
As such, I have added a dependency on !BR2_PACKAGE_PULSEAUDIO

Adam Duskett (3):
  package/flutter-pi: remove libgles requirement for gstreamer audio
    plugin
  package/flutter-pi: Fix help text for gstreamer audio player
  package/flutter-pi: audio player plugin is not compatible with
    pulseaudio

 package/flutter-pi/Config.in | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
