Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60377C3F6B0
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E65F540490;
	Sun, 14 Aug 2022 23:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E65F540490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aXLDCEvpx0e; Sun, 14 Aug 2022 23:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1005D40364;
	Sun, 14 Aug 2022 23:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1005D40364
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B26B1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46063402F5
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46063402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8YLeD4_zids3 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5680400E4
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5680400E4
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:35 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id b124so5829772vsc.9
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ttvcNYrZGVa4WR9ACRi/Ffb1SY4w1xH9MGtiX+GXnBY=;
 b=FC4BlZUwhr5vzsKpTKKylw5CTunHr3MC09SyyofUtLExzESWozQrcfZ9U8a8M1CviQ
 14VOv10X0jZffOrYKi9fwOTM+u1DYaUwDpro0/wd+BQ3SzwQ8/I+bzLd+xOtIMFcsn/i
 yApnj0xAhjDW57k1iSAVk1SaqUCvb65fbfK1rEf701Uv3Gv0SLbowgrOB4klC2plAoNu
 lz4yvYlzKeQR5gDLWpRGdYuAoq2yYL0bz962Kwgwmavicv+lp79CovB3XNKYHpqZAJw3
 qloCvkEB0SYGcYBTHvo9f/LW3VuugkXzqXGeYItZVZggRhB4w3zUmzHKt52X5qINJ6nA
 dLMg==
X-Gm-Message-State: ACgBeo1S1onMqKNEegeL1Lh0WHGky0Td9n7azY/amVyaBBfqmGfbOrko
 ZXEaBqjLvUIdXH4v+Njsvd1yAbi+19I=
X-Google-Smtp-Source: AA6agR6xd03llR6DNexHPbg8pCGurDf7dnQEiU8FfMsUoUtEM9FlruT75niP/UnwQkXggo5gpz9MVA==
X-Received: by 2002:a67:ec82:0:b0:388:fefa:2467 with SMTP id
 h2-20020a67ec82000000b00388fefa2467mr5408060vsp.67.1660520374421; 
 Sun, 14 Aug 2022 16:39:34 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:33 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:19 -0300
Message-Id: <20220814233845.2247022-8-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ttvcNYrZGVa4WR9ACRi/Ffb1SY4w1xH9MGtiX+GXnBY=;
 b=bqz8aN5tqKIMxtFUfLtlr4Xpl82x8v6Y3dRQsZtuBpiozTspjYW9IecjVnNaPE+JGf
 27R+8sYyg0BCwQcdVls1hGZwQj45m2orRK+ioy0IYEpQpKojI7/aknfuyhu3DGzFw8Ef
 1xizqWo1UmD21RzbyMNc5ok6R/7ipQO5zKsZVqLCxPIlY5F7lUy/g9NcGlzvHZ3riNnM
 rxhKb/YaZMCRp2dsDN7nYguGTdRXNvV/VvGWLtiHBtLY8jk3rfbVDoGq4wMBwlwpjqAE
 dsbOTWrsTvmfO7wUvXHA4wCTf01T/8MLHZzsnU7ORayltkcRXkZnV3HjegOQjjeRFwFq
 jL9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bqz8aN5t
Subject: [Buildroot] [PATCH 07/33] Config.in.legacy: add missing select
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

BR2_LINUX_KERNEL_CUSTOM_LOCAL was moved to legacy handling during release
2016.11 but does not select BR2_LEGACY.
Add the select, like done by all other symbols in the file.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 80c443d9fb..03814c0378 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3953,6 +3953,7 @@ config BR2_PACKAGE_ELEMENTARY
 
 config BR2_LINUX_KERNEL_CUSTOM_LOCAL
 	bool "Linux kernel local directory option removed"
+	select BR2_LEGACY
 	help
 	  The option to select a local directory as the source of the
 	  Linux kernel has been removed. It hurts reproducibility of
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
