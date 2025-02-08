Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6A8C0219E
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BFF8427C4;
	Sat,  8 Feb 2025 14:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWVfvDiPa_r0; Sat,  8 Feb 2025 14:23:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0030429D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0030429D6;
	Sat,  8 Feb 2025 14:23:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AE691BA
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12A80417ED
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gh-bRUWDKxOM for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FCBF417E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FCBF417E5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FCBF417E5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38dc33931d3so1155567f8f.1
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024612; x=1739629412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0cOYmHivg8FfvYK6bvZIWxGBVS+QvJB1qXDfgpXcLho=;
 b=kN3rJ2mqR+Ko1HEd2m1IzRjSgVd5yngVtCks6RXeytQR28sn67nhWX3uGJBrc+FYKJ
 6nN3pRWM+TDXcKOwXwHEQRrjxnn/xy6zzOc0AwqThdO3Z/v7lUSxQwuf3Shf7MxO+qY6
 EHhZaKki/cTNcVW6PfX/5izIOGjoT3pOcMvUTPEOtQgQxPcdovTTQ2o1NDm8PFvZB0Lg
 pzBDGksxXYdBNtdoA+8JxFsenzALpHAhmw3vDvWBz8RGfIx7zMTS133vufszQzCjzjM+
 iwz82HkB2vk0hyu/IXlcgD15TOGy9fpTXTeH2g+RYxb8nNjkqH10cEGxCQW+Qu759dNl
 mdPg==
X-Gm-Message-State: AOJu0Yzy8nXetbDzsn/vfnEgoyZTzWy/ng+SsE083XCtYQ/wOtN0VwQ/
 Ih9fYa24isqWIpGRMSawbIbzajT+zIJzo/PIJjRZ714PrXM7/j0jSR7bydZlV5R4CyWc6vvnmTt
 U
X-Gm-Gg: ASbGncteoZ0LA0IVObNWR+hs4mzFY0EZ6/w+zXsJ0oDMFApkt4rpuVdLOfgBKfV1Bue
 tjJGsB8YAmzUL3JLmcG/2lMJdWNhT3rbKcr6kuJLa9+Ah7t6Ns+UOjkYWeeXh7IcqgMdUKXm4re
 MCy0fXKONsnxQLqrcyTIMPFXBHH287g/Zm5srVffBmEFWFYHX7+4KGRXSID1I+32wHCR5f2CUuf
 lAzd9jYRn6XoIYsGuKat1k7xwtSQHeMHB7B6FSunTUF4ZvpFKoosjc9rkd3ez6LNDmB73Nak0aU
 alekf+nuvlPMT8HQFII/GPN2mCrIK2i694ECBHAMNRstvosQgUpiuB74Fgg87wkSuAbbqBsLOrd
 jA0OzeVOyysb8
X-Google-Smtp-Source: AGHT+IE5WropXzC9Dkj2PlIHVoa0+nYvcOh0eOpMP9CP+7C3Kd1xwm7Yqf+FaiubBgycvnVwuULFnA==
X-Received: by 2002:a05:6000:400f:b0:385:f220:f798 with SMTP id
 ffacd0b85a97d-38dc8da6361mr4450486f8f.6.1739024612137; 
 Sat, 08 Feb 2025 06:23:32 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:31 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:19 +0100
Message-ID: <20250208142327.418271-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024612; x=1739629412; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cOYmHivg8FfvYK6bvZIWxGBVS+QvJB1qXDfgpXcLho=;
 b=rCTbnLjo3gwFSfX3YTV8JdiCLPIrAI4ZFZjFt6U6FWZt+9XIRnccqRHJegiW5JF75V
 RN5KBA35muSy1pHAi2Wlii7Lz8R8odYNRdiQss7zsJUqJMdXlTainRcJir3bkrVGTzFl
 3fXINlBC8HXtr6z76eBanSk87dL6ddIO35t5Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=rCTbnLjo
Subject: [Buildroot] [PATCH 03/11] utils/checkpackagelib: fix shellcheck
 tests after update to shellcheck 0.9.0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

shellcheck tests needs to be updated after shellcheck 0.9.0 update due
to changes in errors/warning reporting:

  utils/checkpackagelib/test_tool.py::test_Shellcheck[missing shebang-empty.sh--expected0] FAILED [ 98%]
  utils/checkpackagelib/test_tool.py::test_Shellcheck[2 warnings-unused.sh-unused=""-expected3] FAILED [ 99%]
  utils/checkpackagelib/test_tool.py::test_Shellcheck[tab-tab.sh-\t#!/bin/sh-expected4] FAILED [100%]

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 utils/checkpackagelib/test_tool.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/utils/checkpackagelib/test_tool.py b/utils/checkpackagelib/test_tool.py
index cfa826f57c..56326398d3 100644
--- a/utils/checkpackagelib/test_tool.py
+++ b/utils/checkpackagelib/test_tool.py
@@ -100,7 +100,7 @@ Shellcheck = [
      '',
      ["dir/empty.sh:0: run 'shellcheck' and fix the warnings",
       "In dir/empty.sh line 1:\n"
-      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.\n"
+      "^-- SC2148 (error): Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.\n"
       "For more information:\n"
       "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y..."]),
     ('sh shebang',
@@ -117,8 +117,8 @@ Shellcheck = [
      ["dir/unused.sh:0: run 'shellcheck' and fix the warnings",
       "In dir/unused.sh line 1:\n"
       'unused=""\n'
-      "^-- SC2148: Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.\n"
-      "^----^ SC2034: unused appears unused. Verify use (or export if used externally).\n"
+      "^-- SC2148 (error): Tips depend on target shell and yours is unknown. Add a shebang or a 'shell' directive.\n"
+      "^----^ SC2034 (warning): unused appears unused. Verify use (or export if used externally).\n"
       "For more information:\n"
       "  https://www.shellcheck.net/wiki/SC2148 -- Tips depend on target shell and y...\n"
       "  https://www.shellcheck.net/wiki/SC2034 -- unused appears unused. Verify use..."]),
@@ -128,7 +128,7 @@ Shellcheck = [
      ["dir/tab.sh:0: run 'shellcheck' and fix the warnings",
       "In dir/tab.sh line 1:\n"
       '\t#!/bin/sh\n'
-      "^-- SC1114: Remove leading spaces before the shebang.\n"
+      "^-- SC1114 (error): Remove leading spaces before the shebang.\n"
       "For more information:\n"
       "  https://www.shellcheck.net/wiki/SC1114 -- Remove leading spaces before the ..."]),
     ]
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
