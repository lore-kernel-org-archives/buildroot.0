Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E0BC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C13C60EB8;
	Mon, 15 Aug 2022 09:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C13C60EB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VMjAZP-D-dY; Mon, 15 Aug 2022 09:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EBD860BCA;
	Mon, 15 Aug 2022 09:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EBD860BCA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57FB21BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4082381749
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4082381749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AupxrAOEZ_qb for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:52:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ED748146F
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7ED748146F
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:52:57 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a7so12696440ejp.2
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 02:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=34mdMv2R3XNbVoJNLcATB2/q2cHMA3ZQKOPGa9MuKqI=;
 b=mf4jHAKSJGLX+ShJMGXnGG/3mTH6zMn0DLdmZRGAfd8S5IMbr6mXs3A+jkr5SMZyzf
 zeycUaN8aDJjlplvYMaotmlH/q0125loi/H3qgfZgZFimxwdZSXaFJQpAWlMzd0jJYKM
 4bojnd4jgq0pyS5Aqdu9m5Vt+cYqs/swJwZla5jugmqJp9q21e5I31hdCmaNVojrpUlt
 vscv9Av2ybAs2aCY0zQpWJXmzAerIYhkZfYl8CmSA+OIZvcWDy9pWSOB/f/YhJ0FZpUE
 B9MQmQWGnllliY1+SXo+HOaAxee/nqYGiZv1OMrRAfHx6pSVZ6Wr8e2f/sadO8/tBY16
 dbkQ==
X-Gm-Message-State: ACgBeo0m6bcs35ixqDjjCkS8jnFRQ13fgcyB3qmMplKi5VPP0xJ2WgcK
 JWED9CGro3S8skVfYVB27qE=
X-Google-Smtp-Source: AA6agR7v2x1DtKqu3dOsNSu7mZ/SpOwt5425mcBsp/vnixt37Afpp9MbvKJD3F5pnz6eKnU1c1GPqw==
X-Received: by 2002:a17:907:da2:b0:731:60e4:2261 with SMTP id
 go34-20020a1709070da200b0073160e42261mr9912484ejc.679.1660557175734; 
 Mon, 15 Aug 2022 02:52:55 -0700 (PDT)
Received: from localhost (tmo-096-168.customers.d1-online.com. [80.187.96.168])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a1709061b5a00b0072efb6c9697sm3785176ejg.101.2022.08.15.02.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:52:55 -0700 (PDT)
Date: Mon, 15 Aug 2022 11:52:52 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20220815115252.129e2d4c@tuxfamily.org>
In-Reply-To: <20220814233845.2247022-2-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
 <20220814233845.2247022-2-ricardo.martincoski@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 01/33] package/tclap: fix typo on help
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

Am Sun, 14 Aug 2022 20:38:13 -0300
schrieb Ricardo Martincoski <ricardo.martincoski@gmail.com>:

> libary -> library
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
>  package/tclap/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tclap/Config.in b/package/tclap/Config.in
> index 560cf33174..64b0b74c8a 100644
> --- a/package/tclap/Config.in
> +++ b/package/tclap/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_TCLAP
>  	  This is a small, flexible library that provides a simple
>  	  interface for defining and accessing command line
>  	  arguments. It was initially inspired by the user friendly
> -	  CLAP libary. The difference is that this library is
> +	  CLAP library. The difference is that this library is
>  	  templatized, so the argument class is type independent. Type
>  	  independence avoids identical-except-for-type objects, such
>  	  as IntArg, FloatArg, and StringArg. While the library is not

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
