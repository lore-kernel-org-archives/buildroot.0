Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EB8C36002
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 01:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48CA2411B2;
	Tue, 25 Mar 2025 01:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-Hh8d3ZaUEQ; Tue, 25 Mar 2025 01:46:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77449409E3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77449409E3;
	Tue, 25 Mar 2025 01:46:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D561AC0
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 01:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2483411B2
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 01:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khLlaL1P_EUV for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 01:46:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED68E409E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED68E409E3
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED68E409E3
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 01:46:19 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6fd80f30ba5so32839907b3.3
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 18:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742867178; x=1743471978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ujh2R2IkplZCacEQXbrbafYkdIDieZABIAklScSqNXA=;
 b=aX7ONlgtZvqpg6j2jwpY53JnnpxGzTRV2jAHKnqr6ln2KpnraxC86P5V+GB51m8LQc
 YHoPMlO+sMHkLFPNu7aDO6FsntvsGVZTYpdrnQhNUyW/FZzeDE9vOSIbORBgTrw/C3f3
 hjG3r2wugVKUvZXFRBMvWUeT1uRHPhoALoP/m09x/Aimz7WfD9bLtkR1AR5k4KqHXXoP
 3ohwLraftQ0cEHBLCzRTJHfzmhFHOrnCkKZdHV4All3DtXv/SZ+Pojxr+KPJK+1mrChN
 yjRW6viM/ihehvfszOTcsupsk0HsQps52IUOa2HahmY5Z1JLmC+KfHEaO2M4kcWtUd1p
 9HuQ==
X-Gm-Message-State: AOJu0Yy9YLRw/AbxVKfVK6UNNMX4Ph/q5jLI5xxdK054VIc0h4sLLZZV
 02XM4Li6al3ZVuCOSZW1Qkffo980duW4cYetEs6jZZifdocoQdsy+UPRGA==
X-Gm-Gg: ASbGncsrsTe74952kg+nbiCrWxkJ4oV3DaNFthsfLLp1ai9mYcy3fs39+bhZGCg3RCN
 4Xk4ul2MWJHB4TkwtpfB5TR5MgBEnjT2wgP0yncD/cCC7RB9KI2kexU7U+qt6B2R0l7etlvfg53
 5Q9ush733yd07USL2/roqvj63ZBtbF+zvBoe4GZMht0S17Y4MMBycm5Hfxh2meY4g64Acmtc9Jh
 EVLSfd4PqaQWvupMDCQ4MjPDlGqo8UfSYCnlzv8UXvqljMeFDswVA2bOGMfZeXb0wlHq+CIaRxl
 XuY4qVMazrf7oY90AV18GszRIyRoXJjtkgndOIoFwg==
X-Google-Smtp-Source: AGHT+IFiboUPrhyG991PL1T1s42CcHy9wa9RCJ0DahIXW83w4SzZKfFS2lfOIUvqXdN4o5O5jL81vQ==
X-Received: by 2002:a05:690c:7205:b0:6fd:2fcf:12f5 with SMTP id
 00721157ae682-700bacff5d1mr216840737b3.27.1742867178148; 
 Mon, 24 Mar 2025 18:46:18 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-700ba856f05sm18164267b3.77.2025.03.24.18.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 18:46:17 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>
Date: Tue, 25 Mar 2025 09:45:51 +0800
Message-ID: <20250325014602.1168402-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742867178; x=1743471978; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ujh2R2IkplZCacEQXbrbafYkdIDieZABIAklScSqNXA=;
 b=Jc1LrPcKxlPjw5iic+kabP0ROFETsSggPnXHr+tUEwgtNw1CjbcyPiCf5DiUL7TWGI
 3/nzVwlEhE/2e9jrPLYEJ96BSmMnu0nu6HoT0oVJb7BbEqHyQ75FEL+w11I81jmIkygA
 xzBzYM/on6Eu290KIKnYBKJmJxk1jm+MoOxgwl4zQGjx/lWfuJIcS1dCugXVVS/cEzI5
 DGYTZCeqsUqJxh/3FVg24mEZCmmxG4wyp0ygD1e40+iDkh5yFPIpwoiAHE0+eBJ3bOl5
 0iiv5ERka4meFhIYUHL0m80SD8371H/CdJfP2qGIKjQdkY6EVvb1Bhv7CxHieugLdJ0y
 o+Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Jc1LrPcK
Subject: [Buildroot] [PATCH] package/timescaledb: bump version to 2.19.0
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

Release notes: https://github.com/timescale/timescaledb/blob/2.19.0/CHANGELOG.md

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 95dedc0d92..4e4cb16858 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  30f4ddf5bd71e4e30706f6715aa52109b4672c611e5948d865a2b43471032a92  timescaledb-2.18.2.tar.gz
+sha256  783bfcb6513523827127304d3e51c27e95644f59446bef80d4a96d5de58ae5ee  timescaledb-2.19.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index fdfe9c0539..584c73925b 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.18.2
+TIMESCALEDB_VERSION = 2.19.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
