Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF847C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5998461142;
	Sun, 24 Jul 2022 12:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5998461142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXmS-GwJFsgg; Sun, 24 Jul 2022 12:18:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B891960F69;
	Sun, 24 Jul 2022 12:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B891960F69
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 023EB1BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D198384C44
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D198384C44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rItgvlxlgKyC for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:17:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E14D484BD2
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E14D484BD2
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 12:17:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id b6so5226413wmq.5
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 05:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Ckw7ubkNu6DLkJPh3/Dzz63T1LACJNSWWORpxoI+wtg=;
 b=5+jAchoGGQDVY2denEpyd7iL6GyKwjA8C0MDhLIAUIwarMFumwvVT0FQ9g4jim1OtL
 BwrrPrmAZybaSssd+da2RhJxhh06k0YC7kwOAo3KGlZDUmnQg9A9VmYvLJyNRM3KMw6P
 IXv40tvUklZyxka45pJygllHgv1A2qQ6BvuqwsTuX0+hiAt+oAyKNVSFhJiPk5Pxf85W
 fsq7mZ9DoHuydby2uJ0RTi8tJuwTT1XnHbN8zYeaCdttlHgE8O7z7LTQOiHrPcP8cDkm
 6Ro1MtZdyjxn9mFppEuPop/8JpuMQpEJB9z3YrxxiO49NsBDkKlN71M7yBIBBfjicSb8
 TLmQ==
X-Gm-Message-State: AJIora/pFvyXz9hk63AN55KRrmVAhU9B2Bk3ctifq2NtKyT77b73Dy/x
 jRZEBwAxeW/lLK5dvepa5R5tJw==
X-Google-Smtp-Source: AGRyM1sSc23UX9mtuEhd6+agpKyfLcNc8ypFhb+O04xGX1yoePdq0zrXbWv2Q0OtTEMuvCT5q3yrlw==
X-Received: by 2002:a05:600c:240a:b0:3a3:5452:4262 with SMTP id
 10-20020a05600c240a00b003a354524262mr1700301wmp.86.1658665075118; 
 Sun, 24 Jul 2022 05:17:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a5d6446000000b0021db2dcd0aasm11094151wrw.108.2022.07.24.05.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 05:17:54 -0700 (PDT)
Message-ID: <075a30c5-051a-a3dd-a7ed-555eac8c7394@mind.be>
Date: Sun, 24 Jul 2022 14:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Francois Perrad <fperrad@gmail.com>, buildroot@busybox.net
References: <20220724063311.3305437-1-francois.perrad@gadz.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724063311.3305437-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Ckw7ubkNu6DLkJPh3/Dzz63T1LACJNSWWORpxoI+wtg=;
 b=YtVzyrNvMhUds+pfqu++BJwTMjX0g5yHZoLK4M89u5SqfeK2dGGULoQVNIUOtW72kE
 R72tLmZ+REsqHaF+jvOHx/HIJnC1Gwkng60vzlhRIw8ho7UVgzUWZruG9N4n989Z9P7V
 g5nRoSvf/7MG3EbbCgjwSO+7J82+uYDQNbDKt+x9eobupzFFADQvxl+Bm+wnz/KJi0B2
 b1vhCFUMtfTdU8NxxuhtMvvJ4UwslEuuKZa3Uo81eMgGKvFh9Al9YB0CZkFVUuDrlXAH
 6FPVhVbug9PEWP1NEZrwhsu0Vk2A5fO7cykMVKjkPJVN41WXx12hv65VRkasjDtPvzzK
 Sg5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YtVzyrNv
Subject: Re: [Buildroot] [PATCH] package/moarvm: bump to version 2022.06
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



On 24/07/2022 08:33, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/moarvm/moarvm.hash | 2 +-
>   package/moarvm/moarvm.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
> index 31d91457e..a2a022393 100644
> --- a/package/moarvm/moarvm.hash
> +++ b/package/moarvm/moarvm.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  ae06f50ba5562721a4e5eb6457e2fea2d07eda63e2abaa8c939c9daf70774804  MoarVM-2022.04.tar.gz
> +sha256  598ddf88c18f4d3825970cd391eebcaf66984d43ebf1ef43116356365b6bfe60  MoarVM-2022.06.tar.gz
>   sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
> diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
> index 1408f161f..154a783f2 100644
> --- a/package/moarvm/moarvm.mk
> +++ b/package/moarvm/moarvm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MOARVM_VERSION = 2022.04
> +MOARVM_VERSION = 2022.06
>   MOARVM_SITE = http://moarvm.com/releases
>   MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
>   MOARVM_LICENSE = Artistic-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
