Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFD47C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:57:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0407560FA0
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 18:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0407560FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD372826B4;
	Sat, 11 Sep 2021 18:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_rEl30n7aJK; Sat, 11 Sep 2021 18:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A56182695;
	Sat, 11 Sep 2021 18:57:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 090C41BF2C2
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECC2460814
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 18:57:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOSHvAnaOW_x for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 18:57:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E3556081E
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 18:57:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n27so11389697eja.5
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 11:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x9uesZI/jQCl52KfWRgipQFGZ4sgvfuWBj8JnJQGUvY=;
 b=hc93SjSpQnziry4Np8nL4Eqq8jo/HfMf0yxqCFdt6c81DD8pjt+GKIrVzfmmWwx/mE
 JSCbitmEfwd1FoiEpRadixJS5jUs7Msj4ZmUKG7VakSP704ZpntuUByfaLzsFxNXLZdk
 CK0EzOXzQ3wU0kmfsF7z4LRZm/SrLPHnEGPysVV28/DP23ItvwMDKMkBHBuhBpAUgClZ
 5oLwWxxBM70JDc4L2w0i6tOGoV1BlMoH2eHuw+aBXcXB2tVevohSBZMdw3Bt1CT6z6C8
 5mV/hR2J61sbRptLNOKX9gy/Ty5E6AZn8RB83r8aMFoXvqd20efpfrGvHW2aGdvqSLgM
 p18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=x9uesZI/jQCl52KfWRgipQFGZ4sgvfuWBj8JnJQGUvY=;
 b=4ygUWSi3ndqOKfXGbjnanRhGtEKO2OheYB6LXdg/XlS/5uMi5cNFjopht9O92FuCiN
 fppL6+n8m7vrU6rCDNCi7+cvjuvgitq3mAC/Jh6WrSFcznqGWI6u43ygWKjFww7g0oqF
 keVPsIid8AbtHtQnJLdcarEFkhiacuPGeXMqcuEMJn259SIfzzQtDp4tFIuMUNhEVtk2
 1Ea3wU3AJF133WSBRU/r2xjTN1bMYky/p3YCquVjTHLT9S0IDeT7KkgNqhdMGVgyKfzI
 FqihKhwQEjPtgZ6gfoIX+8MNaCtVKoY1fZxRnod4rNbnQ38G/N2UpA+NJinC+EPqfYhy
 4X2w==
X-Gm-Message-State: AOAM533+UG5k9h4lxboMnw1dnUvtksyIcxzv05ZENbZm9w6YDYYsEjKH
 zkaVa4pfW03tbAwhSInHq4NUhQ==
X-Google-Smtp-Source: ABdhPJwf3aSuZjneX5RQqVdMqmM+NP6BWZVRpHbcKfv91oeMCVIWFLj6fPhFt69hR1NDJ6x7jk21Fw==
X-Received: by 2002:a17:906:318f:: with SMTP id
 15mr3965651ejy.206.1631386625295; 
 Sat, 11 Sep 2021 11:57:05 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v10sm1292556edt.25.2021.09.11.11.57.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 11:57:04 -0700 (PDT)
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210903162027.1935040-3-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <016fa6ef-0efa-030b-3e27-c2e7ff6db844@mind.be>
Date: Sat, 11 Sep 2021 20:57:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903162027.1935040-3-aduskett@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH/master 2/7] g-ir-scanner-qemuwrapper.in: Fix
 shellcheck warnings, switch to sh
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 03/09/2021 18:20, Adam Duskett wrote:
>   - Add double quotes to prevent globbing and word splitting.
>   - Add indentations of continuation lines.
>   - Disable SC2181 and SC2016 as we explicitly do not want the variables
>     expanded in the echo.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  .../g-ir-scanner-qemuwrapper.in                  | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> index ec066062e2..5ece75d0a4 100644
> --- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> +++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
> @@ -1,18 +1,20 @@
> -#!/usr/bin/env bash
> +#!/usr/bin/env sh
>  
> -# Pass -r to qemu-user as to trick glibc into not errorings out if the host kernel
> +# Pass -r to qemu-user as to trick glibc into not erroring out if the host kernel
>  # is older than the target kernel.
>  # Use a modules directory which does not exist so we don't load random things
>  # which may then get deleted (or their dependencies) and potentially segfault
>  GOI_LIBRARY_PATH="${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:}.libs:$(dirname "$0")/../lib:$(dirname "$0")/../../lib"
> -GIO_MODULE_DIR=$(dirname $0)/../lib/gio/modules-dummy \
> +GIO_MODULE_DIR="$(dirname "$0")/../lib/gio/modules-dummy" \
>  @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
> --L $(dirname $0)/../../ \
> --E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
> -"$@"
> +    -L "$(dirname "$0")/../../" \
> +    -E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
> +    "$@"
>  
> -if [[ $? -ne 0 ]]; then
> +# shellcheck disable=SC2181

 Instead of adding an exception, we could just do the right thing:

if ! @QEMU_USER@ -r ... \
    ... \
then
    ...

 But since I wasn't going to test this change, I left it as is.

 Regards,
 Arnout

> +if [ $? -ne 0 ]; then
>      echo "If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help."
> +    # shellcheck disable=SC2016
>      echo 'Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"'
>      exit 1
>  fi
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
