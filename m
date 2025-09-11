Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85CCCAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD9FA84ADD;
	Thu, 11 Sep 2025 19:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfCTc9JAcey3; Thu, 11 Sep 2025 19:23:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34DD84ACA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C34DD84ACA;
	Thu, 11 Sep 2025 19:23:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E988BE20
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB1D161B40
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zs6qNYZ4wuMt for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:23:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C37AA61325
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C37AA61325
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C37AA61325
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:23:56 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad4f0so1856195a12.0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 12:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757618635; x=1758223435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wpJgCcsFlHyGr0M5qBEwIhieCyCZAFLcUeurK5xj8hg=;
 b=QAhtfRTkR4a5beI9if3SfbBrXZ1LQRyDcmb+e2/5Wdjis7wmo2kIC79T4kfHFWUE5r
 TfulA2h3MWVR4Q3cYRKkO/dgfjTBmOZe6ofm9WXfnUYrz4Nna+yNR6SX42g7JROH3Xj2
 kI0VkzsKJiOa0RUSxQ6daoRbxnD5vDt5KeHeQ1K+4lhfGEioX4lA/WJr0tS3hL5WWMlh
 +HlYg/RA7SdLIkDVlOtSikp4cEw57JokTJt55MZc1/b3BH6DRrWR3je2/bXOb/eMfXJZ
 6MvmMyZ3gWQzvqUdzbYZ6ZYUq2YoyOJBco4CbuQl/yTaPfqQph7AFerJo6Rq6/4aqZGs
 ZTBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgLLuR2LROj4h2JCTROstud7YE0yNgXw42zncgj6Q41D2P5XrnrQ/5LB2whjMq9cghejG1pyqdELU=@buildroot.org
X-Gm-Message-State: AOJu0YyjhsVI5UZxitMd66zGjH1P9+ODOx6b1c5v+/jf77XRMGiOJbTY
 qaZ7qKh5w4sjtr9YbflgmoLu9/GtkizsNIBsFdUbvYFIRFDHmd1g401Vy6+BW1rPOB7o+CiXp66
 5uwHgcRY=
X-Gm-Gg: ASbGncuKgZT4HCKo/Io81Hpau9nLXQqu0SSd1Iqqq1XMO5XpTjUuQTLs9B3wJT5BoDc
 8q44jpRVjESahLgqcEzxDsUw69NjIW9DX04WnwvO7vyZYO1EPSDGuv5wj0VLG08zEGwBolA2/Et
 h6Qvi9RNxN5SEuTTnxZDtDhk3Gd+f7q5cpapbgva2B7UHQmByQIH7+0JRzY9KRxe+YYBiKNTZkM
 A3U3j7UpyTm8ATYFdNLG5xEY8spqjOG+A2xVC0DHrP+NWzvDA8WYDRModbFNl5xbNXznHzDFJv9
 WVMNVSu7du6+YtaIHSHRy9APcArNlEZ2+URzTdcs+ygMklxqISoCB1tyxqV3rQZWF2iASYZvsuK
 2uKypl31OdvpCk6ypcuKNUe5t7UONCv7X1BBYmmzqanb21BSX2HOhZLwkpw==
X-Google-Smtp-Source: AGHT+IEBZl/sIHzqj28eqMYAY8y17lp+RQBudMTOD9JU4LRQpAqLP+tG70NPptD8DH1FmimUZtwWvg==
X-Received: by 2002:a05:6402:440f:b0:617:eb8d:283b with SMTP id
 4fb4d7f45d1cf-62ed863bbb9mr607283a12.26.1757618634676; 
 Thu, 11 Sep 2025 12:23:54 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.79])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62edbc829b3sm81999a12.28.2025.09.11.12.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 12:23:54 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:23:31 +0200
Message-Id: <20250911192331.2672240-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250903124306.6936-1-titouan.christophe@mind.be>
References: <20250903124306.6936-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757618635; x=1758223435; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpJgCcsFlHyGr0M5qBEwIhieCyCZAFLcUeurK5xj8hg=;
 b=ZxNO4gIXcr4kmFJ0TblhgzuszDa9q5hkpTK9w9CLf0cGRAnagZptnm7cnoHFCSYRCO
 FZGBoZADiKKCNF0QQJ6hg3cgZF26aPiMi/yZHw8E9kg7+c0/BVRV4tYEhdfEUEWEaLE9
 /U7XM0hnozkVRYK0nnXFvhZp8n0rdKzIT08BW2q17wAaOKdVr8a2KblnLLLkjnsvXUYC
 5oqs0VDUo0LX25uDGLpluWJ4vTKT3S8IGvtXhYNhGyqP6YTvEP+8X7aTPZSBDbf+eGsn
 z9xNYxkP9sizQRzO+MnML8pbr56Syf/0P6uJBnJv3ndxNWrCvZ/D/GKf5FF/iZmn5ZN6
 cSzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZxNO4gIX
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-3
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
> This fixes the following vulnerabilities:
> - CVE-2023-5341:
>     A heap use-after-free flaw was found in coders/bmp.c in ImageMagick.
>     https://www.cve.org/CVERecord?id=CVE-2023-5341
> 
> - CVE-2025-55004:
>     ImageMagick is free and open-source software used for editing and
>     manipulating digital images. Prior to version 7.1.2-1, ImageMagick is
>     vulnerable to heap-buffer overflow read around the handling of images
>     with separate alpha channels when performing image magnification in
>     ReadOneMNGIMage. This can likely be used to leak subsequent memory
>     contents into the output image. This issue has been patched in version
>     7.1.2-1.
>     https://www.cve.org/CVERecord?id=CVE-2025-55004
> 
> - CVE-2025-55005:
>     ImageMagick is free and open-source software used for editing and
>     manipulating digital images. Prior to version 7.1.2-1, when preparing
>     to transform from Log to sRGB colorspaces, the logmap construction
>     fails to handle cases where the reference-black or reference-white
>     value is larger than 1024. This leads to corrupting memory beyond the
>     end of the allocated logmap buffer. This issue has been patched in
>     version 7.1.2-1.
>     https://www.cve.org/CVERecord?id=CVE-2025-55005
> 
> - CVE-2025-55160:
>     ImageMagick is free and open-source software used for editing and
>     manipulating digital images. Prior to versions 6.9.13-27 and 7.1.2-1,
>     there is undefined behavior (function-type-mismatch) in splay tree
>     cloning callback. This results in a deterministic abort under UBSan
>     (DoS in sanitizer builds), with no crash in a non-sanitized build.
>     This issue has been patched in versions 6.9.13-27 and 7.1.2-1.
>     https://www.cve.org/CVERecord?id=CVE-2025-55160
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index 2983b511cc..f260a0e0fb 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  ceb972266b23dc7c1cfce0da5a7f0c9acfb4dc81f40eb542a49476fedbc2618f  imagemagick-7.1.1-43.tar.gz
> +sha256  b16415e8694a2e15e5282d64fc7b358f309ff3a514a90eb5da268676c772de3d  imagemagick-7.1.2-3.tar.gz
>  sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 6bbda40396..30cacc7f1a 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 7.1.1-43
> +IMAGEMAGICK_VERSION = 7.1.2-3
>  IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
>  IMAGEMAGICK_LICENSE = Apache-2.0
>  IMAGEMAGICK_LICENSE_FILES = LICENSE
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
