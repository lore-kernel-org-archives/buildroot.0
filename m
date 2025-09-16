Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EBDCAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 00:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E58D960C27;
	Tue, 16 Sep 2025 00:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjOhbnR7m_z9; Tue, 16 Sep 2025 00:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B00860BAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B00860BAE;
	Tue, 16 Sep 2025 00:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B91FA22F
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E7EF8150B
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB8D0mDATbPu for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 00:46:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53B6D81509
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53B6D81509
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53B6D81509
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 00:46:25 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-88703c873d5so133631139f.3
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 17:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757983584; x=1758588384;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wr8YVGpiossyvmb6v9WNIc1XUVfciXvfmVj1kdAf/K4=;
 b=fuMwsHahmAlly4XWg32CjS2DcKjwU1zFHjcsm/Z4K5MQj642PfAnmoS0qsjIDLTv73
 Kgnct0uZIm4btHwg01aP1UtR3hw9krZPOBcFNskHy0qgeTiP1AgJrwDSrNH6W29FSfcw
 MOg6FrasgyGtaW+wFMEH11EGgS8GjdMfCzeWf6j5wbFtlMbBEm+DMpWCLits+LfvJ88o
 XRcPMwINCcueYBrt4yB62EWlBCKns89d3x+8NYaYNzAghYkeZYSDTUJDs6cjdzzLUHGW
 HA2C5nBSidT0S4o5CJhpl83cO/kDeOhRNjIVJTCKUZWz6mGU2xmgypj48FTMtqudMLJK
 hOcQ==
X-Gm-Message-State: AOJu0Yx8t59eNLDOL+si5n/JXyK0sJ7St5DjsoxV90az1KLzeADgkay+
 sa/3sn0niU8aj+avUg1m0u+RukgDelwQxwgS4604wruvNJ1O09iNgxyzNunG+g==
X-Gm-Gg: ASbGncueBgMVq3QbgtK7mZZs1uyEPD/ozlrvTAaUcSkNF9ETL+ljVauIuQo+Z4BW5g4
 Vkyw4LlFVmNpM5RSVE5kG/NUU/mkyE786Z3s66IMsuSU2ijS3cW8diOm/bfkr8KKUJqsputrwz8
 pXYhmOeeD4gW78PseqZLS66ruEZWX55htC8Z4cH0lzRb/25l22A9pIJ+GlJiGkZbS493KS63IPW
 pYGlHILbBVRdVkO798PeNRGywKNeCFBhQExIEiC8qUTGivKHXRdnN6lxZUEznr884kap2TRWOzV
 UNK1T/0dgPGPXVYx26KdCtDTxP8hjGhJpJegKuYmITbTFLkNaCg3GzyHrFzGGWF+fLZ0qhZYkFp
 0+/fDsoj/OcTG0Wakb8iRqIhbuvvKlkNRkQfp1851zKXHNwpXSFGGQICxWNn3CUuxcCaDLFnsfW
 ZN2dTy2d99oxb9L4sKX0Qb6A==
X-Google-Smtp-Source: AGHT+IE/5S/rGpymCJKDmWNai1jcrSRGtUuFbMjGBcwhpJZtCSK+NvMbu68UhNdtTANyegG71rIvOQ==
X-Received: by 2002:a05:6602:4084:b0:887:45ad:fcc6 with SMTP id
 ca18e2360f4ac-890370a92f8mr1576357639f.15.1757983583861; 
 Mon, 15 Sep 2025 17:46:23 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-89361dd2d66sm180187939f.3.2025.09.15.17.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 17:46:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 18:46:19 -0600
Message-ID: <20250916004619.2528015-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757983584; x=1758588384; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wr8YVGpiossyvmb6v9WNIc1XUVfciXvfmVj1kdAf/K4=;
 b=St0mL/bNuyKB+riemQIi3azfqHOrVZJfGW4LHBce4e2BoxEVwGgera6NL/eR2hw2TV
 1pTXrLy2gX7ighpTInKA47r7u/zE91jjrLFa12tmE4I4Mb8PudknOpwG8wrzO18qME9y
 Hul/w9tqPobI78FLYA5jYIQKS3FgYT7u2NXOjmkmGV6aXXop+RZJUvYqjWZqLHg6Ce8R
 M+kaCqbnxoKiC32z63c9J60opLOwNL+7X5LR+8Ma5OK6TV2v5A1toTL8LGoqiPohmFCZ
 vcx3KNtq1xANSCBb/YblESviWlRzfaRDsmR2roIonypq61PhsHZU5jQVkjmgThqDY4pF
 +VjA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=St0mL/bN
Subject: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version 2025.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index ca64cb7d79..2779cebed4 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  efcb554763a36b3e18acee074f44d1a5  pytz-2024.2.tar.gz
-sha256  2aa355083c50a0f93fa581709deac0c9ad65cca8a9e9beac660adcbd493c798a  pytz-2024.2.tar.gz
+md5  6a7760c71e38b6c75577b34b18b89d5b  pytz-2025.2.tar.gz
+sha256  360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3  pytz-2025.2.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 1d37d09ab1..4ad946cd65 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2024.2
+PYTHON_PYTZ_VERSION = 2025.2
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/3a/31/3c70bf7603cc2dca0f19bdc53b4537a797747a58875b552c8c413d963a3f
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/f8/bf/abbd3cdfb8fbc7fb3d4d38d320f2441b1e7cbe29be4f23797b4a2b5d8aac
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
