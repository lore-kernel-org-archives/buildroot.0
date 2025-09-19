Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1333CCAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D507D61077;
	Fri, 19 Sep 2025 12:58:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lgjx6uITg4Jb; Fri, 19 Sep 2025 12:58:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67CC46106F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67CC46106F;
	Fri, 19 Sep 2025 12:58:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D35CE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 040CA61068
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTWx3IvXF5w0 for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:57:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95DEC61062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95DEC61062
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95DEC61062
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:57:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45df7dc1b98so13031885e9.1
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286674; x=1758891474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Byo0KHqqsv9r1I5dbHayzqat4dLz/CjSXM0h8B8lC1g=;
 b=TtpV69ZnN4NCOTNPgPIYOzYyYvdm/MW42EuNn7movHAiViRDDt0jT413m3wLT8dWsK
 vFNwItraocYkqhtr5Ui85ku9jEe60veFBMxE/4/zdLBNOfx7naXiS3iui1nALaFDWE8U
 0VHVVyk8he9ui4JzC/7X3vpqzkn/jnP6/Gr8DhN60odzinkmoWseo4k3kLatXsWg9xbQ
 fmt0h+I6gp+JGWqYMgr+gL8rbQF1tvTFrDgBRawA8KyrOfAM9chOmFjJWrjazgmKUWB8
 OQbXG29tQP41iSqpaGgN+FYsj1xejnCdC4M59pCatLYFIQGg/52jK+pRXYDqG1A25Cy4
 KQGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVArQbDEAbBfcC2Uhgn2BzZ2feBTXS1Yt1SG1I68efY8zOmS36joWrACEjvFsKfNrwqyG/TABawEvo=@buildroot.org
X-Gm-Message-State: AOJu0YwIFAKJ4Z3cQA+1I3+m9CeVvRngPJVNCIcRe0X0IAcmFJoRr04t
 xCs3+xopkrU4rY2crKfkTjYfz8zMB9ULFi2aC/R4XUuDv3gpgm9ITUXXdS4XU/uk5Sk=
X-Gm-Gg: ASbGncuaiLDwKa356Lqzbm3NcVtj9poZ3HG7j/SIuarbn9kZCLzMep2gb8uuMUAm7cQ
 cqeMc0jdT4c7hfhIOonXpDM357mRn2Xtfoet81DzqrPJcX96UjzDOGpwQUUA/XP+g/YuuTSQLQm
 5/8auQXgyH/niQSZLhBn4301kqBnRWq1pKzqjIgHHArzR8cf7RnV46EhUpNkfWK25m0IbMIpMLb
 iYB9xsjfBJW1iuwGHDV60KOxHKdQgYs1bsjF4BlC5KDe99N0PC/2Aj1EQ2IzL5w52yTUkrW9siA
 Gc9WQFLie4hCbI31fOF6WQ8M++pgc/CZgrPd4Oa8+yZAec+SkT7N0fdVx6bSG/CdBaYnd/UJdi3
 kwie95Kkj1ne0ijI=
X-Google-Smtp-Source: AGHT+IHg9dPLk+MI0oh1R0IY59Pxx3XhBmJH5YwkSS2yW+El34f3ml93TpqA8MunHO1AsTREV+YEOA==
X-Received: by 2002:a05:600c:8b4b:b0:456:1a69:94fa with SMTP id
 5b1f17b1804b1-467e7f7d89dmr25223265e9.13.1758286674503; 
 Fri, 19 Sep 2025 05:57:54 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f32181a47sm85839515e9.1.2025.09.19.05.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:57:54 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:57:53 +0200
Message-ID: <20250919125753.137522-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908192435.214306-5-giulio.benetti@benettiengineering.com>
References: <20250908192435.214306-5-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286674; x=1758891474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Byo0KHqqsv9r1I5dbHayzqat4dLz/CjSXM0h8B8lC1g=;
 b=RjTW/Exj8nQ5R97XdX13chUQx2H3jdx1lCvIwy6bk4fnHnmEEduiWqqiKyFX9SAaLQ
 ZAy0mTqd3OSWTC9ckg4R+kwra5SHd+MXV/JGjztTUpypFSFVOnee4qh0rAA7bIPUMrH8
 FWtZbJdRsGg7BFi80qPwL7zPkTbu0D2P++fPTfrv+U2mmd2LPWCIJ69RekmRuZcVI5Tb
 QT53EAvcCswfGvCH9+Etx4ynKljMII/gSV/kEyKmURLZ5vWZfiC9q6fI4920SG6G+PLL
 5iKts3BOWOz/enuzjS6UBsKOvmLJe6MdJ6LwQLagW4JAp3mWCE81y7etjgpWns3mui36
 8omw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RjTW/Exj
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.16
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
> Add a local patch pending upstream to fix build failure with Linux 6.16
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.08.x. Thanks

> ---
>  .../0014-Fix-build-for-kernel-6.16.patch      | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch
> 
> diff --git a/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch b/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch
> new file mode 100644
> index 0000000000..bf4a8106af
> --- /dev/null
> +++ b/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch
> @@ -0,0 +1,34 @@
> +From 8ee37436cfa1bdac354ff63e17b647e7b5fb20f9 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Mon, 8 Sep 2025 21:14:22 +0200
> +Subject: [PATCH] Fix build for kernel 6.16
> +
> +With commit:
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
> +from_timer() has been renamed to timer_container_of() so let's rename
> +according to linux version >= 6.16.
> +
> +Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/10
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + netdev.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/netdev.h b/netdev.h
> +index 607a3b5..33708ad 100644
> +--- a/netdev.h
> ++++ b/netdev.h
> +@@ -15,6 +15,10 @@
> + #include <linux/gpio/consumer.h>
> + #include <linux/version.h>
> + 
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 16, 0))
> ++#define from_timer	timer_container_of
> ++#endif
> ++
> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
> + static inline int del_timer_sync(struct timer_list *timer)
> + {
> +-- 
> +2.43.0
> +
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
