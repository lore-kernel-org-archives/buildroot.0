Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D321FC54E49
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 22:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34F6A60626;
	Sun, 25 Feb 2024 22:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eti-0jQ4GrCQ; Sun, 25 Feb 2024 22:05:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E99D6064C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E99D6064C;
	Sun, 25 Feb 2024 22:05:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8C21BF3E9
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C32581311
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 22:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMqn9xRZwEw9 for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 22:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B428D812B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B428D812B6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B428D812B6
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 22:05:38 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d240d8baf6so31599271fa.3
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 14:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708898736; x=1709503536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Df7ZdxKfXbvshZ0bc2TUwO3TWmpvzZlX4VcOcSUroYg=;
 b=fJW83DzyzRpbgOhIhfFflMQ0JRWCdn3IW79aVjlSgM4f8sAbITr8TmIVb43cmRT0Ap
 v2IghwdTBndLrbNHxg0B4DMsboThmvsC0ZG3hJN0VNdShvCbqFOBlkqY1hHBj6gBmI0o
 yp78uRmcF0BXoUzNlItN8urf5JpoNhKeIJSI/lIOgyikyDIl9+2MI5mm0hF9hXWONh4N
 E7dHURPw0XG/uoLTIj8aNK7e4Nivj3B80fvk1HxgTNpDvPd3yRtOdxfAoM0ulKXrbKL0
 sIXL5+mAZFCsc0ZDO0HFZQwSNkyoSf6UqUvxosGocS4k9lWK737pbaL1LXbajM53CTpN
 2VwQ==
X-Gm-Message-State: AOJu0YyvJV/UjW1dqCp3LjWaLvnATjiy3PcMVs/MNL4dtjMTy43eNz0B
 aPF534LWq8hHO6iYTjOgWFj3c09UQDvA8tedIEdBQc/bVE3NiFkDGmdpEs+B
X-Google-Smtp-Source: AGHT+IFwFcMm2lRntcrv8bjZNbTAJAzuKWpPeVza4QJf2FxtVcXTZrswgEdHPu7uAEeeUa0KDqnNfw==
X-Received: by 2002:a05:651c:548:b0:2d2:7813:6ca3 with SMTP id
 q8-20020a05651c054800b002d278136ca3mr3778266ljp.9.1708898735935; 
 Sun, 25 Feb 2024 14:05:35 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a0560001a4400b0033d06dfcf84sm6084111wry.100.2024.02.25.14.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 14:05:35 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 23:05:35 +0100
Message-ID: <cover.1708898731.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708898736; x=1709503536; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=Df7ZdxKfXbvshZ0bc2TUwO3TWmpvzZlX4VcOcSUroYg=;
 b=RQQSvpJwfkvkvYCr/ITj/TqFDVngSlPGJm/xgiIRaRBzJcvODZGlWTnI6zgMg66AIg
 wyljm1iJ76p/eJUkqLLsrdLVFI6C9HiHagnaZPzhKNdchKT+2E2Wk9G3fZvGApjq58jk
 6wAjivJlYguOQLbit4sJUkiMKPoc7+mVJ796rLLe+mt7QTO6+TYjssB2qO53mK7+z8dn
 ShfdlycWVDrJJnWDfYE8SxBBBw5JNXvGVf0RyafWwgaLfbRC2nFVB/H954SWkRAZpJ+i
 84SvtqMOmGtZMMK6sy1nLrf3xRf0vrHGozBkofhyusv2yHUlgsLCZRpRZop0+ybu6B+W
 b1FQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RQQSvpJw
Subject: [Buildroot] [PATCH 0/3] support/scripts/pkg-stats: fix CVE
 identification (branch yem/pkgstat-cve)
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

Since we switched to the FKIE CVE feed (as the NVD JSON feed are oing
extinct soon-ish), we missed the fact that the new feeds did not have
the same layout as the former ones, breaking CVE reporting.

As a consequence of having no CVE reported, w emissed the fact that the
CVEs were not sorted in the new feeds, while they were in the formers.

This series fixes both issus, and introduces a minor fixup for a python
deprecation warning.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      support/scripts/pkg-stats: fix datetime deprecation warning
      support/scripts/pkg-stats: fkie json format
      support/scripts/pkg-stats: sort CVEs in HTML output

 support/scripts/cve.py    | 26 +++++++++++++++++---------
 support/scripts/pkg-stats |  6 +++---
 2 files changed, 20 insertions(+), 12 deletions(-)

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
