Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5B8D0BB60
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 05:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AE7A40781;
	Thu, 24 Oct 2024 05:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kv5g4trLxWGd; Thu, 24 Oct 2024 05:23:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 690514067F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 690514067F;
	Thu, 24 Oct 2024 05:23:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 197A82073
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDB8C812A0
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-AGVUioDvrS for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 05:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0E4481282
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0E4481282
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0E4481282
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 05:23:56 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83aacecc8efso53659439f.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729747435; x=1730352235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xFq6TxlgWhwTXsJQhCEx0DEfwodJWNXa+ysDUU0KonU=;
 b=JAOprqqasqrFrED3rBY2bF3ZTH4j5x7PR705tDuloamYA8sFYUKb8hY0NcW4IBBx8q
 2O83Y3PnBFUv9DngOjEZ/43dZ4Tp7i5dJvrSv3+5jgL+tNTGYMGBCr6MfMrhjwFdNoqX
 MPR0kgp8Em/GqP42A3LSTQGdAwBe7RlLdEFeIwL6ahrxGZh4N02/GAxlKGyw26pT/87L
 IuUi079IgjzyvgVerirUY0Gc9YbH/6ARyTjfMnNlXsEmmglce4v3Pbz8L4IiVsFCGHe5
 P2oGnIJF7wDyOYMJiBFkkv0ncLxp0XE85AKHxxL3p+KD2CLaitk6wVFb0o8PxxOTpsbZ
 omYQ==
X-Gm-Message-State: AOJu0YwGvedMAV5vhkAT6OtO9NfFd1s40mur7jRaLXz6vn34BtbZq1Fj
 AxX+MhlUrCQ/1+JN5/7NgUfp4HG3fpVmhutjAFmynmP95h/RWVNyynARFg==
X-Google-Smtp-Source: AGHT+IGbRRtP5nJnLFFzfp9c5SAdIcOpar23rSfTBZ9mnfmz65xEr2Fh/cQU+NziiNWSn5F7BgzrVg==
X-Received: by 2002:a05:6e02:1c2a:b0:3a1:95d9:6f36 with SMTP id
 e9e14a558f8ab-3a4de78f490mr5891735ab.13.1729747435446; 
 Wed, 23 Oct 2024 22:23:55 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a5885c3sm2512054173.76.2024.10.23.22.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 22:23:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Oct 2024 23:23:53 -0600
Message-Id: <20241024052353.3397688-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729747435; x=1730352235; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xFq6TxlgWhwTXsJQhCEx0DEfwodJWNXa+ysDUU0KonU=;
 b=mOxS6L3MO0RddKbVQZbMC07rDCJ3Oozi/SWpGLKKkTeolnXe/6A4hmNiFBi6KFsDVH
 9tqu5HLdNKigjJdZpwdiENUx/31sOpHGkOlg6hNcVKJ5dLmmg9YQvU/jDsqs3oMOg/85
 4Tjy4GDaK5tiqCaj2lb3xYjZ8PB75VtFJ9lnoxS8OI76Iot0LJZT+aJYovodA3ck0hcL
 dOls+2y6kizHs5xPZvXcwZXQ19cadsOkLzGtvJbSWJRZURgwYQHPAPACnvPtFbOUTt0d
 RqJhzK2bCkKbv3duDBC2+aCk55mCSoTV2auPDjxEzv1N0gpk7a63KhP5LlkMpL50IxLG
 FlKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mOxS6L3M
Subject: [Buildroot] [PATCH 1/1] package/python-beautifulsoup4: use hatch
 setup type
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

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-beautifulsoup4/python-beautifulsoup4.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index bb02807cdb..ba54f68c83 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -7,9 +7,8 @@
 PYTHON_BEAUTIFULSOUP4_VERSION = 4.12.3
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
 PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/b3/ca/824b1195773ce6166d388573fc106ce56d4a805bd7427b624e063596ec58
-PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = pep517
+PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = hatch
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
-PYTHON_BEAUTIFULSOUP4_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
