Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A530C54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 20:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FDC841808;
	Fri, 15 Mar 2024 20:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SB5YTed1LhM; Fri, 15 Mar 2024 20:43:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81D334175F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81D334175F;
	Fri, 15 Mar 2024 20:43:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAF871BF30A
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 20:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96E7D6065C
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 20:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCFaGNGw9Y-0 for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 20:43:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0FC960632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0FC960632
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0FC960632
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 20:43:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41403b203e0so5130865e9.3
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 13:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710535424; x=1711140224;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4rKm0za7QVhZZwXIyAWiXFfPDEZIBKG/q2IrUaXcunY=;
 b=adR+ciBKKA+TpCmeAOW9ct90hZAa2dFSrHmnPx+3Wqmo42KEJZvZmr3R7pH8XtvC7m
 SNtvjD72e2bomwcaUZ4xoWg6BIU0trtQGpZVLxDfk0LeSIa9NJYW+kI99JnWi3H6cNJj
 E6DFPolCKSwZcs/L6CTmjK80gwfDBvUkv2PWYuHeNMB57kGrve4s8LMnr+FF0Io6DIav
 MebZZF4t5KX3wB2aqIIPtDnBArCTrXefyl1ZvqKK0Z+2PBD6zexp+KxE2plsmIt6Hmup
 W48gfDBRQV4YtDtYgGUc8odBTlebETDrRYBX3p+arVcud1GHgw+0DZxY2Tn3jwITk4Ss
 62+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtl+aKDe3OffUBG2RhoZdUWRjz7hSU3GtuJYlckMtkQJ8rh4/uQeDL3JA6FkiDAFY5JqpUuALAUnp0e51Qp8twdXdZESIF9A==
X-Gm-Message-State: AOJu0YzrAbJVRppjPNOOguokVmKi7SYMAWlZ4EMejiyoEQps6EtILnm5
 ueaWskwcNzB+wmXtYcHpU2sGIGhe+FwUDi2YF+c6A5JmlXauoYd7ahIeFL+8n0UDvzbBdR4kAcF
 0
X-Google-Smtp-Source: AGHT+IHqqmS6kRNTcy09JosZshVJ3MHnJNN3hxAd0UURg6D7Xy6LXPF4y7ut6MSRfU+M7bbf+COFmA==
X-Received: by 2002:a05:600c:4e16:b0:413:fe47:f793 with SMTP id
 b22-20020a05600c4e1600b00413fe47f793mr3447729wmq.7.1710535424515; 
 Fri, 15 Mar 2024 13:43:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b004133365bbc6sm10014778wmo.19.2024.03.15.13.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 13:43:43 -0700 (PDT)
Message-ID: <c650fc8c-1040-44c6-b13a-4b7240d2544b@mind.be>
Date: Fri, 15 Mar 2024 21:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240312190954.71227-1-brandon.maier@collins.com>
In-Reply-To: <20240312190954.71227-1-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710535424; x=1711140224; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4rKm0za7QVhZZwXIyAWiXFfPDEZIBKG/q2IrUaXcunY=;
 b=CgKYlGg/aDOJBmvxmI/nxYpQ5uTXt9VqPLTQBkIJKkJL9fplQE9LffYL0baSOZ2sEU
 vk7gbE+G+5gRctSQPzdttcCAw3Qpm+SSap5Oj7WQN+0m7W0rT4TGnzT2+Bolo2ZJCtRI
 AKLtV2NIHY3Ef3upvKSP9ei9sb1EA1iRhzWq9+uUDFqkF+Ih8PNRfZAVd4eM4uNPmj6B
 vLw5snnxbFavbyYh69ncVUpAIfZIJZH5vSS6gPwe5Hza0+7K/L9qYkXobpdjy4V0onmz
 YZxUoN8SBBXVn32eOcOM7LnivW+DoTJgV+dimh5yksuWAne6psR0lx0NmgChIK3p4Ohr
 EpAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CgKYlGg/
Subject: Re: [Buildroot] [PATCH 1/1] package/gmp: fix target build with host
 gcc 4.9
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/03/2024 20:09, Brandon Maier via buildroot wrote:
> GMP does not build if the host gcc is v4.9 due to the following error

  Oh boy, are you still using host GCC 4.9? Poor man...

> 
>    gen-sieve.c: In function 'setmask':
>    gen-sieve.c:99:3: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
>       for (unsigned i = 0; i < 2 * a * b; ++i)
>       ^
>    gen-sieve.c:99:3: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code
> 
> The gen-sieve utility was added in GMP v6.3.0. It is built using
> CC_FOR_BUILD (host compiler) during cross compilation as it generates
> build files. Autoconf does not have a macro for add -std=c99 to
> CC_FOR_BUILD, so it must be set manually.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>   package/gmp/gmp.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
> index bd401c6a80..85836a8c72 100644
> --- a/package/gmp/gmp.mk
> +++ b/package/gmp/gmp.mk
> @@ -14,6 +14,11 @@ GMP_CPE_ID_VENDOR = gmplib
>   GMP_DEPENDENCIES = host-m4
>   HOST_GMP_DEPENDENCIES = host-m4
>   
> +# The compiler for build requires C99 but GCC 4.9 defaults to C89

  I don't think the comment is really needed.

> +ifeq ($(BR2_HOST_GCC_AT_LEAST_5),)

  In all the other places where we pass -std=c99, we do that unconditionally. So 
I'd do the same here.

> +GMP_CONF_ENV += CC_FOR_BUILD="$(HOSTCC) -std=c99"

  Don't you need something similar for host-gmp as well? All the rest I could 
have fixed up while applying, but I don't have a host gcc 4.9 with which to test 
host-gmp :-)

  Regards,
  Arnout

> +endif
> +
>   # GMP doesn't support assembly for coldfire or mips r6 ISA yet
>   # Disable for ARM v7m since it has different asm constraints
>   ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
