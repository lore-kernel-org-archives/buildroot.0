Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF924CD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 970FB83B2F;
	Fri, 29 May 2026 08:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFy30YqwV32R; Fri, 29 May 2026 08:29:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B86FD84200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043352;
	bh=iKbDyaLU2cYPB9gvIVEK0Xh2R73OjJRCOoorvXWADlo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WYKD8kW8v+1URLSZvyuTxjd4FHP/10zawwSLbVNVjxBekki6grqhQ0pL3HpdH0qT+
	 kQd4XuScT4gs9Y+lxp95UMgm12BaGwalALF4bFimhSkYh3runXcZGc4H5HZn0anVyS
	 xqxG5EwawyrRVAwJXYhn/XmL6gs/qUvowCES/AP4pBxZPNi5KV2/5bsQ0hfocFnFpv
	 849KXgjx4OS9tc3QsSFuQg4aE8HHb/uuN0Q/8o7YCbymxzRP6do0hYOZ9uXfMwRetW
	 CJDJPgTfCM6Opns/69Y2qyMpYMkoj4YwXSxVwhfiHjSCJmAj5tuIoS4vkP9Yo1O/Sh
	 dBmuJXkAg2mPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B86FD84200;
	Fri, 29 May 2026 08:29:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4189288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C505B421F7
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSjs_8v5vScu for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B598E421F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B598E421F3
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B598E421F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45eecb8bf67so991107f8f.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043346; x=1780648146;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=15oehqR+7IGh/6Gk/IS+IBks3CGpAN5BTiA5nfTb2Cs=;
 b=jWQepCq+tbxfpvQQYOjps/4BHdP4aFvWR6uwUEOU8mpJzLh3UBoUSkmejJorZattBl
 FHUpz3A2zQbZ4SlIlQuaMTPXA0EM9ZaZk/8DMPnwHKIV7jKkFb5nmTgRpnkakKVTmcZg
 RceUcxRLcHrY/hh1SEZgYNQ7xH76OsTbQyZH86+SEBW5xKKYeByg3SbqKYoD36azu74P
 sjVqhAWaY0AlvhcL09ZsIZ7NzOCwneMg9j4Exdr80xOJbe/OyhM5b389tBJUKA7c7tlr
 cCqIsvy2uGaDD4HHYMHM32/T2311vmzEJDcAziydHOIBNWsbdXXN6aNtfQ4gsze3X86C
 x1xw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+YUy2kbBkzU7yVAJLrCz5HGmBH1WboxTYAsPIWT3YR9KjU0M1pZjKw6PtyNzQOFIETU/cmNsI82Yk=@buildroot.org
X-Gm-Message-State: AOJu0Ywre3OZcVskwkLXyW2Eiu1TND+yWJVmJFIZDJdz6T2rbcyzSITR
 4zFQliubdwSAtJjnmU9wTZV3GyoLnh1XTT9efraCsQQmWZhPSvnZmApeyCduVCkEPrA=
X-Gm-Gg: Acq92OEXH6hoeCv62ivYgozRuTZJznl1qtv5Q/hbeU+7BbzAqVX3UY1a1dI6kKSETrM
 6JpP9U0KtLCkFKyc67RCx25yiMNuy8tyWWbZl5sOh7wiop7cKpyIoJtOvYDsMBHCWvS0HC13/Ze
 0hHsxMmlRUfLLdM9ohmeKVl5m6GLqMLrHXjJWuqli/Ew/WXTjn9ZeXJOHzA5c6TTAKORVYltJT7
 zuIk2hsaWwxOactH+SJi21bsPs/wIUw1fCCR5F0pidrTUT2SH5o3/a00e7POit5eXtSLdav4SdW
 djBgLBplB9oMaCtTYLGnrLyr3JNg1+Od5pBqx5dg7nzmhrt7f4DZAO2uBAzEyVYou/IRibN1YeQ
 0BQhgFGaWEQ55rN6uqJwPRS++tlyXALfEOsgDcZ2BeFozm916x6+ARXtGRp9wwjhpmjeyq7R3lf
 D3B0xw/I4bryMqumu5C7eb8hFLro0KgRMmWlOcNEP/8QFqj+zCmGoBKXZrBxlBEAc8YqxZ
X-Received: by 2002:a05:600c:a55:b0:490:6869:46c3 with SMTP id
 5b1f17b1804b1-4909c0cfa37mr35211395e9.30.1780043346303; 
 Fri, 29 May 2026 01:29:06 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c967c77sm33402985e9.1.2026.05.29.01.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:06 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:05 +0200
Message-ID: <20260529082905.56398-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251012085802.3442610-1-bernd@kuhls.net>
References: <20251012085802.3442610-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043346; x=1780648146; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=15oehqR+7IGh/6Gk/IS+IBks3CGpAN5BTiA5nfTb2Cs=;
 b=Z4MN6/O61TTBraGIerx1NzwsMcCbSnO+32JNX1LmyTnYPYBiNGsETUNhzo4m8Hy07e
 W80SM2Z4qX4QlvlY0+9ikzqZTMSy5ZxpcBC7CppOnVeI1vNQl6eJdPdjHBTujhXb2qRn
 1TZKsqxYnM1CNlfvDjHKwas366iSt14/kyCLPItCtA+xcelKUt7T3cpY5smqs9SznGZv
 oQkEkN2PotrEIxXhFeWUoUB8jNDzrTY6pwbKSmY0XawJ3wXjv/dst5/oW/6W49a9hnBU
 kG4mk1Rr0H7c5fz7kzLaO1q19k45cJoFpbVoYBSDD3eCu1vRYgSlM58rxSqxUmvA1eDG
 WfQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z4MN6/O6
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: bump version to
 1.56
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
> Release notes:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=NEWS;hb=b3b68bde07b02dd2b6d78356ac90baa652a309fa
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/libgpg-error/libgpg-error.hash | 4 ++--
>  package/libgpg-error/libgpg-error.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
> index 957f96edcf..d02983d1ca 100644
> --- a/package/libgpg-error/libgpg-error.hash
> +++ b/package/libgpg-error/libgpg-error.hash
> @@ -1,6 +1,6 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  0a9386ff70a5d1f771771bf0b8db2b956e292f13  libgpg-error-1.51.tar.bz2
> -sha256  be0f1b2db6b93eed55369cdf79f19f72750c8c7c39fc20b577e724545427e6b2  libgpg-error-1.51.tar.bz2
> +sha1  6db7c51778e424c928993e1d49ccf6ad6866b185  libgpg-error-1.56.tar.bz2
> +sha256  82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0  libgpg-error-1.56.tar.bz2
>  
>  # Locally calculated
>  sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 3f327e3054..1fb1076ef3 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGPG_ERROR_VERSION = 1.51
> +LIBGPG_ERROR_VERSION = 1.56
>  LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
>  LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
>  LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
