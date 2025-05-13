Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879FDC3ABC3
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 12:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E6F540E43;
	Tue, 13 May 2025 12:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGaEAWsgvkZW; Tue, 13 May 2025 12:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62D6140E3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D6140E3A;
	Tue, 13 May 2025 12:06:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15E6F150
 for <buildroot@buildroot.org>; Tue, 13 May 2025 12:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0701F40FC5
 for <buildroot@buildroot.org>; Tue, 13 May 2025 12:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRKSVW-jeIG4 for <buildroot@buildroot.org>;
 Tue, 13 May 2025 12:06:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0661740970
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0661740970
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0661740970
 for <buildroot@buildroot.org>; Tue, 13 May 2025 12:06:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5fbf1026309so752527a12.0
 for <buildroot@buildroot.org>; Tue, 13 May 2025 05:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747137967; x=1747742767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JolZfolD/DyUdBXNo61o0Kdsffn8vTL8/oVbk65XuOw=;
 b=VbXB9vtDsCrvqYJtmkmkQE6szCWV+G9ROY63zBTF1s1RfHn8azUaHAb9tQVBqnv96U
 qUzwwzFySpkb5FqHUKWIOf9JkbVwGif8nW3qsJ0iljLpQ0Sm4lIJIs9j8kyQqm6rLgh9
 NljyL9EU7c8Iy/FtfuWw7l9BzWVRDXrwPX6Y2GbHba/LdYNWJdFfAm60PbGSZHiBp9ZM
 HgvdqM7xwMtaPkkS3Bw5eS0lmsD6STMAr7+Wys1n3MxwEgg/U8eT9zvE3LWb5K9Fqjla
 Gh3U9K3DBx+yXdJCvU+AjHk6pgLhZKQa5QKYAdT/kSWW8AXbFUmZo3WFXqpgEUnOsSma
 DvcQ==
X-Gm-Message-State: AOJu0Yw4VXbATJpcnA9XMfGYTI9BCNFbT1Q5lA0oYs3ftcaP22R/6GpB
 kDVLI8P+gXX0Xe4IP0REzx7oV/JCi6m1o7vMitSsIGz0+h1Ip15d3vCoxK96DBqMaUxWuOpjp3Y
 RbtY=
X-Gm-Gg: ASbGncupTSYFQ8Olig1nWDw2R30uoSTjibhshiYtlfAG8eo85RXUOMWFUnXIWVBaUNa
 F7K+3ybAUPrNTefA16e5Q4ZDHyBk/3y1Ag52mH4eyzBzHJvloUKFNsNSaTVo9D3J0OfKRCKNq2/
 20+UIW3hi2ja1WV+k0aVmePAudKpGxifhihlJvLJRLCYN0JeLGMdNDrB22xqPpOurnihlsicUSK
 zQujNBoS3p0tkV+GPQFVNqxLJwx/DLyDu3XlRjskSea2czU1WvyPH80zwhzLpw3lVtMYkZuP+aD
 E6vGixBzNwkeEVlS9ZXXy3Gu0vGM1WCB9M2TgL5ZE79yEwGGo//wOobrTwiXMIvtU21jQ3B/2wG
 uFzROpNprgy5x0hGuLuCluqc7sidcjj0rgj03Scl8rM8v1txLCtr+tNclHe+ydyVLcuqB+FuTGe
 rNBFKF2pgGyllPSSg=
X-Google-Smtp-Source: AGHT+IGVP6RQXVIrqQSFeH0oehhNdS6qy8tlEchzb/44QOvp5c897xkqPVFMAssZeyAqBKRBw+q2aw==
X-Received: by 2002:a17:907:7636:b0:ad2:2671:2e95 with SMTP id
 a640c23a62f3a-ad226713184mr431452366b.8.1747137966588; 
 Tue, 13 May 2025 05:06:06 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad219376451sm770038366b.77.2025.05.13.05.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 05:06:06 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 13 May 2025 14:06:04 +0200
Message-ID: <20250513120604.146496-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747137967; x=1747742767;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JolZfolD/DyUdBXNo61o0Kdsffn8vTL8/oVbk65XuOw=;
 b=DNGF0v0Zt7jM6gEtsEoVoqxpvh11Hl8WobN6zif3GSi0KOEFtEWslWXisqKhHnefm7
 ae0HjjogXXfYUYk1my5zm1WZmVNOH61Mi3Ply8c3Yfv/pnsKECvXI96EBeVdNOTvLkY3
 n07/WTAjSYbSiB7jPPZ6V2OjGW8PR5/A1F+Hg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DNGF0v0Z
Subject: [Buildroot] [PATCH 2/2] package/sysvinit: bump to version 3.14
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

The biggest change for 3.14 is the maximum inittab entry size has increased
from 127 charachters to 253 characters long AND it logs a warning when a line
longer than this is found AND it refuses to run a line longer than 253
characters. It doesn't truncate too-long lines anymore, it just drops them.

Changelog: https://github.com/slicer69/sysvinit/releases/tag/3.14
Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sysvinit/sysvinit.hash | 2 +-
 package/sysvinit/sysvinit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
index e806ad3786..8de1efed40 100644
--- a/package/sysvinit/sysvinit.hash
+++ b/package/sysvinit/sysvinit.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  cbaeabddc35a6511b87c87452ee5e87c678a26329c7d7d17fb69a2b42a314d86  sysvinit-3.13.tar.xz
+sha256  c90874b8c054a35991fb8c4d30c443ed1e9b1815ff6165c7b483f558be4e4b53  sysvinit-3.14.tar.xz
 
 # Hash for license files:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index e0eabc933c..7e73432ea2 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSVINIT_VERSION = 3.13
+SYSVINIT_VERSION = 3.14
 SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
 SYSVINIT_SITE = https://github.com/slicer69/sysvinit/releases/download/$(SYSVINIT_VERSION)
 SYSVINIT_LICENSE = GPL-2.0+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
