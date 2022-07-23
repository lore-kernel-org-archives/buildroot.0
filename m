Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7349C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8267240354;
	Sat, 23 Jul 2022 19:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8267240354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUa7vVukl98B; Sat, 23 Jul 2022 19:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C12440566;
	Sat, 23 Jul 2022 19:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C12440566
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E44B1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44D4842471
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:10:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44D4842471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFakdPOv3SSp for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:10:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22A04245F
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A22A04245F
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:10:35 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k11so10170402wrx.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TqSbpDjpxxxPLz7l04UhDdu1cv+/JCoRR/wBiNSUHI8=;
 b=WuRLHddq/PAXrdFpaUE8dp/4VAPRqHriRMe9QYQT7XeRjN0IHwGP3Q14w8Dd6rqbUK
 x2XYdLgXkcoDPUVIEiuTmNNg08F4AS/l+8STWWuqOYtvctDtt1Oq4sGnnNBpodBidmE5
 D8qhBr71fD+cQg4enzNwmZNCZ+shrR5UbNv6hsQjZAWBSjLmwgeF2me2u7e/W/sxgpIb
 OShdrBLzQbfMAbSa/ql9D/l6mcup9nLjxzg6e8Vm0iqP9oW8axlKwq0lj5q/9FE130SX
 trezmKa9xAvlXDl3tv20VP7LslHM2O/DY6jvPhgyuuq6Df2fCTAbK1RsUKAaWlZXLml2
 /27g==
X-Gm-Message-State: AJIora/uZH0+xwkUDU/545+oz0l+Jcz4A+fArjJicGBF6X5Bn5efoNPr
 aNgsMFDfhTOZ6m/ocKa/3lbPVjAW44aAbw==
X-Google-Smtp-Source: AGRyM1vEehWyYzqkHqeMbzRH21NcH3FvXenwLHotYvnM0diG/THpEVJp6uFJzpyGcU8LDc9S6BxiWA==
X-Received: by 2002:a05:6000:1789:b0:21e:619c:2c5c with SMTP id
 e9-20020a056000178900b0021e619c2c5cmr3575794wrg.270.1658603433783; 
 Sat, 23 Jul 2022 12:10:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c4f5400b003976fbfbf00sm9643847wmq.30.2022.07.23.12.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:10:33 -0700 (PDT)
Message-ID: <81ff877d-7b32-bc2d-c98b-2677187609b6@mind.be>
Date: Sat, 23 Jul 2022 21:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220618085704.508506-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220618085704.508506-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=TqSbpDjpxxxPLz7l04UhDdu1cv+/JCoRR/wBiNSUHI8=;
 b=SC2Za7fGwMc5UZYYXKZAfQV1GCDW7WxU4AgkZwx9kUeOwoqd6UzycllGHfaLye5qie
 5i7rSlMy7mP+q9m/4m1pqn8ziOi/Et1miLOG9roQvctCUnvCkoSfYGAwv4rSfXag5alh
 PSsscS/LQUfnXKTDgwEE1W0LMtOx7w68CeQ6D5X9lvOesu8PYBr1/rHLJVobgENypljK
 /LOt3MGi3TKefx6tg+6XZTlEz3Ec2jvZGtFQ0/SK+UW3wLN2FDadRx6+DbUw4m7aPHUc
 c7u/t/+DV2Q7/4jaLB7aGIjbLJGxAeIRYhG7wiu537Y/RQWUlIT/vr9y74CULkgHkncf
 67hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SC2Za7fG
Subject: Re: [Buildroot] [PATCH 1/1] package/php: add
 BR2_PACKAGE_PHP_ARCH_SUPPORTS
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/06/2022 10:57, Fabrice Fontaine wrote:
> fiber (https://wiki.php.net/rfc/fibers) has been added in version 8.1.0
> with
> https://github.com/php/php-src/commit/c276c16b6627222c40bd43907475d664734b9abe
> 
> fiber uses asm on supported architectures or needs ucontext since
> https://github.com/php/php-src/commit/8fd747a2a0e9f57c12bdad22a1844a736e7b4e57
> 
> As result, the following build failure is raised without ucontext_t on
> architectures not supported by asm since bump to version 8.1.7 in commit
> 0ddfece7f7e5b10a5da89f2c462616d5deb5b1ec:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: Zend/zend_fibers.o: in function `zend_fiber_init_context':
> zend_fibers.c:(.text+0x68a): undefined reference to `getcontext'
> 
> As fiber can't be disabled (only fiber-asm), add
> BR2_PACKAGE_PHP_ARCH_SUPPORTS to reflect this new dependency
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/f4077bae8f879828e343475318cd2ddb99e09ba4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/php/Config.in | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/package/php/Config.in b/package/php/Config.in
> index 226d2d5fd2..69b4268c1d 100644
> --- a/package/php/Config.in
> +++ b/package/php/Config.in
> @@ -1,5 +1,18 @@
> +config BR2_PACKAGE_PHP_ARCH_SUPPORTS
> +	bool
> +	# see fiber_cpu in configure.ac
> +	default y if BR2_aarch64 || BR2_aarch64_be
> +	default y if BR2_arm || BR2_armeb
> +	default y if BR2_i386 || BR2_x86_64
> +	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_RISCV_64
> +	default y if BR2_s390x
> +	default y if BR2_TOOLCHAIN_HAS_UCONTEXT
> +
>   config BR2_PACKAGE_PHP
>   	bool "php"
> +	depends on BR2_PACKAGE_PHP_ARCH_SUPPORTS
>   	# PHP uses -export-dynamic, which breaks with elf2flt with a
>   	# message like "ld.real: section .junk LMA [...,...] overlaps
>   	# section .text LMA [...,...]"
> @@ -52,5 +65,6 @@ source "package/php/Config.ext"
>   endif
>   
>   comment "php needs a toolchain w/ wchar"
> +	depends on BR2_PACKAGE_PHP_ARCH_SUPPORTS
>   	depends on !BR2_BINFMT_FLAT
>   	depends on !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
