Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C31EC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 14:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8EF740984;
	Sun, 11 Dec 2022 14:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8EF740984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rud7yLTvkkkB; Sun, 11 Dec 2022 14:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B08A940980;
	Sun, 11 Dec 2022 14:09:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B08A940980
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 082B11BF398
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 14:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0DDF4026A
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 14:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0DDF4026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecs3Q8mPcfmt for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 14:09:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B4A40135
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99B4A40135
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 14:09:00 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id m18so21965024eji.5
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 06:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BuWwwdELtTFH2Z1oUaaWZ5UN/FnUP8MTntvKFWFNLaQ=;
 b=hdoQ979l8dTFoViYtyGgeCCE7Zn/3GkT9i1d5aZuW5oVNJQiQUIzCGXsTKfR1g3JUq
 rK+lUgeAUQx3D7tJ/Jse24HV/tWsQaPf1H631sOGNRNak3jCAgz6Y4Xf+mqwMOBaj56Z
 MGP0bRDrmnFwpBzFQG0+RuEFfLSj5XNJ423NBdDU4dU/GfcNMI04ZXtu45+dsmOz6T9A
 hmmdlUFCqHGhksUKioFWPOdlMDgbTPgxT468lpiYl962SMWm3isiZchr1p/2z+53Ac2m
 4fs2zAjeGeBe0Y9HEbEOFVNiA5tF5ZmSHyIWGlXMgKh/RpC2nRgHNHzyJ39X4GeDD4G2
 WuvQ==
X-Gm-Message-State: ANoB5pmTu7qwvx7xVF3kYw7VPek8ri6JSrizgjg1qvuA+Ee8mJh1JXj+
 3fJYHkSJacs8Gbtm7jc4rNrPmbTE8+30xBnqDZpDNXIiE2QlYpmy
X-Google-Smtp-Source: AA0mqf6bEYQV9qW5/nSErRwVXXhKCB8flSp8Y/94wRVPj3yZ9uXXNNjHUDc2k8P/e17DyDRnMgb3yH42TtJXP/L7gd4=
X-Received: by 2002:a17:906:6a1d:b0:7c0:b569:8efd with SMTP id
 qw29-20020a1709066a1d00b007c0b5698efdmr27167680ejc.652.1670767738707; Sun, 11
 Dec 2022 06:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20221206220311.1350707-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20221206220311.1350707-1-fontaine.fabrice@gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 11 Dec 2022 15:08:47 +0100
Message-ID: <CABGWkvrVBxxiEcA5qV1Cap+-kgtTzRMdbQGORQ-ujDTM2PF32w@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BuWwwdELtTFH2Z1oUaaWZ5UN/FnUP8MTntvKFWFNLaQ=;
 b=SVhTBkID1h8y2dq2pHmofjC2YRSe8LzpZTg1FT+MkEv9HxPMAhOyRkPF9nSN7TQonW
 uBm3pULzYEWTK6jAgNUSQ9mR0e35i5nZZIeypnWKvSZA9414tWlbNBwZ/D7tIZf2V4oN
 cXu0OZFO3RFpCW4IS6YoeAm6Vc+yY1APiH6m8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SVhTBkID
Subject: Re: [Buildroot] [PATCH 1/1] package/sscep: requires blowfish
 support in openssl
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,,

On Tue, Dec 6, 2022 at 11:03 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Enable blowfish in openssl to fix the following build failure raised
> since the addition of the package in commit
> 72fa60dc102679f51b228336ec38f5af78ff7646:
>
> src/sscep.c: In function 'get_cipher_alg':
> src/sscep.c:123:24: warning: implicit declaration of function 'EVP_bf_cbc'; did you mean 'EVP_sm4_cbc'? [-Wimplicit-function-declaration]
>   123 |                 return EVP_bf_cbc();
>       |                        ^~~~~~~~~~
>       |                        EVP_sm4_cbc
>
> Fixes:
>  - http://autobuild.buildroot.org/results/55d2c481d8c148fb3bb61c1331340bcd71274553
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sscep/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/sscep/Config.in b/package/sscep/Config.in
> index 4b9039c9b2..2e5e29f7c8 100644
> --- a/package/sscep/Config.in
> +++ b/package/sscep/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_SSCEP
>         bool "sscep"
> +       select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
>         select BR2_PACKAGE_OPENSSL
>         help
>           SSCEP is a client-only implementation of the SCEP
> --
> 2.35.1
>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Thanks and regards,
Dario

-- 

Dario Binacchi

Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
