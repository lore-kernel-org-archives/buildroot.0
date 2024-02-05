Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BE6C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 20:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A7984012F;
	Mon,  5 Feb 2024 20:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A7984012F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkBTuTj6oZDR; Mon,  5 Feb 2024 20:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6722F40A8A;
	Mon,  5 Feb 2024 20:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6722F40A8A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BC2A1BF35A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 20:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45E7482001
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 20:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45E7482001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnxcbm_BJS_p for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 20:47:11 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B65B82000
 for <buildroot@buildroot.net>; Mon,  5 Feb 2024 20:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B65B82000
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so5870737a12.1
 for <buildroot@buildroot.net>; Mon, 05 Feb 2024 12:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707166029; x=1707770829;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nfTcZ72/YXLO++U62qHUnqsg5Ltw1Z+S8l3u11HPiCs=;
 b=ckBGMvp9OG94wsApfSM+L17YUynYfvfSVAMwUoSPBwgAS5g2h+eNdjc6N9Yd4KNmjP
 qdtvdL4H21Xas1jF5AhOVm8D9cc0NjfGbmsJ8EgNhpoef2dwbuSuKN6b/N6JXmKX+Jjw
 b1mbCifqWp1H8ByhzRj08g0Hy6EZCNTHQ1XKB7weruGqj/7wsWpmYahsZo8mtqEw9ayI
 LlJ0yHqeeOv+YiIP5JU+c4VTB8r8WCqOVgOMH0B1cMLRujm3y81LU2MQfIyEW2S7n/wk
 +AiyRcXByy6HRRD1CUF2ZdH/xMUykFojoZXnCI4+E7w7D+H6HW0jcjH/wY4ehkNwgKQV
 zofg==
X-Gm-Message-State: AOJu0YxVuolVDXEPwc98ODEdiDAnFL4DFcDoCL4UnrHBz06lSQ4d0Iui
 amzLVbaszrbks1hVeZVFlHzdZdJgHKVmiemv+IFRZO9eHnOXTG/zRSfmrl3l
X-Google-Smtp-Source: AGHT+IHTMCMORLwKEC3+dovLoj4kMTQeG2u8hVmJqCxgCnXThI8BbgCDDBwxRvg+HaTEcufz2duuCw==
X-Received: by 2002:aa7:cf99:0:b0:560:8010:b680 with SMTP id
 z25-20020aa7cf99000000b005608010b680mr101775edx.36.1707166029262; 
 Mon, 05 Feb 2024 12:47:09 -0800 (PST)
Received: from einstein.dilieto.eu (smtp.dilieto.eu. [188.68.43.228])
 by smtp.gmail.com with ESMTPSA id
 bx19-20020a0564020b5300b0055fbfe6c488sm271640edb.4.2024.02.05.12.47.08
 for <buildroot@buildroot.net>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 12:47:08 -0800 (PST)
Date: Mon, 5 Feb 2024 21:47:06 +0100
From: Nicola Di Lieto <nicola.dilieto@gmail.com>
To: buildroot@buildroot.net
Message-ID: <ZcFJSqCW36QdHnDj@einstein.dilieto.eu>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707166029; x=1707770829; darn=buildroot.net;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nfTcZ72/YXLO++U62qHUnqsg5Ltw1Z+S8l3u11HPiCs=;
 b=QkogVSehXafunVPDs3GngfZ0wnkEQQ8UaY1hpyYa+IiI/SXciu5ejWGLLEsJZD4JKU
 d6PrnAyfWVr/dNtesJIQb2ohXuI5DTpxGjGyPVsTEHC1DvaSO1uMvprMI1QjitNFDDie
 GF8aWSbn5FMIx+KQZeZsXkeagjEX941lDWXbBlhxt9bmBMgHVcyP+wbbxmI+WBkalTOy
 Pfr6qVuBvrgRRSm1Qw9qPJyf1DtGprtMMIWJFsN2gKOae086uOQOUGQFzQ2LeylszRl9
 lkLlfo2RAeV17NecpmT5e7JFXOfleYxT9Ube9PnuszpWd/FCVpJLaX8bBr8JPl1NVbLa
 f5jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QkogVSeh
Subject: [Buildroot] [PATCH] package/uacme: bump version to 1.7.5
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

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
---
 package/uacme/uacme.hash | 2 +-
 package/uacme/uacme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uacme/uacme.hash b/package/uacme/uacme.hash
index 063b0b57ac..9a274bf394 100644
--- a/package/uacme/uacme.hash
+++ b/package/uacme/uacme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  a638fe0878dba8fdda62f89e7a284243edbcd31b92c11b5cfdc7d3efd9547bca  uacme-1.7.4.tar.gz
+sha256  596b2fba75fedc7a410dd71583c828642ecd486dfdcfde109dfebb82a374abbe  uacme-1.7.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index b260bd85ee..f02e522761 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UACME_VERSION = 1.7.4
+UACME_VERSION = 1.7.5
 # Released versions are on branch upstream/latest, tagged as
 # upstream/X.Y.Z Do not use vX.Y.Z tags from master, as they do not
 # include .tarball-version
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
