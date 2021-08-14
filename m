Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC573C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 20:43:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CEA60EB5
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 20:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61CEA60EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ACDE40340;
	Sat, 14 Aug 2021 20:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id am-zo24vwJV5; Sat, 14 Aug 2021 20:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82DB440346;
	Sat, 14 Aug 2021 20:43:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B22131BF311
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 20:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94C3C40346
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 20:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6QfuTaycTXm for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 20:43:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71F9640340
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 20:43:41 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q10so18053224wro.2
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 13:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwOt+NOSgXzahIPRE6pEJpiC5hD938z8agjSidAwKuk=;
 b=mhvJSyLMCS3A3EUXk9dbyKd14fF4bZlok1j7bO5aKzw4m/X1Eb8YZJkhZoLR5ysGEb
 HusVJKyhLmtIReKUWH2V3AVar58mvasDrAbMx8N6l1UDc6YtZ9+k6Wotlf1DCyWUncmh
 W/PFLSaJqCLY3s1+2/leDPhsVKdC0Zt5fPv8VPOcm1BAhDWieQ8ydTSqhIdyZnpRYsjR
 bOBzm9jZVO8lagzKqwb/ZLJ46GkJw7LehQaY9J75p/lwRTcwVXdFGn2rP48z8DBKQMad
 0w97uCjylb2cGJ2ZJAb1ZRtV6xC7R4xOUMbnmIIs0SzUj2TPODFhWaQwi11DTTs+iPNA
 bzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwOt+NOSgXzahIPRE6pEJpiC5hD938z8agjSidAwKuk=;
 b=qYlYWSQdjBd2sJM1D+1Zek0ikP3HyX/qf/cr2ha3D4udlmnngh1vOgKosJyKnJZt5r
 w7cZYxTzbHrj4xvj07/3dPoe0UzHnOhlPqW6ogxYtqDqJL+KaPsBd1ht7Q+JGmnXoKT/
 Qd8C/p5WT2cJTeOE1mcBxwYsiH+twINHQ+8p0hlX7LZJ6pCKtx21+N4WY93sMG+8H517
 rhROhq0N0HVrMKokQR5LGfeaOhIZNyaO5iCDJyGczw1jKiGDMkSG6Ok808HWxPfMq5JW
 g5or1Ds4XLBUb6z82TcpjV4a5jfE6H6fauSkABqJIQuG4Jle+gzZuAGcY+FAnxnXRvkO
 HODw==
X-Gm-Message-State: AOAM533ugsKGHvqhZXpWx/hHGYlZTofnhvamej74mhtXCsEiDa/ayHSU
 tcJP79c17j3pqPY06C6O6hQVGUOkapXhAg==
X-Google-Smtp-Source: ABdhPJwA3DH7DiC2j4qVwWP7h2vnzGgICJLpMIUzyTUhrrOQxYUyTJX9gxZKfslIDhbkckCFHhJPmQ==
X-Received: by 2002:a05:6000:1086:: with SMTP id
 y6mr9947977wrw.406.1628973819480; 
 Sat, 14 Aug 2021 13:43:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id i21sm5911981wrb.62.2021.08.14.13.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 13:43:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 22:43:34 +0200
Message-Id: <20210814204334.352335-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gd: fix CVE-2021-38115
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

read_header_tga in gd_tga.c in the GD Graphics Library (aka LibGD)
through 2.3.2 allows remote attackers to cause a denial of service
(out-of-bounds read) via a crafted TGA file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-of-bands-in-reading-tga-header-file.patch | 29 +++++++++++++++++++
 package/gd/gd.mk                              |  3 ++
 2 files changed, 32 insertions(+)
 create mode 100644 package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch

diff --git a/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch b/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
new file mode 100644
index 0000000000..a42bfb402e
--- /dev/null
+++ b/package/gd/0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
@@ -0,0 +1,29 @@
+From 8b111b2b4a4842179be66db68d84dda91a246032 Mon Sep 17 00:00:00 2001
+From: maryam ebrahimzadeh <maryam.ebr@student.sharif.edu>
+Date: Mon, 19 Jul 2021 10:07:13 +0430
+Subject: [PATCH] fix read out-of-bands in reading tga header file
+
+[Retrieved from:
+https://github.com/libgd/libgd/commit/8b111b2b4a4842179be66db68d84dda91a246032]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/gd_tga.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/gd_tga.c b/src/gd_tga.c
+index cae9428da..286febb28 100644
+--- a/src/gd_tga.c
++++ b/src/gd_tga.c
+@@ -191,7 +191,11 @@ int read_header_tga(gdIOCtx *ctx, oTga *tga)
+ 			return -1;
+ 		}
+ 
+-		gdGetBuf(tga->ident, tga->identsize, ctx);
++		
++		if (gdGetBuf(tga->ident, tga->identsize, ctx) != tga->identsize) {
++			gd_error("fail to read header ident");
++			return -1;
++		}
+ 	}
+ 
+ 	return 1;
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 2df81e6d37..90f966c294 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -15,6 +15,9 @@ GD_CPE_ID_PRODUCT = libgd
 GD_CONF_OPTS = --without-x --disable-rpath --disable-werror
 GD_DEPENDENCIES = host-pkgconf
 
+# 0001-fix-read-out-of-bands-in-reading-tga-header-file.patch
+GD_IGNORE_CVES += CVE-2021-38115
+
 # gd forgets to link utilities with -pthread even though it uses
 # pthreads, causing linking errors with static linking
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
