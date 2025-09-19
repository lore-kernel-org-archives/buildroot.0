Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A908BCAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8264B61073;
	Fri, 19 Sep 2025 12:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O14KuGEotCL9; Fri, 19 Sep 2025 12:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9134A6104C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9134A6104C;
	Fri, 19 Sep 2025 12:56:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B117E7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5B4940C23
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rxwp0xpjlOVE for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:56:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3B5B40C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3B5B40C14
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3B5B40C14
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:56:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46897c60e38so4081735e9.0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 05:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286583; x=1758891383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YL8VbhwYdsA4GteGP6WQllre6dwl4WTTIzxs5BPlr4w=;
 b=T2nQyTs3AcF2okBtSEkNVIIYN2v4kAzOhtsdLle9Vscqih05M02GKmt1DcWEiKbMas
 ZGWcDmGFXF+eLfCRUS1cKCrfV7Yo6jCbf9b1oJQ1v++15MC1U1P4KUsUEySftYUCyDOk
 QjzQ6tZhOYHgf7N9suG4+2Xl0CW/qn2715OhltXzRgi3RGse3jGRxXIZpWDDxWtksghD
 qHlUuMg61eQOCHrlQuc2RHtyyGxwhNJV4z+qagjbjQUCEyze4bS0elldFrBLV44XKg9v
 BFVOZz2PXKZwTlFwbgY8jRlyY9R7/WwX0rc5QcwZCVk4vHObfmdZzMaO6af214qcAtV6
 ZnzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2x+8Dq6cJB8wakFVLD0uD+vkysgk5HPFYcTNqJUSvmgVY3Wqr5KEHI35IEDyU9nE2Mz8n0x9kWfI=@buildroot.org
X-Gm-Message-State: AOJu0Yzdg40pYNcebKpozFqKMOU8sUQ/qbUrjSjvuRgKJH0xnCre5T0P
 8B698zaXoIlN41N6BRazWWyxID9PrTYsZ3x40d6tNtoj/yTuLS0QLkZQqR1f00dSlTcbsPJEZhc
 NA+wQ9Gk=
X-Gm-Gg: ASbGncvZpsxBrmp22o4l3ZYJr4v5oJ60rkT3iCEyq2GnlfCm13kYI57L/UY2CKXIXoY
 pnzojBT+3r6SOXIKU2lICSGIgp16Trjp0oHGTOUWkre2TXinIljT32obBpORA6+kwOmI2OY3sSJ
 ppDo4lRo2kWIUr3/6tuSMRWB+luakJ5FyC2GdAkZ8d8G3RpkRrEXr/BdVzg81p37zxzbJACy1D9
 6Kl2uOdJ6sXW0q9WkmBC5zlUYdFhKMKhiCpuwdI3xCv7DNachBzYoACMIGtnYDPtxcBJU2H7gUz
 Uw4z/gugHrZBe1kQFJZkrVIPWxlwVN79IyAAfYxgmnOqFiStFRwWVC8RRTAxE6BFu/DRZCCP0OD
 jXWaCFYVeSZtfy4I=
X-Google-Smtp-Source: AGHT+IGwwLIbNdHe3elDziFT1fgEf6DclSQJzWBSH2hW1kusc5WF8LbCQOcIxJOuB++tlqgr7iBlTw==
X-Received: by 2002:a05:600c:5491:b0:45d:d5df:ab39 with SMTP id
 5b1f17b1804b1-467f2cc83afmr24585095e9.26.1758286583003; 
 Fri, 19 Sep 2025 05:56:23 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbc7284sm8139672f8f.33.2025.09.19.05.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 05:56:22 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 14:56:21 +0200
Message-ID: <20250919125621.136514-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909120822.1069595-4-thomas.petazzoni@bootlin.com>
References: <20250909120822.1069595-4-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286583; x=1758891383; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YL8VbhwYdsA4GteGP6WQllre6dwl4WTTIzxs5BPlr4w=;
 b=hTVvb8a+EzZwG5Ts/vyFKS4HwsDNGKYxdK0dWZKJx5LfpudmIk6B8iwBmVM+AupRPr
 K6553ZIk+sCEnyHWpO8jVqoO/Gh6B6W6E9rnmACDEUrUQpAlp65++LUtNzs8pyL1HHbA
 IwrOdeHdFn6/9ZaBypVc/9mdpQWRZUSDGwGCaiooPKxB4jqn3Xzv7jJ7PNg/+gGmGyLy
 eBzoIy5yLRCdfbrKsP0vhu0tSCqCaL7vH+TMe1ZYz3padEOdmzlbQb8gF9/dsHxrwHd1
 5KGg9jYNsR5xHpgNQoXW1oiOVuFYIdwJR8bvFn1I3hH4xYNcGfWXrMN9mB+OYXtRCyoJ
 EWiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hTVvb8a+
Subject: Re: [Buildroot] [PATCH 03/11] package/policycoreutils: fix build
 with musl due to getpass()
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
> policycoreutils uses getpass(), which with musl is only defined with
> some feature macro defined, such as _GNU_SOURCE. So let's pick-up an
> upstream fix to address this issue.
> 
> There are no autobuilder failures, the issue was most likely hidden by
> other failures with musl affecting the SELinux stack.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  ...oreutils-run_init-define-_GNU_SOURCE.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
> 
> diff --git a/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch b/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
> new file mode 100644
> index 0000000000..bef6909b0a
> --- /dev/null
> +++ b/package/policycoreutils/0003-policycoreutils-run_init-define-_GNU_SOURCE.patch
> @@ -0,0 +1,37 @@
> +From f338b2e7d2bbf70cb811eb1331162e33deb4ce6c Mon Sep 17 00:00:00 2001
> +From: Robert Marko <robimarko@gmail.com>
> +Date: Thu, 1 May 2025 21:59:13 +0200
> +Subject: [PATCH] policycoreutils: run_init: define _GNU_SOURCE
> +
> +Trying to compile run_init with musl will fail with:
> +run_init.c: In function 'authenticate_via_shadow_passwd':
> +run_init.c:206:40: error: implicit declaration of function 'getpass' [-Wimplicit-function-declaration]
> +  206 |         if (!(unencrypted_password_s = getpass(PASSWORD_PROMPT))) {
> +
> +This is because getpass in musl is guarded only for _GNU_SOURCE, so
> +define _GNU_SOURCE for run_init.
> +
> +Signed-off-by: Robert Marko <robimarko@gmail.com>
> +Acked-by: James Carter <jwcart2@gmail.com>
> +Upstream: 50bafc3d9c08cf26c3b0f61e29157a0ea8efbf4a
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + policycoreutils/run_init/run_init.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/policycoreutils/run_init/run_init.c b/policycoreutils/run_init/run_init.c
> +index ce499781..4531a8ba 100644
> +--- a/policycoreutils/run_init/run_init.c
> ++++ b/policycoreutils/run_init/run_init.c
> +@@ -37,6 +37,8 @@
> +  *
> +  *************************************************************************/
> + 
> ++#define _GNU_SOURCE
> ++
> + #include <stdio.h>
> + #include <stdlib.h>		/* for malloc(), realloc(), free() */
> + #include <pwd.h>		/* for getpwuid() */
> +-- 
> +2.51.0
> +
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
