Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E17C433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 498D641061;
	Tue,  8 Feb 2022 20:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UXv7oysSnu0; Tue,  8 Feb 2022 20:28:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7492B40A02;
	Tue,  8 Feb 2022 20:28:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CBEC1BF390
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57D1340A02
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4x_QD7R0IC47 for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:28:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F8A3409F7
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:28:55 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a8so1018572ejc.8
 for <buildroot@buildroot.org>; Tue, 08 Feb 2022 12:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jEb5Jz3g3mmKvXXdtATPfY2LqtZmB2y4d/ecATx6wps=;
 b=TGewVwp76q+dALnKjJcpZKXY/470UOX7Bsnbm3H5pHYwZlCLsNLHTWDyKmoG+bkrc/
 MAIkkKfY642dt/0Tdbmt8p5NhzS9FFNWNM1KNYuT8I69iKMA7o5QM5/SReSHgzEOfiJD
 AD426tWt3q3c7PjZ/QCtiD3miM4gfLwiABNvKtPTtciWHGGgfI6A8/CaQVK3/Pu7acuc
 tSJeIWLNWxe+1m5LZvQEId2o2iRY6HcNSiJv+nKuxDPIWA+dQHSRqS5Hsem7jS1P/Yq5
 spooBJCcyySHSab8wdtqHWaWU2U4VCb+oydb+Dak3wYdzSzKZCGsEwk+b2Q2UrbAIAzg
 WUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jEb5Jz3g3mmKvXXdtATPfY2LqtZmB2y4d/ecATx6wps=;
 b=tdnyLDUzdZxUPwi32d1mHluvN6IZPzFlZhCZNhZDddFZoZkp3JqRh7OCdwCGRiXsl8
 pEnLoNlm40Vi4wdSVeyKUl8SLEhmtBm43+F1OQQMbdVsgOOdWLu5t7zNzFuaaelaNK7b
 0Y3zwdsSzfJXGniGCBT6aALWFPnEHAb2ffwDQApjXEVKVBnq/mp7rHAQAj/aaDXDzqBK
 yN57w/G8Qb8HycmicIqh5nG/YP4vcXnfUW9TbEFspENNX5G7oXU8jjqU8DNMMKL4lSI3
 2htcuYfjRQ7Z1+MLDtr/QqnglRfHv/pfWNM0ONBoN2OrbN48Ngj6diJPgDC6nhfeZVl/
 JR5g==
X-Gm-Message-State: AOAM533dxI7N1Vz0gPAW3ZPF21eM81VscpJBipST/0fBArmRdfmgTUVA
 ZDvJwXBBeVfr57pk6qhFtITWdQ==
X-Google-Smtp-Source: ABdhPJxap/PHiwVyoHPFhImerbVVofrPI/NJ0JsY9zoxMBaylEhuuNmGY4iWb37xTCBRisAjOFx63A==
X-Received: by 2002:a17:907:7246:: with SMTP id
 ds6mr5215507ejc.762.1644352133650; 
 Tue, 08 Feb 2022 12:28:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d7sm2088083ejp.98.2022.02.08.12.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 12:28:53 -0800 (PST)
Message-ID: <cc623b63-715c-2456-18b4-890857e304d7@mind.be>
Date: Tue, 8 Feb 2022 21:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot@buildroot.org
References: <20220115200306.14037-1-patrickdepinguin@gmail.com>
 <20220115200306.14037-8-patrickdepinguin@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220115200306.14037-8-patrickdepinguin@gmail.com>
Subject: Re: [Buildroot] [PATCHv2 7/7] linux/linux.mk: correct
 LINUX_ARCH_PATH for sparc64
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
Cc: romain.naour@gmail.com,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2022 21:03, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Buildroot uses variable LINUX_ARCH_PATH to refer to the arch-specific
> directory in the Linux tree, which may not necessarily be arch/$(KERNEL_ARCH).
> 
> Buildroot already accounts for the case of KERNEL_ARCH=i386 and
> KERNEL_ARCH=x86_64, but does not for KERNEL_ARCH=sparc64, in which case the
> correct directory is arch/sparc.
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

  AFAIU this is completely independent of the rest of the series, so I applied 
to master, thanks.

  Regards,
  Arnout

> ---
>   linux/linux.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index dd2eebd446..35e2484588 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -242,6 +242,8 @@ ifeq ($(KERNEL_ARCH),i386)
>   LINUX_ARCH_PATH = $(LINUX_DIR)/arch/x86
>   else ifeq ($(KERNEL_ARCH),x86_64)
>   LINUX_ARCH_PATH = $(LINUX_DIR)/arch/x86
> +else ifeq ($(KERNEL_ARCH),sparc64)
> +LINUX_ARCH_PATH = $(LINUX_DIR)/arch/sparc
>   else
>   LINUX_ARCH_PATH = $(LINUX_DIR)/arch/$(KERNEL_ARCH)
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
