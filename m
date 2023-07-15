Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96574C001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FD3B60E17;
	Sat, 15 Jul 2023 15:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FD3B60E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ePmd_DZRfGt; Sat, 15 Jul 2023 15:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F77060E31;
	Sat, 15 Jul 2023 15:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F77060E31
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 864D81BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CD8640131
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:07:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CD8640131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7ogN3B6r9Lx for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:07:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 807BA400CF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 807BA400CF
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:07:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B3B45A4C0FDB;
 Sat, 15 Jul 2023 17:05:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKgq1-0002tE-07;
 Sat, 15 Jul 2023 17:05:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 17:05:21 +0200
Message-Id: <20230715150536.2959313-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715150536.2959313-1-bernd@kuhls.net>
References: <20230715150536.2959313-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689433537;
 bh=7lQ6gcT48kKh+0sPWy9knQ6wRvtma5W9nFQOd3bHxM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HHXsykVCJu36cPayfygnT9IOKYsHKyKDK8lUjLDGyhITyLrgS0Bnns96nBWda4QV6
 2/IpwhYvXTlCMncFPyV/6C8Lva9CbsRgf4JRmFGw0yHUPT0JyyZ4DRlFeGi4doW4uL
 zQQoQTQesqv4IvvDrjUDiY+DckW8uk/4+WWPNuli5a1fgEbG6Htku1QmIi6yd+nA3C
 m8Ofw+58rzJ7VJyF5fd/l5AstdFU3+S4NLJYKXqHJlkfLot73tIMC2ZE5HahKdf241
 pBof9NwnUtrmptrMxcx7wAEtsF53DSfQ8dPs2BHjk5STH0isY51IadLy5A3SUEw0hf
 gUnJXe/K1cbCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=HHXsykVC
Subject: [Buildroot] [PATCH 05/20] package/erlang-p1-acme: bump version to
 1.0.22
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/processone/p1_acme/blob/master/CHANGELOG.md
[1.0.22 just updated a github workflow file]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/erlang-p1-acme/erlang-p1-acme.hash | 2 +-
 package/erlang-p1-acme/erlang-p1-acme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-acme/erlang-p1-acme.hash b/package/erlang-p1-acme/erlang-p1-acme.hash
index 7cecb6dfc0..e417d4b181 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.hash
+++ b/package/erlang-p1-acme/erlang-p1-acme.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  58d4b7e97e677bd5a8aa3c1e52514a37cfa0985cad8b5f45cd05889843c4fdd9  erlang-p1-acme-1.0.16.tar.gz
+sha256  a445b66e76acdf1342eda166344004473bf4f45ad7e7f5ae38fb0333d896eb2d  erlang-p1-acme-1.0.22.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-acme/erlang-p1-acme.mk b/package/erlang-p1-acme/erlang-p1-acme.mk
index c9cd1c4f33..cb8c7a8a19 100644
--- a/package/erlang-p1-acme/erlang-p1-acme.mk
+++ b/package/erlang-p1-acme/erlang-p1-acme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ACME_VERSION = 1.0.16
+ERLANG_P1_ACME_VERSION = 1.0.22
 ERLANG_P1_ACME_SITE = $(call github,processone,p1_acme,$(ERLANG_P1_ACME_VERSION))
 ERLANG_P1_ACME_LICENSE = Apache-2.0
 ERLANG_P1_ACME_LICENSE_FILES = LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
