Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E4EEED61F
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 18:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2895F4031D;
	Fri, 15 Sep 2023 18:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2895F4031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FN0A8BFmgfOm; Fri, 15 Sep 2023 18:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66FC740123;
	Fri, 15 Sep 2023 18:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66FC740123
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 575CF1BF5A8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 18:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D8444031D
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 18:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D8444031D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nIxQqlZ0B89b for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 18:23:12 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35E9A40123
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 18:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35E9A40123
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-403012f27e3so28158695e9.3
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 11:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694802190; x=1695406990;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQsljzFiWN0sy0ZYbeEEKqvMvr0yHuCAJ+bhNcJ403s=;
 b=ri3VERaNhRbZNjvFzqf7AAqmHbJ9wJRBjE4DDdAGrp4JysDDdMcMBEca1UUyOOoB8a
 GMcGfZDgkL+NjQwclTsKqoK+410ttO8v2S8pGPWtlRc+xnFm0iFU4oOkuUqGlGHnmVQJ
 rUMGdJoSDiU7LxMaNRBkoy9f2E5XGVf7zZmyB6UiLAcJeX0LO6CvvrZOleVKjooaAgwl
 HX8Y3ewqhFqKED3WV9+HJBPW1j2cd19FIriRSiya2wcnqYRpuGobNqha14TjHaQ2T7tQ
 M4kThzSDM+owIIZNS/qeYmB9/+ONywZBf0gEndNNeDsaRdlndT6uw41vwxOIr37tJMIr
 w5Ng==
X-Gm-Message-State: AOJu0YwyIV6wEJ3vWyRQxaqHHDwqSwj9Gl+ORzLGH3KzUwB2l12IrOF8
 L9Z2L/jychybbtRHvLvEpMOA+eiPpt4=
X-Google-Smtp-Source: AGHT+IFOGaeBud5/I234rPssleIBr5/chOTJV16vZa3JT+M2lB0VtK43AreYj/0gyTVnLgGAERnH2Q==
X-Received: by 2002:a7b:cd06:0:b0:402:ee67:45d1 with SMTP id
 f6-20020a7bcd06000000b00402ee6745d1mr2427723wmj.36.1694802189621; 
 Fri, 15 Sep 2023 11:23:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y19-20020a05600c20d300b003feeb082a9fsm5246344wmm.3.2023.09.15.11.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 11:23:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 20:23:05 +0200
Message-Id: <20230915182305.975086-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694802190; x=1695406990; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rQsljzFiWN0sy0ZYbeEEKqvMvr0yHuCAJ+bhNcJ403s=;
 b=mTkUmxJOexElGsITqKbS5TdWwustFA1lij2H6Lx2QV59yV2J5BFYG1mpixVSuDLGd0
 L+YKsMfMjENoMgYDPAbWQGy4otpVDXwwBVjy251B08wXtFEVfNweq3/Z2QD6N8/z2MUa
 mYvy4zEcaoxvGSWgF2MsnU8bv/36VnaY3OSzqx5WJ6rnbGNL9VDWpGGKpGUGhWq1dbfy
 pKJz2I8BrA6EJteMvdSB6OQvMKDdc8nh+y14BsLsp9vvN4CRJ9uViF/FwdJczU29u+Qr
 oxpLk9foLxGeugZjEAOj8/NcN4ShqQgG0NNtGp9/qgV/elYPrKNAhXg9iRY2n33QU2Oa
 QNtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mTkUmxJO
Subject: [Buildroot] [PATCH 1/1] package/irssi: bump to version 1.4.4
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
Cc: Rodrigo Rebello <rprebello@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2023-29132: Irssi 1.3.x and 1.4.x before 1.4.4 has a
use-after-free because of use of a stale special collector reference.
This occurs when printing of a non-formatted line is concurrent with
printing of a formatted line.

https://irssi.org/NEWS/#news-v1-4-4
https://irssi.org/NEWS/#news-v1-4-3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/irssi/irssi.hash | 2 +-
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index ecd339d83d..df72ee4d76 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  79a4765d2dfe153c440a1775b074d5d0682b96814c7cf92325b5e15ce50e26a8  irssi-1.4.2.tar.xz
+sha256  fefe9ec8c7b1475449945c934a2360ab12693454892be47a6d288c63eb107ead  irssi-1.4.4.tar.xz
 # Locally calculated
 sha256  a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index c2d02289ad..6790bf0c96 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.4.2
+IRSSI_VERSION = 1.4.4
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 IRSSI_SITE = https://codeberg.org/irssi/irssi/releases/download/$(IRSSI_VERSION)
 IRSSI_LICENSE = GPL-2.0+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
