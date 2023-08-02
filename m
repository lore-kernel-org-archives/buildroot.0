Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17E1C001DF
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 18:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B8B141DDD;
	Wed,  2 Aug 2023 18:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B8B141DDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-pHy7gMMUto; Wed,  2 Aug 2023 18:12:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC5241DA3;
	Wed,  2 Aug 2023 18:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC5241DA3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B0C31BF3A7
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 18:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F1E561237
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 18:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F1E561237
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HEvFhUTelyrl for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 18:12:18 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C57D6121B
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 18:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C57D6121B
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 72613A4C00C6
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 20:12:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45458)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRGKV-0001fs-0d
 for buildroot@buildroot.org; Wed, 02 Aug 2023 20:12:15 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 20:12:15 +0200
Message-Id: <20230802181215.807175-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690999935;
 bh=BSoGZbdDstItib/JqgkeIg3ERWPntRA7uWBfQcjzzgA=;
 h=From:To:Subject:Date:From;
 b=wVMNJ0sjE2rY/kwLofcBZKD0SHdS9EJEW6481AiZcESCK/YHrLpd5OlFD59W7qVNJ
 W3CwhnK1XLZDRiHzD9VvfDmhkxU7v3OcjTvhdG9InKunVMpOhqpavOApBDBf1GX3hv
 p98/3N+9Ck0kO7oJB2MZEWlE6QhKI31Se7dCiJzxfidSMFcUp3Bmg4/RydBGE3YtrI
 aj3JEdoZRuqx7nnHqz1Kfmk7+guD5lpcNyU2XlE19eA3cDFEvv59QcayOwCKzMYUij
 2hIZi0U2JhvSotf4H9Rk+YpY04pcwc5ASUt+XEQIVLEsCi4H7gU/1OSIiHcel26TAe
 y30/BUD02s+qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=wVMNJ0sj
Subject: [Buildroot] [PATCH 1/1] package/liblo: add upstream patch to fix
 build error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/c98/c98c21093714542d4c0546a742fdcc48f3f07d04/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...x-use-after-free-warning-in-server.c.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch

diff --git a/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch b/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch
new file mode 100644
index 0000000000..be815a0a61
--- /dev/null
+++ b/package/liblo/0001-Fix-use-after-free-warning-in-server.c.patch
@@ -0,0 +1,29 @@
+From 8187a8456c14eeb3af08c86ffa1228823c9ef1c5 Mon Sep 17 00:00:00 2001
+From: Guido Aulisi <guido.aulisi@gmail.com>
+Date: Sun, 25 Jun 2023 15:58:30 +0200
+Subject: [PATCH] Fix use-after-free warning in server.c
+
+That assignment is not necessary before returning
+
+Upstream: https://sourceforge.net/p/liblo/git/ci/8187a8456c14eeb3af08c86ffa1228823c9ef1c5/
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/server.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/server.c b/src/server.c
+index ba02d8e..35c9ba5 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -2289,7 +2289,6 @@ int lo_server_del_lo_method(lo_server s, lo_method m)
+             free((void *) it->path);
+             free((void *) it->typespec);
+             free(it);
+-            it = prev;
+             return 0;
+         }
+         prev = it;
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
