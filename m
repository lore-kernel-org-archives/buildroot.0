Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D5BC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 21:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 223A9400AC;
	Sun, 14 Aug 2022 21:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 223A9400AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqEeLvj4i6fW; Sun, 14 Aug 2022 21:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FB0A403A4;
	Sun, 14 Aug 2022 21:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FB0A403A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 649D11BF282
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D672403A4
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D672403A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pgDsG1fxApyM for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 21:19:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F2B6400AC
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F2B6400AC
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 21:19:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso7001153wmc.1
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 14:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=6CDOTBUTNPJtd2bQoo0fw1apWQx07SEfFiyC5tCLWgE=;
 b=Z2dBxINqVKuKFlKyw6t/p2d34+56QD8sf01JT5v78MLYUAo8L8/XCIrafBgxgdaoZR
 YZueQJm8IKYO13rr9EvrXTOAz4Rwp9n0Z7U/2Dksuzj0KOeO3tm9XHH84heZ5jy9cyqh
 olGfXzI4UsFfb355TQvBRd9dsG8k/6Vmt8Dq7zTycNLyKk1tIZygMiwswW3x8TUiXq7/
 uqtONlMe2ciwKJ4ZrUNwFrbwPJtCduFG8X3k9usFlLHTtN7+FIUEKUM2oHbYIQTmw0Ia
 4oIvir50lE6LG916DBse1TQ7VTs6NKIgSuzIK/knXs5g8DWJoXH3ZgFhExDf8bj4Vxjk
 tBEA==
X-Gm-Message-State: ACgBeo2t8bd72MKK7QGIRR5zj7qA8J2IUNaFghlHl90xUKF82I+0+G69
 dsFJDhv7TyoOMp7lZa+z3HtWy9XIu+4=
X-Google-Smtp-Source: AA6agR4ULqvqzXzDPV7kkoEKB21W/zXBKa94iK5f4FXfAO0m7ldMT7i12NzWCp73csgkb+b6KNvUsA==
X-Received: by 2002:a05:600c:3d93:b0:3a5:eb9b:b495 with SMTP id
 bi19-20020a05600c3d9300b003a5eb9bb495mr2226823wmb.91.1660511952701; 
 Sun, 14 Aug 2022 14:19:12 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a05600c348a00b003a531c7aa66sm7442263wmq.1.2022.08.14.14.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 14:19:12 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 23:19:11 +0200
Message-Id: <20220814211911.3231098-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=6CDOTBUTNPJtd2bQoo0fw1apWQx07SEfFiyC5tCLWgE=;
 b=gkVRAeutMosWHrg8AlTALzTfqNZJ8AsDvMgVOw09HemUd+c2vjOh9aJVX099j9DJwC
 5CrWFGP5zapfM3Q22emMcOswcTWzTw1X3f/r5LixiB+WuizAaj3bFwzfhqRct0U/kF0U
 62toal6FeaFjc7J+uZ90KhCOs/NlGqZ8XJdC9x3pPpGO0m2qhHvASTx+5ib0UHPYV/ub
 REB4+KiUy4ZxgH0yjxCtz7JPFax1Hz3vrgooBc/5nOJ5dnp8OYk9wGphKZasVdhFKqBl
 CHT8999pnHuFrI5OT5oSQB7IooxDUQkiKkJB7E1hf3MmtzAuS7ntv6NRiZIwmSjoF0/L
 ckIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gkVRAeut
Subject: [Buildroot] [PATCH] scripts/autobuild-run: also fetch tags when
 updating buildroot sources
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The post recent tag is used by git-describe, and ends up in the header
of the .Config file, so having up-to-date local tags helps in reviewing
.config files when trying to reproduce autobuild failures.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 337644f..4987c61 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -328,7 +328,7 @@ class Builder:
 
         # Update the Buildroot sources.
         abssrcdir = os.path.abspath(self.srcdir)
-        ret = subprocess.call(["git", "fetch", self.repo, branch], cwd=abssrcdir, stdout=self.log, stderr=self.log)
+        ret = subprocess.call(["git", "fetch", "-t", self.repo, branch], cwd=abssrcdir, stdout=self.log, stderr=self.log)
         if ret != 0:
             log_write(self.log, "ERROR: could not fetch Buildroot sources")
             return -1
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
