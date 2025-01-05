Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8646E77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 03:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E6266066F;
	Sun,  5 Jan 2025 03:44:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXbC_ZKrF9Hq; Sun,  5 Jan 2025 03:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CC396069C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CC396069C;
	Sun,  5 Jan 2025 03:44:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F21E0F
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 03:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ED2740194
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 03:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVS9iXuPGZTy for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 03:44:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BFA8400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BFA8400FE
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BFA8400FE
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 03:44:06 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2164b1f05caso185042095ad.3
 for <buildroot@buildroot.org>; Sat, 04 Jan 2025 19:44:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736048645; x=1736653445;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tmqBY9sTvZQV9vDOouaBEDbMjeUR/9o9BlYolcwcKao=;
 b=o8f7LtePvLZPqgOw8NNfpJFY3GoZyeMxI46uNx7TcGCvfd0PvqDdk+CDRSzJcKnoaN
 eSfaNSURiEHe3WX0hz6+KpOGXZOzAO95K1t1f+ilIvxEPXTZBuCcMvTWgVlZ/RSTjnfk
 pIdMpQl66u6zlKYbSqkCL2CLGvXMB596QrUr52dresDcjKCNbRNu/rpXk9GiBZQRXO5J
 Ka3fIaFS+cFaByRQ+mT/KiTg95DWvFF4DNYGs7B1/jhlX6Vb6fSOMrp6FR+vwgClQoAq
 Cg32CIFQ51KoK5qeDFsAX7Q9AO1iV3dL4/7kqAu7Eal8xhSgfeog1y7tUfetjHqf9909
 8r0A==
X-Gm-Message-State: AOJu0YzPLajZRc1ZU9n1HcVI/X+m6V9Ei3F/EeLbFsRCwchFjT26Y6xM
 3UZRjikrPBwgsFktrpmYZwzcIWz9fseuV3knj38hiLMZkk9/tF7r97P9eg==
X-Gm-Gg: ASbGnctnUAKJIn4hZx5FszlaoZZOKTQwI/Qj5jou8Uu6ALV65CAWcWYF0xI0LHd9dxc
 skVSTj+I7whJMRnIU7qCZ7ua+kuT98YTyX54LLMZ14BXHvua3Sz285VJckMongDH1qph4ZFTScR
 8lxS0oG0FVAwKwOvdq7xK9hTwfU5Aa5DT6BCsW3/iEwPnDgJRmkBBnk4EU8mk/XBBYbsopemWB0
 91VBLgpUHyQ0ZW/D/LN3p2KZE3dhld20NQW76YQEfB4VZ5p8YglMhe9001dcHJP0BBQkyrszE5m
 EifzzUeiCnA/xWj0jbovEHSZo2ZHHuATpRmdU5l/
X-Google-Smtp-Source: AGHT+IFXkXrH6ADGyhWm50Di0LGGOk8xkZ/4CcEAyRa9Al132umwhklzsS6IZRCsTE7McJKvm0QMRw==
X-Received: by 2002:a05:6a20:7fa2:b0:1e0:d1c3:97d1 with SMTP id
 adf61e73a8af0-1e5e080294cmr85526815637.29.1736048645298; 
 Sat, 04 Jan 2025 19:44:05 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad834cecsm28760744b3a.70.2025.01.04.19.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 19:44:04 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat,  4 Jan 2025 19:31:59 -0800
Message-Id: <20250105033159.4966-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736048645; x=1736653445; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tmqBY9sTvZQV9vDOouaBEDbMjeUR/9o9BlYolcwcKao=;
 b=N1gGcUk6pptZaq9kG3Eaf0Mgj+86CITstoR92HGN8nm3a2XwDmPFAvas8LvBHIGrzb
 NTHMO7E6FAIiQ+moCgDb8deST10S+mIxSeMIgViHHCBKT+dFq0LN2HumDJVhV8P8Ok16
 Kz/7+tG6GdBpdoVnMNJvYJEXZVIQCslUVgEBF3Ea7IltqAjX21eGpNtNCQfYAtu0rTyT
 exLRwc2lzaVjVflORqfxPu7HBJL/P8ek2Pll8b3ssu71VatHJZOmowuBcIoylPvwZEp0
 +B7Yzh6oiGTNKLn9nnuqCpbNJ2CLNALuO8Y/6RRuBrJ6Bl2I2j/e1ctLja0VD0vIzeWB
 100Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=N1gGcUk6
Subject: [Buildroot] [PATCH 1/1] package/pppd: bump version to 2.5.2
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

Release notes - https://github.com/ppp-project/ppp/releases/tag/v2.5.2
The tag now has a 'v' prefix instead of 'ppp-', so update that in the github macro

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/pppd/pppd.hash | 2 +-
 package/pppd/pppd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pppd/pppd.hash b/package/pppd/pppd.hash
index 92f036df58..1aec3f037c 100644
--- a/package/pppd/pppd.hash
+++ b/package/pppd/pppd.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c0537067bdff5f0b5d7a2fd1cca13c220f6dadc89183f23739a2cf9df49c68ca  pppd-2.5.1.tar.gz
+sha256  d7457f0ff409cb2d7a0d8382ef6302520d664895ac5568cb3dce727d71a2a1f5  pppd-2.5.2.tar.gz
 sha256  5d588eb3b157d52112afea935c88a7ff9efddc1e2d95a42c25d3b96ad9055008  LICENSE.BSD
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 4b65cf08d1..8d80675d15 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -6,8 +6,8 @@
 
 # The tarball provided at https://download.samba.org/pub/ppp/ does not
 # include the license files yet so we use the github tarball.
-PPPD_VERSION = 2.5.1
-PPPD_SITE = $(call github,ppp-project,ppp,ppp-$(PPPD_VERSION))
+PPPD_VERSION = 2.5.2
+PPPD_SITE = $(call github,ppp-project,ppp,v$(PPPD_VERSION))
 PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
 PPPD_LICENSE_FILES = LICENSE.BSD LICENSE.GPL-2
 PPPD_CPE_ID_VENDOR = point-to-point_protocol_project
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
