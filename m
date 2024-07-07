Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B935C30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 12:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCD5A813F1;
	Sun,  7 Jul 2024 12:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6F2OMgdnyy_N; Sun,  7 Jul 2024 12:41:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF727813F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF727813F2;
	Sun,  7 Jul 2024 12:41:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF9841BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 12:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAA58813F1
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 12:41:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayz4RVU9lF-4 for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 12:41:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD9CE813F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD9CE813F2
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD9CE813F2
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 12:41:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57cbc2a2496so3437427a12.0
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 05:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720356074; x=1720960874;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YftC8RJBb+NK2mb2osFqst5wTv4m7rlh1MHyDnAQP3Y=;
 b=NKkjWP8q9HrWlEsQg3JIl+CWAPoaMEVhDTjN5LZuiRpaXuP1O5z2u6xQwqwKl2T2Dy
 yMwyIHRYCEeOlUPd6eTr2wObHPZ23qM6flPbR2ZyAwOkkCippGXc6ayDzVHlkJcFVANC
 dXToq9SRyVkqP2gyR0/r/oCIMDFjSOgQcY1PcpF0BcMQ0bXxFkNbxgSP2QI+rk5YnKkL
 ggFcPzaXQSfUpXhaWTvGIYrtjpLG0d8hwN8aPb8HhJC6I/PcZuY8aS+Gm5TyKySrB2Kt
 69OjI9rNz/jxN3ZVF5VJwHFHsBJXdpkDxGnADUbYgOnI/TcdXolE3tCsTGb5tEp9UdCS
 8Eug==
X-Gm-Message-State: AOJu0Yx3L9cTrmGYh7l4eVmrtFqWERGwZijwOu3uO/tQmKWGjazmd7bk
 KmL+j/WV3raeZeqQGko2mts/fkZUEl5UaTap2954IZdsdVX7l3g+Er6nDY5A3pmErfSCrkULWgK
 MZQ8=
X-Google-Smtp-Source: AGHT+IFFgltETxiTu2mrF27uIVLhgi4mOXUEB5Gcr/89Nuh16NaosY8SpfdWhh920t9/ljYvhGNH2A==
X-Received: by 2002:a17:907:969e:b0:a5c:eafb:5288 with SMTP id
 a640c23a62f3a-a77ba46f87dmr904617866b.31.1720356074489; 
 Sun, 07 Jul 2024 05:41:14 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77edb0257dsm74716266b.113.2024.07.07.05.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 05:41:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 14:41:10 +0200
Message-ID: <20240707124110.4049936-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720356074; x=1720960874;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YftC8RJBb+NK2mb2osFqst5wTv4m7rlh1MHyDnAQP3Y=;
 b=GggJkI14kMv7o6IN2KbnkuPWKTp1Vin66lVMcqiNMAZbhaMKZHR6oS8vTapyksle+e
 oZQrS08x6Dct7dWmddzCrKWK2nwLB4MUSO09bdHcODI90BUcxwbU+ryMmHiJIWgveq7H
 8lq2RV7/J2fQ7Q337hfYSoy1ufM/+wPqzSzxk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=GggJkI14
Subject: [Buildroot] [PATCH 1/1] package/redis: update the patches to be
 applied with fuzz 0
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, redis fails to build with output:

    Applying 0002-largefile-conditional-define.patch using patch:
    patching file src/fmacros.h
    Hunk #1 FAILED at 42.
    1 out of 1 hunk FAILED -- saving rejects to file src/fmacros.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/redis/0002-largefile-conditional-define.patch | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/redis/0002-largefile-conditional-define.patch b/package/redis/0002-largefile-conditional-define.patch
index 747e0552b379..685a30cc5b72 100644
--- a/package/redis/0002-largefile-conditional-define.patch
+++ b/package/redis/0002-largefile-conditional-define.patch
@@ -12,13 +12,15 @@ Avoids:
   <command-line>:0:0: note: this is the location of the previous definition
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 Index: redis-2.6.11/src/fmacros.h
 ===================================================================
 --- redis-2.6.11.orig/src/fmacros.h	2013-03-25 22:09:15.000000000 +0100
 +++ redis-2.6.11/src/fmacros.h	2013-03-25 22:09:40.000000000 +0100
-@@ -42,7 +42,12 @@
- #define _XOPEN_SOURCE
+@@ -55,8 +55,13 @@
+ #define _POSIX_C_SOURCE 199506L
  #endif
  
 +#ifndef _LARGEFILE_SOURCE
@@ -29,4 +31,5 @@ Index: redis-2.6.11/src/fmacros.h
  #define _FILE_OFFSET_BITS 64
 +#endif
  
- #endif
+ /* deprecate unsafe functions
+  *
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
