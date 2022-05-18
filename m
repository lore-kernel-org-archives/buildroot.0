Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAB2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66CDB842F9;
	Wed, 18 May 2022 19:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uDFLHOk4ydM; Wed, 18 May 2022 19:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29AEE84310;
	Wed, 18 May 2022 19:19:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53D241BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50C8C41C8A
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plr2nnVzybmg for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:19:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 325FA41C88
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:19:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id s3so4228355edr.9
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GIklSErqb6t3UecYPEvqVohSgtnQ56lb+fLGDhqVOSI=;
 b=To9ocY4tkwGfDNr+fe1k9toE4E7mf5AzV7VXKkpuat/T6759akjKIOgJXU71sJMBPw
 7zsk3hAdaNASFe3jn3lQ3x33rJqPhy04lSg6FQX3YIvnPFf5dRDuHe3wRnOPY4RnMBYM
 4r2d7TW0/dXBd6whcANr7MmIvdruOFmZIUZ9eRqRJF9CIIRYfHbvgVl5GjpSRn2ifqLZ
 +BZGU8jRQ3lubWEoavQ6bnfrk/urwuj3IS7C5qqqRi1IFlh75QsrZe68L9tJS4owV2xR
 73s1di8xQtO6LP5m7GDhpSkiq0rfoSsee8Jqh4aGZqwTPV+Jv2fMWXODT0yc99BGdkCh
 TXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GIklSErqb6t3UecYPEvqVohSgtnQ56lb+fLGDhqVOSI=;
 b=koJT79AiC4PoqjWbxRjjwdBTJlBp5vB0YzzE9EehiUxy+3qQ0JhGRVCV6A0z1ypV/c
 jkPDa9pccgLgz6FjanpAKJVjEoZlsk9IrP9viddTh1IcO0FwHOx8pfXWCB9Q2cJYRUb7
 /b2NNz2soefrMtChejwB+rjICxZGXXARWpi2og3HkgR6nEX+0byQ+Eu1quWGw+O+39Kj
 uofWVNjKkwVCvOxShWhBBsiCDrPReRftizLPp2vLANu7OAsYjzda02vS5oH96CyPxcK9
 h/GWmkU/dkNq3Zc9zh75neu3Ba8T0a1hLndYaFA1xJ/jXdgGsEU932BORlL42X/RsApZ
 ySQQ==
X-Gm-Message-State: AOAM533+EtQfV481YyLdBi3VHGYGJyzTw9lRt9PQXMX9UMmkHGysPy2O
 GCvTSn0Lh9H0wQFVbUAYjsegDKSYOEFczw==
X-Google-Smtp-Source: ABdhPJyt0y/9LwbqoXSNc+stZaWpqXroq0rQ3OZZVhBaRLJD+7BFIbhCLsgXNgSltdecsMYurxf6Xg==
X-Received: by 2002:aa7:c2d4:0:b0:42a:a9a6:e73c with SMTP id
 m20-20020aa7c2d4000000b0042aa9a6e73cmr1361026edp.115.1652901564263; 
 Wed, 18 May 2022 12:19:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 er8-20020a170907738800b006f3ef214e45sm1258827ejc.171.2022.05.18.12.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:19:23 -0700 (PDT)
Message-ID: <9788091e-bf7a-831d-724c-14c635c60980@mind.be>
Date: Wed, 18 May 2022 21:19:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
References: <20220518034225.373194-1-joel@jms.id.au>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220518034225.373194-1-joel@jms.id.au>
Subject: Re: [Buildroot] [PATCH] toolchain/glibc: Restrict ppc64le support
 to power8
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
Cc: mpe@ellerman.id.au
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/05/2022 05:42, Joel Stanley wrote:
> Glibc restricts ppc64le support to Power8 (or later):
> 
>   https://sourceware.org/git/?p=glibc.git;a=commit;h=a27d2c19355a15569dfcdd5da741b57acf1a106a
> 
> The autobuilder has been attempting combiations of BR2_powerpc64le,
> BR2_TOOLCHAIN_USES_GLIBC and
> 
> BR2_powerpc_970:
> 
>   http://autobuild.buildroot.net/results/89eae4c6e28658444ca5bc67caa2644358de97b7
> 
> BR2_powerpc_power6:
> 
>   http://autobuild.buildroot.net/results/bee990c9c34d391cfc4a351a30abc1a0a53a2415
> 
> BR2_powerpc_620:
> 
>   http://autobuild.buildroot.net/results/a0557172757d3bba2b5fc6244c7b9b17ef6be0db
> 
> When Power9, Power10, etc support is added to buildroot we may require a
> BR2_PPC64LE_AT_LEAST_POWER8 or similar.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> I don't think we can boot a ppc64le kernel on these machines either,
> which means we could instead set depends on !BR2_powerpc64le in
> arch/Config.in.powerpc for pre-power8.
> 
> (A power7 can boot a ppc64le kernel, but outside of the lab it wasn't
> really a thing).
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   toolchain/toolchain-buildroot/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 8d9cf4cc68b5..559c2546225f 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -46,7 +46,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>   	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
>   		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
>   		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
> -		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
> +		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc_power8 || \
>   		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
>   		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
>   		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
