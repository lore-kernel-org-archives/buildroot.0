Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33934C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 19:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4E266100D;
	Wed,  3 Jul 2024 19:25:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFn-l6x6c2B5; Wed,  3 Jul 2024 19:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE00F61010
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE00F61010;
	Wed,  3 Jul 2024 19:25:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D371A1BF2E3
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 19:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF0F54057C
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 19:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwGMxZM9zLsM for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 19:25:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0911940544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0911940544
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0911940544
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 19:24:59 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-58b447c51bfso3406404a12.2
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 12:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720034698; x=1720639498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pgjZd6GBS99+f4USksqIy4QB0lSULBUPQ238hkhp7uM=;
 b=WXKR3H2XV712gdlaf4eh6pIaSZKEUSlxyNqYRqysqrD1OHfRRAYj2DWkuC0KPFBpiW
 V89zQ4MMTX/FFdxLBX/IrlioYR+oqgbuaia9rF2siWLUduObpm6oxXWVjB0LAGznPfSD
 mSzzkyYhN8gxAeoImk7PtW/RuE4VOxgIhlGUL/s3JQhfpOajrFF6EdpbJAct7/OZ+z0d
 VQu55/NZF5hOwoLzIcLMnyvUeWOiZqZ0aPI/BmIW9K30x4dDaHdZ+5/Ly++DxrdPtzcb
 HNenthg75g/yDbmVvCk0Z4e1P39oqZF1YaSiZxCFaqnotyUgoKwqd7yoCJuPVPaVxgrg
 cnIQ==
X-Gm-Message-State: AOJu0YyRBlvj0cw9zeH8TScyQmDQ0TKmXDbqKS8UnXrwy02OrpJdp3mu
 IZXLPq2YPSrbzBcoyMr4DOj3NBVLSkWOsh9dKy64soNM84UTeyh/jQhBu6qk6Lv3JS3E/HyRXdM
 4Vjc=
X-Google-Smtp-Source: AGHT+IHThOaLL/loTEW4DHFBJrMKTulhgBNQUsZm3kNwxf9FMq/zQ4d9Ztggi0etx8kHezEFWdHBWQ==
X-Received: by 2002:a05:6402:31f1:b0:58d:e2b4:f0db with SMTP id
 4fb4d7f45d1cf-58de2b4f3eamr282054a12.41.1720034697880; 
 Wed, 03 Jul 2024 12:24:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58612c835dfsm7428537a12.20.2024.07.03.12.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 12:24:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 21:24:52 +0200
Message-ID: <20240703192452.2804130-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720034698; x=1720639498;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pgjZd6GBS99+f4USksqIy4QB0lSULBUPQ238hkhp7uM=;
 b=LX33qjE7zHPnau82BAtVhtEmOPlAXKbwjvVnFGqEO/pICqVJEatziMP7yWEbQ3FMnD
 6QD2AEhBP2yDMl8tRPZYPjfZahdZem60EhybSc2FJagegnpOD131268PJ4Zu3DCqaaN+
 3sJjuLiI3F+w80nqM8LJAvx2dgI/YlKuzZgPQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=LX33qjE7
Subject: [Buildroot] [PATCH 1/1] package/memstat: update the patches to be
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, memstat fails to build with output:

    Applying 0001-PATH_MAX.patch using patch:
    patching file memstat.c
    Hunk #1 FAILED at 19.
    1 out of 1 hunk FAILED -- saving rejects to file memstat.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/memstat/0001-PATH_MAX.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/memstat/0001-PATH_MAX.patch b/package/memstat/0001-PATH_MAX.patch
index 0c3617a61b52..14ca6a0078e2 100644
--- a/package/memstat/0001-PATH_MAX.patch
+++ b/package/memstat/0001-PATH_MAX.patch
@@ -1,6 +1,8 @@
 Add missing #include for PATH_MAX
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 --- memstat-0.8.org/memstat.c	2009-06-08 14:38:05.000000000 +0200
 +++ memstat-0.8/memstat.c	2014-09-12 03:55:43.096035374 +0200
@@ -11,4 +13,4 @@ Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
 +#include <limits.h>
  
  /* blacklist devices that just map physical memory */
- char *blacklist[] = { "/dev/mem",
+ char *blacklist[] = {
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
