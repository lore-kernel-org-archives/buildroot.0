Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAD6C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 732B8401DD;
	Sun, 27 Nov 2022 13:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 732B8401DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YQyYtic3Kx4; Sun, 27 Nov 2022 13:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A9C734016B;
	Sun, 27 Nov 2022 13:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9C734016B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE9021BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B65F1410BD
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B65F1410BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MO4Gdfqshr5a for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0853B410A6
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0853B410A6
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:43 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id e205so8998711oif.11
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=leQAAFxOHPIunhmv2ax1c1s54cGL8hlQkpatx32r9IM=;
 b=CiXjXkY866LVVKh+ul2Z0zlr6tqWX+/Z42/RoLT27g+wtg43bE8RWAsnhGucqWEgDA
 p2V9Ft0iU4MSuFJAPYII/ns6MO3vKMtaPTUwi9K0v66B87hKRsizznafvesZOY1QwQxv
 ieVp/0te1QQB2QcDDo2EDyAR1DC+txGGnqsMhGBdrz3lQwErlLk5mwPBflP41b9wgeAq
 qqoLlOZbwBpRJNrnZN4w25Iy8IXtU4lS/7D5wHx0ruKhyHPFAn7LJ3TWJMmm0ivZ6xmp
 Zy2M0nHDfNXVh8w3wOBJ9p3ePkSKSpLjpJnNZr6NblgejqwSjGT3sQmKk6+Ljm+F+7b5
 gc2Q==
X-Gm-Message-State: ANoB5pkIiVM8HzPO3Yi9k+JrqFA5T31gTL9ZcGEyDrc1GunHXQIHBEsT
 hv9/mGztVkXKrNY6i42Up5mdqqSMFD0=
X-Google-Smtp-Source: AA0mqf40A/iVbQ+5UF4Sc7U9tUH8P7OTnUgaO5TFJ/AhM3V69w4zRVqJfWEjf/b10GNun1ZIIXaj1A==
X-Received: by 2002:a05:6808:901:b0:354:5bb8:1291 with SMTP id
 w1-20020a056808090100b003545bb81291mr12369773oih.120.1669554523156; 
 Sun, 27 Nov 2022 05:08:43 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:42 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:30 -0300
Message-Id: <20221127130739.1862398-17-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=leQAAFxOHPIunhmv2ax1c1s54cGL8hlQkpatx32r9IM=;
 b=UkU2ckRK70btZXIiK/HfBK1UQ1MXontLhwU9SRuszLYfK1Jo9ZvkdYGIPa2V1T5YFz
 DE2nCC1ktVLKEQ8RWHxiQ1ZCLhjXjiYrQRmd9jCoQiLZBEnUvb71FGkzahof+GCbJnbN
 7Zlp9y8U31pIiDizWhHNrHNYR9eYeX04x3lt6bzQZbfwUAJY7G3+xgMJLM8arWzMKspm
 NtZDclkkBIU5Sa+BFyueao21Hu6lRAyqYHvNidy7ODtM4OLDVP65h1fK34KcJ1hMEqDK
 WQ19TxCVdASC+aji6YJE9IO80SIi1bdVqiNmK4Spx2dyEGvBNtds5WbCvp7d+163hqEW
 itSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UkU2ckRK
Subject: [Buildroot] [next 16/25] package/linux-headers: remove bogus symbol
 BR2_PACKAGE_HOST_LINUX_HEADERS
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

The package host-linux-headers does not exist and there were never
references to this symbol in the tree, do drop it.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/linux-headers/Config.in.host | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8679241a2c..b8318a3a67 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -1,8 +1,5 @@
 comment "Kernel Header Options"
 
-config BR2_PACKAGE_HOST_LINUX_HEADERS
-	bool
-
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
