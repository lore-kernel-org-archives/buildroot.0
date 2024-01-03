Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A23DC46CD2
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 02:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B19EF81EB1;
	Wed,  3 Jan 2024 02:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B19EF81EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cw1AIm4mNcAV; Wed,  3 Jan 2024 02:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D759681EB0;
	Wed,  3 Jan 2024 02:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D759681EB0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9EE51BF2AF
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 02:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B79B60EF7
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 02:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B79B60EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ulx6Q5v5L8fU for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 02:06:17 +0000 (UTC)
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2E7560ED6
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 02:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2E7560ED6
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-594965fbb3cso4725232eaf.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 18:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704247576; x=1704852376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aznLap6wY/DaD4/dWLnQVMA5GlysF50XyqR/IYHxATM=;
 b=nHUueddQeTN7+bY0drJBUHcRqJ1/pQOr+Xgo8KnLBj7PN8twbwwt5gC4bxX8uPXgMB
 AHD+YbkZaGBBYXcORxihfJKeauIi6OYdsD1qO5Qrz6nNjrM6gsVqlcDs+8DE3cQKNywr
 TzBJdFuY3vJKsBRXSPyt50vjX2fzpNZHZ7OA1jomZHwpVmpL2viUnP0OA3RHQ3oIiIlq
 QXwwZniPi+gSOlLsLAaZbepWqHu5YKRhdO7nsrLTqnF3w+rtEJxHwrzFkHaW8ufCKZNB
 FB/yRcibt5BUTckLprM7YJTkQM0FVtVlssrC/zRsLzZtGdwiPv1FK7j7XIiQkE2i899D
 j4Zg==
X-Gm-Message-State: AOJu0YzSJhtUaVmeJ4AOgfeiI5uvG2HSnn2UOnoyq7oI74+TCrT21/P/
 zislQ/0qRNynxQz3xiVOkipnZtfdcoywUrQLZpimq04pDmo=
X-Google-Smtp-Source: AGHT+IG+3to32aFLkasG3HLU1dDZ7C4zmp7dlaJsfYYQjPpcAogTskUpV4aAxbhpbnf4ljuEPTL7bQ==
X-Received: by 2002:a05:6358:4298:b0:175:50c2:50e6 with SMTP id
 s24-20020a056358429800b0017550c250e6mr1261840rwc.40.1704247575631; 
 Tue, 02 Jan 2024 18:06:15 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 f4-20020a17090ac28400b0028c060d5c59sm309428pjt.15.2024.01.02.18.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 18:06:15 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 19:06:12 -0700
Message-ID: <20240103020613.4084011-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704247576; x=1704852376;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aznLap6wY/DaD4/dWLnQVMA5GlysF50XyqR/IYHxATM=;
 b=mhQwwmqdm2nZ79ZcBm5ptPW/+GmgE7RYO9vzh4KtM8UjHC/kw0GXELwJhtRUO/5qhZ
 7NshvkRFIiS2ZEU9fJvfYyKWMkdhhxFeqso4xmSrz+yanijJuygL/Drl2glM+knwAk7z
 Olo3YEYC5zDUjyNudfW5036qvQ7JTxbeGbIik=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=mhQwwmqd
Subject: [Buildroot] [PATCH v5 0/1] package/ivi-homescreen: new package
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

Included is v5 of the ivi-homescreen patches.

Changes include:
  - Drop support for the file selector plugin. Amarula doesn't need it and I
    wasn't asked to port the Zenity package. The file-selector plugin is
    hardcoded to off.

  - Add a more comprehensive commit log as to how I tested this package.

Adam Duskett (1):
  package/ivi-homescreen: new package

 DEVELOPERS                                 |   1 +
 package/Config.in                          |   1 +
 package/ivi-homescreen/Config.in           | 167 ++++++++++++++
 package/ivi-homescreen/ivi-homescreen.hash |   3 +
 package/ivi-homescreen/ivi-homescreen.mk   | 245 +++++++++++++++++++++
 5 files changed, 417 insertions(+)
 create mode 100644 package/ivi-homescreen/Config.in
 create mode 100644 package/ivi-homescreen/ivi-homescreen.hash
 create mode 100644 package/ivi-homescreen/ivi-homescreen.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
