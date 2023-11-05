Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7528BC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 17:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3636400D6;
	Sun,  5 Nov 2023 17:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3636400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcShkIg1oVst; Sun,  5 Nov 2023 17:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD6EB408D7;
	Sun,  5 Nov 2023 17:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD6EB408D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9B771BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 17:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92044418A3
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 17:40:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92044418A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8G9gg9wcShm4 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 17:40:53 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36EC54188F
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 17:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36EC54188F
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507bd644a96so5286668e87.3
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 09:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699206051; x=1699810851;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kvecd1Cx2tBAMJzO6FqU8WBsP0JrshyCSe1/FDmbcc4=;
 b=O12SipSG7TzUhEmO8KhFRpBcyWRDe7urokNhvoY+wfnWQR0pr0myVQEStPQOq2LfpV
 RL0PydoXAxNrrlwT+087uxLcX5nFC3tj7cw+5P3gYF0ZjPOcWbFVyKOKgXf/2nUPcKQk
 t+mvuWAbbrsjVYIsPtTrywjJALSR3eKt/fGCOOZKtsydH0XUoQHlj38ot/elx60EelZE
 TxB1QBdinD85vw5srI8TKcyItKnvBCzB8P8Jig9qJ1n++j3io4FIwTVLXi7RVAKPjxa6
 8qqY0TkFXmEXGho+OEL0ApwuNPfhmTezL0Z9EqyFF4b6ag2X/aGf+rqeo8wL55fvFBDk
 msbQ==
X-Gm-Message-State: AOJu0YyIF+mgfWocFpbNACYXQIVwQz20z0E6ibPHgKvN4cipxtSkP4n5
 LwO1xvwQOKdqz3OHtSlpHCKt7g==
X-Google-Smtp-Source: AGHT+IFCEuIN0JulDGkKevplzbohrYqFvPTeTM60NjAyrCzUk6wwn8iFo8aRsoH0j98xBBO3VfrSag==
X-Received: by 2002:ac2:5d22:0:b0:509:4645:b78b with SMTP id
 i2-20020ac25d22000000b005094645b78bmr6867736lfb.10.1699206050477; 
 Sun, 05 Nov 2023 09:40:50 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 fd20-20020a056402389400b005400dc94f43sm3405463edb.45.2023.11.05.09.40.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 09:40:49 -0800 (PST)
Message-ID: <ef809271-fc0b-4e08-a085-4c997881b7df@mind.be>
Date: Sun, 5 Nov 2023 18:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Reza Arbab <arbab@linux.ibm.com>, buildroot@buildroot.org
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
 <20231009151729.2223963-5-arbab@linux.ibm.com>
In-Reply-To: <20231009151729.2223963-5-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699206051; x=1699810851; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kvecd1Cx2tBAMJzO6FqU8WBsP0JrshyCSe1/FDmbcc4=;
 b=EeNzEpZwfkhr0LkwNaoG+1lIKscovd2O2LR020dJvBDkmnqkRMhsw0VFSgMKfsWY8B
 Bl50+uaG5itzMe/95KhCyS95zd2She14B7YdbkEfOvKf52TmOXxtqJxJIJhstrG9nd6e
 9UWJYjNpVoOKN3WAYdbXOMZPuNmmO9rP6sKpQWynZTuOVIDTwXa4Naip2Mq0d8lkwET3
 rkxZ+XONajFPJ5l5z29b6vyt/ZN1IZ17mFYds0z95W5eLBFUh4mHyAFDshIuwaOcY+nZ
 IdeofJgS/xBq0YZb63tnhglU9/mGAyMYfXp3fJv8+LaDg9gNbp396jXA0ZHzjDjcOgjP
 VlaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EeNzEpZw
Subject: Re: [Buildroot] [PATCH v3 4/8] package/petitboot: prefer kexec-lite
 on powerpc
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Reza,

On 09/10/2023 17:17, Reza Arbab wrote:
> This is a better choice on devicetree-based platforms.
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> ---
>   package/petitboot/Config.in | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
> index b534b4900e88..4981c165bf76 100644
> --- a/package/petitboot/Config.in
> +++ b/package/petitboot/Config.in
> @@ -11,12 +11,11 @@ config BR2_PACKAGE_PETITBOOT
>   	select BR2_PACKAGE_ELFUTILS
>   	select BR2_PACKAGE_LVM2 # devmapper
>   	select BR2_PACKAGE_NCURSES
> -	# run-time dependency only
> +	# run-time dependencies

  This is an unrelated change (sorting the runtime dependencies alphabetically 
and removing the repetition of the comment). Ideally, this should have been a 
separate commit. Failing that, it should be explained in the commit message. 
I've done that.

>   	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE
> -	# run-time dependency only
> -	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
> -	# run-time dependency only
> +	select BR2_PACKAGE_KEXEC_LITE if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )

  If the user has already selected kexec, then we'll have both kexec and 
kexec-lite. I don't think that that is a good idea. So instead, I injected a 
separate commit that introduces BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS, and use 
that to simplify the condition here and to only select kexec-lite if kexec is 
not selected:

	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && 
!BR2_PACKAGE_KEXEC



  Regards,
  Arnout

>   	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
> +	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
>   	help
>   	  Petitboot is a small kexec-based bootloader
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
