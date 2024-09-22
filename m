Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FB4CF9C69
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 04:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC65760716;
	Sun, 22 Sep 2024 04:06:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdUPte6hxa88; Sun, 22 Sep 2024 04:06:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90CF6606B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90CF6606B1;
	Sun, 22 Sep 2024 04:06:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB1CB1BF263
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 04:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6CF6606B1
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 04:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orxqNp0KE4fU for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 04:06:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3DBC605FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3DBC605FD
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3DBC605FD
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 04:06:37 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-3a0c8c40560so13857945ab.2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726977996; x=1727582796;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5XcouPWpHn63jqL5BZmWrEH0Udi7c8RMjkXvz7TFwo=;
 b=Ojl42g+SrKg1YeIX4p4pKIrQq3Y+9DW4+K6yzy7N+yq3vfoSEjOU4WRBDDs0iAJglQ
 bOeWeYjbzS9Od01MhcE88iRYLS7tRorAndpyi3stVJ7wv0/Afq73710jl9f/jQE4bnAz
 tgpaQmLq1Oj4oN/2BgcVcYBcY1C9mUUX99bmBb89Zlfm87H9adyjCWy4sD2CaHPR590c
 PDCN4lKXm1jmo29ssTy5js71sHrHpclT7kueZhjQA2W/k92yg0GTnVV18cV3zmYwUeXt
 VcjZEvG+oXVzX4M6UHezEgNj4UqkHQ8iGKygXEWQTwxoXnKyZDFEbah2M+K2eueuZkq9
 yXJg==
X-Gm-Message-State: AOJu0Yykebx1R1u7wcd830SgyPXj9FeeJu7eyTOgjNMzMXU+t5nstNim
 fyisTiJlot3xFimH2I+3W6hwolb1farRHz5qMpSQONsKsdqg5BhvLZkivg==
X-Google-Smtp-Source: AGHT+IFvKPk6njA/XWr2E2w7ZHqE+728c48488gq8XLLl4299h6eayT2wnoSktFoq/Ul5XN+WbA0Dg==
X-Received: by 2002:a05:6e02:214f:b0:3a0:8edc:d133 with SMTP id
 e9e14a558f8ab-3a0c8c9afcfmr63193605ab.9.1726977996559; 
 Sat, 21 Sep 2024 21:06:36 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed62dbbsm4410288173.164.2024.09.21.21.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 21:06:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:06:34 -0600
Message-Id: <20240922040634.919038-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726977996; x=1727582796; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l5XcouPWpHn63jqL5BZmWrEH0Udi7c8RMjkXvz7TFwo=;
 b=lANSLBX8xo+8qLZ5KwkqIlgkftP0p7tXsUZ2/tSxmNKSNYxOmXwxIFKw6e1IY1FKRd
 cy1m1mzVIRT4lgcSFE7a7xxJDqCXDsQJ+SEIDAX5VrVFaCvYk2GKzlqoxQxSQLMvjYFo
 xcIjIhvKjJm+BoSBiPR5mDozcBgb2saCPb+E3xt8mNdY83aSN7qJdBrsXUYcjqr7/ZbJ
 NikOEn2noKuv6UicAK2PqW0kbQRD2BdDA/fxNFRk6yF/xsvkDhYYzROYK2ThufJqPhuk
 okq2a1QI1GDUQxKuPVUyyUC0C+rSAaqYFAAnQuLhkWW1RLB1WCcWZuxrXtoOR+njHJ0f
 HSkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lANSLBX8
Subject: [Buildroot] [PATCH 1/1] package/python-tqdm: bump to version 4.66.5
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to year update:
https://github.com/tqdm/tqdm/commit/7323d5bcc9b032d525f9d6468a9713f5be9c4174

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tqdm/python-tqdm.hash | 8 ++++----
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 4be54de7de..ee59af438f 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/project/tqdm
-md5  5822af464d77ea156ad1167c23e1bdac  tqdm-4.64.1.tar.gz
-sha256  5f4f682a004951c1b450bc753c710e9280c5746ce6ffedee253ddbcbf54cf1e4  tqdm-4.64.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/tqdm/json
+md5  32e8dc7da1490d96d944f61a1d0ecd4a  tqdm-4.66.5.tar.gz
+sha256  e1020aef2e5096702d8a025ac7d16b1577279c9d63f8375b63083e9a5f0fcbad  tqdm-4.66.5.tar.gz
 # Locally computed sha256 checksums
-sha256  a0fc1785a8f2a200a3124d703d49550601b7741ccffc861713c2ddaa07a537dd  LICENCE
+sha256  dc33252e829015e3b150086fb9b3a40f6ad6fb32c2f4610ce812fa677d35986a  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index a6296bd0f5..c91aaf2875 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.64.1
+PYTHON_TQDM_VERSION = 4.66.5
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/c1/c2/d8a40e5363fb01806870e444fc1d066282743292ff32a9da54af51ce36a2
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/58/83/6ba9844a41128c62e810fddddd72473201f3eacde02046066142a2d96cc5
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
