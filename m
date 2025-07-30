Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A708C87FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 14:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDF3A40F6A;
	Wed, 30 Jul 2025 14:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFjf_vJyccSK; Wed, 30 Jul 2025 14:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F00FF40F7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F00FF40F7E;
	Wed, 30 Jul 2025 14:57:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90E0A16B
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 14:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7790B400F6
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 14:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCgrgZQRB_Im for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 14:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 637ED40C8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 637ED40C8C
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 637ED40C8C
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 14:57:32 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-615a115f0c0so526442a12.0
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 07:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753887450; x=1754492250;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WxG3h0GsqVKdjWgi64gqLsVZIBD2w3eR9xG/IXvTaI=;
 b=rJWihlg85LATrv5tcBgJhtOX1cFoYB7BYTONz8+TkXYfl4ySJwFh/VqAGDYPcj/qw7
 9YYPyfOL1pmnUzGdqd8/1rH21D1D+gEAzMJGOX3Md8aXWisV77W01bEo5EZ1aI/X3HHO
 Yt98rqqBTazXODRiSU3ZAqM3343OzOoNEnNrblgjD0cdQX//cW4ArnDxV1citPmd1iw5
 0DN0BAoNqMxjS1jUkYAXSiXmVJTKOppeakSgMSUrF0pMinVBdJBL0cMBPT0Uvnk235k+
 um+JHMj4P981a8yisjiLcnqME0dR2iIJzjfbb33I0Ah+dinQySKRDMkvVhap18Pc3i0k
 +52Q==
X-Gm-Message-State: AOJu0Yzx/EUiu7nba282J8YNsEYH0SvY9aVYlc+4Wz+I2q6UAy1vNCsw
 pIjG1fq3wShGD6zjNnmt7UaNIBO7AnzmdDcZiznBnUF/60thxnx0nDUj9Is96w==
X-Gm-Gg: ASbGnctonfMslOrXKixuQqZYLH0qug1/N33jcsJgIvyrc/E6vhzNkVzO/a19s6ASaFT
 4EXOKl+qWg+h6iy3wwlsycQF7vq0dj0vhrSj+B/Hhw2VgBRh6rioHuXWCLG17Qk3mbZ6cmMpgUf
 QT15cp2Ebm1pAkIdDXPmtZ0F7SQ063TUJI21Bc7YitqZCzWPMaOYofPHKHijgU2XSzddb4c+rvY
 Cs/BJDLurL2SvljOVl4YX4lSO8C4SGjLZv1RbZE9LH6M8eYiRwoAGUNHw+MNd04Xb9tSOwcu3Ps
 vxQZE8UnypFAstNjbaah3uGX15V80x/SB4MNS0Wzfb2++BkiHjla06A3lc6KDtUnV4gRUrlXA79
 Nj/FY/qiux1ZgAxhpRGYRGIBjhTLrVmrYfKUp8+eweOH6P6F9YjawK/u/IexlVtU0lab8wx3zxx
 GGqNEPY/U/
X-Google-Smtp-Source: AGHT+IHtgFMJyJSDub50zKm6wkpGt8kdyJXgETJjRoBQAIlzWbCK5LKbxrPAEM/SXq4tW5o1by9pWQ==
X-Received: by 2002:a17:907:7ba1:b0:ae0:d4f2:dff3 with SMTP id
 a640c23a62f3a-af8fda2b46amr489505766b.58.1753887449614; 
 Wed, 30 Jul 2025 07:57:29 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af63589cc5asm746645866b.32.2025.07.30.07.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 07:57:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 30 Jul 2025 16:57:24 +0200
Message-Id: <20250730145724.204468-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1753887450; x=1754492250; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0WxG3h0GsqVKdjWgi64gqLsVZIBD2w3eR9xG/IXvTaI=;
 b=gf0VaX0taFY2PldLwvYzLN3jaD2ArSMW/CI/Iu6WQabg2VhyAD3YDuva6tDpG+I2kE
 06DvkN6A1iUWl2ccAZC2Hwes99BFghfgVUREx6/wuuw0X/Wq2U1OSocVIHEX0cE59pJJ
 T1biZztmLAIkgEOEUch5AXlCFILTxyMV1PrHTbp86jFmlIaA5/WboFn3ZLZ0JZAdUWvq
 82zFWPRHKCxO0MEAg3bTD1Vm6/tAYoHiKJLZImzpvgZi5KQ9Coj1OjPmCpILovuRvDYF
 GcE3dd6vd3OcwIkdDde/PVWvKFLe2uUKpfejp8WnZVyRGEeqhsgGgI1SavNBgpNHUvFd
 saNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gf0VaX0t
Subject: [Buildroot] [PATCH] package/python-yarl: bump to version 1.20.1
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:

https://github.com/aio-libs/yarl/releases/tag/v1.21.1

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index ca2d42bf58..43ba31f81f 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  80b89d2b28be7345a38f099b2f839d7d  yarl-1.18.3.tar.gz
-sha256  ac1801c45cbf77b6c99242eeff4fffb5e4e73a800b5c4ad4fc0be5def634d2e1  yarl-1.18.3.tar.gz
+md5  23352fbc2b165825d4a33682c91788bc  yarl-1.20.1.tar.gz
+sha256  d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac  yarl-1.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 160dec8a1b..4f25394c8b 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.18.3
+PYTHON_YARL_VERSION = 1.20.1
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/b7/9d/4b94a8e6d2b51b599516a5cb88e5bc99b4d8d4583e468057eaa29d5f0918
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/3c/fb/efaa23fa4e45537b827620f04cf8f3cd658b76642205162e072703a5b963
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
