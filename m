Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352F0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 13:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E244640A13;
	Sun, 29 May 2022 13:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lru0XwlvGdnS; Sun, 29 May 2022 13:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 029FB40A0D;
	Sun, 29 May 2022 13:20:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 716B01BF4D8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6025141BC1
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VopvS_fAqMcI for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 13:18:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C53941BBE
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 7so3880592wmz.3
 for <buildroot@buildroot.org>; Sun, 29 May 2022 06:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gbkd5wAg3w1bK22OsS0CB43eE1yGilswdDZ0WdX+KEQ=;
 b=kPDod+8SWByxZkvDCBlNVNnWDdm2KFJPW8OLLbR9Ql5kqklErOryiQkZ8LF2kiKs0m
 SMkz2I9jlV2/ms0X30rLR4mIGR1rc/2U4g//SDHalsk0Vkm6gKrXBuOALitsdCyBdaVW
 CC45LAothZyWsCn50fNDQsN4O7c42K+uMtkFu2jNVaFYkHB8/3Rx+y341f9pnB9f3spe
 NJt0uCXrrbZopDgTVI9n7/4OMqlwTvzYGDDp3z3OyEYO9Wya383dxhPSyzZt6pfVaSSB
 zV09pDhpuafe7zyMcoQr8FxKD+rqZTkQTktkwcHzPii4SHHjW5abjVVe8/gtZff+6cwE
 U88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gbkd5wAg3w1bK22OsS0CB43eE1yGilswdDZ0WdX+KEQ=;
 b=T5uTzKs2XzssdT2K3vgdqG1Z5r2QH+WRZEephWyS0Tl+B7dSYg5z8tDBVNWnfqYB0o
 Z60Ul5xAbwHbHyVJFl/dx1xOd2iwC9Xl7cV/XACgqstieQWeVegRxIGmAFp6lXZ7v/u1
 KUdbnXhI4tRg8nW4O/h7r00l/hjllj+3S5rvLet4knOPk3MT3nuNnZ62V6fEhzogYCEY
 ECt8hDJsdqlPQHba6M2qphXfVSsSn9c6RzsEUmMx1ABIPL55vwtPmun8xw7RKdUhtkiD
 7t064E4xorIYaKLQLrHXSdDK/MMSCeCJWzoJyOoBNb7Jd2uSGa7YJfdvm89jHd8pnVCV
 AMKw==
X-Gm-Message-State: AOAM532zb9MVOWPj/Pb4yhADkBH0c19prGUn/ILYgwY++4FNvmrO2/x7
 C5Iq3Q1L4hm74WbRgy8FXc1HIxhoEQQ=
X-Google-Smtp-Source: ABdhPJzCVDMC+P82jjB/0LK466FGYWpjqc9ssavHQGZxV9jx6oN3b9koKe57Bkdpeq6uofGauY2Y/Q==
X-Received: by 2002:a7b:cd8b:0:b0:397:435f:91c8 with SMTP id
 y11-20020a7bcd8b000000b00397435f91c8mr15166353wmj.83.1653830313653; 
 Sun, 29 May 2022 06:18:33 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b003949dbc3790sm7492562wmq.18.2022.05.29.06.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 06:18:32 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 15:18:10 +0200
Message-Id: <20220529131811.481017-10-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220529131811.481017-1-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next 10/11] package/gcc: switch to gcc 11.x
 as the default
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even if gcc 10.x is still maintained for some time, switch to gcc 11.x
since it has been released since 2021-04-27 and gcc 12.x is available
since "2022-05-10".

We have been having toolchains in the autobuilders with gcc 11.x since
mid-June 2021, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index afaa4d2191..10061dbc9d 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
-	default BR2_GCC_VERSION_10_X
+	default BR2_GCC_VERSION_11_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
