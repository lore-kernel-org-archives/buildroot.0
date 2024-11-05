Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565DAD3177B
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19FCE407B3;
	Tue,  5 Nov 2024 18:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwuBnUB-wunh; Tue,  5 Nov 2024 18:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E39DD40782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E39DD40782;
	Tue,  5 Nov 2024 18:17:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F9173B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40958608C6
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:17:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDyZVghZQcmJ for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:16:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B9FE608C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B9FE608C3
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B9FE608C3
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:16:59 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-83a9cd37a11so225242139f.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:16:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730830618; x=1731435418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XtMk018JfQ0jl+eWmvtnSE4bq4MdD1VyZeZBTwAfkjs=;
 b=EGqW/0/tRPuAWWCEWqn5Pm7mCzJ1ZcSSiywiNmkHASTnSq26w9ZGdAmmT56xWr8Noj
 CRoNfTpufDKSNPjdDWbaEAsvNEhlqYXC0Bm4ejdSbjayp2ex90Q+P2pX5Lq1/gIaKwuw
 4UvK/NyptbBdMto8j82kl4wE1iV79mjct+NWt1DgESIxMDlwl3ob476a/Z+9zp0bagkJ
 UXWG5p+Jsni6bjrYClahm2Q2eGcr4QdQVjkYwFoydryWRKk5sfg5xMZBmCyBSb64B1v5
 /R9xyL+e0A3A6QrMKkx4jB/iOiS82aSYVBlbgx9WNimhf32SzAbeUg1C0WgAhroJddVL
 Z1gA==
X-Gm-Message-State: AOJu0YyxUgprfm+8bD8UdKa0GJGhyDCmu0pkbJFtGotZv8oro1kk9CIn
 5hIwKLGi7E+XSrCUDvelUvPBjMIrbwUNqOPuC5ZbZLsX9EPop5urdk8aBQ==
X-Google-Smtp-Source: AGHT+IGzgiCkPM+0epskAys6bLEwrHvNwsNrssylS/n+Wn46saGaDdSdzT7afxTb2VyjzDll8T1OvA==
X-Received: by 2002:a92:364e:0:b0:3a5:e1f5:1563 with SMTP id
 e9e14a558f8ab-3a5e1f51a81mr191259535ab.9.1730830617876; 
 Tue, 05 Nov 2024 10:16:57 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a97b0478sm29977135ab.18.2024.11.05.10.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:16:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:16:55 -0700
Message-Id: <20241105181655.1425565-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730830618; x=1731435418; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XtMk018JfQ0jl+eWmvtnSE4bq4MdD1VyZeZBTwAfkjs=;
 b=nInTQi4mxWOhsRAY9yu+u42funs2u72a0V5RxUin3cZDAxuJ3LNi73l1bHhEF6biQd
 z4S6GJURNu6FwG8OlLI0UMwUQLNIVaRwDf0a15nlINheIQa90TkYNj+ny1GEYAP8TosU
 491E4Z4o46ei6TSQDWYKOEHYsUZHwwJUMWeVLiQ7MTorP1/BRyqfu2U7f9t5mAMwH+NW
 fCtLhW5BllPqdn/S9L8rcwzkg0oPjdAUDCSsqa/zBK+ZuFP9LKDBbgP8qkdeZXKQQK2m
 t6ba4iMNAq5h1bKvyQebDsc22bCwRyVo9miwJVbPq/tHI1JrkjNWAFxqZWIHXTJd3aw4
 oJtA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nInTQi4m
Subject: [Buildroot] [PATCH 1/1] package/python-pysmi: use poetry setup type
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

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysmi/python-pysmi.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index a2793647d8..6758b4e807 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -7,9 +7,8 @@
 PYTHON_PYSMI_VERSION = 1.5.6
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
 PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/a3/a1/b43edf8fd80c550782c9f0daa499c7d3013d31ff924405a7f96c9cdaa5d2
-PYTHON_PYSMI_SETUP_TYPE = pep517
+PYTHON_PYSMI_SETUP_TYPE = poetry
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
-PYTHON_PYSMI_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
