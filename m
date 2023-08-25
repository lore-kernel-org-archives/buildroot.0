Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC99C001DB
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 16:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E074483BB0;
	Fri, 25 Aug 2023 16:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E074483BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbNJasIStY-y; Fri, 25 Aug 2023 16:18:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D93E832E7;
	Fri, 25 Aug 2023 16:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D93E832E7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D59D41BF2CB
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B624D41DA0
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 16:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B624D41DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J4lrt_5nKbqf for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 16:17:56 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA31B41D96
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 16:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA31B41D96
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA04EA4C0432;
 Fri, 25 Aug 2023 18:17:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41728)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qZZVS-0004R1-1m;
 Fri, 25 Aug 2023 18:17:54 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 18:17:54 +0200
Message-Id: <20230825161754.398783-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692980274;
 bh=fCpxiweu2tuLtWmMx3lvdV6kNhE15izvLTNngfQSnMY=;
 h=From:To:Cc:Subject:Date:From;
 b=H/yajQIxPyDQ1mG83uWpUoy5YL5fpHfcNT7SAaO0S535jCFmwz6osb5NeBbb64Sor
 O/JVfPv3PMj2m1sKWdVlWubPEX/hrxEBJGZffAMOw6S/LNo0VPvgzJ4ZYnjKFxG3UH
 OO7Yo9mqiFXlgEf4RKfPW1eMDrAWaezKDwU2ysO1gPjuPsCg2E1ajJBpeX/RG5yNsG
 yBxkGotoUMgHF7cWA1HfjJkmk/qR925IE989Haqd6DUcDyMtVfiG1jBFUeC7Ufrozi
 J7axVpojNTC5ZIw8rUNnTiJWrRZkpQnEsxPk65x7YjiGtanwIodbTKmHsRC5PQfipz
 oSbWS3YVUEdZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=H/yajQIx
Subject: [Buildroot] [PATCH 1/1] package/sentry-cli: needs host-libopenssl
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/b86/b8613dc343c9ebb1470075a72ad86137ddddf5a7/

This build error did not occur prior to bumping libopenssl to 3.0.9 with
buildroot commit 3c66f65a6a549930870f2c0d98abb5ca9321d2a5

It first occured after a libopeenssl 3.x fixed was commit to buildroot
with commit 8382f0eb41bc12098f032c12781fb488aa63d901 here:
http://autobuild.buildroot.net/results/2df/2df940342007e1e3bcdc9defde3a8be1fef1a0b3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
The rust build system and its dependency management are a complete
mystery to me, I can not provide more information.

 package/sentry-cli/sentry-cli.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index df419f81e1..9a05992853 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -9,6 +9,6 @@ SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
 SENTRY_CLI_LICENSE = BSD-3-clause
 SENTRY_CLI_LICENSE_FILES = LICENSE
 
-HOST_SENTRY_CLI_DEPENDENCIES = host-zlib
+HOST_SENTRY_CLI_DEPENDENCIES = host-pkgconf host-libopenssl host-zlib
 
 $(eval $(host-cargo-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
