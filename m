Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6484DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 17:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0592C80DD5;
	Sun, 21 Nov 2021 17:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OaAsmGEuW9wu; Sun, 21 Nov 2021 17:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B0CE80F2C;
	Sun, 21 Nov 2021 17:09:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87D0D1BF3E1
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7779C60705
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 17:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SNXyQrgo6DiP for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 17:09:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3E53605E8
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 17:09:23 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id l24so31891768uak.2
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 09:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OohDic9mF/U2xGhWoHC207ZmAq2r/y37UPm4roRkqgE=;
 b=XMzBtiX5RXi5AUihnYk1clDHXzrvwvP/9KNpjmhZ5wmZq1pX7JSeQFLusgnz50ypJO
 IGbGTNOnsJMaNEtqiJGahk+LI/asLaqJXCsAuDeniPYAJ1f8p8FOckIUv6tOpApefCtD
 0eP4I4+BAXgaMxcrazfk51OeYGy9cN++vmOZHnqY8EdAO+NdEkEmkeJTOCRLBQuMqL6Q
 CBKkYUYmdi5yvqSLoRoqoc4CCGnQGwrQsQ9ETR6ZgfJ4+qb4/8bM1VKvDVp8f+DwsIVF
 gY06SsySVVDLm7S5ivdlsS0zcCIf4zaTXd9SgK5air/qWxdLarjwTiWE3W0zwLJ/xkKx
 lGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OohDic9mF/U2xGhWoHC207ZmAq2r/y37UPm4roRkqgE=;
 b=bWBp+Ijs/WOLFH3ouSlvS0+tf614dbsppDz6uV/GLSGAGGnaM+95N7TmKDqcx5OgQT
 uI+Unz0hgpXC2NbIeA7JCFKTPexNcg16POivBJtuh50Dcj2dACoYJ1WtdsyQzh5MpXbj
 cmwTEQB3vhrkckErsUvY+csRnhAjOm3VvzvwmgKlH5LsQCVNPrD3B7NQAB/xo4z2t9YL
 Yq7IGMKvY5EEYr3YP+rlPqXWnWYFkc7xFH5L/+yZCM5U6PBeu2K4nU4IC/Jt2sDAelvw
 ABjOkDFJD1ItzOwbxVO0UTNJ47JxJV4c0Cvk0mwkmOEVzUfK9cJroXfjKalWIsfuIwtW
 q2qQ==
X-Gm-Message-State: AOAM531yH9293euxL0rPAIsYFk/hfB5WI2Z130aOA5mKr0z2r/1jvzm0
 wH+pysm/AluFJ5Dukji4DHJItotfZ88=
X-Google-Smtp-Source: ABdhPJxTfav5DUM/w7z3PUZ1c/c0NLF/EevUEZ1fIXAQ07WUHTzbm5D03qY1MVJWJM7oCpOVsGriIQ==
X-Received: by 2002:a67:c11a:: with SMTP id d26mr121060935vsj.29.1637514562780; 
 Sun, 21 Nov 2021 09:09:22 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id q9sm3159121vkn.44.2021.11.21.09.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 09:09:22 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 14:07:51 -0300
Message-Id: <20211121170756.3810922-2-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
References: <20211121170756.3810922-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH-next v2 2/7] boot/at91dataflashboot: rename
 patches with the proper naming convention
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

As reported by check-package (by calling it directly):
use name <number>-<description>.patch

Output of:
make at91dataflashboot-dirclean at91dataflashboot-patch | grep 'Patching\|Applying'

Before:
>>> at91dataflashboot 1.05 Patching
Applying at91dataflashboot-1.05-do-not-install.patch using patch:
Applying at91dataflashboot-1.05-eabi-fixes.patch using patch:

After:
>>> at91dataflashboot 1.05 Patching
Applying 0001-do-not-install.patch using patch:
Applying 0002-eabi-fixes.patch using patch:

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
v2: new patch in the series
---
 ...shboot-1.05-do-not-install.patch => 0001-do-not-install.patch} | 0
 ...1dataflashboot-1.05-eabi-fixes.patch => 0002-eabi-fixes.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename boot/at91dataflashboot/{at91dataflashboot-1.05-do-not-install.patch => 0001-do-not-install.patch} (100%)
 rename boot/at91dataflashboot/{at91dataflashboot-1.05-eabi-fixes.patch => 0002-eabi-fixes.patch} (100%)

diff --git a/boot/at91dataflashboot/at91dataflashboot-1.05-do-not-install.patch b/boot/at91dataflashboot/0001-do-not-install.patch
similarity index 100%
rename from boot/at91dataflashboot/at91dataflashboot-1.05-do-not-install.patch
rename to boot/at91dataflashboot/0001-do-not-install.patch
diff --git a/boot/at91dataflashboot/at91dataflashboot-1.05-eabi-fixes.patch b/boot/at91dataflashboot/0002-eabi-fixes.patch
similarity index 100%
rename from boot/at91dataflashboot/at91dataflashboot-1.05-eabi-fixes.patch
rename to boot/at91dataflashboot/0002-eabi-fixes.patch
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
