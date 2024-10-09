Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9DCCEE33C
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 18:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E96B803D1;
	Wed,  9 Oct 2024 18:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6OcxChOg-H9; Wed,  9 Oct 2024 18:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EF2D80CF2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EF2D80CF2;
	Wed,  9 Oct 2024 18:11:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F2F51BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B71140154
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Vc0sM0UBehS for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 18:10:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F4BC4013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F4BC4013F
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F4BC4013F
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 18:10:58 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-8354599fd8aso2778839f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 11:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728497458; x=1729102258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GG0SqPpyxzxGFEZyQnsImDlDnFRbWGy/xFPj0nFGda4=;
 b=SxERrT7+JkgHZGPjXcDuNV1C8NkdtRem+O41ANZJPT1uehS83nZQQaXsTdlTQdPitZ
 bD2VCVt4Eic8AMlW3d8xoiSDJ4YiG9xqaRxFcbesgBVKcQ0wjkVCWx7icpduG1AITGT8
 G27+EySvynA63pttaqpUYAl+Xhv2ndyEwrdLkkuSSDsjoJ03jLuWpI1BJewnqvGEozF2
 emM02+ezmVuNCITL/zFqAq4EM93yBhDFCquSwFZUhOJ4yn+g7FoNTNRE/P/sIE+YFH3m
 327pCE5/GHLHbR6rZBFlEfYy4YrP+vPjlYKiJhgaK7YyyTL8up60OFV8dYBU/6mn6+Y6
 Hz/Q==
X-Gm-Message-State: AOJu0YwadUumwjSn3bElHKZ/CR5NLKFmK0oUm5iuDnEcliVc8+eUL03q
 EqQ4Jm9es3kwJfcqvxtk0/Gg28S9bP8P9/k1rY5rRFoK9VOvguJLnaEMo/bX
X-Google-Smtp-Source: AGHT+IH2acTdpYDIV1S7WoHUUrR0PlxPcU+J/fB02rt3v28LFemxlxol/NNJApreEnJhYixOXMASgQ==
X-Received: by 2002:a05:6602:2dc2:b0:835:45f9:c2ee with SMTP id
 ca18e2360f4ac-83545fa002emr198974839f.4.1728497457662; 
 Wed, 09 Oct 2024 11:10:57 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83503a74e97sm233717139f.2.2024.10.09.11.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:10:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 12:10:53 -0600
Message-Id: <20241009181053.3874403-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728497458; x=1729102258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GG0SqPpyxzxGFEZyQnsImDlDnFRbWGy/xFPj0nFGda4=;
 b=an959D4U1+TUgpTWI8hRBWhi+WG1xPTWnndJByRVWW58hr7sVqQOVCz9rmXxaPhiqT
 zm8UR234jaB5Oob2jc6fttdNL294xzmuWrVM+8l6XA5OeXei56r+tUFyQkdeFQQe3eZ0
 nI/ak8Y03TTdjwXfeI7S8l9EUnu6Oi2lUfv7lsCgZCZy1h2hAJWpIb857aj15Do7gYEo
 khz6cgL5rb97Ddb4MTR02aST//rIIISpi+SaFpSi6gpDB7gCW0MW6zvQBORyppvWyUoF
 LLjl2oFFlQHB0/+66Rlh2G7276x8czjTJZuqJnjoEXApW6VLZK2z6vwx2rzlg0Hwj982
 0nTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=an959D4U
Subject: [Buildroot] [PATCH 1/1] package/python-tomli-w: bump to version
 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tomli-w/python-tomli-w.hash | 4 ++--
 package/python-tomli-w/python-tomli-w.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli-w/python-tomli-w.hash b/package/python-tomli-w/python-tomli-w.hash
index 778c22583a..1d0bbf881e 100644
--- a/package/python-tomli-w/python-tomli-w.hash
+++ b/package/python-tomli-w/python-tomli-w.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli-w/json
-md5  2c050134d4842b449ec4129c97d51e62  tomli_w-1.0.0.tar.gz
-sha256  f463434305e0336248cac9c2dc8076b707d8a12d019dd349f5c1e382dd1ae1b9  tomli_w-1.0.0.tar.gz
+md5  8a074845fdcbb1fb6855bec753f0f94e  tomli_w-1.1.0.tar.gz
+sha256  49e847a3a304d516a169a601184932ef0f6b61623fe680f836a2aa7128ed0d33  tomli_w-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli-w/python-tomli-w.mk b/package/python-tomli-w/python-tomli-w.mk
index d5d7ab9f2c..a6ca0cfbbc 100644
--- a/package/python-tomli-w/python-tomli-w.mk
+++ b/package/python-tomli-w/python-tomli-w.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_W_VERSION = 1.0.0
+PYTHON_TOMLI_W_VERSION = 1.1.0
 PYTHON_TOMLI_W_SOURCE = tomli_w-$(PYTHON_TOMLI_W_VERSION).tar.gz
-PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/49/05/6bf21838623186b91aedbda06248ad18f03487dc56fbc20e4db384abde6c
+PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/d4/19/b65f1a088ee23e37cdea415b357843eca8b1422a7b11a9eee6e35d4ec273
 PYTHON_TOMLI_W_SETUP_TYPE = flit
 PYTHON_TOMLI_W_LICENSE = MIT
 PYTHON_TOMLI_W_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
