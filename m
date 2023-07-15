Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1D0C001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4E6360D9D;
	Sat, 15 Jul 2023 15:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4E6360D9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wX02qJcrbBmG; Sat, 15 Jul 2023 15:08:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1090A60DC6;
	Sat, 15 Jul 2023 15:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1090A60DC6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85B6A1BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FE8481D35
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE8481D35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LW5QSnx9t64s for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:08:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6863C809F5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6863C809F5
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:08:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CDC54A4C0FDF;
 Sat, 15 Jul 2023 17:05:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKgq1-0002tE-1j;
 Sat, 15 Jul 2023 17:05:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 17:05:27 +0200
Message-Id: <20230715150536.2959313-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715150536.2959313-1-bernd@kuhls.net>
References: <20230715150536.2959313-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689433537;
 bh=DZUpXfNMp6jvzeGgigdwxQn10Ydgstozi1428PBBt+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dJJbPoy/3aSprUcokfCpWCru60XWIKVUiZc47tBgdiu2T3g8SiGj7KPD1SO/QLLZK
 PH4fMpSHHr0BtafENKuUtZdzvhWqvenopjw7dN0JCz0BEN07pu7932Q45X9ULtzWih
 Ho+lP20ZNp+GH1woLitiMw7qtLxfScXE8zMCYmx0d9otCs+J/tEJ2+LCZbEWTgp2TW
 ynCTjG5SrOu+8MjDj1gIwhKxZO2FeoGxEs3pK9zlPrNYgnNDv256VKRW5RmaK8FLqa
 vIQ8fbEfkoJpRROR8FDM1lUR7ET+7YvytAiDHaLROnbcBeWG8RkQ6GQW1A7u7ZubA6
 +z/TvGafkaZaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=dJJbPoy/
Subject: [Buildroot] [PATCH 11/20] package/erlang-p1-stringprep: bump
 version to 1.0.29
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
https://github.com/processone/stringprep/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 2 +-
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
index eec611829a..50a48af0a4 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  cdc2ffa6ba2171f55b78e69cfce5dab6099cbb6bc6955d88c5c53b0cf24d13af  erlang-p1-stringprep-1.0.27.tar.gz
+sha256  b07daf2148829d513caf2931d463550e70252a78ef99696dcf444d61d93bf940  erlang-p1-stringprep-1.0.29.tar.gz
 sha256  f44415631770cb818de6d92f3961fdfe6e407a5154f84b87cc06ac27323e919c  LICENSE.ALL
 sha256  42aef2a1337ef1f45ae2832aa5aa268c79b2560fb1f3ebab519629372cb24ffe  LICENSE.TCL
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index 233be52c58..09e339f57a 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STRINGPREP_VERSION = 1.0.27
+ERLANG_P1_STRINGPREP_VERSION = 1.0.29
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
 ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
 ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
