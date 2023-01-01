Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B63C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4D9281438;
	Sun,  1 Jan 2023 23:42:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4D9281438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uq3TOdSWn7I6; Sun,  1 Jan 2023 23:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38B0681378;
	Sun,  1 Jan 2023 23:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38B0681378
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6FE51BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2B6B60E6D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2B6B60E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEKNS-WsxExx for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193DD60D51
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 193DD60D51
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:39 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id r205so23815939oib.9
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UDYxc5iqh/34+cTaMaMNUeH8wOSB41x3609DlZkwMNk=;
 b=J2OFDNX3yByiioomXTEZdmGzB1XU6jBDhw4+d+KWy9W/sNugmhkvcktrZ8LMzDkpIE
 L9xate2krotlHRhZ770eR93ZipshSPsSjgt5o8m9W8AxdONNODI17PScpHHdtJWmAKxE
 Jaeyd9etFCoHlfNxfMHZwb+pdIj02nT2ilxmfGbRqV7OIKuad+QJTymN/aztTjLLyqkm
 QJoDvDQEA6f7hEub4ZeSGWtjWXjG8JY1Qc6pHMezhjmUZum1l7uQeljt8v6paLuLGv9+
 5n1UumQFjn9S2dk20zzaR3CXMMhazcueNoH3/ZYwTJBjT+YxBVX7qfbtX+N0dXtpY/VT
 3i8w==
X-Gm-Message-State: AFqh2kpNzSHhoh2cUR6zJzO8przH7yiHd4QrlvTI2JsMU0Po3R4uh5EC
 iKoRMuXiDOEgPl27tshTCAH5ReBWAM8=
X-Google-Smtp-Source: AMrXdXvbdjjYaMdInE+FobnEjG4JUvGi1/qAhWw/8gsZ5g0rWBoV561EmvzYKgxu4Mk7OjracTs8ZQ==
X-Received: by 2002:a05:6808:996:b0:361:11fd:a77 with SMTP id
 a22-20020a056808099600b0036111fd0a77mr17622848oic.11.1672616378799; 
 Sun, 01 Jan 2023 15:39:38 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:37 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:38 -0300
Message-Id: <20230101233653.487175-15-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UDYxc5iqh/34+cTaMaMNUeH8wOSB41x3609DlZkwMNk=;
 b=Akvas4ijg3GEhqlh+c5Wwqu2QjZLBOY4FyYvvqz5n7w9ig4c8HaWwqFQ9Tu/+vQMAV
 JORIYfs+ttf2WKSUjia75w8hb1O2gsy8LvNwP/s48aahWl2KBVKeBZ0r0wXCgU4yyWm2
 besIRsGhe8GExgta4OrRgHwpwLgWykY51R8G50aebd8sPTqGkaREsYuIjp0dafVVvDAQ
 cRmLiu6EpALS5wxUQHpxkDuTG8kQuX5hQkMN94dJuweDrziAYdQH/sfpjlN9lIee36PJ
 G/bn/ceJUoTa10XqX+pAs7SyT0L2uht0i8W4ZcFZRCQCCSuUVTBOsy9IBEJvLMF+5rsW
 ALpw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Akvas4ij
Subject: [Buildroot] [PATCH 14/29] package/exfat: drop dangling EXFAT_CFLAGS
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

Commit "98538bb0a2 exfat: bump to version 1.2.1" changed the package
infra from generic to autotools, but dropped all usages of EXFAT_CFLAGS.
This config is ignored by autotools package infra.

So drop the dangling symbol.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Before this patch, 'std=c99' cannot be seen in the output of:
make V=1 exfat
---
 package/exfat/exfat.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index 282a30aa5e..c0ef77a113 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -11,7 +11,6 @@ EXFAT_DEPENDENCIES = libfuse host-pkgconf
 EXFAT_LICENSE = GPL-2.0+
 EXFAT_LICENSE_FILES = COPYING
 EXFAT_CPE_ID_VENDOR = exfat_project
-EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
 EXFAT_CONF_OPTS += --exec-prefix=/
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
