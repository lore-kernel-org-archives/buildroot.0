Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F71AC47077
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B252242DEE;
	Fri, 12 Jan 2024 00:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B252242DEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PN6wZTNijQJy; Fri, 12 Jan 2024 00:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B4542DE8;
	Fri, 12 Jan 2024 00:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B4542DE8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41A6B1BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EE7040648
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EE7040648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lD8LbRo_pP3 for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:25 +0000 (UTC)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A851940124
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A851940124
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3bbc7746812so5422923b6e.2
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021044; x=1705625844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wENP2S/Vqt+dwZglDqkfq2iJmFGtSBF7T1/7Gc3RoOY=;
 b=GkuuyKlg3WwKVqJar/AB5Zu8Jq/Cs+x41C8HjNkzFMJKyee0xoYY+qDblXY2Fjhb4S
 z+/47JL8/+3BGMHvDbu0g4TBRVGm/VWq4dJx9dw9MiI2uNwI3K3hb+dEDGSvdVqwTb17
 DBTapROTxnOsUHbhGRxUWNVQclRinwNkpJ63GvSWgGasgo0cXDnrXrePKUw6GAMazQt7
 eStb9zmqWpReY2NRhdrglx/ZsjLV7eZcyjxRhe+KnmT9uFs0ds2/YJU0jeFOMHbBXXdd
 0bGZkZgQfngK2ytPMhc/uw6UP5uJ6kZG5/DsYXAkg57znMRjB9NWmQuUdPRAqcPQaTzc
 MpNw==
X-Gm-Message-State: AOJu0YxsfnzkAxC67b2g8WsAAv/YjMGCD9vmT81OmsPiwZHMT23EB9YM
 auAmaZJ1RnfQvulLNUOyexnaCMk1discr7OTdu2xth6h8h4=
X-Google-Smtp-Source: AGHT+IFE26PRA+22Uk31oDu2pNkQTIQES/sJo4hI/ppGjAnl8txjhf2WmdKxOlabA1PgtC6jYvKnfA==
X-Received: by 2002:a05:6808:3c99:b0:3bd:3488:7240 with SMTP id
 gs25-20020a0568083c9900b003bd34887240mr270523oib.36.1705021043786; 
 Thu, 11 Jan 2024 16:57:23 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:23 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:09 -0700
Message-ID: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021044; x=1705625844;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wENP2S/Vqt+dwZglDqkfq2iJmFGtSBF7T1/7Gc3RoOY=;
 b=UnbgmLuW6GbyD7RxZlETUJZSr4FB8n2TDif0Un37POi+sk7U7X7c37kAjGLcsD1XTm
 Nl1BRCGNs4EP9gOLua+5u6DJPtEvUpw1G0m9CFWngvHBszDsW/7IRXMosPPrsljfixDV
 VZmI3UD6Wbo/lAS4SXlE6nOBOyFpcubg5jUw4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UnbgmLuW
Subject: [Buildroot] [PATCH 00/10] more flutter package improvements
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
  package/flutter-sdk-bin: bump version to 3.16.6
  package/flutter-engine: bump version to 3.16.6
  package/flutter-pi: bump version to
    b816d8cff40e917ed0bc7905ec5f8611c08b5875
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
