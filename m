Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A5FC433EF
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 20:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDE4B83E31;
	Tue,  3 May 2022 20:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ees-JwdD_A3; Tue,  3 May 2022 20:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE96F83E17;
	Tue,  3 May 2022 20:19:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55CEB1BF2C1
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44820417A4
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 20:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tKAP8o-9WHr for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 20:19:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA92641797
 for <buildroot@buildroot.org>; Tue,  3 May 2022 20:19:05 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gh6so35606118ejb.0
 for <buildroot@buildroot.org>; Tue, 03 May 2022 13:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+RTwliWZ1NEEbvzOusmx3SMnLbsP1M+jYGV5PrihWG0=;
 b=BvBfVE5Ae49OezcqYbdUV6hPo4PCrJoCZq0OLL7+E5kexRj4UdI8nmeDQ+16ZEeMR2
 x9WiO4bvzVx1ZyhIJ/S7fI8otzPiFC4IFR+yTQyJVW5L0RZsQy7dWGD5c1EpcgSFqrCx
 4ct4oYlhx1vAuO+y70uIljA/WxCaCfm6YnweyMiBed34WrgWPjuk8wyPkIhhBJCQ0CqY
 fme10IqeWgg5TGfB/bzhWjMn2EIpA/9fLJrrBCsjqXqML2Y0/x7/mJi9bffdWjoLBVFt
 tmDujptLfVS7vCR7BfU2Ka2tBut2HqPS3vDu+h5I/bTSgQqFi9NhiJgWlYy7ulTM25x/
 6q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+RTwliWZ1NEEbvzOusmx3SMnLbsP1M+jYGV5PrihWG0=;
 b=NZRVdHWdMakITD5h0FvDMjo/k/wuxW01S0mOxBBTC2DBgo5SFF+SfNRyO/eYyZWkye
 h26YJwgL6aT3+NHNYfhBiPJBzZnNjeLcKoQBv6jMdVvxYZX1L5UmglCe40juGxPrlHML
 QVJy3dSgu9o8RPBrYxVQXNIQc24C57+toW9llK8/IQ5bHh83uxj0dieuw6VlVXeSVnM6
 C0eeuCRWqA3ASqvJxIHBijZP8prnb979k58sDbknkfmNVp4/t2kBR32UXW5OufmHJupq
 rySPNTim0/7K610KZKzi6Q5+tNqV6grCb293h7pL1WAr6cs+l3DZU2NgAmq+Z/5kXbSC
 n0uA==
X-Gm-Message-State: AOAM530Lc4aP0vmn+wLlhu1cGooBEh/D2tRIjAiVKg3sVN44PaNAt578
 ajS1AHUrnpylq3usGLVMjloJrQ==
X-Google-Smtp-Source: ABdhPJy5anCyFIA23GoEMVhmcI2Y2bs52e+9Ps6PBpZqMKtg29Aq/hL7LWVJi73Qrc8o5N5tocYqtA==
X-Received: by 2002:a17:907:1b02:b0:6ef:ea73:b2ea with SMTP id
 mp2-20020a1709071b0200b006efea73b2eamr17360205ejc.753.1651609143997; 
 Tue, 03 May 2022 13:19:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 t19-20020aa7d4d3000000b0042617ba63c2sm8279031edr.76.2022.05.03.13.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 13:19:03 -0700 (PDT)
Message-ID: <578f0d00-98ff-6c36-2e4e-1f4bae787a24@mind.be>
Date: Tue, 3 May 2022 22:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220502221631.2347844-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220502221631.2347844-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: bump to version
 9.1.0
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/05/2022 00:16, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pillow/python-pillow.hash | 4 ++--
>   package/python-pillow/python-pillow.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
> index 88a5d7cada..2e259c1caf 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/pillow/json
> -md5  8deffccb4f402df154fd2fd504d8487c  Pillow-9.0.1.tar.gz
> -sha256  6c8bc8238a7dfdaf7a75f5ec5a663f4173f8c367e5a39f87e720495e1eed75fa  Pillow-9.0.1.tar.gz
> +md5  a9ebd39b3482993474872757d317e26f  Pillow-9.1.0.tar.gz
> +sha256  f401ed2bbb155e1ade150ccc63db1a4f6c1909d3d378f7d1235a44e90d75fb97  Pillow-9.1.0.tar.gz
>   
>   # Locally computed sha256 checksums
>   sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index 901876e0ee..4249a44776 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PYTHON_PILLOW_VERSION = 9.0.1
> -PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/03/a3/f61a9a7ff7969cdef2a6e0383a346eb327495d20d25a2de5a088dbb543a6
> +PYTHON_PILLOW_VERSION = 9.1.0
> +PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/4b/83/090146d7871d90a2643d469c319c1d014e41b315ab5cf0f8b4b6a764ef31
>   PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
>   PYTHON_PILLOW_LICENSE = HPND
>   PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
