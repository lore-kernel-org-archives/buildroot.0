Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3481C27C78
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8455260629;
	Tue, 11 Jun 2024 18:02:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ua4qhpkNglds; Tue, 11 Jun 2024 18:02:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84B9F608F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B9F608F6;
	Tue, 11 Jun 2024 18:02:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05DDD1BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7EA1608F6
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pn1IIUr6dry for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:02:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BBF260629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BBF260629
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BBF260629
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:02:12 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2c2ef6617bfso1259833a91.3
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128931; x=1718733731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l9B/ZH9TnTZWc0D5ya35vMWY51bV7zyjWLEOoeGxxMg=;
 b=t5H4GK5FjhmD6wf3ozTLek30UpOraXj0n4OJ+CFTPbizEyKDvmtqbVhZYh3dpTfNEq
 KnlQXPpR7tV9oeDeOVkaSitcvRzYHO9XuRb25ZHq4pHFwZr6kfp2RcXX0PqlmoSZEUex
 PaLkKF7FEOLTRAI38c45V/hDMVa5Rym7yAx2CknKNeFBL4Xx6u2IglZ3mRSB3zu03w0w
 9egMZQAqD6Cze6tKzbAJ9ZpzQXSR9R4lZPf4XDKUZLOfrwq4AK+Di0GUFyRe+A0KdksV
 9wwCo+No2fcMVRzqrPOyojEOJIBPOIdLJXJHGcKzDZUKsrMMvHfSWWE0JkLTTlbL+zyn
 Ytcw==
X-Gm-Message-State: AOJu0Yxju5TA6RbWRW3pa5MDNKUB0duhqc+WsPy/88Sc5pilYV9pVaEY
 rafv+dL5A4TnpRfxe52dDl3xXU3+DBuHLukclQATm0bgPiNHpxgSCcOJLGKl
X-Google-Smtp-Source: AGHT+IFbtNmMi5/sWY3mNhKYL865WBJX3OF63pbZ0EAZwNXd++ZsrgK5wK7AWH0wBpAye35lfV1TRA==
X-Received: by 2002:a17:90a:ac17:b0:2c2:d4b8:832b with SMTP id
 98e67ed59e1d1-2c2d4b887d3mr11941445a91.23.1718128931298; 
 Tue, 11 Jun 2024 11:02:11 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c2fbde41ccsm5673927a91.11.2024.06.11.11.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:02:10 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:01:59 -0700
Message-ID: <20240611180207.2138847-1-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128931; x=1718733731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l9B/ZH9TnTZWc0D5ya35vMWY51bV7zyjWLEOoeGxxMg=;
 b=J8n4kRlZJiAR6XLN/bf7MRDpQtI9yco9VeErnRBm2KY8lB55FxgdkUPOogba6yLtrD
 i4fdriPppmBbvHM7Qd1c6ssW19ONM/EYJUS79Sf5scs2TWEGHxhvpZpYaAEVgijmJJcg
 c+V6Fwy/MYR+ZOIYJU2Uv6U7D4HHNncB9khc7wFzuCq56ViMDNmLRXjJabXlYoKUVwa2
 f3nhPqaMItX4kyNVGPGzYh7xYLKOgxEJ3GIfOR0n9mFsNSquRi5PAoYEb/7niHXt4qqu
 53o+eska64BxnOVWLtoTMb591Y92wwBK+CPgPuLZTtonYxn7Fe24YelsRTpR2JB6+yXp
 Q56A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J8n4kRlZ
Subject: [Buildroot] [PATCH 0/8] boundarydevices: update/add defconfigs
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series updates boundarydevices defconfigs and also adds support 
for two new defconfigs -> nitrogen8ulp and nitrogen93.

Chris Dimich (8):
  board/boundarydevices: update boot scripts
  board/boundarydevices: add i.MX 93 support to post-build.sh
  configs/nitrogen*: bump kernel revision to f789d32c
  configs/nitrogen*: bump u-boot revision to e3228228
  configs/nitrogen8*: bump atf revision to d18357b7
  configs/nitrogen8mm_defconfig: add SMARC support
  configs/nitrogen8ulp: new defconfig
  configs/nitrogen93: new defconfig

 board/boundarydevices/common/boot.cmd      | 111 ++++++++++++++-------
 board/boundarydevices/common/post-build.sh |   6 +-
 board/boundarydevices/common/upgrade.cmd   |  11 ++
 configs/nitrogen6sx_defconfig              |   4 +-
 configs/nitrogen6x_defconfig               |   4 +-
 configs/nitrogen7_defconfig                |   4 +-
 configs/nitrogen8m_defconfig               |   8 +-
 configs/nitrogen8mm_defconfig              |  10 +-
 configs/nitrogen8mn_defconfig              |   8 +-
 configs/nitrogen8mp_defconfig              |   8 +-
 configs/nitrogen8ulp_defconfig             |  63 ++++++++++++
 configs/nitrogen93_defconfig               |  60 +++++++++++
 12 files changed, 236 insertions(+), 61 deletions(-)
 create mode 100644 configs/nitrogen8ulp_defconfig
 create mode 100644 configs/nitrogen93_defconfig

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
