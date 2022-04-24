Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24C1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 21:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8784C40292;
	Sun, 24 Apr 2022 21:40:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dxfr9vF1nBmf; Sun, 24 Apr 2022 21:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E18A9402F5;
	Sun, 24 Apr 2022 21:40:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13A821BF470
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 21:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01CF9605B0
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 21:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S3ikApCaHFrh for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 21:40:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDFFD60774
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 21:40:07 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id y85so14023675iof.3
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1YLiRW/eNTZhc5VQXswrlte97cYC3hDAJ8AmwsVmvEM=;
 b=M1wX5c8F+yozicZCWfbtigaRU6A1tEpA8SPkQ0sz+qEp3/KZWh7TNMf69I/9/sxC6Q
 0TXqC/y5a3HGvMNvp+Za46UWw4Hmsuf4AS0eTKTYGC1v9+Q+3sDadnseHYiuZGBHpnfw
 sI16j9VJyMIOj27IZ2GMXHHgH+BRszUbvul+UQRzH3RcI+luIAnzNZ3BPUoZGGQz5iiQ
 RskbIq7Al9z0EJ1yiQ2zxOCEMjTokazhfIulAgjFLvY7Db2QVdraLwdv7F+Ljb7S2e2U
 YQz1MYOMKldLp+scN2DkodvW8boqCgo91B09UGch3QQmMWxMZDXhYTXoAclcXdJh5xdU
 zEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YLiRW/eNTZhc5VQXswrlte97cYC3hDAJ8AmwsVmvEM=;
 b=pWB2BLxufmsccFjw9KWVGsMYknaEnNHvyLn/RSuZ/LpPK317SdHVvvKo1txSShD26h
 R4D3aCWBModbnIDAUpGcSpu7SSHdWCfBzUXeH/RM4qTsSm6+tfyLObq84BR4/oRflfr8
 W3UgsA1RYivKBQDHP9amCxwpJ+FqUBIVQZL94WNKdgqFwmG+grfsJRd1vpJDjLurDhXs
 7aPjBHWROBPLCN+6vYlgSwY49abjzgwxuCHExJwOC4NT6uvjzSqUQ1inks2lnHIjuo1u
 wy/jmQtFSTJkfkyeb8j1Y3NmIYPMFrqFYXJsDQqEPSEG9ZcwDc9xB/5caF9ltHzM+kbu
 QZ2Q==
X-Gm-Message-State: AOAM532dkZZQKic5Jfzk25MQ/hXMqydHvmzSGh9BDq7SVaJzlfsvWZ2I
 lLUU1SzndtWZFCBdLmBiktAT361V9uQ4xA==
X-Google-Smtp-Source: ABdhPJw/ENeyTFLA6JOTgQrAVNGkjg/fc8JBoR0EQJjS15BED6MW+HrbJvgX1jPkkxicv6s0sIg3Fw==
X-Received: by 2002:a05:6638:3f0d:b0:328:95b9:f8a4 with SMTP id
 ck13-20020a0566383f0d00b0032895b9f8a4mr5963112jab.174.1650836406889; 
 Sun, 24 Apr 2022 14:40:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 o19-20020a056e0214d300b002cbec3af6casm5385084ilk.30.2022.04.24.14.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 14:40:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 15:39:57 -0600
Message-Id: <20220424213958.1747120-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220424213958.1747120-1-james.hilliard1@gmail.com>
References: <20220424213958.1747120-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 4/5] package/python-tomli: bump to version
 2.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package now requires flit and must use the flit-bootstrap setup
type for the host build since it is a dependency of
host-python-pypa-build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v6 -> v7:
  - only use flit-boostrap for host-python-tomli
---
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index 1a274c8a40..8368f9ee13 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
-sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
+md5  d4341621d423a7ca6822e23d6d52bb9a  tomli-2.0.1.tar.gz
+sha256  de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f  tomli-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index b8c20ca736..b803d67466 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 1.2.0
+PYTHON_TOMLI_VERSION = 2.0.1
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
-PYTHON_TOMLI_SETUP_TYPE = distutils
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
+PYTHON_TOMLI_SETUP_TYPE = flit
+HOST_PYTHON_TOMLI_SETUP_TYPE = flit-bootstrap
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
