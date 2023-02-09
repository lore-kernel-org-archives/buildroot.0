Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B88C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 20:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89787812C5;
	Thu,  9 Feb 2023 20:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89787812C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id suqhgJrUhfIH; Thu,  9 Feb 2023 20:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADA1D81266;
	Thu,  9 Feb 2023 20:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADA1D81266
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 919DB1BF57B
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69A13408AC
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 20:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69A13408AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id woX9e9motgEy for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 20:53:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70D9B40549
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70D9B40549
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 20:53:20 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id l12so3275574edb.0
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 12:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dzRNxLPMroMkzrdopoFEtA0erUKwqqfnNb1QeBx7T+w=;
 b=0eEmWWrMPtD2KPuFfbuP90H+58s0lC9laH5S0994+vBKCEM12w/DnTJcxbfbvC+26f
 ZWQ1HJdSCY/ZuXVMrrCLD8FzkIJb0eZlz6DkSqVgdTh0GyxWgvsHd/27dbhsuYKANHO1
 RsP7WyAvqZof7HMoFj2sLT4iTkdJbENg7Zl/jfJHb9Hnt4N3DfQFZWWoAWfb4dy/xu5Y
 34dQuuxyPO8izW80gIBdPftAhUa+0kDeYTiyOBl8/s5F+UhirjFjta0nEmPOgyYk5jBc
 ng06ujyIs1O/odTsNFlVIdbwMdEF6hZZ7ziVqsp74rC3O1RJAaySj3eVduAsmUqmW1FJ
 Qvdg==
X-Gm-Message-State: AO0yUKVRTFla7PaTGPdE1gFjeh25lMES1vpzyABv6+AA2QhrApCksdsk
 6k/6Zo+GyIJKVn8RjoRYveXOL9YFxOZBBRQ/
X-Google-Smtp-Source: AK7set8YYYqYZcl2KHuuJKL6KZZ0FqeT0F6No+v211XxUowfq+gjwTmpWCePTlaW2h3/vlcQuI7smQ==
X-Received: by 2002:a50:d0c9:0:b0:4aa:c4a4:aa5f with SMTP id
 g9-20020a50d0c9000000b004aac4a4aa5fmr8620365edf.2.1675975998600; 
 Thu, 09 Feb 2023 12:53:18 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d1-20020aa7d681000000b00499703df898sm1236867edr.69.2023.02.09.12.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 12:53:17 -0800 (PST)
Message-ID: <b03bb4bc-d520-cd11-f6f8-04402142ed37@mind.be>
Date: Thu, 9 Feb 2023 21:53:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Andreas Klinger <ak@it-klinger.de>, buildroot@buildroot.org
References: <Y+NhFA5/pfRlQbiR@arbad>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <Y+NhFA5/pfRlQbiR@arbad>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dzRNxLPMroMkzrdopoFEtA0erUKwqqfnNb1QeBx7T+w=;
 b=QJ4Hb2/VJOqr7ph1hJUTcrw7yaa3Pqj3uwPXYGpe+GVeKpxJFBg3dby7bu1ZJcmi9A
 yCnLvpOflCl8OWHuVO50a/Zs7YVJAgOXZ+Hg9NnecgtRuSwTDF9Md04MAybRREW1zAso
 T/G15kdf/BW3jTYM7XWlXL9TUpqr9Mmwm3SR6gTnJiaB2+QEwPHnMRPTO47g/wfyUdEH
 LAqQhPArYijF7G/dNuFERRsEupSlmvR5BS+2/kJgnSpD/kpDK5uYrPQX7oEuTBYh526L
 T/LMY9Gec5FUrZiGTRsQNFi7e72+9aQ/ZlNkY0kLrJG+v/nnTq0j7cU+21qj6dwnuJLT
 WmlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QJ4Hb2/V
Subject: Re: [Buildroot] [PATCH 1/1] package/ply: add dependency on Linux
 headers >= 5.5
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



On 08/02/2023 09:45, Andreas Klinger wrote:
> Version 2.3.0 of ply now requires Linux headers >= 5.5
> 
> This was missing in commit b9612601b037e6deb79af300e64e0557dda1be5c
> ("package/ply: bump to version 2.3.0")
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/ce37039991cb0fb02b97d341d78327e54d0e1d26
>    http://autobuild.buildroot.net/results/c00714847ae92dd609bc8990df318bee58be38b8
>    http://autobuild.buildroot.net/results/8210bd2b9c67d6d7616ada525019b2658195416a

  Applied to master, thanks. Sorry it took so long.


> This is a resend, because there are still the same autobuild failures.

  A comment like this shouldn't be saved for eternity in the commit history, so 
it's better put under --- after your Signed-off-by.

  Regards,
  Arnout

> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>   package/ply/Config.in | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ply/Config.in b/package/ply/Config.in
> index 0500e7883f..f7507095c1 100644
> --- a/package/ply/Config.in
> +++ b/package/ply/Config.in
> @@ -5,16 +5,16 @@ config BR2_PACKAGE_PLY_ARCH_SUPPORTS
>   	default y if BR2_powerpc
>   	default y if BR2_x86_64
>   
> -comment "ply needs a toolchain w/ dynamic library, headers >= 4.14"
> +comment "ply needs a toolchain w/ dynamic library, headers >= 5.5"
>   	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || BR2_STATIC_LIBS
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5 || BR2_STATIC_LIBS
>   
>   config BR2_PACKAGE_PLY
>   	bool "ply"
>   	depends on BR2_PACKAGE_PLY_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU # fork()
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # BPF_JLT
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_5 # BPF_JLT
>   	depends on !BR2_STATIC_LIBS
>   	help
>   	  ply is a light-weight dynamic tracer for Linux. By means of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
