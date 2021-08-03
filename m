Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C43C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:07:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D493A60C3F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D493A60C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11814044B;
	Tue,  3 Aug 2021 21:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUS844tPkMP9; Tue,  3 Aug 2021 21:07:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9D9F4039B;
	Tue,  3 Aug 2021 21:07:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 587461BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 551FF8350A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4lxp2X-h6rPK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:07:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6025E834FE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:07:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id c25so574912ejb.3
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 14:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ovLOiGvkpnZ+6SKPB+CvhQv4194IxbNzSLgp9d4vcDs=;
 b=QSwp2xqI4qvXWWU8H6QtAE8O9ObPiYumXDBj6zTb3GITcGj0IoVpTadOjH6Pi/aGPI
 eImGAfX1eQS77KWNyxyQ4oh20CqZok4m/AWhubM2rW59VPz22+C9hrob2kTZ/HDvLxjD
 9jU/JfvFGzNiZB6L9l8py1J5hwFwCPS+dbnHy9eWlu5FsJDnrFeiA63gLt+/cr0EnDNZ
 CUpqZoKgWvpvmroLRM2ODB/hqayZANuNjga/otZx/OSJrbY1Q+vl1qJQHX1DB1BlgEM6
 YMtrhZSZDmf4E4h9hVfzHLw8+GHVgl7zS9A6/zVA/j/wyvrVYJ9trSRDZcFZRqJQNw6k
 xaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ovLOiGvkpnZ+6SKPB+CvhQv4194IxbNzSLgp9d4vcDs=;
 b=Nvic337agKDSZ97tXsQPozzfqtYj9qduCiz2bVXcLG11NTkmI4Z4LWY/Q99pfJSQOI
 Cyv+Bdy0YYC49sYAvkzW5a8ebVRypTlqxCi149Z5coVnm5Ytddi5NZJErPk8+D7rKF8b
 TUTUX1UU0Sa3rzGNBJ4fRrDf2XTm2/FieGlfM9J+qnJ+1gJnyAgcDEGIoWMqzqdF+dbM
 KkFEz9KaVJxK5K7OPMkWewVA8LmNMqD613bqJ3lOW65/GYqeBQNJfEZ1riyT6FY+qWCm
 aUGGykaXC8ByKdwGyKhEAMK33cMpYvlg9thKOzVPpj9iYlDFUsG2EjTLV61EdWnBfOE9
 ODeQ==
X-Gm-Message-State: AOAM533Ha3lWIgf4K2fMXIy+Klvl7QKP2LzfcluuaAlMWZsFyhXnqEti
 VVXFIk2NSu6Imfvh5r0vfQ0j0O8ZLWA0ajWib30=
X-Google-Smtp-Source: ABdhPJzhy6vvZdRZwf5Gi9XPuz4XKsVFfRHJ5oLXH5myRpXXDI7lKD5V7AawwPFmLcEqesVdSGYH2A==
X-Received: by 2002:a17:906:dc4b:: with SMTP id
 yz11mr21574965ejb.402.1628024845424; 
 Tue, 03 Aug 2021 14:07:25 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id o22sm51512edr.19.2021.08.03.14.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 14:07:25 -0700 (PDT)
To: Frank Hunleth <fhunleth@troodon-software.com>, buildroot@buildroot.org
References: <20210802135203.3059317-1-fhunleth@troodon-software.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <4c52ccf8-3f9b-77b2-c8a9-f4b35fb26682@mind.be>
Date: Tue, 3 Aug 2021 23:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802135203.3059317-1-fhunleth@troodon-software.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/erlang: risc-v should only add
 risc-v
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 02/08/2021 15:52, Frank Hunleth wrote:
> This restricts the Erlang RISC-V update from
> 0bab8c1089983a4b5f0f2acfe5cad77b02d6f654 to only enabling RISCV_64
> rather than enabling builds on all platforms with toolchains that
> include atomics.
> 
> This fixes build errors on SPARCv8 and other platforms that look like
> this:
> 
> /tmp/ccD9Q9F7.s: Assembler messages:
> /tmp/ccD9Q9F7.s:230: Error: Architecture mismatch on "cas [%g3],%g2,%g1".
> /tmp/ccD9Q9F7.s:230: (Requires v9|v9a|v9b|v9c|v9d|v9e|v9v|v9m|m8; requested architecture is v8.)
> 
> Fixes:
> http://autobuild.buildroot.net/results/a57/a5779e22c41eb63b8400409f26f96b924fdde1bc/
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/erlang/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/erlang/Config.in b/package/erlang/Config.in
> index b6b100f38b..15931b5896 100644
> --- a/package/erlang/Config.in
> +++ b/package/erlang/Config.in
> @@ -10,7 +10,7 @@ config BR2_PACKAGE_ERLANG_ARCH_SUPPORTS
>  	# __atomic_* builtins
>  	default y if BR2_i386 || BR2_x86_64 || BR2_powerpc || \
>  		BR2_sparc_v9 || BR2_arm || BR2_aarch64 || BR2_mipsel || \
> -		BR2_TOOLCHAIN_HAS_ATOMIC
> +		BR2_RISCV_64
>  	# erlang needs host-erlang
>  	depends on BR2_PACKAGE_HOST_ERLANG_ARCH_SUPPORTS
>  
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
