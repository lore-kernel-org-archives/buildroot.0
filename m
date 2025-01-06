Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAF9E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 23:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8C96607D9;
	Mon,  6 Jan 2025 23:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5P8jVACf8Xm; Mon,  6 Jan 2025 23:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9974B607ED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9974B607ED;
	Mon,  6 Jan 2025 23:37:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C1A9DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 23:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF80580CEA
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 23:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bkGxKQOhwEHj for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 23:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35C6D80BE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35C6D80BE4
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35C6D80BE4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 23:37:51 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2163b0c09afso214538575ad.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 15:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736206670; x=1736811470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pqpNu/ukQR3um5IFaEAuVFhEkHGHiqCaw7x8Rldj/i4=;
 b=MUXMZ+4rN0KjRUgGlf0ZaoN8hM7oIKsMPhi/4CeiBymTz6pbmCBWu+YSWwjgP3v/gI
 dqD0PylJh7/ll3nFmFe2UhJViv5aK+sYpmgAoraFzVgxKgrMj+9Q0itqwrQh+QRUk9xb
 DK+w+IAKn+Zxk8XSte6G5mQamWa6BDHV2nkNT2WqyWmYfJDBKTfKFf2izyMEtRZpnHvU
 AgYWJWx6NqkyDD1f6G+Zfu7of+ahoqHCkvalrXJ60x8sAZe8qvz2z8gVDg0teSkQLnCs
 6lznz2tFCu5TU+tczBP3/l3EcP6fxzFb/gJJORtgPnyrglh9xH/mA3iZZN/gyWu1hNky
 Ex0A==
X-Gm-Message-State: AOJu0YzKBxPrbL9x0gna+/kEpDCTOZHGehwyPqdFDaZvJq3tw8IPWJfb
 m/KURTxlf7Si2vp30/QQ77pO0QZTqcfyeaqXIizqENTz9GcGLysiKmG+VA==
X-Gm-Gg: ASbGncv0bQuSmENNMi2dSQaZhHFa1BBmP6cM4AZpmn1yUucKcQsMBTbDgA4RXHz9dAa
 X7tpothnlfG98fb4tFfeGQsnLD5C6IMyGyIR6ibwZkVWsww1+l5hz269kkLmsBH3b4UQOFhT+Ug
 qmFpuvcb41lgjQH+PGbmD+FCVq7HhDbqMRaDq85FM1aU1SK+xgbQxDN5phxVhl2nZNBTiTZNmOg
 gr+1+lKa6ese8Gi0ZGII/RnFiQPpXy49LuNEmZ/CnyL73vKiZZN2vlXz7AN1m4A4fFIgh45PEaJ
 p8oHdI78LvrXTd2ngMGqodSYWfxgOzwNL7MpVgjR
X-Google-Smtp-Source: AGHT+IG0P7DNj8Id6fJEsS8qlmhTa3RROcPNooA4fC49yicfJIrESwmgQmUaneWr6cSc9lXQlyxLwA==
X-Received: by 2002:a05:6a20:a10b:b0:1d9:aa1:23e3 with SMTP id
 adf61e73a8af0-1e5e080c43fmr104900102637.32.1736206670133; 
 Mon, 06 Jan 2025 15:37:50 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad8dbbabsm33282054b3a.101.2025.01.06.15.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 15:37:49 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon,  6 Jan 2025 15:37:46 -0800
Message-Id: <20250106233746.190324-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736206670; x=1736811470; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pqpNu/ukQR3um5IFaEAuVFhEkHGHiqCaw7x8Rldj/i4=;
 b=mOVnEMMTqT36jGcLxClqXkHfFVMttOWESldwuV+348j8onCEYzrSOxIasZiJnVyg89
 mrk0/YkxwMU2vV+jlTp2SaGsyLGBrp8Y2Kej7FtlgLHuV1CXTS6cZER5D1TjY000lwbe
 Ak+FdC1kCkXhyneJ0uuKEUy7u1zjIiksHNtWHex9Ad2hGdnPk9OO1iITMnCFMq718Ue+
 +Ijk5YayCfH+xBTb03RjqQuWxdFQOAnfKWDw/1YiCZMrVXYj2ds8jGY3pVhfRQyZawnO
 0yICXtMSu5ANGmAS8BUf5Gc5KqDl/8mTnr7gYBnIfUZ/0qoGJc9UD2oBo2px7eQhpir6
 fi1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mOVnEMMT
Subject: [Buildroot] [PATCH 1/1] package/sysvinit: bump version to 3.13
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

Switched _SITE to github. sysvinit is no longer maintained at http://savannah.nongnu.org/projects/sysvinit/.

Changelog - https://github.com/slicer69/sysvinit/blob/3.13/doc/Changelog

Changes between 3.04 and 3.13 - https://github.com/slicer69/sysvinit/compare/3.04...3.13

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/sysvinit/sysvinit.hash | 2 +-
 package/sysvinit/sysvinit.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
index 67b0ab38f0..3e1c6be1d8 100644
--- a/package/sysvinit/sysvinit.hash
+++ b/package/sysvinit/sysvinit.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5  sysvinit-3.04.tar.xz
+sha256  503423780288547631fa23a916f02bf7945fc6c7a6e4dde37b4bd188e2f210c3  sysvinit-3.13.tar.gz
 
 # Hash for license files:
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index e05a6dee38..c2a47b8f0f 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-SYSVINIT_VERSION = 3.04
-SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
-SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
+SYSVINIT_VERSION = 3.13
+SYSVINIT_SITE = $(call github,slicer69,sysvinit,$(SYSVINIT_VERSION))
 SYSVINIT_LICENSE = GPL-2.0+
 SYSVINIT_LICENSE_FILES = COPYING
 SYSVINIT_CPE_ID_VALID = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
