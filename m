Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73F7D10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E4F40227;
	Sat, 26 Oct 2024 20:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBqFBI9X663D; Sat, 26 Oct 2024 20:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29691402A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29691402A5;
	Sat, 26 Oct 2024 20:54:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E421E5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D25378116D
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vano2z_k2Zux for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:54:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DAF3A8119F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAF3A8119F
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAF3A8119F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:54:35 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-83a9be2c0e6so119853139f.2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729976074; x=1730580874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gJN1tJK2ztaC2Lf6suV5xMxL5U4dr+jP5fHIox0N6co=;
 b=aqVCuQeNEvyf37EFzzErBayRz7qeLk0zpskndzoKqfAQa9vv7yzQBf/Z9SHAZMJNno
 SsS4MHTo8WbzeITs5tSaHNJRJJ3Heua0/f1UT/cM7Sl1oWOhfQX4vsNGcDlvpGr/NpjF
 ckYnqW74QxKidXaplPtl4jclw9ZvejjeRD32uWPM3IMQtdoKAQKMzVfLau3aHwiRHX3U
 3r21nmxGehSypaAN0lXURWQR1NvSTEzNfy9mW6Sn7EUV1CxhpSzEELdmyCT+oWhGJJhv
 wjpkr+dhBINlFqjl+wARpWuVZGMXBoMMEUi9L1xJg35bl5saqPr792nTCwYU00w1vEXo
 gNsg==
X-Gm-Message-State: AOJu0YzY+AOfkVahTG0n2gf/5gSoFQ8bmgtGDVasX5TDzBnprVvgh6RA
 kA8MzKDBRAS+eD083v0H8XnouIN5pC+Ho+2a7EKXUw3MY7P+3TnrE2dFig==
X-Google-Smtp-Source: AGHT+IFVXE0Kx4huqKv32yn6LHUaIai+A1qKJk175kKpXGg05bUlcsMDwq/z7v3cVkrw1IshLvtinA==
X-Received: by 2002:a92:ca4a:0:b0:3a4:e308:2f5 with SMTP id
 e9e14a558f8ab-3a4ed1ba8camr30392805ab.0.1729976074627; 
 Sat, 26 Oct 2024 13:54:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6de0aecsm8728205ab.29.2024.10.26.13.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 13:54:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 14:54:12 -0600
Message-Id: <20241026205412.3625809-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729976074; x=1730580874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gJN1tJK2ztaC2Lf6suV5xMxL5U4dr+jP5fHIox0N6co=;
 b=mVoIzCg7VXXYI+Fql6TSXhXagOk94X9lsJq1gDXY7ipYW+W+DhjLVFB+rg3xYejLiy
 Is2qFwfH2XSS8e+fjpR6q3CEjbiWsj7oUwcGCwH7HP4/e3uk1+NokN4+92QIAmIMxsqm
 bMaXV+truoiz+ijnRFkw8czzWV1n0+UvQ1nwVUNKVZHruzS3WT6TJ7qLg6tLbmmNUA39
 a4asDE6tmDaL08c/ZAIvDkjDQSqyhw/HJYo09XKz5b+myjO9U4OiRyTZ6oLpTxY+PJwq
 LPP+Ds01J+RHy1Sd5nrdH2SLxRXGke0E+Ben+N9sM6xRreJZDp7fHI6YPUi62jiXchuv
 SDpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mVoIzCg7
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow: bump to version
 3.23.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index e71425d958..3a7a9dc2a7 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  55bc9b09b8557d53541521b723232133  marshmallow-3.22.0.tar.gz
-sha256  4972f529104a220bb8637d595aa4c9762afbe7f7a77d82dc58c1615d70c5823e  marshmallow-3.22.0.tar.gz
+md5  f7b800ad13a5948d208e04973e75aafa  marshmallow-3.23.0.tar.gz
+sha256  98d8827a9f10c03d44ead298d2e99c6aea8197df18ccfad360dae7f89a50da2e  marshmallow-3.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 811e532155..49558583a8 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 3.22.0
+PYTHON_MARSHMALLOW_VERSION = 3.23.0
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/70/40/faa10dc4500bca85f41ca9d8cefab282dd23d0fcc7a9b5fab40691e72e76
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/b7/41/05580fed5798ba8032341e7e330b866adc88dfca3bc3ec86c04e4ffdc427
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
