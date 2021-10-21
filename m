Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF71C433EF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:34:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF12610CF
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FF12610CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B9EE408D6;
	Thu, 21 Oct 2021 20:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCrUnSoMsZHI; Thu, 21 Oct 2021 20:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B17E6408D2;
	Thu, 21 Oct 2021 20:34:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 538FE1BF318
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E66140221
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdcrc43rD4nY for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:34:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32AA74020D
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:34:36 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id a25so1959545edx.8
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jHgOlN2IvGmdPyFj0aFrWPsA0fts718Bp7uNQrYnmGg=;
 b=Blg9aqgCt0bueyvZO5nVWHOr3sOtI0+o3gmcy26sS54c7Kg0RsqlKhBXFIA94gEZ9C
 ByLQAVA6kbYpGnLpTORBv7qQRZ/llLo76W9azcqTxY3RQxe9DZCDIz5OZBW7Ku3wITEh
 QTEQV1RT+eOumUPX6Zce1S/P/EZTiGx9eo8mx3/LDjXxsb6UeyLR6nJkhqa8dyaTChXc
 Z24waEZacQw3y+JD7BcBdiJ4w9CCgG4lQ9WGj9gbTRMYZu7Pj4y9sMJccCC0Y1exx6p6
 efHQBcR1vUU8W9G0P5LdhpOY7LxB9U+rC0ZqE9nrgjZpvuTazoRWLA/iIjwMCH0hINQW
 XnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jHgOlN2IvGmdPyFj0aFrWPsA0fts718Bp7uNQrYnmGg=;
 b=FLOM3IXSfb2scWGBqZ9aWES3iW44YJp+R/p5Vv71BAbaQYMnnSxz5ozVxGjrdC7qPX
 s6UYeio08kx3Wte4+wDO/M29ODpFsE78WSF36RpPRQkJKJYvI/IyfZ+YJ7dx9P0EI4Iy
 +i2PkPUboA+hQqH5EjihNi4EydLkKfAHCFduhIqOIqSmQ1MjPS7Jqx5xnrePMxoPDZKF
 FPcgwQh28vJEqu4hxPQHAUPu5MGelYFHjWr6ZD7t6tj5pCvSWRZ+4gysy8vnh1TxDenX
 44duGxYYZNWmthyC5hC6NsXricH1L5JFEDoISC/nbUZZR3jnQZO57J3XYeO8+9pDB4hQ
 dfgg==
X-Gm-Message-State: AOAM533O6ZMCAPUQ5pbejTeVM1xzYkcNP3xUehDK9cTn0CdsDWMtkV0G
 3T8SxUp0gmNwfU3ThQdx0xcUFQ==
X-Google-Smtp-Source: ABdhPJx9ySnFyelFgmOYvEyx/qJciovWVVw1RYuPikhOLE7awq/fJOSDF8p+y9ZJ0F/FCJW6Zbs8wg==
X-Received: by 2002:a05:6402:3d6:: with SMTP id
 t22mr10985398edw.240.1634848474490; 
 Thu, 21 Oct 2021 13:34:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u18sm3304988eds.86.2021.10.21.13.34.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 13:34:34 -0700 (PDT)
Message-ID: <31b6249a-7c06-7022-2950-2d1111694046@mind.be>
Date: Thu, 21 Oct 2021 22:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211012171807.691567-1-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211012171807.691567-1-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.59.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/10/2021 19:18, Adam Duskett wrote:
> This fixes a regression introduced in 0.59.0 which prevents gcr from compiling
> UI support with the following error:
> 
> meson.build:225:5: ERROR: Tried to create target "@BASENAME@_merge",
> but a target of that name already exists.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/meson/meson.hash | 4 ++--
>   package/meson/meson.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index 9bb7ec9f40..f3cfe66072 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.59.0/meson-0.59.0.tar.gz.asc
> -sha256  e376c298df64b643dfe01eccb2d7b6f1e02e95aa38c19f19d120d129612ce476  meson-0.59.0.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.59.2/meson-0.59.2.tar.gz.asc
> +sha256  13dee549a7ba758b7e33ce7719f28d1d337a98d10d378a4779ccc996f5a2fc49  meson-0.59.2.tar.gz
>   sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index 134411625a..bd03a7cd67 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MESON_VERSION = 0.59.0
> +MESON_VERSION = 0.59.2
>   MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>   MESON_LICENSE = Apache-2.0
>   MESON_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
