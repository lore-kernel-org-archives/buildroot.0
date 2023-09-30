Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CD7E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 830174151E;
	Sat, 30 Sep 2023 13:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 830174151E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17TRcS9TQ9n8; Sat, 30 Sep 2023 13:28:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99C4B40ACE;
	Sat, 30 Sep 2023 13:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99C4B40ACE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 186941BF681
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 006C083DE8
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:28:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 006C083DE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hK1l6qeD_UFx for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:28:30 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0123383CBA
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0123383CBA
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40566f89f6eso123550015e9.3
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 06:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696080507; x=1696685307;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y6DJYiZQU90dBACQiDQxxkuFweHVXfrO1k+dbFc4CJY=;
 b=QNHxHcvqaWS7WuYWfkzYlw44MjCDZBL9v69NY/i0X2SnckzquwalDcZPzW1+a3te3D
 Yarp29NhcJ+SWl5On8wbQTeGUZaxC6sdoX92XBXmZGRpzZvXYXLnUkbzQxv8IzV/FV+a
 BXGbUq1/2bsngvN9TFbKjaElFkCnU8fpBvimXs87Yqc4fBtGjS1OhdzF6jTU54qbqebb
 eHoAV+EYMa25LuYvqlt/qtdhaUfqe92gNy8la1t1zL1PZYeIvCznkUTUoGJozkG4L/CY
 56SYP45CsA6JtRYVW3cSgOnlfDhjaIVL1f3ZbooiB7Dn+PFIeKu5w6mghyVnWkY3UOYp
 acNg==
X-Gm-Message-State: AOJu0Yw21i6cJmOEVxG667cxeV8CQaSBmu0zzw1wS60bm5sPfpH3r6WO
 p4jTvlbITN4sztBYjSK7nByKW0GbJxg=
X-Google-Smtp-Source: AGHT+IGLkGcDogJWUUUCunavnud+Z6Yn1lvAdpA1bY0WoVfppXOdsdQv8kIyQtnpc72WhEXa0LNS+g==
X-Received: by 2002:a7b:c419:0:b0:405:3a65:1b4c with SMTP id
 k25-20020a7bc419000000b004053a651b4cmr6725632wmi.6.1696080507174; 
 Sat, 30 Sep 2023 06:28:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c5-20020adfef45000000b00326dd5486dcsm1458035wrp.107.2023.09.30.06.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 06:28:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 15:28:22 +0200
Message-Id: <20230930132822.436857-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696080507; x=1696685307; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y6DJYiZQU90dBACQiDQxxkuFweHVXfrO1k+dbFc4CJY=;
 b=QU+nv0xBdqXk4jcBU/oeYBfIT6RQYilsa03fx/Q6JFmKs1nWVkRO11LPHfGXRSoxZ2
 8sSNGSNJ0wOuBJlS92xvQHZolbKcCFLi8LqaO40paPNklx3wJCofjD1aIH7GROmaDTYE
 CApwtTATGfCW58RW2tQ2x3RW6+e0GkMogd8QPkZWildlybYrQV/ssKyI+FVre8etfpI/
 Z765hKHzlRpJqXbBXOR/5VTLayCT87vNS0VG/IHwVNB1Q8n8DkUO1mzJcJZPFWaAHoO7
 13vzw3v/VB5KQaupJRgR/jDW8i3dTMwo2VpVcX3Xqvt8KicZvKPa+9ga7QhptPTX4kSg
 ZzMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QU+nv0xB
Subject: [Buildroot] [PATCH 1/1] package/open-iscsi: fix musl build
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following musl build failure raised since bump to version 2.1.9
in commit 2314928cf828ff02939b9c0041964c3ee2dd907d and
https://github.com/open-iscsi/open-iscsi/commit/7b571d76d6937a78c141630fc38c3c57c532466c:

../usr/idbm.c: In function 'idbm_rec_write_old':
../usr/idbm.c:2230:27: error: 'GLOB_ONLYDIR' undeclared (first use in this function)
 2230 |         rc = glob(portal, GLOB_ONLYDIR, NULL, &globbuf);
      |                           ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/14fc1c139f055b5b1eaa6e04e327863c06176a7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-usr-idbm.c-fix-musl-build.patch      | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/open-iscsi/0001-usr-idbm.c-fix-musl-build.patch

diff --git a/package/open-iscsi/0001-usr-idbm.c-fix-musl-build.patch b/package/open-iscsi/0001-usr-idbm.c-fix-musl-build.patch
new file mode 100644
index 0000000000..2ee0e0cc71
--- /dev/null
+++ b/package/open-iscsi/0001-usr-idbm.c-fix-musl-build.patch
@@ -0,0 +1,40 @@
+From dbe342545b7bee42107e09d0da59bb42c50903cb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 Sep 2023 14:54:15 +0200
+Subject: [PATCH] usr/idbm.c: fix musl build
+
+Fix the following musl build failure raised since version 2.1.9 and
+https://github.com/open-iscsi/open-iscsi/commit/7b571d76d6937a78c141630fc38c3c57c532466c:
+
+../usr/idbm.c: In function 'idbm_rec_write_old':
+../usr/idbm.c:2230:27: error: 'GLOB_ONLYDIR' undeclared (first use in this function)
+ 2230 |         rc = glob(portal, GLOB_ONLYDIR, NULL, &globbuf);
+      |                           ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/14fc1c139f055b5b1eaa6e04e327863c06176a7b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/open-iscsi/open-iscsi/pull/426
+---
+ usr/idbm.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/usr/idbm.c b/usr/idbm.c
+index ca4a4ec..fbaa132 100644
+--- a/usr/idbm.c
++++ b/usr/idbm.c
+@@ -45,6 +45,10 @@
+ #include "fw_context.h"
+ #include "iscsi_err.h"
+ 
++#ifndef GLOB_ONLYDIR
++#define GLOB_ONLYDIR	0x100
++#endif
++
+ #define IDBM_HIDE	0    /* Hide parameter when print. */
+ #define IDBM_SHOW	1    /* Show parameter when print. */
+ #define IDBM_MASKED	2    /* Show "stars" instead of real value when print */
+-- 
+2.40.1
+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
