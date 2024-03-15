Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9944DC54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50A4460631;
	Fri, 15 Mar 2024 19:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kn9jl3K0_wje; Fri, 15 Mar 2024 19:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B239D60677
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B239D60677;
	Fri, 15 Mar 2024 19:44:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95B741BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 831B480BFA
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HmyIfr0abi_b for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:44:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C10682433
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C10682433
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C10682433
 for <buildroot@busybox.net>; Fri, 15 Mar 2024 19:44:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33e672e10cfso1305354f8f.0
 for <buildroot@busybox.net>; Fri, 15 Mar 2024 12:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710531891; x=1711136691;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EIot1BObt2m12MAjt+7nQr1hcs/gcCz5H859nB5seTI=;
 b=sCq0/vjpZs9qwqOAL6Uvnlp6T64Pc3QK6cm7RMJR3OoWaSi9/3ZHeYDdHb+3jZZf5T
 KlV1CIBg+bU6MxmYpO38fMuMpbHLG10SYMXfjTrRHrP4C4pZg8n6o7xaVOcbI7Zkf3px
 pfnK7I0OsbSOT9mR7Nbl2U26hsLnKCNVVE50NzQzs1k/sXrMBmVm9bNw2uvmzL/KsJQj
 ChQECajgj6uvXWQgJa8VsiJ2bq+lgejAVzcKSKvw2jFCS1CVLt5st8yIdQ83+Rs0Y2cN
 lb7JqauuSbsZy1RJbWXzGPUj90mgqKr5mcEJxWTbQZYGaK+jre+cXuuKh9JC38GXYgzV
 KeJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/pAtXNbRjfDrJH2y8OP23Ti/VUuOGQ6TIPlTebx5TWS+Iq9GKo8G/KP1csUM9SewX4y9okPGDYKhlw0RrTVpZdF7vKuo=
X-Gm-Message-State: AOJu0YyTlFLmLdh8FexNOyuHq/s7P1YVXeDUAiYmpdvDnskFCDt98YCZ
 f/MslXtXSl2ckSNczAkVph4iVmitXUiyumZO+l7jsuPyFshLtIuDFMWXnm2GsM0=
X-Google-Smtp-Source: AGHT+IFOpwNPaDvO7gDyh2dfXFY8TYtwXLAwRbOgT23EiwByXDh1rNm5s+xEi53K106YV/qHIVbA2Q==
X-Received: by 2002:adf:f04a:0:b0:33e:c389:66a7 with SMTP id
 t10-20020adff04a000000b0033ec38966a7mr4344997wro.16.1710531891325; 
 Fri, 15 Mar 2024 12:44:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fj14-20020a05600c0c8e00b00413385ec7e6sm9915039wmb.47.2024.03.15.12.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:44:50 -0700 (PDT)
Message-ID: <721c22fd-00eb-407b-adaf-d5eed3cf0e5e@mind.be>
Date: Fri, 15 Mar 2024 20:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20240314173130.16321-1-francois.perrad@gadz.org>
In-Reply-To: <20240314173130.16321-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710531891; x=1711136691; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EIot1BObt2m12MAjt+7nQr1hcs/gcCz5H859nB5seTI=;
 b=Ik7eiYPoOmW1ivtj0euynuglKUA6gZNnUgEOCK+HACn5KQqEEkQ3rjvhM4PgljEKtX
 c76N5tbpoup++7sGMX/mdCxNKlGLOb5n9D1eX+kSs2I1rwFUKo80cNoXtPekrY0GFxi8
 1dCWHOWPGy4K5xTeYRT5/ViZPrlVukJtQVkoKXht2A1SJvbRl4bjf2b9BJL0YDNKfPhZ
 abllcE0sPTtRpPubwzlVXH50z4zF841qaWnt2G4jyGTZzmfxI1ivuG1oNGCRjExyfskp
 dQAVdFn9XRBaopIz4La7ghUBub6u0hOsKDTOSOJiDO+MYXgpavTbNXgONKsN0HsVn9v5
 tz3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ik7eiYPo
Subject: Re: [Buildroot] [PATCH] package/luarocks: bump to version 3.11.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2024 18:31, Francois Perrad wrote:
> COPYING: update copyright notice
> see https://github.com/luarocks/luarocks/commit/a0bc05dcc7f44b94fb4585c560928ba9be6d8bdc
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/luarocks/buildroot.lua | 3 +++
>   package/luarocks/luarocks.hash | 4 ++--
>   package/luarocks/luarocks.mk   | 2 +-
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
> index 3c044d89b..2b5235866 100644
> --- a/package/luarocks/buildroot.lua
> +++ b/package/luarocks/buildroot.lua
> @@ -350,8 +350,11 @@ function buildroot.command(args)
>         return nil, "Error loading rockspec: " .. err
>      end
>      if rockspec.source.file then
> +      rockspec.source.dir = rockspec.source.dir or dir.deduce_base_dir(rockspec.source.file)
>         ok, err = fs.unpack_archive(rockspec.source.file)
>         if not ok then return nil, err end
> +   else
> +      rockspec.source.dir = rockspec.source.dir or '.'

  This change should have been explained in the commit message... Anyway, 
applied to master, thanks.

  Regards,
  Arnout

>      end
>   
>      if rockspec.source.dir ~= '.' then
> diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
> index 713645692..fbf527021 100644
> --- a/package/luarocks/luarocks.hash
> +++ b/package/luarocks/luarocks.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  ffafd83b1c42aa38042166a59ac3b618c838ce4e63f4ace9d961a5679ef58253  luarocks-3.9.1.tar.gz
> -sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
> +sha256  25f56b3c7272fb35b869049371d649a1bbe668a56d24df0a66e3712e35dd44a6  luarocks-3.11.0.tar.gz
> +sha256  660773f53ed17cd0d8be7d67168c25e8cc664a506788c7b5971192bdd2994a9d  COPYING
> diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
> index 2bec2fca2..4c9922914 100644
> --- a/package/luarocks/luarocks.mk
> +++ b/package/luarocks/luarocks.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LUAROCKS_VERSION = 3.9.1
> +LUAROCKS_VERSION = 3.11.0
>   LUAROCKS_SITE = https://luarocks.org/releases
>   LUAROCKS_LICENSE = MIT
>   LUAROCKS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
