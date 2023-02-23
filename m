Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59498C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 11:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0181381F0F;
	Thu, 23 Feb 2023 11:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0181381F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ie-UObc5jIvK; Thu, 23 Feb 2023 11:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F0C8149E;
	Thu, 23 Feb 2023 11:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39F0C8149E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1261BF57C
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 11:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1475181469
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 11:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1475181469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBDTXwFPL327 for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 11:19:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D7B8149E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2D7B8149E
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 11:19:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so9949063wms.1
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 03:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJx5enJ9X7Ke7CWxZdMOXyG6ogB8J5OvtdplPqKkkBA=;
 b=deqMLL87DfXaSzg6PcQAZ4PdjRbF98Remf3aOasbipUxc2CHbIMGVKgy7tFwL6y+EK
 Vpdp1x66Qsk/JSvL5enRKVxR6apmNpHg1YUDlketw1zg7hPeB2Y1LIJ1JXi5a6vASWHf
 XFoGfDXH3A6BI405GFk54uz45wjOjvjAfxr8HiNDhC+pPH+/P+sla3KynJiPi8e9kYaY
 Pf3FYDHQ4U81xLx88QT+11UXofPMDmFh83fkJKYpjroqGG2kFPQBnGtpj0y55c2Ev+8b
 AuY0xCFbB0RoiBbnrD6qB4wSHfe6alFGSeLCmvXD/ajHPKq1NlUWuPFZiuHCAxyAbGmX
 NUkg==
X-Gm-Message-State: AO0yUKU9dgH3gXlxZdd8ZblwLElYkKbzETzmLv4J26WAyQs/ggsadtUH
 gSG3wXNeCj9jv5U1Qp0VJ7sVGqiAJX4=
X-Google-Smtp-Source: AK7set+HezM/zuRqRElRRxhNE3CddI/NlAFOF72crzp3ee2XhRE52SXo8qbsvkJ/JYQl2xXuUgGJWg==
X-Received: by 2002:a05:600c:1887:b0:3e2:20c7:6545 with SMTP id
 x7-20020a05600c188700b003e220c76545mr9182689wmp.12.1677151145550; 
 Thu, 23 Feb 2023 03:19:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c22-20020a7bc856000000b003e01493b136sm11008566wml.43.2023.02.23.03.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 03:19:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 12:19:03 +0100
Message-Id: <20230223111903.315678-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XJx5enJ9X7Ke7CWxZdMOXyG6ogB8J5OvtdplPqKkkBA=;
 b=l6l4gHN5fmLQXds+Irpn2LzNYwusKZNjcLOImIHg9v0H4bbklouBf+9kaofKmzZ9Ph
 c92/IrSAGKcc0GaphAzZVyhgIkCrIgjA7FQ9CJSzk5ev7qsEfYcSd5aYGYSFI+imlocD
 fbCqEiphNuy3KyG36rOQVRkH7ao/SifkftNsJ6YvGF8YUnk+b88Sswcd6dbtgv7SV+H3
 0qlB24PIB5FKfFipLDkKmTU5oHw/LJnMIJ4JcB+JOpOhds6ZNfppB9PoyixpcrQWh1MB
 LmPiebe5VbDEte8n6NYqvnoO6u9GjjNzr4RDc2LQCm6Y4lWsVadY0k/G5UB8Tk4TQonI
 IkdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l6l4gHN5
Subject: [Buildroot] [PATCH 1/1] package/s6-linux-utils: fix build with
 glibc < 2.25
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with glibc < 2.25 raised since bump to
version 2.6.0.0 in commit 5aac1d0105a73133fd886acc6c5195ca28f7e17f and
https://github.com/skarnet/s6-linux-utils/commit/ad5973028c42d947440cdae5e4f106152c3dda28:

src/minutils/rngseed.c:15:24: fatal error: sys/random.h: No such file or directory
 #include <sys/random.h>
                        ^

Fixes:
 - http://autobuild.buildroot.org/results/214bcecfc389cb412b68627c831300478d614a3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...utils-rngseed.c-fix-build-with-glibc.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch

diff --git a/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch b/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch
new file mode 100644
index 0000000000..2df8a99700
--- /dev/null
+++ b/package/s6-linux-utils/0001-src-s6-linux-utils-rngseed.c-fix-build-with-glibc.patch
@@ -0,0 +1,39 @@
+From 3ab8bdc1c657f91a2a96f4e6db308d17098de0c4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 23 Feb 2023 12:09:11 +0100
+Subject: [PATCH] src/s6-linux-utils/rngseed.c: fix build with glibc <
+
+getrandom and sys/random.h are only available since glibc 2.25 resulting
+in the following build failure since version 2.6.0.0 and
+https://github.com/skarnet/s6-linux-utils/commit/ad5973028c42d947440cdae5e4f106152c3dda28:
+
+src/minutils/rngseed.c:15:24: fatal error: sys/random.h: No such file or directory
+ #include <sys/random.h>
+                        ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/214bcecfc389cb412b68627c831300478d614a3a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/skarnet/s6-linux-utils/pull/2]
+---
+ src/s6-linux-utils/rngseed.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/minutils/rngseed.c b/src/minutils/rngseed.c
+index 2b1772c..223f50a 100644
+--- a/src/minutils/rngseed.c
++++ b/src/minutils/rngseed.c
+@@ -12,7 +12,9 @@
+ #include <unistd.h>
+ #include <sys/stat.h>
+ #include <sys/ioctl.h>
++#ifdef SKALIBS_HASGETRANDOM
+ #include <sys/random.h>
++#endif
+ #include <linux/random.h>
+ 
+ #include <skalibs/types.h>
+-- 
+2.39.1
+
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
