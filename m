Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B4AC47DA2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC96A42111;
	Wed, 17 Jan 2024 22:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC96A42111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1Ua85krJZGt; Wed, 17 Jan 2024 22:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C5942112;
	Wed, 17 Jan 2024 22:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C5942112
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 814F51BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 563A5615B8
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 563A5615B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0q6qfARbDUjb for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:50:57 +0000 (UTC)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 891EA614F6
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 891EA614F6
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so10259192b3a.3
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531856; x=1706136656;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M7Y74yqq2jvo0h7WRe803/XivPHwERy/FpiTLWkVEBw=;
 b=q+MsFF4lHcqHYIH5zjkJYVC11Ja7FHK96mGdq+BkPlGdRCSS/DzS6g0I8nkfdVJZ+w
 0rzmFtUrG4A+430vn0wySSk4ZPSrWpGtQ9KBSgUm3AviVHkofaCb0P3Bz4WtJUyiooJ7
 tLXj6G3NzuuGz+z2jfuTBT99x8SlEkyRSKe2TYYTdO4HkoHN5vWn7cUzxp4RH7jvyCAk
 JX+rjUVxm/KQy6zP0zVjhqHUQSlKT0fAc05fFRpStpFJ8aYDggG+2c1axz8ryNNQ8xGS
 1QO1C44kKDzhKnWWQ2RneYHNy71WaT0CGsdSWd/433Nunb2c1QEt5UjGEJALiz0BbEH3
 3bxQ==
X-Gm-Message-State: AOJu0YzjvBXw7YX3siK/EtrYgNtftgPoBmXCdWlPrieUHLizQJDdVdPf
 wU3reNghDyOoe4a+KI+s9LTongy78ofmD0KgYZQ+3zY0Fhw=
X-Google-Smtp-Source: AGHT+IEja/UUSU7Au/7dI6qwWUIyFYmTNIWnNg4lObgiLwCLD0hRfoKWUjv9AasTEERXQbP/fqM+bA==
X-Received: by 2002:a62:6283:0:b0:6ce:751b:81d9 with SMTP id
 w125-20020a626283000000b006ce751b81d9mr9348497pfb.9.1705531855929; 
 Wed, 17 Jan 2024 14:50:55 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:50:55 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:39 -0700
Message-ID: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531856; x=1706136656;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M7Y74yqq2jvo0h7WRe803/XivPHwERy/FpiTLWkVEBw=;
 b=ryjAvpQ6j7+BnQCiKmTyQpdaNBjIG2etZQkObkSSAqwGG2AGUx0RGON4a3oBHavi5W
 dBDuw0vdDV7ngVI/kIjOg0dUpRer8KuleYXK7DiZzqcbuY1VgkUv4+yKCZUk6uWOKVAL
 nl8morrF+PEEq9nSleoaFTyBJF17Actnbwb8U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ryjAvpQ6
Subject: [Buildroot] [PATCH v3 00/10] more flutter package improvements
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

Change v2 -> v3:
  - Bump flutter-sdk-bin to 3.16.8
  - Bump flutter-engine to 3.16.8
  - Bump flutter-pi to 75e72fef8e8ce65ec72a002c00d9c6db4d1479d3

Changes v1 -> v2:
  - Bump flutter-sdk-bin to 3.16.7
  - Bump flutter-engine to 3.16.7

Most of these are self-explanitory and simple, however the depot-tools version
bump should be explained:

The current depot-tools version is from Jul 13 2023, and there is a bug where
when building with PPD enabled, building a Flutter application on my laptop
running Fedora 39 or even in the Debian 11 container fails due to permission
issues when running rsync such as:

/usr/bin/sed: couldn't open temporary file [...]/output/per-package/flutter-gallery/host/share/flutter/sdk/.vpython-root/0e1e32/lib/python3.8/sed763MrF: Permission denied
make: *** [package/pkg-generic.mk:267: [...]/output/build/flutter-gallery-2.10.2/.stamp_configured] Error 123

After several hours of attempting to find the exact cause of the issue by
parsing git logs of the depot_tools repository and cross-referencing bugs on
https://bugs.chromium.org/p/chromium/issues I am unable to determine the exact
reason why the problem occurs or the exact commit that fixes the issue.

However, updating depot-tools does indeed fix the issue, and looking at the
source code between 4e87f5bf and 8d14454b shows improvements to several bash
scripts, such as gclient, vpython3, and spid. All of which could be culprits
of this bug. As flutter-engine is the only package that uses host-depot-tools,
it is safe to update.

This permission bug is present on PPD and normal builds, but causes a build
to crash only on PPD because of rsyncing. On non-ppd builds, the bug only
causes some minor annoyance when trying to run `make clean` because permission
denials crop up when trying to remove the .vpython-root directory.

I can't remember, but I * think * the autobuilders don't select PPD yet, which
is probably why this bug hasn't caused any autobuild failures yet.


As for everything else:
  - Tested on Fedora 39 and Debian 11.
  - PPD and Non-PPD.
  - Docker and host.

Everything passes and works as expected.

Thanks!

Adam Duskett (10):
  package/ivi-homescreen: add standard_method_codec.h to keyboard
    manager plugin
  package/depot-tools: bump version to
    8d14454ba4a35fd9d2483842b08815a2357ec86f
  package/flutter-engine/Config.in: Drop nptl dependency
  package/flutter-sdk-bin: bump version to 3.16.8
  package/flutter-engine: bump version to 3.16.8
  package/flutter-pi: bump version to
    75e72fef8e8ce65ec72a002c00d9c6db4d1479d3
  package/flutter-pi/Config.in: propagate flutter-engine dependencies
  package/flutter-gallery: add a configure step
  package/flutter-gallery: fix build options
  package/flutter-gallery: clean up install_target_cmds

 package/depot-tools/depot-tools.hash          |  2 +-
 package/depot-tools/depot-tools.mk            |  2 +-
 package/flutter-engine/Config.in              | 10 +++---
 package/flutter-engine/flutter-engine.mk      |  2 +-
 package/flutter-gallery/flutter-gallery.mk    | 24 ++++++++++----
 package/flutter-pi/Config.in                  | 31 +++++++++++++++++--
 package/flutter-pi/flutter-pi.hash            |  2 +-
 package/flutter-pi/flutter-pi.mk              |  2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.hash  |  2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk    |  2 +-
 ...rs-to-the-audio-players-and-keyboar.patch} | 26 ++++++++++++++--
 11 files changed, 81 insertions(+), 24 deletions(-)
 rename package/ivi-homescreen/{0001-add-missing-headers-to-the-audio-players-plugin.patch => 0001-add-missing-headers-to-the-audio-players-and-keyboar.patch} (77%)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
