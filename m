Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F145BC001E0
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 19:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79D2380BB7;
	Wed, 26 Jul 2023 19:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79D2380BB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nvn512OX31Tk; Wed, 26 Jul 2023 19:48:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C991880B8B;
	Wed, 26 Jul 2023 19:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C991880B8B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8FBC91BF336
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 19:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68C4060AC3
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 19:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68C4060AC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0G5v036871EG for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 19:48:31 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9159D6070A
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 19:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9159D6070A
Received: from fli4l.lan.fli4l (p54a1bcc1.dip0.t-ipconnect.de [84.161.188.193])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2AD91A4C02CB;
 Wed, 26 Jul 2023 21:48:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35518)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qOkUl-0001Rm-2s;
 Wed, 26 Jul 2023 21:48:27 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 21:48:27 +0200
Message-Id: <20230726194827.1462721-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690400908;
 bh=8y0IFg7dBVJTIm38xavKb03U0NwymVsUI1fvQemOvN4=;
 h=From:To:Cc:Subject:Date:From;
 b=NkAUyWql/eyYriKUM4vJS/DZWU6cuW2G4qtVGCNut4sK/2uXGLDyAAj5TFld6uEx4
 tDhbfLrHbR+BLgL4EJdnD8GlxpNSRwgXZ1UUsygP5FjoS+tOM0Fy5jkGIEq2GeDFKC
 9XZwPXxhKT2rHHCjQiUkcTtd9wOHcyyK4hdUX65F2qiNZkl9xA1FD7IuohAHBuQODi
 /tj6cz0CRyUTXD1GiMxMQkvFPW2VL+yUX4gPHI28zAYLyZcGJGgwEBvFvWcLOKglPy
 GqQm0AmkGVDeuy5EKJvjxwExDiGOfE+BARhUeG5Is3egtN9zgrEl5uhY3cRpE4MZIc
 /6WeZknKXFQnQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=NkAUyWql
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: needs libyaml
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/cc1/cc141c81fd00ca3ece1c33b9659cce93dd5222a9/

Makefile:576: *** libyaml is in the dependency chain of libubootenv that
 has added it to its _DEPENDENCIES variable without selecting it or
 depending on it from Config.in.  Stop.

This error was introduced by buildroot commit
9325ba4754fea800658bb3aec99f28bba3d2acf3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libubootenv/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libubootenv/Config.in b/package/libubootenv/Config.in
index 9be52c4522..5258ed78b1 100644
--- a/package/libubootenv/Config.in
+++ b/package/libubootenv/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBUBOOTENV
 	bool "libubootenv"
+	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_ZLIB
 	help
 	  libubootenv is a library that provides a hardware independent
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
