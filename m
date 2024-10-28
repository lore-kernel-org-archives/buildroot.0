Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C059D1358F
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 00:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E273D81118;
	Mon, 28 Oct 2024 00:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O12sdM9TKG_Z; Mon, 28 Oct 2024 00:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED25D812AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED25D812AB;
	Mon, 28 Oct 2024 00:48:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D3BA112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A5F84028F
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rj_rUPOHWLF for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 00:48:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A5A0403BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A5A0403BF
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A5A0403BF
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 00:48:47 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-83ab5b4b048so155270739f.2
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 17:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730076526; x=1730681326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=STRmcvt4kL2OsjkUsYuA9/Ehph2reFCPwkZzZo/N2iE=;
 b=i3ChuRvEE0XklrgFJ4Qaj7hdzJYeza7R/IqRas6n+UZWbmr21mGvgT78kegbHseAY9
 hzkoTIpmtw6LuVASMVVqDwHwvM1IrgIwsMwsVvqrPcAGDPqPVeslU8qvtiD8d5dScmcX
 aUrPlKPa4TXfwWhUB6tg3os6rdx4OU8EVo7dlPK6SJVtrgC5Jm9PX4/g2QmjXSbqVjui
 AI4qJh7gVYHJb76AmRXIEaSgbPNLuagcmS3NMVGJ5Om2mqi+BclQquOVfHy9g1KH9Tu5
 jPXSDHy1Y8B05Z+juI/EX1PPDo7Z/49bI+gEHFeMDR4d7eYS5w8i0bvoaSlFMqS2F1XW
 9hgw==
X-Gm-Message-State: AOJu0YzLAHH7Zr9sstFrFEUKCcEuZbGXCIxqSqWjB1NhH2mLq3YC7BQH
 LgQDeTREwhMNFIR3qhpjwjM59aVrLsORfE6cG56kpHNyT+Ek6yoGKS/kjQ==
X-Google-Smtp-Source: AGHT+IHGtm9VpJj4t4O7fJKKkV5PsxxldQCmZsWL5vkIovYGs+2GnHvAAvNNMkRcjjzRH9f/QlVAJg==
X-Received: by 2002:a05:6602:6c0e:b0:835:4cb5:4fa7 with SMTP id
 ca18e2360f4ac-83b1c4b4ff6mr495560339f.12.1730076526071; 
 Sun, 27 Oct 2024 17:48:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b1389206bsm121117539f.49.2024.10.27.17.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 17:48:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 18:48:44 -0600
Message-Id: <20241028004844.4116288-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730076526; x=1730681326; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=STRmcvt4kL2OsjkUsYuA9/Ehph2reFCPwkZzZo/N2iE=;
 b=YD73hamo0Zpc8IZy+PznymcpjetzcgC64s5XpRoBVZkrxPmJslfeonbsIR35eECaSq
 OhJZG4zEAk5U0W6lpxifrkdKgxYURp3j1+NfBqZ6nF6oqpJWxwidsoOez9V6VBjXeH4n
 nlBCfj5M1c1uyprdRzONx7Iw0IMM3686z4iZ3SYRELmf7AtcpyQ2zBun1eq1h+GOGPHV
 pBU0fD8A/GPsQtVK0cCOM3CBVVVYcHbAdtS6KnytJpsWA3ZD1rHbUiJB+DnuvdLwOOC5
 0qrcVzCjbBKvJByt1/RN8yIz8C9FDCPw5HPIZLsoFF1qIKz/PV1kCHCwqE6/vDLxWwGN
 loYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YD73hamo
Subject: [Buildroot] [PATCH 1/1] package/python-trio: bump to version 0.27.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-trio/python-trio.hash | 4 ++--
 package/python-trio/python-trio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trio/python-trio.hash b/package/python-trio/python-trio.hash
index 2ef1851f25..35de5d6c3b 100644
--- a/package/python-trio/python-trio.hash
+++ b/package/python-trio/python-trio.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/trio/json
-md5  8f9ed35c130e802b7561edd7f32fc305  trio-0.26.2.tar.gz
-sha256  0346c3852c15e5c7d40ea15972c4805689ef2cb8b5206f794c9c19450119f3a4  trio-0.26.2.tar.gz
+md5  81c1aa4eefa98e1b2895a85369211d24  trio-0.27.0.tar.gz
+sha256  1dcc95ab1726b2da054afea8fd761af74bad79bd52381b84eae408e983c76831  trio-0.27.0.tar.gz
 # Locally computed sha256 checksums
 sha256  418d025e1284311f2690263e6efa6bf51585e5741818ece63e5862487e505bb9  LICENSE
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.APACHE2
diff --git a/package/python-trio/python-trio.mk b/package/python-trio/python-trio.mk
index 58c28bb757..dace4eec9e 100644
--- a/package/python-trio/python-trio.mk
+++ b/package/python-trio/python-trio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRIO_VERSION = 0.26.2
+PYTHON_TRIO_VERSION = 0.27.0
 PYTHON_TRIO_SOURCE = trio-$(PYTHON_TRIO_VERSION).tar.gz
-PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/9a/03/ab0e9509be0c6465e2773768ec25ee0cb8053c0b91471ab3854bbf2294b2
+PYTHON_TRIO_SITE = https://files.pythonhosted.org/packages/17/d1/a83dee5be404da7afe5a71783a33b8907bacb935a6dc8c69ab785e4a3eed
 PYTHON_TRIO_SETUP_TYPE = setuptools
 PYTHON_TRIO_LICENSE = Apache-2.0 or MIT
 PYTHON_TRIO_LICENSE_FILES = LICENSE LICENSE.APACHE2 LICENSE.MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
