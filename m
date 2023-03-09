Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3506C64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B27061786;
	Thu,  9 Mar 2023 20:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B27061786
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U503cptQPneb; Thu,  9 Mar 2023 20:06:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C77D961386;
	Thu,  9 Mar 2023 20:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C77D961386
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 505731BF3BA
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 369D482202
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 369D482202
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsh2bSN7qH4T for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:06:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7176E821FF
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7176E821FF
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:06:45 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g3so11813395eda.1
 for <buildroot@buildroot.org>; Thu, 09 Mar 2023 12:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392403;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FCdoDsXLso+Ol72XkqKFYd89avxWYsWROXLTRUtmkgo=;
 b=mNqKYHuurjk00MWE0/nHP/Zd3qUTu6cyfU/a59nK4STVI4cW4wiZFR/zfTI/7h8IIb
 8U++aTtKYjRFDDXH9qLzClr9RdbgaFjrGUZ0IxAd6K17jqw3HsVYyXQG63SpnHhEcHE4
 6supMAtH5w/uUp4juy2APqPkKcpjczi+pWO0DuKXRvUU4qKK6TJjOxQAU4Zr3NZ0U3ye
 GVCwTx3MDgxjW85SQjZDOPiLGP8ZevM6Z0F0ju1CxkBa3kjDZbeIGpp7tnRanVLrjCGo
 wFtu6Dh+lKrWcDK4BO1jdLS8VGsW7mBr5lUv3bEBdSRUfCEMw0Y4ysTYF8fZf6d9iUlA
 1lBA==
X-Gm-Message-State: AO0yUKW1bYcIGAJe8jGEOT4z9CrYMfgxg7SiRMvCExzcWieOqzuTSH11
 d+juypfoD/0QBXc9VRC7Z2UU73zQsKp0bmx8KA8=
X-Google-Smtp-Source: AK7set9/4IFqmzzqXAVgSmiV5LCbzF0Q4/7HCADlTTgSI/pVvZCot9fIk119HF3DFAz2fzmQJiuwgA==
X-Received: by 2002:a17:907:6d86:b0:879:ab3:2864 with SMTP id
 sb6-20020a1709076d8600b008790ab32864mr26441959ejc.24.1678392403627; 
 Thu, 09 Mar 2023 12:06:43 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 ib21-20020a1709072c7500b008cdb0628991sm9290335ejc.57.2023.03.09.12.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 12:06:43 -0800 (PST)
Message-ID: <c805a208-5724-5192-ce9b-324e0e3e625c@mind.be>
Date: Thu, 9 Mar 2023 21:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230303222658.157671-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230303222658.157671-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1678392403;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FCdoDsXLso+Ol72XkqKFYd89avxWYsWROXLTRUtmkgo=;
 b=PmonGFwhLLhnRG/jt4uwsuJLfqhdbyAE3aLhUISDDZ4CaQMTDblNLssoqt4xsVoP1U
 XG1UWKdUdBL/+70bzZP8nzCxIXL79NuuUGcWciPIey7Wbi/7uyHK2CC1YHgWcmpp5M9K
 1v4OvllqcBjSzlopCOhxoKunLjj6pAIp5tSw5TaDWuZo+WLtp8g9n9PPAA2fY0ydusI9
 bD5N2MG2mbkv/QFLYDcslShFt121ZJOLwfPK+Gve863q9EbhjWMl0d+S3VoWEzIWR4/z
 kkg/QDKcBw3mz3JU6tXtLlBPBY/hmYSImSoEq/zylz3s5iiZz8fWCnMBbGrpdF2b9AF4
 QMPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PmonGFwh
Subject: Re: [Buildroot] [PATCH next 1/2] DEVELOPERS: add Julien Olivain for
 package/kexec
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



On 03/03/2023 23:26, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d052e59122..21ea2b53e8 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1693,6 +1693,7 @@ F:	package/fluidsynth/
>   F:	package/glslsandbox-player/
>   F:	package/gnupg2/
>   F:	package/highway/
> +F:	package/kexec/
>   F:	package/libjxl/
>   F:	package/octave/
>   F:	package/ola/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
