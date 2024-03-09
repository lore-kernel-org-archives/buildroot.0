Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01D3C54E49
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 23:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AEC0608D7;
	Sat,  9 Mar 2024 23:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Ow21pdTvfJx; Sat,  9 Mar 2024 23:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D57360A3D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D57360A3D;
	Sat,  9 Mar 2024 23:44:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9ABF91BF2A2
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 928C781886
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 23:44:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3iq0ihSYpTk for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 23:44:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E431817FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E431817FD
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E431817FD
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 23:44:30 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33e6aca1ca9so2749832f8f.2
 for <buildroot@buildroot.org>; Sat, 09 Mar 2024 15:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710027868; x=1710632668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+CPqCeo4zX+EQowkTUXBTxmcBvA8sEXJ20KxlNpbMQ=;
 b=QKWlKNXqr+ARFKApg29sAATUJrRhVF0xh5i5SVAMOvViDbfplDeWB+yiIsymrdnswy
 IeDxq88mU2/RGYjf/t7MmeE0LL+LIdoAh/Loyoh2lfQfphlNqIJ2Z0eUmlHxIm+7+Kg1
 vTfZXDZt9em2if9LqjvfKrHDek5wtuOmdbSTjov3HsUyWD6aiRw6EKg0/lc/bZKdp4WO
 b2nbs8AMBw+zNEsy1otuLCVvdiaAo9o0H2rospsJkzQyXurkYSIWV1SAcz4XmrwDTxfJ
 bqZ8ImIvgJsmE73yBdb1eraKq9m/6d/4C/qw//PozK6HxlhCnsjsO4PPtTPHuCFh3qky
 l+xQ==
X-Gm-Message-State: AOJu0YziBiCstX4DRQn4TQWgxsb5GJZWIo5pruvsJgOMVL078kKroywn
 JtzmR4LB+k8TzewxIAaBPOIo4vaA/V1ViJQ7ZCiCWjD8L1zOu72jrRRRjC4T
X-Google-Smtp-Source: AGHT+IHrA9Q+DJyVcmwETDWjWizbDzBYzAuPglDhHV8WfAEV4AkcShg1r13mx3nXRV5sqX+Ami5ssQ==
X-Received: by 2002:adf:a4c4:0:b0:33d:87e9:5900 with SMTP id
 h4-20020adfa4c4000000b0033d87e95900mr1727407wrb.62.1710027868086; 
 Sat, 09 Mar 2024 15:44:28 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d6a8d000000b0033d202abf01sm2812156wru.28.2024.03.09.15.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 15:44:27 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 00:44:26 +0100
Message-ID: <cover.1710027863.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710027868; x=1710632668; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=f+CPqCeo4zX+EQowkTUXBTxmcBvA8sEXJ20KxlNpbMQ=;
 b=gzD8oIp2xrtwIAw5Ev4Sb7F3H5D/6GJAj+hGsQUZLtDQmvTkeO2pdALiUZU1/2QUFK
 HN/4F4M9DuK7LYg6rnjkbNFyLXgYCKjrAnyNgzGVSRKWWjRJJ0VTlZCltfc4+ybRslJ6
 Y6BeW2SmPxfG2eaKq3dN0ZDGTYSecqsFKVu6FDDbVOz5jSvkSl8LgCfFD/L4sPsXrw2/
 eNDD0cuvcirEE/rVrID7E74PQpLxGpYqkQ44a/M5SB4DGp+hYlulgqh1ZXhAWyQaAHpk
 wVgBfgVNsRijhPNRO7emtfUHeqsPXgiWEaxTIQWyAFaTp/zTqmCc/glPDeqmnxj46p+C
 9G+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gzD8oIp2
Subject: [Buildroot] [PATCH 0/5] support: accept text files with missing
 terminating \n (branch yem/newlines)
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, masonwardle@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

As explained in the last commit, we expect text files to be properly
terminated with a full line, i.e. one having a final \n.

However, a lot of people do not have proper text editors, and those do
not add the terminating newline, and do not honour our .editorconfig.

This series fixes two of the affected scripts, and also fixes shellcheck
errors in both. Fixing those also uncovered an actual issue in mkusers,
so that too is fixed.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (5):
      support/scripts/mkusers: fix UID/GID confusion
      support/scripts/mkusers: fix shellcheck errors
      support/scripts/mkusers: accept user tables without terminating \n
      support/download/check-hash: fix shellcheck errors
      support/download/check-hash: accept hash files without terminating \n

 .checkpackageignore         |  2 --
 support/download/check-hash | 11 ++++++++---
 support/scripts/mkusers     | 34 ++++++++++++++++++++++++----------
 3 files changed, 32 insertions(+), 15 deletions(-)

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
