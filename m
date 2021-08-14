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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28F2C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 20:44:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F60A60F51
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 20:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F60A60F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59523401BB;
	Sat, 14 Aug 2021 20:44:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4MSBHVm9x5Z; Sat, 14 Aug 2021 20:44:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D360401D8;
	Sat, 14 Aug 2021 20:44:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30B2C1BF311
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 20:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DD7680EB5
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 20:44:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9SvvL0UrGkJ2 for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 20:44:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 154CE80EAD
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 20:44:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso12110771wmj.0
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 13:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwOt+NOSgXzahIPRE6pEJpiC5hD938z8agjSidAwKuk=;
 b=p5Ek0BCACM7x7ZBhqY+5w6yfUaQZvfuxYwM5/uBIIUtYw+aouX7NCFNoNmgjK/ySV9
 sROVZH8KBJaKkW0OhlffYT30wE5gqhwZBkftnP2vUXsnDeAWkI/Xj1Uohc6Px8Cjx7Ej
 gzExGTMvprrrCVCV2UuZwcvr7K9kBtS6vv4FJulEGQtebteK+cEw0BGud2jWo2QSJrgt
 nFch4KIJcB62k+aJNnGtJkTDuF25HIgPzjkvTf7FPhGECpF6teDSFXHWliQY30aa+x7m
 e7QHXilfwy2MLCVrU0xZxTLzFDdEfBirnfES1RfXRgzi1e1IzwlEUGuorYinpfvGrStn
 YuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwOt+NOSgXzahIPRE6pEJpiC5hD938z8agjSidAwKuk=;
 b=hSMvAa0UWQkRWtIR/I0OfjluWuUr3oP+7KMIUbhbygiqzCUf0IYYLlnuzTrcOUDS8X
 1BgZzqEy6Yq0JhTtU0pxPziPDwoSOavXqhBxf8Zmld9y0g1yrh7KZMNAuq+0iSV/pVWM
 4RX9ScnD3NoMMnP2YyP56JsPQCK1WdMFkrN6L0bG5utf3g1jHiMjKrNq2794+t3tXwBh
 5lwF/BlIzwujttUdyHPAGVYOnJK/sMh7J9YSFxXW80mfFPDYuOEwcO1phrlSZGECDT9i
 /sX38Ga/xlRiv5RYtzGun0jDIU8Q+CWEy4wrH8KNyZLQ4Xg3B2ZgCQWAk/hj9sBpQpz7
 0HTg==
X-Gm-Message-State: AOAM530bnccu5EABVgwzydarpnfR5z/SMqFdSLDQR+TTtpJugpq0zUHp
 NhItrawVLOXS7+kwnqD0KQGwzgtw0bC1tg==
X-Google-Smtp-Source: ABdhPJwIh+yQJV9vaSRtfNciBVtSr4lzel95fAeJHdPOBygtHLR7XmJYnTe/MSmQnao5GotmKO/Sew==
X-Received: by 2002:a1c:2504:: with SMTP id l4mr8338840wml.55.1628973840070;
 Sat, 14 Aug 2021 13:44:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id o17sm5065587wmp.13.2021.08.14.13.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 13:43:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 22:43:54 +0200
Message-Id: <20210814204354.352402-1-fontaine.fabrice@gmail.com>
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
