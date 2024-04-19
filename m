Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471AAC4345F
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 21:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F131F40B9A;
	Fri, 19 Apr 2024 21:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QstqcHRFcWIF; Fri, 19 Apr 2024 21:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1120A41A52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1120A41A52;
	Fri, 19 Apr 2024 21:32:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C2E821BF977
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE8C441E59
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:32:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkkaNPeRwQZI for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 21:32:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FFE741E57
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FFE741E57
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FFE741E57
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 21:32:27 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-571bddd74c1so2197548a12.0
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 14:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713562345; x=1714167145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JOD80ZY17DgT7z5nyEd3TrFP0y/FgUfQ5MN3cit+OfI=;
 b=NjJwijZyZsOsXAbs/EvrDRkwiP0PWwwDm3SlIr+a/WYOGYjvP7oyMfW/POnCyn+HOI
 WTG1l3+q9qCOBYjWdWQy7IOJk99IbOuSg36CUcr0Zm26rNMQbGDyokTmgkijRPaaJBnm
 VlROpPiCmMsvzdL5Uw6xHWQj5qcaZ82Rqs3Cn0aH8n3gZn+vnnlrEwnio856OTkmsOu/
 editxong68z/BrBa+gK8A/nf9Iryt8aioMO3SiCwgiASroz0uZE60qh7s+W74/gk8DyL
 2SVjoX4Tv1E/pUr/hw3t7FuZd9gJQwFByM6fAIMQgEe+YBVeA5L54AdVypmrL7N5CBeB
 VOAg==
X-Gm-Message-State: AOJu0Yx3fwvhYLhbG+7ZtSvT7ndlZ8slOJcY4sujLlwjyxI7DHDPOLf6
 ayWZuw4l00ym7Ty1oFIjmDx0g0AaIWMkv6xNojHzTNuJVfaPQXGU/lCRkg==
X-Google-Smtp-Source: AGHT+IG/2iJbh/gcZ9LeBhw7hpui7cPMyoHUiQvVXjSnArpzV+nRu9Hebtn4EmUPXnUMJ3wrUCtSww==
X-Received: by 2002:a50:d609:0:b0:56e:418:5559 with SMTP id
 x9-20020a50d609000000b0056e04185559mr2396791edi.3.1713562344570; 
 Fri, 19 Apr 2024 14:32:24 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a0564020e9900b0056bc0c44f02sm2529297eda.96.2024.04.19.14.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 14:32:24 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 23:32:14 +0200
Message-Id: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713562345; x=1714167145; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JOD80ZY17DgT7z5nyEd3TrFP0y/FgUfQ5MN3cit+OfI=;
 b=ezUJ2jYBwDx5KMAmtNJ5pCwhdk6NPpiW6xAnDY24rnucYzZyBIk0bpYqLq8r1jjfQ2
 F4TUgva8CGDz3954z/MAXOZBzY8/qmBWvcdwdkbHcws1tIl7xVQP9I9C/IY4gj4B16TU
 twB50ay3AEFtfRXDfij6hXyn8yQ7eMgHwvXYDuibzhNJHOB9A7VKzn/nuEbIRiNBKRF/
 4lR/s8aeVVk+xDwPAecbNBCGd1f0wl0uJ2NQimW6g7iyRnStkVt5hiynqTFyWinYcXIZ
 7AdAW+Zd7KsAT7deYFvs05ug254pxAL5d3JOx+Gp8nDogvFsxAnT+798s0hZGYkVQKRq
 CJPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ezUJ2jYB
Subject: [Buildroot] [PATCH 0/2] Fix fail2ban
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series fixes fail2ban not installing configuration files in /etc anymore.
While fixing the problem, I discovered a bug in the way we invoke the
pyinstaller.py in pep517 compatibility.
Basically, pyinstaller.py will install data_files defined in setup.py
and tarballed in the wheel inside the directory pointed by the --data parameter,
which is nowadays pointing to /usr of TARGET/STAGING directory.

I consider this wrong, because the data folder shall point to the
TARGET_DIR/STAGING_DIR to be correct and we shall trust the destination path
expressed in the setup.py.

In the case of fail2ban, configuration files end up being installed in
/usr/etc/fail2ban instead of /etc/fail2ban.

v1 -> v2:
Fix signed off with correct email.
v2 -> v3:
Fix commit author too


Angelo Compagnucci (2):
  package/fail2ban: fix data_files installation path
  package/pkg-python: fix pep517 data files installation

 ...001-setup.py-fix-data-relative-paths.patch | 73 +++++++++++++++++++
 package/pkg-python.mk                         |  4 +-
 2 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 package/fail2ban/0001-setup.py-fix-data-relative-paths.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
