Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8F8C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 19:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45685400D8;
	Sun,  5 Nov 2023 19:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45685400D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4lXqdvrGFaqV; Sun,  5 Nov 2023 19:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C390400F2;
	Sun,  5 Nov 2023 19:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C390400F2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 228FD1BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 19:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDC6C400F2
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 19:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDC6C400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zIS_7UAWhM-o for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 19:58:31 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 897B9400D8
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 19:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 897B9400D8
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c54c8934abso53937211fa.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 11:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699214308; x=1699819108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XAsR6xTeUFlsjfGQhouPqVooC/ZsGCsejgjswz7yCDI=;
 b=v5rzW8y0LxtVco77NwOgTNfYKSCK2wH1CQfUMfo2ASz4W8pigEvdEcu5O2N/dbGkUd
 iu8EXJTzP1edWXrfYEp4c/iBIA+iM7Zx6IAe+tnSV6pmISy7bua20qv5X/2VvP/Rq5LC
 lzbtXlX+21EKC9IxeZKn7ykrwqwa58KMKmpAzinhfUtf8IKV7sbAgcdDM5Tqj+9AHwnw
 Cu581HpEQP8/ydliaKRDME/XkEYeyCMMqexgj36ZDBmocoR7fGhsvKAFGBmErmHTFi2G
 kTY7dGxfXEduNKnO0irNUW6Bx5jjWrf6z/3pz4YxJ/+bA+AR7WT9gnkEtGaXSlxqP/zW
 Dj+Q==
X-Gm-Message-State: AOJu0YwX2TtafZ53fbFfrJkVUYKTNH+b9Qf+mYo0kkwMgMMYVlQ+aUzZ
 T0c6b0t2wwti8dqND5HO7lekDP0p/F8=
X-Google-Smtp-Source: AGHT+IHqMNWulq3Z3nHgrHWTjrQGAx/MNMkt/kyrvuPxCvzNyHFu5zOhbOfR7FGo4JVMGxSpFszoRg==
X-Received: by 2002:a2e:a3d7:0:b0:2c5:d10:248f with SMTP id
 w23-20020a2ea3d7000000b002c50d10248fmr19528260lje.49.1699214308425; 
 Sun, 05 Nov 2023 11:58:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c481100b004063d8b43e7sm9655462wmo.48.2023.11.05.11.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 11:58:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 20:58:25 +0100
Message-ID: <20231105195825.1076285-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699214308; x=1699819108; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XAsR6xTeUFlsjfGQhouPqVooC/ZsGCsejgjswz7yCDI=;
 b=DOwKCucObF3ez3KM3qp1BXkyrho8lQqFTav23n/fS5IcG91BJ9/TD8tLVka2nzPZEQ
 WVCuS6/Gxg2TPI35YJMymcAJZG6150hGq09hoEWPQIdCphMkLJJh7iP91Y2n2UgCvtid
 fLAUrHK2KCrrO7mg5gy12qnI6m5GhfpOmNwoWCJ/l1Y7RsCjHgey+xo8wCNY/ttzSbg2
 u9mYC2pA6JRmTN46cMOGKElBtLJTg1aMbPrg9IPr5rtSEv/0ugSNyT4s1acSHeQv17xv
 6Kkh4AxqAhtZfaehQFOxDpzcceo0FdwknsJC6bwsF1Ccky4DQVKqU/8+tQ23/5R2dRP7
 WP5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DOwKCucO
Subject: [Buildroot] [PATCH 1/1] package/nmap: bump to version 7.94
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of license file:
Updated the Nmap Public Source License (NPSL) to Version 0.95. This just
clarifies that the derivative works definition and all other license
clauses only apply to parties who choose to accept the license in return
for the special rights granted (such as Nmap redistribution rights). If
a party can do everything they need to using copyright provisions
outside of this license such as fair use, we support that and aren't
trying to claim any control over their work. Versions of Nmap released
under previous versions of the NPSL may also be used under the NPSL 0.95
terms.

https://nmap.org/changelog#7.94

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nmap/nmap.hash | 6 +++---
 package/nmap/nmap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nmap/nmap.hash b/package/nmap/nmap.hash
index dc379f30d4..99c5d5fb07 100644
--- a/package/nmap/nmap.hash
+++ b/package/nmap/nmap.hash
@@ -1,5 +1,5 @@
-# From https://nmap.org/dist/sigs/nmap-7.92.tar.bz2.digest.txt (lowercase)
-sha256  a5479f2f8a6b0b2516767d2f7189c386c1dc858d997167d7ec5cfc798c7571a1  nmap-7.92.tar.bz2
+# From https://nmap.org/dist/sigs/nmap-7.94.tar.bz2.digest.txt (lowercase)
+sha512  a55cddf9c1d9272243d01251eb3315b26f232d0596818857083222a385398618b428dc2bd8282c3e832527e135a74aeb020ca8609d83d8337342f5d8a04d7f2c  nmap-7.94.tar.bz2
 
 # Locally calculated
-sha256  133794301a764dfe8a60e38601e56657b7113e0337b452189725bbbed58baea0  LICENSE
+sha256  9d9a9a763c0e6145172cfe7d8483e23b38ce60b6c79a82e4894242917bdae6d3  LICENSE
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index f22a2295b1..6cd9d96119 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NMAP_VERSION = 7.92
+NMAP_VERSION = 7.94
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = liblinear libpcap
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
