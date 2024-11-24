Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9416E66894
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 10:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11DFE610BA;
	Sun, 24 Nov 2024 10:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtom4aKhEe4f; Sun, 24 Nov 2024 10:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AE2F610C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE2F610C6;
	Sun, 24 Nov 2024 10:50:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 950D94961
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 829AD610BA
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USLzzWAXO8sm for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 10:50:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 898EB610BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 898EB610BB
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 898EB610BB
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 10:49:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so31588395e9.0
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 02:49:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732445397; x=1733050197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1FqoHd0SqWu9f6NH8h0T+wgrsLJP11CsUaJLkS6OryQ=;
 b=hNRSjU90YOLOIMWJEvi81mP0NQW26c5LfIRt8dx7/+nxBqF9xC/GIv5aUoFDczfZzc
 51OJbNK83C9pxzKW26qAS//fzFH3MNAh4VDOZftjvNLvqqQyMRaB3YJanpbDsidfqpXD
 U63AM9ojxYIPpvv8Lodm8cse/kZGhslc1SuyIEWkmsyEbZejsZNCOQlopP04UtzbJJpb
 8t4zNDlA1DLnvEIX9AgIdBriRRgaV0X0E/VmInts5NfcFmUb57umtOFK3+pWuuBfXZe5
 ae+SQC1MvBbRSKWy5cFxdrMxxpRPc7gb8z+/sGEp28QLZikRcnMhl+1dbUDCwwgkMj+s
 GEYQ==
X-Gm-Message-State: AOJu0YyiI620DeBc57c4y2g5YAKJsn+R/pC/k0jxmQonnv1ey/UxsLjW
 8WwbFtJeYDk9xghu+V+vqxwh5bvVri/v/lhcvekNsjZx45GNlS/dUjNpeCjc
X-Gm-Gg: ASbGnctE0HnIN3UF9x+BpZFEHCWMyoXHMZnJZOnvq6oKjmDPNqvq6mFh1bsZ9iiADsY
 FqDt9xz3LFbuDFdxk3CGco3zQLM/mqRVgMXLGh+UAYdC1fwZpaFr8TZz1EFBV2JHy8NsS9SqxHE
 JEKN051zbh8u1RPbjDwdJiUuPJwxrA+KeX5BbWhy73pspDVJcvWJJbLDCFBUX410gTySCITNkN/
 DebiMXx7bFz/o3NpuLkrtqegPhGVl6RH5+FMxZ/iDCG3YfslO4FAatN
X-Google-Smtp-Source: AGHT+IE48EOcmtvd1zyEdCHUxDlosAKQN2SOjnVOseBMEAms69JHCB/tZIkt6IexE6BU64mnRJJNeQ==
X-Received: by 2002:a05:600c:138c:b0:431:57d2:d7b4 with SMTP id
 5b1f17b1804b1-433ce490ffbmr67971645e9.26.1732445396218; 
 Sun, 24 Nov 2024 02:49:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:8070:2483:7e00::478])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde110cfsm88665515e9.11.2024.11.24.02.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 02:49:55 -0800 (PST)
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Nov 2024 11:49:03 +0000
Message-ID: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732445397; x=1733050197; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1FqoHd0SqWu9f6NH8h0T+wgrsLJP11CsUaJLkS6OryQ=;
 b=e8GQ6JfMVftxCV4FroZmJ1L21x9THpXnXhDVOX3t8HWAzRF5tnX3Gq7bM2V5CX32oh
 SzmGg107tnCeNhkCgcZkDv8ubV0sQ+Hez95xWCsjRbM77YY3Svi01iq/8k13/jlKdQfR
 hxcdMF0e5z+mYgw6T0JT2cuRc67LL1EUSJ//oA//Q2q+BwKg48xBUybHgUSMpsDxASpd
 QVS6R8fm75E6WQoWPhAwwzvu9pG4FxcSFC9ZFH/8/AP2zziDyijRq0+lq6eXVvr+ab9I
 Ef+2YG6G49gTz+Uz9MlmP9Fi3hOLuSyiey1wUOo5u6QHDI4Oa9OSaDASpmc/Rj5mg6kp
 MYpg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e8GQ6JfM
Subject: [Buildroot] [PATCH 0/4] package/sway: bump to version 1.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To bump sway to 1.10, we need to bump wlroots to 0.18.1.
To bump wlroots to 0.18.1, we need to bump libxkbcommon 1.7.0.

Also, if wlroots is bumped to 0.18.1, we need to bump cage.

Raphael Pavlidis (4):
  package/libxkbcommon: bump version to 1.7.0
  package/wlroots: bump to version 0.18.1
  package/cage: bump to version 0.2.0
  package/sway: bump to version 1.10

 package/cage/cage.hash                        |   6 +-
 package/cage/cage.mk                          |   8 +-
 package/libxkbcommon/libxkbcommon.hash        |   4 +-
 package/libxkbcommon/libxkbcommon.mk          |   2 +-
 package/sway/sway.hash                        |   6 +-
 package/sway/sway.mk                          |   8 +-
 ...1-Add-feature-macros-to-more-C-files.patch | 181 ------------------
 package/wlroots/Config.in                     |   1 +
 package/wlroots/wlroots.hash                  |   6 +-
 package/wlroots/wlroots.mk                    |   3 +-
 10 files changed, 20 insertions(+), 205 deletions(-)
 delete mode 100644 package/wlroots/0001-Add-feature-macros-to-more-C-files.patch

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
