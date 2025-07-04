Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D751C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 445EB60D9A;
	Fri,  4 Jul 2025 06:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvt23cDDjOsN; Fri,  4 Jul 2025 06:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240A060F4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240A060F4B;
	Fri,  4 Jul 2025 06:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B8841EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D7F140FA3
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9tpnHJTdZvL for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33ED340F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33ED340F8C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33ED340F8C
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45310223677so3418805e9.0
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611623; x=1752216423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4orK4DrrbWmY7y4qj8ihv/vXAoHVf8hqzcTW1SopWP0=;
 b=XHLI3KE7vYJYqAuF1Sp7ozgPW/BYm7hSplnFQXloQS05MHoeo50T+wVMB04RLaxeiQ
 YkX1UpfB7mkT11u9/FcWn5Rb8YLZAB797QFkdqXuVN1uEM2ehgdfgOqc1HcMV0XMqWIb
 uh+HgMHmPEUmvVYkxWpfEWo75WPiHVh1SR2nDachmivKL3kBMO7kOcwgqvxvDDUMEuab
 EAYtHxrWuAQd4lLbWKpV6QCyUXauXTIo50QVlv77FlCmB9zPsvna3bVGF56DuCENttyN
 SpbEtlpXGj842btF+5sHzktHioRtnEklmlSAaqAnVsqpZLlkEchhlMIZhaKxKj1jdQhz
 CBgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9JI9q+YNt9o+hJhbvqbVzaY0J4ZOddDNZ3YH7tAo+C1OT9V1PDsdfSqZ4Jo6NRdyp1WQVzD5P0wU=@buildroot.org
X-Gm-Message-State: AOJu0YxoXm4s09AE6eef1KWl+nGNmay10uGHlIBkgx1dnIAUa9NG7MRF
 T/KfsabJfbUF6xJUJZjRPxQEvdwTXAu2Dsng8sHbbRj5LEBW2dK04Jgy7SdRPDwOPkhKr2/8WvB
 peM5K
X-Gm-Gg: ASbGncsskLfIxyuC1XlasISrB5Hk3DHsWkj9UPDgalb8GH7bt6FrYBYH+Q6vPNWYp6F
 cmH+IpaZOmSkxCvKBBAMOb6eJxgi5nvImRTugoDFmepByB2WoWDpy7cU5ddKZ58na2rALe7iBcc
 WPjaDHrNdzh8zVckPbQsBy6qbm6JWqObGIXfyoHkIYxEJWc/MxGZjJqb4kytjZbPJJARmZu7UZO
 +etscb97R/YI6RqD2CECUxpDRYyTwOaWkf1YyTIsacREKp23jsqkUFifhUS5/5kF/S+jIdI5jm+
 L6VbstjtaBWS+KXx9znItGOHco4LPD3IHHF1azFz+pOiq/U8ZcvL9BFrWhsh6rKbgpArLDss2oz
 OybU6c9hOgQ==
X-Google-Smtp-Source: AGHT+IFkSl8K4KqNfVaNfZncCdy1STJlx1WVxE3pZSyGRTZA7kwKjrkum8p4Ynu+8vFaMlwD++TnHQ==
X-Received: by 2002:a05:600c:540f:b0:441:b076:fce8 with SMTP id
 5b1f17b1804b1-454b4e85deemr7945725e9.14.1751611623183; 
 Thu, 03 Jul 2025 23:47:03 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47040161bsm1646945f8f.4.2025.07.03.23.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:02 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:01 +0200
Message-ID: <20250704064701.4064464-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626083005.537882-1-titouan.christophe@mind.be>
References: <20250626083005.537882-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611623; x=1752216423; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4orK4DrrbWmY7y4qj8ihv/vXAoHVf8hqzcTW1SopWP0=;
 b=f6YSrWYCTLFRo+0Fk1WgXyOZS1TvkoD8b9dJgzXDo6wYlmNFsDqcdiF+GeFvbBwxgE
 jXw7YlhLoX71KHva1kRqD9JL9smwZ03D9YdGalQMXXnFyI/IUSD3RMhcE7GxXer9Rs/m
 n8k/xkwZ8vb1pTiAevshxHF6EiBECpBTOCIO5GyqV4++9Z/YUg9r4l6weaiCYTkTOzOK
 xStHmIIl2uMND5WSXrYHjivhoQm8/NcsIMIoPApFkoIIIzbDAIzgBhMC2nEV8F6cs5v1
 zJpDC77xFJsGMTIb/t64T/1DcC2I3qrtUORJYAXFFT4yUcnIjASAncdMxk9JSe2n7hIS
 mPnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f6YSrWYC
Subject: Re: [Buildroot] [PATCH 1/2] package/libmpeg2: switch to videolan
 Gitlab repository
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
> The source code archives don't seem to be available anymore from the libmpeg2
> website (Sourceforge) [1], and their SVN repository [2] doesn't seem
> reachable either.
> 
> This fixes recent autobuilder failures, such as
> https://autobuild.buildroot.net/results/ede/edeef6a480350880b12eebd94654644e43c2670e/
> 
> [1] https://libmpeg2.sourceforge.io/
> [2] svn://svn.videolan.org/libmpeg2/trunk
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/libmpeg2/libmpeg2.hash | 2 +-
>  package/libmpeg2/libmpeg2.mk   | 6 +++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libmpeg2/libmpeg2.hash b/package/libmpeg2/libmpeg2.hash
> index 615d0ea6bf..96b71fb1c8 100644
> --- a/package/libmpeg2/libmpeg2.hash
> +++ b/package/libmpeg2/libmpeg2.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  dee22e893cb5fc2b2b6ebd60b88478ab8556cb3b93f9a0d7ce8f3b61851871d4  libmpeg2-0.5.1.tar.gz
> +sha256  1b3adfb73e7d34ce9259130683d884b0b1af67572c9fd8229d45f55794b6dc0c  libmpeg2-v41f78cf4d30d0da0a24c8ecbc38b0c9dfd43f871.tar.gz
>  sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
> index db9b2f8bbb..cab800162c 100644
> --- a/package/libmpeg2/libmpeg2.mk
> +++ b/package/libmpeg2/libmpeg2.mk
> @@ -5,7 +5,11 @@
>  ################################################################################
>  
>  LIBMPEG2_VERSION = 0.5.1
> -LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files
> +# Gitlab repository does not have a 0.5.1 git tag,
> +# use the corresponding commit sha instead
> +LIBMPEG2_VERSION_SHA = 41f78cf4d30d0da0a24c8ecbc38b0c9dfd43f871
> +LIBMPEG2_SOURCE = libmpeg2-v$(LIBMPEG2_VERSION_SHA).tar.gz
> +LIBMPEG2_SITE = https://code.videolan.org/videolan/libmpeg2/-/archive/$(LIBMPEG2_VERSION_SHA)
>  LIBMPEG2_LICENSE = GPL-2.0+
>  LIBMPEG2_LICENSE_FILES = COPYING
>  LIBMPEG2_INSTALL_STAGING = YES
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
