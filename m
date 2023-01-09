Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDF8C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACB8760B36;
	Mon,  9 Jan 2023 05:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACB8760B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdygOo4_Lo8h; Mon,  9 Jan 2023 05:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0797A60B2D;
	Mon,  9 Jan 2023 05:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0797A60B2D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 45F171BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DE5981854
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:53:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DE5981854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7Fm0iFTrpsH for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:52:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC8381819
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FC8381819
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:52:59 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id m15so4449132ilq.2
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TMGsFCE1772h6/Hag3+3GMKZsztyLW8u6LPYe+gG9Qc=;
 b=YMshA6kQ/xJHoEZnPJsYiOQyzf3h1HpWZInSPctQ7IoRD00lUBY5zim9RP+INVHjg2
 PpFUo0cwwFcjrxVE2BX4tYsmZCuYvL5VWr86yYQKGY8dFL2FfhSWExB+9IZUhJ66Tduz
 PXyLaAMXV86cmt3KeuuH1hzNrl61T3i7xDicnpqa+IhibBVUp2llEqn2QG0HCg2DM8TZ
 NoTegsNlyAXZoz6hM+1g6ec7piQWgNEkzd1uiimB6h65t31zEfNDKcKHqDmz8xuG7eQl
 Y8DmZqyZgtBvto9hOB2d86lXo/eoZdF73HRcna9zspXjSPIIHLFUBpJiQ9YWKSJm1XLj
 sMQQ==
X-Gm-Message-State: AFqh2kpgAis0bVI/Eq4IiZqwff3pblDCwh9p8fjoBNj/izYluSPsPDY4
 RBHFAzxq8gBSf63OFxqfxIy6XNpc0Znh1M+9
X-Google-Smtp-Source: AMrXdXuXbBIZRmf+I2U4O+frln9c/fX3AGmgA3WcAYwnJXtqgeI9Iqy+ZUjzbnfnNtxFznW1eAOQzw==
X-Received: by 2002:a05:6e02:688:b0:30d:7920:476a with SMTP id
 o8-20020a056e02068800b0030d7920476amr13405840ils.27.1673243578078; 
 Sun, 08 Jan 2023 21:52:58 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 q14-20020a056e02078e00b00302632f0d20sm2497585ils.67.2023.01.08.21.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:52:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:52:56 -0700
Message-Id: <20230109055256.2756538-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TMGsFCE1772h6/Hag3+3GMKZsztyLW8u6LPYe+gG9Qc=;
 b=kwvVplRCQE3wgPj9moI95jmeoCXXMTX/IneeIg7VcznCdNJ/Hr8SN0c1srxKSPrR7+
 RoEbDz49uSLxF3CfLXKyNAcOQUTQwKrRsOVarN4FAx+H9PqcQG4zZszx1Cr9DfuoW36U
 T9ppQiiFijHb9L+6FCyBm2H/GlWlhhgo6HNWhV/Hh3AfZ1hM5do3QbGUuRVink3cOtjB
 Ji1qDH2gU2sVbEhVBWCThuG4UT2qbEwQkm7sU2t5aSZVnHk1kPbzOHb99y73zgJOLBUH
 gXYxpvOmWIgH10a9yYh8QJvRvMPRAe7c8eBcSN75Sw6a9sx2dohZZeXgZ/KdOtkfEGVb
 /N7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kwvVplRC
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 1.12.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 2aa739f398..38ae3380a8 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  4980e01dc73c6bcf794b0b7d3f3e08d7  sentry-sdk-1.11.1.tar.gz
-sha256  675f6279b6bb1fea09fd61751061f9a90dca3b5929ef631dd50dc8b3aeb245e9  sentry-sdk-1.11.1.tar.gz
+md5  ea2d728c847879f66c3d24cfbade2026  sentry-sdk-1.12.1.tar.gz
+sha256  5bbe4b72de22f9ac1e67f2a4e6efe8fbd595bb59b7b223443f50fe5802a5551c  sentry-sdk-1.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  59404d4c854e579097d41bfccd5006afde9d6d70e646cf55074cdbfead5ecf1c  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 056a015952..c3092a5184 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 1.11.1
+PYTHON_SENTRY_SDK_VERSION = 1.12.1
 PYTHON_SENTRY_SDK_SOURCE = sentry-sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/a3/d5/db26377e9817407ae8d7b65e15b3c3b8d817c301633be15bd2aef61f38a3
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/32/03/496a7c8313658dec419303e8add969f314b7538c29f4ec5ebe6d86fb8ce2
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = BSD-2-Clause
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
