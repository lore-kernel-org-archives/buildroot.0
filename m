Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2A8C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06C75410AB;
	Sun, 14 Aug 2022 23:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06C75410AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X91Ig-yCUqZd; Sun, 14 Aug 2022 23:41:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 437D7410A0;
	Sun, 14 Aug 2022 23:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 437D7410A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7ECE1BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B18BC408BA
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B18BC408BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F_wClJgzITqs for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0DEB40298
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0DEB40298
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:39 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id q14so2998594vke.9
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8N2py/tfqN3aOrZTHvZiaVlhA7MHLlYlGe3TwLfSAcg=;
 b=ozuyF6f0UyPNigza4qb37+d+04H6iqicSJoVd0f3AaMgajLwyQF3MIvczIcW3FlDs6
 C6eUFec9JVVNndU6rrh9gdVYr25CWk6w+zNzE2ENCqBZK5X8mzhvlo1j4shsU23hZjoL
 w7Sg948MVa2ho9adb8siPrNiBuqNUNIM7tZMJX7uOc8WDvEuj3xWve/muIydmSYP9njZ
 Q1JrtUIM7fZFOBXGuCpMHxKXBtJFHl9E8a165+pLeUGU5YxdxBwpopWgYTuwRSQG4TXU
 Dwjbj1tmr7g98f7G1DNrN8UeSNIyr802p+KwKnDZiZp3HVw46gXLawSdKzBsAe/RMoEa
 aPng==
X-Gm-Message-State: ACgBeo3kngRBepjahDN4IAecsnKpwrLkBvKIq0EX54hEUigk1VArMMKc
 Tt2FEd4uFtvl/M0eHd4GodPsFuM7c88=
X-Google-Smtp-Source: AA6agR6hee63vCClcsOQj6UM3/3EHulllfF4HG3WH6fmLqb1Z8bg9BfuvIbiD/YPZpT9HZ6xCvLAFQ==
X-Received: by 2002:a1f:b254:0:b0:345:87e4:17fb with SMTP id
 b81-20020a1fb254000000b0034587e417fbmr5514999vkf.25.1660520379487; 
 Sun, 14 Aug 2022 16:39:39 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:38 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:21 -0300
Message-Id: <20220814233845.2247022-10-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8N2py/tfqN3aOrZTHvZiaVlhA7MHLlYlGe3TwLfSAcg=;
 b=EwTlJyf4HE7SFVydVsP8pivi4+G7JuVTvQyutXtYXIL8XaLM2O3VhBqGBCqVZ7xPdz
 /HyporvFn1gFBaVdlRn5BM1flnN2dgFAGEkzu9GPkCsOGZQYBf0lNX8MuZGCS/IUyd+z
 YQ1NrhBUvTJ5ZIQlVOSmiC4Q9BrYOPdSJzfIqeypDiN2y+R3VUITi1hZzm95NuzCkmKw
 VFxrp6ukYkrSCdoliK+0WNu6eo1LNCEOFKsbhP4DhZNeQmPFPdgwBo9josH+hr9IwNr4
 EGTNdX3FmJxsL46rapZ0WZnqtiaWwUBjbnyXm9eQJc5b9K9q2XHEedihRQ/f12FdOQ2F
 zdJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EwTlJyf4
Subject: [Buildroot] [PATCH 09/33] package/libgpg-error: fix typo for
 BR2_aarch64_be
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

The typo was introduced in 2016 by commit
'2f89476ad9 package/libgpg-error: bump to version 1.23'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/libgpg-error/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpg-error/Config.in b/package/libgpg-error/Config.in
index 03157dd9fe..5a2c14ead8 100644
--- a/package/libgpg-error/Config.in
+++ b/package/libgpg-error/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	bool
 	# see src/syscfg/
 	default y if \
-		BR2_aarch64	|| BR2_aarch64_eb	|| \
+		BR2_aarch64	|| BR2_aarch64_be	|| \
 		BR2_arm		|| BR2_armeb		|| \
 		BR2_i386	|| BR2_mips		|| \
 		BR2_mipsel	|| BR2_mips64		|| \
@@ -28,7 +28,7 @@ config BR2_PACKAGE_LIBGPG_ERROR
 config BR2_PACKAGE_LIBGPG_ERROR_SYSCFG
 	string
 	default "aarch64-unknown-linux-gnu" \
-		if BR2_aarch64 || BR2_aarch64_eb
+		if BR2_aarch64 || BR2_aarch64_be
 	default "arm-unknown-linux-gnueabi" \
 		if BR2_arm || BR2_armeb
 	default "i686-pc-linux-gnu" \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
