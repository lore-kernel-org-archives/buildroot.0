Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ABFC4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D42A760C16;
	Sun,  1 Jan 2023 23:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D42A760C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0FhbIsZtdri; Sun,  1 Jan 2023 23:41:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13BE860BFC;
	Sun,  1 Jan 2023 23:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13BE860BFC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B65A31BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90784410BE
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90784410BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJogZp-d1Iyt for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D324410AF
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D324410AF
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:28 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-144bd860fdbso31796157fac.0
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tk5MaAbjPkwJnlMojpWHV6kCFXnj7jvvPORxoyutkIU=;
 b=BZ55u8GZZ4nCP74jcKnEzRWu2zfODFi7vOwQuQmoobZ48kOD5rj/0uqnU6rRtbXPFa
 pOEmJeK+XOpKTYQ17abWWPfv+R+YqJdahH3hYjH/v2FYRtX3KNDsrHH1MbrqPwbZboER
 eQZTm453WIdxsgn1mxRn+WsTg8O+uNaw6Pt0d9TFC80j3EtLA1pfw7VAaKMlu7Z4lbo+
 1+Xy+BumVhua2xzZMWM8V1FjntpbT/P/SHsgR6it1K1DIHLVyR7AJiZT5HF1Os+euT1H
 aJ59eQIPvotH5ZtPhOeKrNzLBfUnl4YlVa7OYayW7vAHDkOUXPAfdpl6pwzNlt0L7nhz
 k0DQ==
X-Gm-Message-State: AFqh2kqSCCH/AZgNWVs0lYa0uEjQGznO0nlQGhmPUlQ1nWnok7pcMvj4
 Gp0cPY1C4UGwzI2XY0qP/fg1DfkPOfM=
X-Google-Smtp-Source: AMrXdXs6wvULHgN0rnMBxVHvHOFONjCl4sUqtRnC/5FC8xgVtw2vv8edWPZo5YBJgE7x2TM9sSQ3og==
X-Received: by 2002:a05:6870:610f:b0:14f:b4be:2f70 with SMTP id
 s15-20020a056870610f00b0014fb4be2f70mr19193127oae.9.1672616367606; 
 Sun, 01 Jan 2023 15:39:27 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:26 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:34 -0300
Message-Id: <20230101233653.487175-11-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tk5MaAbjPkwJnlMojpWHV6kCFXnj7jvvPORxoyutkIU=;
 b=G2wDSoBSBZ6mlp6icjXJekydpmXW5Q0FRiorJsWS2OCqwW46hCQ0CnZP33GTWwhg1I
 bdtW/HgQ8WefQYOtd8zCotSL5koMAvm1XyTWZ8K7VRHJToNQKO639Jh4b66tmS2YpGn1
 uWu+fbfEUUFjqKjcPR4Zjcoret8b+7x+/53U0K4gBWJTmioGAwcJhsK84tbZSgbeGttb
 yHO2b3Va1EOUxdcj/6u43mxbqkLR09wSMgBZTpmhGsqo91RS5MgFuRarp7Aktb/97SYb
 2zpWZh9LDvrlBfId3R1btyjZFg4OIg8Zic/i43p9P0r4OkY48vNoc59d8v7x5CkuUdwX
 HVVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G2wDSoBS
Subject: [Buildroot] [PATCH 10/29] Revert "pptp-linux: fix build with high
 BR2_JLEVEL settings"
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit ffc4afe084a76e7246bd373c73b706f512a86c2b.

Commit from 2012 "ffc4afe084 pptp-linux: fix build with high BR2_JLEVEL
settings" added <pkg>_MAKE to a generic package, but the generic infra
does not take this symbol into account.

The build issue was fixed in 2013 with commit "a5b8081b89 pptp-linux:
fix parallel build" by adding a patch file.

So drop the bogus PPTP_LINUX_MAKE.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Using this defconfig:
 BR2_x86_i686=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_JLEVEL=3
 BR2_PACKAGE_PPTP_LINUX=y
one can see at the output of:
$ make V=1 pptp-linux

Before this patch:
... /usr/bin/make -j3 ...
After this patch:
... /usr/bin/make -j3 ...
---
 package/pptp-linux/pptp-linux.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 7fd0733977..b6c740e710 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -7,7 +7,6 @@
 PPTP_LINUX_VERSION = 1.10.0
 PPTP_LINUX_SITE = http://downloads.sourceforge.net/project/pptpclient/pptp/pptp-$(PPTP_LINUX_VERSION)
 PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
-PPTP_LINUX_MAKE = $(MAKE1)
 PPTP_LINUX_LICENSE = GPL-2.0+
 PPTP_LINUX_LICENSE_FILES = COPYING
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
