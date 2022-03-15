Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65547C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02F54408DE;
	Tue, 15 Mar 2022 21:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7DQlC2gd3VLH; Tue, 15 Mar 2022 21:47:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C581F40573;
	Tue, 15 Mar 2022 21:47:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9B3F1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98E034162D
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwFe5Nt1SngQ for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:47:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8C88415BA
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:47:53 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id w25so485049edi.11
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mjK+dYXdOBe0LhuE6i9CBT2AK1S/Fl8Moy9Ev9W2lN0=;
 b=eemGq8TNmbrM0gyxue0hgd96OMx9RR0QyvY6frlpYPyZn4S7GpSCEruvSNxGwW4Vnc
 BWnHXem518foYYdxnRio2AdqaVaiR45ViPscQ5Ab7YnCJNhFCNKA5TZ5wKjhZBcOO/iA
 eTaymMO2NgaqKM21tfwrgipbHu4qDRbkqO/ABgkvvsqZ35Nur1VCzeh7NgIfGWXMZK3n
 RO9mpzTt2/rPDePhN9YLXvh9dUcSO4F5MgP/fL1zpplHzVaQhDSluW0xSrZRvRYhm9q9
 y9s51PrU52XIwxMp56SLK3SK7XqpRlAuTPGiy/UzvAObKlXYUoM4hj8vfmOtBmqB2YN9
 8qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mjK+dYXdOBe0LhuE6i9CBT2AK1S/Fl8Moy9Ev9W2lN0=;
 b=UipufizSSfLo/i64X7GNJQGxnICGtGesCd+HDNok1eokXR6QpyrzGt/uaPgqvntr9/
 Fo2oDBZ3n1AGIzn0IF/tv4wZYPRC8h3x1QyJWU1FPWUyaeT0jmaLFTecAuhbFK9lZ1VP
 QZwqOHG2WIzP5IzEXtAJDBSjh/NY5eH8bYU+V88Oggrxeks1F3pYu964HFqTTSgXskEc
 RSCRHszjGDv9DvYZ9ihKZcFH4cNO+63D2t9flcghhrGayBxwRca3+DoPr9zaMeofJRO8
 7dyGfuZv+mPnwwQvU0zFwf6CeeT0GNvflI9MzCXeQmr0BFgFDLJzOF3FnIlVTbYdOZ25
 FMyA==
X-Gm-Message-State: AOAM533NgaOTMLEC6DpYzC1ChtP0v9s8utzWYUV5PxDSHpGu6FRIgpzH
 Ec6gfnwtHG6pr/INIH6chumYLQ==
X-Google-Smtp-Source: ABdhPJw/vQ3z5cTP4woKdvA4wl7J/jXFfSdKh9NG5XuohCc2kQg9NPkq/UzeBGRVgJ0yprezNsqByQ==
X-Received: by 2002:a50:aa8c:0:b0:410:801c:4e2f with SMTP id
 q12-20020a50aa8c000000b00410801c4e2fmr26527593edc.179.1647380872105; 
 Tue, 15 Mar 2022 14:47:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u5-20020aa7d985000000b004024027e7dasm89995eds.28.2022.03.15.14.47.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:47:51 -0700 (PDT)
Message-ID: <cc2a1ef4-bc53-47d7-6ace-3639229882b6@mind.be>
Date: Tue, 15 Mar 2022 22:47:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220309213459.677932-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220309213459.677932-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/usbguard: add
 USBGUARD_CPE_ID_VENDOR
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/03/2022 22:34, Fabrice Fontaine wrote:
> cpe:2.3:a:usbguard_project:usbguard is a valid CPE identifier for this
> package:
> 
>    https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ausbguard_project%3Ausbguard
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/usbguard/usbguard.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
> index 8df8aedeb3..54a4031056 100644
> --- a/package/usbguard/usbguard.mk
> +++ b/package/usbguard/usbguard.mk
> @@ -8,6 +8,7 @@ USBGUARD_VERSION = 1.0.0
>   USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
>   USBGUARD_LICENSE = GPL-2.0+
>   USBGUARD_LICENSE_FILES = LICENSE
> +USBGUARD_CPE_ID_VENDOR = usbguard_project
>   USBGUARD_SELINUX_MODULES = usbguard
>   USBGUARD_CONF_OPTS = \
>   	--with-bundled-catch \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
