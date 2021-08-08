Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC38C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:27:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 966F260041
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 21:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 966F260041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 532696076D;
	Sun,  8 Aug 2021 21:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tkl-iHswry7W; Sun,  8 Aug 2021 21:27:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CA66606D5;
	Sun,  8 Aug 2021 21:27:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9951BF42E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EEE882C2E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 21:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kln1ixSl7rmX for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 21:26:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5824582BBC
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 21:26:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id z4so18731794wrv.11
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 14:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tyqhdFrIz2DLtfgGtqLfRBO+UaQcoIAKCgNj3RerUN0=;
 b=va2K1HEfVYjnr+1u+f38cxcrEX/5rVb5fuxm/9soeOuQxZKLvKXP0qZeHaLR0WVQIi
 +tsl6xaznRY+dvq4RCrSAkidsy1GC/IjwROTLZTxJLVGRJyHLoKWRWdK5kepzzwAAlWQ
 KzfIGFIXlDgjHUJGJhWBv0EKY+MtZnSdAhSliLx1bcaxoTJvtd5716YF3jt4mxBcTV2U
 t9XFKWcnFfhtDoT9VUmucfl2xFbOXCTRjE3hTGgUU91fhVUNyW41eYR1v224IyHJd07H
 yfVp/r9JUZHF5KO9p1BS2AUnDdEDJtYlH3P0K2JwpsVR1hUZCvje4Q4eMbys3mf0sG1p
 WlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tyqhdFrIz2DLtfgGtqLfRBO+UaQcoIAKCgNj3RerUN0=;
 b=eNCFY2GXQL2tTtpZJU2y3FVIQKPMNKCOkluBO4xrOvxzkpTxinGw6fl+riLn7rRSwv
 P/E8ffXT4MvQpIBzvSnSUFxZzqG6mWUgY0/FldWFfExPe11lBs7xMf8KL+c5usFklgtA
 WIrh8cZrFgz16WYOxhJpnV00QCHZp8iekmXnZLtHj5bSyFuuOIJ6zOzocymGcoBOa5MS
 wVOAqivVgUvvyOMtsp15AUw6U2nFBUMbuG/Ass9Dw5EXEGCzqen87HXvTeXddYAjWuo4
 NbYyHeNOyAfHMvtDOAPYss7L5TVpg63Wy1SZS66MMx10ofJKwXvTdzi9WDpzksttRppk
 /RVA==
X-Gm-Message-State: AOAM532vyleWhwvNDHUeLjj5RJ0jXcNww9y2mT+wbadaEmGBBIjj8mh7
 8Msec8g8wB3GS7pjXY2xIKUkTnnvzxQKsA==
X-Google-Smtp-Source: ABdhPJyX1PmLg962eXkX32kJfqSd9zbA7hq4pc7qu8CvdysE/qAE8oOGRaaAFOag2CY3gZT0nhbuiw==
X-Received: by 2002:adf:e3d2:: with SMTP id k18mr21403230wrm.212.1628458016277; 
 Sun, 08 Aug 2021 14:26:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id j36sm17780537wms.16.2021.08.08.14.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 14:26:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 23:26:16 +0200
Message-Id: <20210808212616.3839828-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rust-bin: fix
 armv7-unknown-linux-gnueabi
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Commit d69d40c029dc7d8199b745eaee759d92b66c5d17 forgot to add hash for
armv7-unknown-linux-gnueabi resulting in the following build failure:

ERROR: No hash found for rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz

Fixes:
 - http://autobuild.buildroot.org/results/443f94bb9ae0addb5130f96fb363ec9651e8af3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rust-bin/rust-bin.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 136ff79764..be502465cc 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -31,6 +31,9 @@ sha256 b1f25af230f3b6fd930452024bd0cc9f4599bfb15f09f802cdb756effa516bbf  rust-st
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
 sha256  86549aca1b65188cedf3f1c8fce5af3d7f817450418367049d4bbe8c69ba1da0  rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  7823b95fc3fcd7cc47ba767e2e917c9efbafed2d5ad0b74e7c087600bd72e54f  rust-std-1.54.0-armv7-unknown-linux-gnueabi.tar.xz
 # From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
 # Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz.asc
 sha256 f9a650a3970dbc321e8979dd87ed02fd8f9d03901c3fb1a87724f3c214eb6e57  rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
