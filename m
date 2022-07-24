Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA4EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6652161B19;
	Sun, 24 Jul 2022 10:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6652161B19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E64I_pcgD3yZ; Sun, 24 Jul 2022 10:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E05261ABA;
	Sun, 24 Jul 2022 10:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E05261ABA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 67A931BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 413B540B97
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 413B540B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ume0ZDhPhjIu for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:31:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4359D40359
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4359D40359
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:31:57 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z13so12112621wro.13
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=B8pAfOuMuTZ7+AfXlmPGQMgxkZ/da/RcaXt9a5GRIJg=;
 b=0w+9B0XgBudqNZMu95fLyRf+eqQcWP6H1h1XWCa/BTzIo28MHIxggP3PGOOb5viR3A
 J6lArk+y1YDOECOD8GSxCMSh+WUuOcwuR+5V9VY0jiZi0FUyjdFDjuNmXNz/jfry792T
 YYA+OU1VRNYs7q1BNzrkS3nXdYnr+PC7kCuGdiMdT6Sj41e9/vpoAWgjpuMoJYy1dvfK
 hktjHdtHKWJ9VUNJVWGmMxQ5D8g4LAqvdBwmDm2m4rGKj5ImhzzG31mH2c/M8a2KasV3
 JCM/TrywYZaSlQrH45zVkSsVGmvdNO3/xZpgiF69YtvvaeGWAWNi8w3us97UF+9g6kIq
 3qSw==
X-Gm-Message-State: AJIora917s/xTK3isLy60hTcTp1gTxyKdAxVgVreofjoM4Xfw6aOn23h
 iXwcdBQrj8Rq9EzA1wgCA4xYYd5zniEO3A==
X-Google-Smtp-Source: AGRyM1vkfIrJfu0w9VROS0wELpRc6zkaWW1ZiYGhL8A8F1YBrKKehIYSTD2KqQqUrCUxeRHqAcZIoA==
X-Received: by 2002:a5d:6848:0:b0:21e:5e37:b2e4 with SMTP id
 o8-20020a5d6848000000b0021e5e37b2e4mr5068495wrw.530.1658658715385; 
 Sun, 24 Jul 2022 03:31:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b0039db31f6372sm12540352wmq.2.2022.07.24.03.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 03:31:54 -0700 (PDT)
Message-ID: <8b554be7-d9c3-74ce-2684-c6ab2d6c9a05@mind.be>
Date: Sun, 24 Jul 2022 12:31:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
References: <20220723210523.293598-1-romain.naour@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220723210523.293598-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=B8pAfOuMuTZ7+AfXlmPGQMgxkZ/da/RcaXt9a5GRIJg=;
 b=LqvrW0VCIVz/rv6kNLiHKyibY9mbzkns9IXFDe3HrlJI3f0XVjJWACyOgbTxmQDjRB
 sqcM22vi0OLNHw9AKi89VCcmIiFjqSKMTfHr4uR0SczfCDJoSzMpmJsvv1lktOao6wd2
 zatg9zdLfYDjB6nQhJWqIj1lwjld4+l8dm6MN/f21CgYn0qi5xKTu8XplHbhpPtp/ORv
 dI9Ibvy/rY3aX8mdHrC7LTBxJRE3itiJgbIlKP7EH7G6ySYwhvrPaEYxDUvc61ODvqia
 sVd5yBtx4TLUopQFDHhq7eRlX981slEwW+Nnh3zKeLV8c2BEMZQLgN41rNNXsqaiEsyu
 Mtng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LqvrW0VC
Subject: Re: [Buildroot] [PATCH] package/mender: remove single hyphen
 command (2)
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/07/2022 23:05, Romain Naour wrote:
> Single hyphen commands has been removed since Mender 3.0.0 [1]

  I just added mender-connect which also has the hyphen. Is it wrong there as well?

> 
> The hyphen was added back while fixing check-pkg and shellcheck warnings [2]
> 
> [1] https://github.com/mendersoftware/mender/commit/fd838ec1b08f3d429b1d81607e9c35a87a104ee6
> [2] 0b350cf7569005d3eec6bb55a3acd4688d2fbd4e
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Adam Duskett <aduskett@gmail.com>

  Applied to master, thanks.

> ---
> We still have a patch adding a simple Mender runtime testing that would
> catch such issue:
> 
> http://patchwork.ozlabs.org/project/buildroot/patch/20220106144301.1022644-1-romain.naour@smile.fr/

  I'll get around to that one - eventually :-)

  Regards,
  Arnout
> ---
>   package/mender/S42mender | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/mender/S42mender b/package/mender/S42mender
> index 29008beca0..0f2077d089 100644
> --- a/package/mender/S42mender
> +++ b/package/mender/S42mender
> @@ -5,7 +5,7 @@
>   DAEMON="mender"
>   DAEMON_PATH="/usr/bin/mender"
>   PIDFILE="/var/run/${DAEMON}.pid"
> -DAEMON_ARGS="-daemon"
> +DAEMON_ARGS="daemon"
>   
>   start() {
>   	# If /var/lib/mender is a symlink to /var/run/mender, and
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
