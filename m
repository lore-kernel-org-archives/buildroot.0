Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B24C2BA15
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 07:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12BF8401ED;
	Wed, 19 Jun 2024 07:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBfrCGO_Zv7B; Wed, 19 Jun 2024 07:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C651E401FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C651E401FB;
	Wed, 19 Jun 2024 07:34:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2FF81BF2C2
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 07:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FBAA401ED
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 07:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dzh9bPC6J0Ya for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 07:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06C74401DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C74401DA
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06C74401DA
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 07:34:00 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57d1679ee83so41072a12.2
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 00:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718782438; x=1719387238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3KeRu4eKowUbDFuEGjiRwY5a3xQ+/WEhdNzPSuGv0I8=;
 b=vW2uazteEYqRMHlOUBBO2DlVSxg5tEbNjQSR9S2OXiDAN8zegxRrGJUSYQUGazdT0G
 85dqlQes5lKRwmykYaQF/Bvf9mdP9y9DEsbTP9qSoe1KCFWySpfu8KSa0zyDRnpEAFTg
 vAR1bDfmIZlQKkGbPmaDjkSYafqoc2TZq3HDEfBfNFk8aNtwRHN0YCNT22hD23pGwvmx
 j5MXBU1yDh3bOSWIrrpz5WKT0OlHtmdmYFEGVWS8d5pJm3iVHFo9c1ChsI8tlm1zCBut
 xVY8Vv3jswcXKFwBehjHLnf80t2FlL7+UyoZGBPN1V1LfAq0KPRgdzy2FfhK4SetEZGj
 Wpyg==
X-Gm-Message-State: AOJu0YyAAKjXJvjCqaX8rosMqAWjoa2Z25knWESyyMzzVA+r7LhUXMQX
 efv1F6bS5XzL5ttWBaJoWqTp0ayG3zz/0p0bJK0//PtgaB4yvm+fEdmQTw==
X-Google-Smtp-Source: AGHT+IEvZksyaH54gfZA4myFVLe6pOK0i4meK9p4soSJfMOrTeHpu5EBOZEC/hbnSu2b9OaF20shEg==
X-Received: by 2002:a50:bb44:0:b0:57d:788:aaad with SMTP id
 4fb4d7f45d1cf-57d07e6ba3fmr954763a12.2.1718782437647; 
 Wed, 19 Jun 2024 00:33:57 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb741e6c8sm8245884a12.77.2024.06.19.00.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 00:33:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 19 Jun 2024 09:32:52 +0200
Message-Id: <20240619073252.411472-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1718782438; x=1719387238; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3KeRu4eKowUbDFuEGjiRwY5a3xQ+/WEhdNzPSuGv0I8=;
 b=kMjCOgWEIws4Q/P6f09SgbVA9EWxjaKUbgKJZqbNWEwUvjE3/e/ikEXEZUI2UQHL8n
 +sK4dWXhXtoLmOSNBsLroErGXeFt0hLi78MQCx1JQZ22k7PejjnrDVjSsifHyvO7obEo
 NCHk1L8yNc/Dm0JCA267dyJGNa/5QUkQg4NxkZyLRYUZe/27xVDyA6tr+tBR43O4/Lzi
 lXCwTrZlfclzeLWDY2n530/VYOCGXCAHA3o31dW6ZOquDEuvD2RKWUbNM4MfKOrtCVxb
 FTti135Nx1leBbHEp6nspYtEAXSBy22LttuMIeo6T/qzCh2sKLdiOXH3Wo2iQAYZtfwb
 cixA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kMjCOgWE
Subject: [Buildroot] [PATCH] package/attr: add missing libgen.h header
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Resolves the following error when building against MUSL:

tools/attr.c: In function 'main':
tools/attr.c:69:20: error: implicit declaration of function 'basename'
[-Wimplicit-function-declaration]
   69 |         progname = basename(argv[0]);
      |                    ^~~~~~~~
tools/attr.c:69:18: error: assignment to 'char *' from 'int' makes
pointer from integer without a cast [-Wint-conversion]
   69 |         progname = basename(argv[0]);
      |                  ^

Upstream: https://lists.nongnu.org/archive/html/acl-devel/2024-03/msg00000.html

Fixes: http://autobuild.buildroot.net/results/c61206968eda9913e37e95a61dc3e10399503fcd/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...-missing-libgen.h-include-for-basena.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/attr/0003-tools-attr.c-Add-missing-libgen.h-include-for-basena.patch

diff --git a/package/attr/0003-tools-attr.c-Add-missing-libgen.h-include-for-basena.patch b/package/attr/0003-tools-attr.c-Add-missing-libgen.h-include-for-basena.patch
new file mode 100644
index 0000000000..b4012297e6
--- /dev/null
+++ b/package/attr/0003-tools-attr.c-Add-missing-libgen.h-include-for-basena.patch
@@ -0,0 +1,31 @@
+From fe7fbc2b666f0daad5b7bb0b1e8eb2261cf16530 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 19 Jun 2024 09:21:34 +0200
+Subject: [PATCH] tools/attr.c: Add missing libgen.h include for basename(3)
+
+Fixes compilation issue with musl and modern C99 compilers.
+
+See: https://bugs.gentoo.org/926294
+
+Upstream: https://lists.nongnu.org/archive/html/acl-devel/2024-03/msg00000.html
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ tools/attr.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/attr.c b/tools/attr.c
+index f12e4af..6a3c1e9 100644
+--- a/tools/attr.c
++++ b/tools/attr.c
+@@ -28,6 +28,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <locale.h>
++#include <libgen.h>
+ 
+ #include <attr/attributes.h>
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
