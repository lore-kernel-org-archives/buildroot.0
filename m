Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C66C2BBCA
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 08:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C23E80B5F;
	Fri, 28 Jun 2024 08:54:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPIabI_Nopes; Fri, 28 Jun 2024 08:54:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A821980B68
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A821980B68;
	Fri, 28 Jun 2024 08:54:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5B241BF3AD
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 08:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FB1B4151C
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 08:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68mO5VTSB_M1 for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 08:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E687C414D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E687C414D1
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E687C414D1
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 08:54:07 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-71871d5e087so219062a12.1
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 01:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719564846; x=1720169646;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kpzEPeRgb+aS8kuvcjEy+hfB+cXNhenxDkyd9nmHQlc=;
 b=IOeRiEgV0jzZs4vKbxV9R66N4mDkuq9mpo7RBWdqUziVe8aEpOy2EC2cUJ4f6pgOBk
 luP6Jadvk43R5ltFBWFiQXgrPKXUr3WLnx4nIkqvxWMwCYLquS64C4vwgui36FnEQ0iZ
 cU+/7HfdTou+j+yuipIcTdxvRbAskhRMlGScLTaIZsE1PO1CvRk2Sczc8OScif2NS6Wi
 5vdHFNPH1RjmzZx/oWwIzKqFiOGSpbeCoNZCr3nTgZzbE8GNFhkBG7LRFHs62NsWp6pk
 UpYqps1lQvzXOLcSvdkzlGfGSLERDUX95zHJjJ9kV4H7fQeNeIKSh3KgTHkpFrP5/fFI
 iHUg==
X-Gm-Message-State: AOJu0YyV+aHTTr79ajijWiiQq4QlZNjqRYcMSI/dY9PyrmhlITuslxrL
 gZ4UVdc0lgKDdciNtTw/rkv2j0x6ItYpGLKwLHk/QkLRu9Xw7VsXzYkLRPVP
X-Google-Smtp-Source: AGHT+IGCEaV5RTyQEwTbjLXzJQDJhedW2FpZfCyamt2GoLexiN11Lfe87V/BqTcFV9x81VRTE/M5Pw==
X-Received: by 2002:a05:6a20:748a:b0:1be:e993:4105 with SMTP id
 adf61e73a8af0-1bee9934228mr277807637.50.1719564846328; 
 Fri, 28 Jun 2024 01:54:06 -0700 (PDT)
Received: from eldorado.. (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10d1559sm10268435ad.45.2024.06.28.01.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 01:54:05 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 01:53:59 -0700
Message-Id: <20240628085359.1660363-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719564846; x=1720169646; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kpzEPeRgb+aS8kuvcjEy+hfB+cXNhenxDkyd9nmHQlc=;
 b=NhFw7S9XiQvWoIRTCIdT2zUqVlSgYonNUhYlKQi+rX8Df607WxzDY4CUNYBNkdGpHN
 F2Bi3Gg5GFw4J1nC9EUBJ8LEwF2iETBW/W8mtTZ8AgxGg7p0QWy/1yWLI2lDCQ+p1GYU
 f5Rx5VfuvDQY3L/qjIspWxQW4OscNr0GMIJ7Y3+JicJEFfui2G6Xim8bJWUF6BmjpWWc
 j/45mjK0LfRzIYKpFXUTGhYTRTJaUHmbmnfmZ6FuSqBixBmtsWZmoiyKloWx99orj2CC
 28AeskmAPdftdMHgEj9Kv8uuPUralDmH3+5c1mAf2SkRmy7Me/yHR784x8cN6YVGxePQ
 I+Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NhFw7S9X
Subject: [Buildroot] [PATCH] package/cpulimit: Refresh patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Florian Fainelli <f.fainelli@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make sure that
/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch applies
cleanly without any fuzz by refreshing it.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 ...Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch b/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
index fa32e3ede22f..c0a457cdfd28 100644
--- a/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
+++ b/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
@@ -35,8 +35,8 @@ index 06d73a6f3541..d4f6fab3385c 100644
  #include <signal.h>
 +#include <libgen.h>
  
- #include <assert.h>
- 
+ #if defined(__APPLE__) || defined(__FREEBSD__)
+ #include <libgen.h>
 -- 
 2.25.1
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
