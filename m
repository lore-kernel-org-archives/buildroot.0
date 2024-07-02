Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106B8C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 05:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B40BF81446;
	Tue,  2 Jul 2024 05:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QsA-2iuHZqr; Tue,  2 Jul 2024 05:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C06D181ECA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C06D181ECA;
	Tue,  2 Jul 2024 05:56:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EBF91BF31C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 05:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 940FC40592
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 05:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENREKI4LyabL for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 05:56:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57500404E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57500404E9
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57500404E9
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 05:56:00 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7f3d2d441e4so112279639f.2
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 22:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719899759; x=1720504559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XMIkSBUiS5w1obiVd/ISXD3zZJgf1HIMwQZSIbhjYFI=;
 b=SBsTeZ6aYwOvistJCX9sYN8Q/awvC1tiMz52Aug1QEWuBiZIwTKbaZx9XbjZ3EP3XH
 Vfoa46QwsHk5x7WZ+5iZnsSOVjVDlJm/DLZnhkU/3ejyHX5rUMNIxAnVQJQe9K/+yz6f
 5D0OWLpkB0Kdc+Y4w3o48B1cArJF6JgXq+DYYHb2mCJFbVD/92wc5VV+rWoqEHft7JyH
 v1ue0VaC64YRsee2VTdDSZngrS4EVoz0Z4Mm4QTjk84Qtc5/zBDAXPTLb08Ifbcme/TE
 0ngr/rryOwzFfaa9u9q0YQbbOhdaWzG/SAKo247qg0YfonmZfrxo5IuWRwtLysORGyUg
 nPPA==
X-Gm-Message-State: AOJu0YxGVnGVaJ8WZ1mFUyk++twrrk67UQ8ESRC7cJABRvVrZhTqx+qU
 OboaXlE7d7q4pxUvzqS+HoQ0x9Bu5i/i/59cvwvl4T81qboXzsgKwBe2eQ==
X-Google-Smtp-Source: AGHT+IH+f83IGoPn9joTHazTBHVT64KuVf+f3bWXYad6KOySSvaM8yTu7lfPTe0/K5t3BBpl/Rvcfw==
X-Received: by 2002:a5e:9504:0:b0:7f3:d759:8fb1 with SMTP id
 ca18e2360f4ac-7f62ee0c747mr806301639f.8.1719899758867; 
 Mon, 01 Jul 2024 22:55:58 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73fa182csm2622011173.111.2024.07.01.22.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 22:55:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 23:55:54 -0600
Message-Id: <20240702055554.1039927-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719899759; x=1720504559; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XMIkSBUiS5w1obiVd/ISXD3zZJgf1HIMwQZSIbhjYFI=;
 b=IRXKMXdIqozAshz8nYwWdszZhlK22docypCDG/CdALCebtYKu7rLTJGNHhNY95ByTU
 WS7WcIjkuD7ruaxq3to9tPO2k2Sx7A0oaRXjltoanbmZoHk2AT6Ck27QonXfhQazUjtG
 XLRqO6l78zUdwW2vSg5rG1Ydh+Mnv2k77Lm+iTRlzjAEDlGPC+IDl3J0yh/ZCODzHplC
 /Fbap2QWfZYXnJzyhdORJR6u0UhfJsbjox9Mv7tl+QF6rQibbsAhPrvvECLLcnZeyyE0
 vls/Q5buc8pG+vMVAn45N0X2FrFkGvyHT0hXPIo9pK8Gp95Iz06cGQAQqnIxBJCMyMiP
 woKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IRXKMXdI
Subject: [Buildroot] [PATCH 1/1] package/libblockdev: fix patch fuzz
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, libblockdev fails to build with output:

    Applying 0001-Provide-replacement-function-for-strerror_l.patch using patch:
    patching file configure.ac
    patching file src/utils/module.c
    Hunk #1 FAILED at 28.

This commit fixes the Provide replacement function for strerror_l()
patch so that it applies.

Fixes:
http://autobuild.buildroot.net/results/df5/df54118cc7057ba8dd566515281b77c49a596a04

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-Provide-replacement-function-for-strerror_l.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index f7f75c9c14..d073e16ac5 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -41,8 +41,8 @@ index 6557c3ab..5893f0ac 100644
  #include "logging.h"
 +#include "utils.h"
  
- #define UNUSED __attribute__((unused))
  
+ /**
 diff --git a/src/utils/utils.h b/src/utils/utils.h
 index 801a8b6e..b2bdf0d0 100644
 --- a/src/utils/utils.h
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
