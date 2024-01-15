Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004A7C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 07:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8693940933;
	Mon, 15 Jan 2024 07:41:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8693940933
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dR_dTGjfXdqV; Mon, 15 Jan 2024 07:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C33FA4092A;
	Mon, 15 Jan 2024 07:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C33FA4092A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE7EB1BF396
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 07:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B051C607F7
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 07:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B051C607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qbshNRDH4Ik for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 07:41:22 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60AF4607F1
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 07:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60AF4607F1
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e7af5f618so9227926e87.1
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 23:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705304480; x=1705909280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mytuqPFkD3UuBWZ+Nq8pjFlelzi9Vg8Hd0PPEPKvXJM=;
 b=FOOVtRTwPE7YvGWFAXC8DT+ZZrJT9zGcADXgerJzUu59an5CssJZkSMiQO+vCHJx0l
 xDHCJwVPeq2dabTvEOpGayuXJ+ZtmAmPmOzcl/+sc1QeLQqljJxlK/YFAQzj9jt3CL0B
 4Ka0LoM58MF+b/zTb8NW/A22juiFMkT49fOW3TZglnu6l6FHeTu1949vf4oZdXg02pQM
 hBvhK9n7BF0wD/ORV5ZPDEdRTmj+mZQFQU+muSqmf2qms7t3lfVbB7geh2uCSWy1XIeo
 5j2wV9qpASkKPPDFsBtjX6a4l8ZgPqacW9I6W8RhpmElE2A++7Wb4QUwSwpzPcajXFFD
 re8w==
X-Gm-Message-State: AOJu0YyND8mmdto2VBZmUial3hJAoZg+Lwoz4qrlh6yI58nc1Pl+Wlmt
 /Ep9k49GxZlAesdc2pLJYa84jBez6+Pl/Q==
X-Google-Smtp-Source: AGHT+IGRhWpWGYn32w8iry1EOm2uDZXpmaEoMvbNoITDoNnW4BqLoiZJxG+LCZtPdGsh4klGqcJgpg==
X-Received: by 2002:a05:6512:1247:b0:50e:b622:24e9 with SMTP id
 fb7-20020a056512124700b0050eb62224e9mr2732076lfb.85.1705304479549; 
 Sun, 14 Jan 2024 23:41:19 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.204])
 by smtp.gmail.com with ESMTPSA id
 fc6-20020a056512138600b0050e9c5b289asm1383913lfb.91.2024.01.14.23.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jan 2024 23:41:19 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 08:41:08 +0100
Message-Id: <20240115074112.157216-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705304480; x=1705909280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mytuqPFkD3UuBWZ+Nq8pjFlelzi9Vg8Hd0PPEPKvXJM=;
 b=G5w4a0vfFPYV45rYHi3Ea8kQhiIwzvzzM6TC9/tPAyr7ergJmGt19l9D3r7QFAUKdD
 kfxlxOZSGm9tudiMWsduXDYqwHSKFjZeAT0qj2wkUi+xHkynnYrEsAkmkLYag1wJMARs
 5Ez8yrDjXuT5tFOTQUxcATdURU+bPcsXG6SLTLyCV09ljjvgWssLMT9Ub1IfQDA3dZv2
 dJVjwhDE192XVbwYySH++Yrx+AM4xiW7oLp6+BJddvifGR6Yqb8Ws/M6vDnwYruySuVM
 XwFy8sMi/dkLgxJlEfljP6bR1ZxzaraCrxuhOLI73YXKWkEZ7SoXSeeFBYu9tnGVntYB
 rAJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=G5w4a0vf
Subject: [Buildroot] [PATCH 0/3] package/watchdogd: version bump and major
 Config.in rewrite
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this patch set upgrades watchdogd to the latest version, a major upgrade
with lots of fixes and new features:

  https://github.com/troglobit/watchdogd/releases/tag/4.0

One such change is how the configure script used to be --with-plugin=SEC
and now is just --with-plugin.  This is handled in a separate patch of
Config.in, with the legacy migration support from int -> bool.

The split in separate patches for bump and Config.in changes are mostly
for clarity, but works because the SEC poll argument was always ignored
by the upstream configure script, and the same is true now. (The poll
interval has always been set in the /etc/watchdogd.conf file.)

A couple of new optional system monitor plugins were added too, these
were added as a separate patch.


Best regards
 /Joachim

Joachim Wiberg (3):
  package/watchdogd: bump to version 4.0
  package/watchdogd: convert Config.in options, int -> bool
  package/watchdogd: add menuconfig support for new system monitors

 package/watchdogd/Config.in      | 46 ++++++++++++++++++--------------
 package/watchdogd/watchdogd.hash |  4 +--
 package/watchdogd/watchdogd.mk   | 30 ++++++++++++++-------
 3 files changed, 49 insertions(+), 31 deletions(-)

--
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
