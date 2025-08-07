Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D89BC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5095980C32;
	Thu,  7 Aug 2025 18:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqhMykzhR9Dc; Thu,  7 Aug 2025 18:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E258480D25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E258480D25;
	Thu,  7 Aug 2025 18:24:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22AF110A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 084DF40087
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7whnoeY_57k for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:23:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BD7C40057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BD7C40057
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BD7C40057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:23:54 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so7310135e9.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591032; x=1755195832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YWGYhfVrYJLYaSWRBcXh0CHa4u0KdH1utSbt28FZKRg=;
 b=cj4wFXDTVcXqH1pAthSy6+kYtKJepeIEyvpPhAeaUD2Zip/fWoZPC97Mp276kVyGmw
 JaJ+N8LKSJgnNOkUUXDBleEfqn4325IqWKXavmUcipzuPCMj/cI6aRPbsfb8n65wq0lU
 aYPdy06KsQh9Q8anc0k1SNeEwHJ5WGYZ1wrBb7iBOM1Os7cE4Cs+Bk6i/QGJ12yInMKS
 45TFWApmRDfozpP50P2e93vlbzEBZLuTMGdcgnd3E+d3XMxTcG7FqBfNtWm9Sy3czng2
 TTxFy0qKiAqz4VJxbcF26EE5ewc/Ajzy8iYEtww/24KCgozzIHI2Bere/lRhwSTJKLfm
 Dutw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXXr1tGrqVoA4g86Yp7eXA07vGD05CY8OwEX+8W5XKox0AE1zrNrDF33XzPJk2gVjpjCxRpUnGqec=@buildroot.org
X-Gm-Message-State: AOJu0Yw0GvZaOwHxCNBuszXc8WsB7pQY0i9GJEmyqXuM+rGU/WITt8fl
 55h0kuRdkqtY6sU7WcF1rJOSf3wCo9Rdupcg3PthJE3hK9NSW3mI82n/E9WbFg7wvJM=
X-Gm-Gg: ASbGncvdPlvbDbuAXD+HfA4sX0keFvm2ve9X4aL6pwoywXFy84tR6Y+ZgzsYZ+joNWw
 qNNehG0kp8vJAPqQ0w80Dq7ks29fxuYasf9DPXuykyKkjlSusKfpgzQCzPWOsODaX9SKFy2G2iH
 hArhn5KcIQGwogn8s7XOs1MKufzfYr0OLbrxUpw/Rg8B4x2Br69mr/q9av5mljr4R/DS8InUL7n
 CBEXHB8tINXd5NoadIvFIMziZrC0hXFUEI/Gr8SvuwH8nYsCh9zjgr37LKERFaSGGC7fHEzmuPj
 9q2Bz/MspJw3ay/l4lEJ61qHrba2m6JR+q3KcLFGreZIp4DAp5SSZuS/Oz9YOnKBa8ogKhuYisj
 tWqgh//Muyt1jUQ==
X-Google-Smtp-Source: AGHT+IED1S+Vn8DLM3FV+KXKrIKOC7TRK8ZTdOfGRQjhXjtSK4h5MOKeQxmXGxqyELcMTfx8KYIVMw==
X-Received: by 2002:a05:600c:3b98:b0:459:e466:1bec with SMTP id
 5b1f17b1804b1-459f4ea0d17mr255385e9.2.1754591032151; 
 Thu, 07 Aug 2025 11:23:52 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac51asm28235127f8f.1.2025.08.07.11.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:23:51 -0700 (PDT)
To: yegorslists@googlemail.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:23:51 +0200
Message-ID: <20250807182351.723700-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250619082600.2176432-1-yegorslists@googlemail.com>
References: <20250619082600.2176432-1-yegorslists@googlemail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591032; x=1755195832; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YWGYhfVrYJLYaSWRBcXh0CHa4u0KdH1utSbt28FZKRg=;
 b=hnAiUWYwS/UjJAWOLlKzBeto77T1RfEKbP0xN8PsfXSXiWDuvBrxRbeTTAyoGk9dR0
 itfXUMJGgYukyn44gZvqtLse9NoMynbnrF7Fg9UlJh91neqPKrUfRX13UkiBjmaXfDjD
 KOkv4UDJzv+6zviqcLF3EDm5orV97bBtry2lk7vDpl7VKQOnRp8tb1z7+T5IDbxb5f5I
 eXvIegGPljlI79sfCZ/COOFeTvukPfCJYbwqkfgusWJaFX61i2FtfegMSWwxeyHNJ9bM
 U27B/6P/MwsizXNGYBE0plO0A4P2eTyMO30OtWFRnnmGuLt9oqrg+dYtVOrKSEZhrk9j
 Pydg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hnAiUWYw
Subject: Re: [Buildroot] [PATCH] package/watchdog: do not guard shutdown
 __GLIBC__
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> These headers are provided by uclibc/musl/glibc and bionic so we can
> assume they are not needed to be glibc specific includes. This also
> ensures that we get proper declaration of reboot() API.
> 
> Upstream:
> https://sourceforge.net/p/watchdog/code/ci/aa371bf201b1d59c595a1ad7b3464ae544ed142f/
> 
> Fixes:
> https://autobuild.buildroot.org/results/3e67d5b3b89d794e3f6c510803368f8b100b07a7/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...0001-Do-not-guard-shutdown-__GLIBC__.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch
> 
> diff --git a/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch b/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch
> new file mode 100644
> index 0000000000..eceaf11501
> --- /dev/null
> +++ b/package/watchdog/0001-Do-not-guard-shutdown-__GLIBC__.patch
> @@ -0,0 +1,40 @@
> +From aa371bf201b1d59c595a1ad7b3464ae544ed142f Mon Sep 17 00:00:00 2001
> +From: Paul Crawford <psc@sat.dundee.ac.uk>
> +Date: Thu, 16 Mar 2023 11:42:34 +0000
> +Subject: [PATCH] Do not guard shutdown __GLIBC__
> +
> +- Patch by Khem Raj <raj.khem@gmail.com>
> +
> +- These headers are provided by uclibc/musl/glibc and bionic so we can
> +  assume they are not needed to be glibc specific includes. This also
> +  ensures that we get proper declaration of reboot() API
> +
> +Upstream:
> +https://sourceforge.net/p/watchdog/code/ci/aa371bf201b1d59c595a1ad7b3464ae544ed142f/
> +
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + src/shutdown.c | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/src/shutdown.c b/src/shutdown.c
> +index 1d9a857..6aea0d0 100644
> +--- a/src/shutdown.c
> ++++ b/src/shutdown.c
> +@@ -29,13 +29,9 @@
> + #include "extern.h"
> + #include "ext2_mnt.h"
> + 
> +-#if defined __GLIBC__
> + #include <sys/quota.h>
> + #include <sys/swap.h>
> + #include <sys/reboot.h>
> +-#else				/* __GLIBC__ */
> +-#include <linux/quota.h>
> +-#endif				/* __GLIBC__ */
> + 
> + #include <unistd.h>
> + 
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
