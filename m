Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DCBC433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07C964170B;
	Tue,  3 May 2022 20:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GDy4STSB5iw; Tue,  3 May 2022 20:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 615AE416EB;
	Tue,  3 May 2022 20:27:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E4351BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B870416B5
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZJ-wpMq2TfX for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:27:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 637604169B
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:27:40 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id g6so35590729ejw.1
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=IpYmFclWEh5B5ZNBpC1WrPwgO0YcK3Tgnv1lvsURWiU=;
 b=Uz0QypoCP08AgBTmQCNurUGr/TX6uZD4VqVYaudu2em9kYnZHFgResiTmYqh15z4l4
 R8wJwogLr/fxIqmITOh2xjS7Tpu8lrPdkr986YcWWaqKi6K4tqW7Ko47eItbLZLGbVLm
 /7bDT0G0D3qfgaTlRhRs5PeXM6MqVhWBhzA4DHSidR2dSLI4L++gnVv/spXPVWQLObFR
 ywjSbYYZ88b35Cw3Gn8EAUXqdQKfi92i62ZfhDlp0QP8Wyg63TGJFTJ/s6NMbjVfq4zs
 +ABRVVDwxTQF8agQ9JrsR3umlW4jX0C2loG9brUhiqV7R6paAhAQf3pGnV6qL9KjumCr
 YuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=IpYmFclWEh5B5ZNBpC1WrPwgO0YcK3Tgnv1lvsURWiU=;
 b=AewRp9Anf6eRDk9vnmBKTAW5IVwz7F1ngPxSPEZXmSPfkvHrQ9DUSV8mJvrpAjESgz
 fTsxSEBFMw/q/aJlGXfyx7VxUehM7Dxfc7gTDT65mCoQnVGdIMZ4t4KqTGRguPqv0gjs
 O7g4fPkYYbUU5UjgSHy4lMBn35pmimRGP0OCAZXVp5agKoNIcDjux6HL7yYFCP0OypRW
 yQz/Kt6gJJ0SLwILDvNKgHgA+3XnEH4qgW1Y9L9c3h/kJg/mV5hKgdEdWnPThS/QhqeD
 z+YRCHDQvd6R9ed0uID/S1xPPJh28YXH1SMA65c5Y1YeM6jFFnEU6TZUcNZ7uu3Tk+3d
 2JcA==
X-Gm-Message-State: AOAM533kM4EP+cYvPnQPoMFQQkyRM0lp/16exhQweQrzWta3wOqKH4x+
 +5vcG61IKRWVckgFVlr+WatFJtPCEK/abA==
X-Google-Smtp-Source: ABdhPJwzPJ/ZEWttYyXiKvDZBC8qzp6rN69V3WM4aQ4PEjnSYrY3C8TPI4/3THAujSornGAcUdi5DA==
X-Received: by 2002:a17:906:4884:b0:6f3:a042:c1c6 with SMTP id
 v4-20020a170906488400b006f3a042c1c6mr17041102ejq.363.1651609658711; 
 Tue, 03 May 2022 13:27:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 z15-20020aa7d40f000000b0042617ba63b9sm8223769edq.67.2022.05.03.13.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:27:38 -0700 (PDT)
Message-ID: <aed82009-414a-2026-c448-f4667cefc946@mind.be>
Date: Tue, 3 May 2022 22:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220503004943.3170832-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220503004943.3170832-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: use high quality
 random for KCONFIG_SEED
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/05/2022 02:49, James Hilliard wrote:
> Internally genrandconfig will use gettimeofday when generating a
> KCONFIG_SEED, since autobuild-run executes genrandconfig at the same
> time for multiple autobuilder runners this could potentially result
> in the same KCONFIG_SEED being generated for those test runs started
> at the same time.
> 
> To ensure this doesn't happen set the KCONFIG_SEED using the urandom
> entropy source.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   utils/genrandconfig | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 70af84f002..8ed2783a6d 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -18,6 +18,7 @@
>   
>   # This script generates a random configuration for testing Buildroot.
>   
> +from binascii import hexlify
>   import contextlib
>   import csv
>   import os
> @@ -605,9 +606,13 @@ def gen_config(args):
>                     file=sys.stderr)
>               return 1
>           bounded_loop -= 1
> -        subprocess.check_call(["make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> -                               "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> -                               "randpackageconfig" if args.toolchains_csv else "randconfig"])
> +        make_rand = [
> +            "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
> +            "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
> +            "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> +            "randpackageconfig" if args.toolchains_csv else "randconfig"
> +        ]
> +        subprocess.check_call(make_rand)
>   
>           if fixup_config(sysinfo, configfile):
>               break
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
