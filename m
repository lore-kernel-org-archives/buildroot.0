Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A17C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:03:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B136109E
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9B136109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70E1460BC9;
	Thu, 14 Oct 2021 21:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tMWpskBIyoXS; Thu, 14 Oct 2021 21:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCA1760BBD;
	Thu, 14 Oct 2021 21:03:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EC421BF343
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B8F683A99
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3qJD6-bwk1Zj for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:03:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FEFF83AB0
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:03:12 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id i20so28570428edj.10
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=G0yA5cb+2sL4BcwTpGr3oo39n1RP2IyN6nj4l2RvXrY=;
 b=WQd+/OP3vSXtJ4VGkspIf7K4Z5PLqCmAG209CTxmTEZ97mq1ZIxm4+BJWZCu1aL41f
 /wMy4203BiHTJi9trU850QrjvXXxnhYxa1JdR1yDokMvuKbHQaJqoIudKEWfXND62z9t
 TlsDK0wJSBiOXNmpYJQ2Ytwl9lzUT4/aq/8k1VzBPapBPnaV681lmKQ9RfVBpPxzOygT
 363oIv1NEazOG9nRKbweWc6UOWlsNT2JIjoJI62mdgyk76xp/2PVnDEscuZQwYl3jwZD
 Vofu58kn5WcN7bNgx7AM7TVcKrZiEX7eAaQJyljiiaTjZ4Ern/zlHG9qSJkz3OYM/CFq
 L5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=G0yA5cb+2sL4BcwTpGr3oo39n1RP2IyN6nj4l2RvXrY=;
 b=M+pyuHg38oZBK0coIetZv6fEK5x8jteaiNsoE2SaVIUQNt+byZT3faHjInlum6my/0
 xE9DImbpCMLhesrq9I3wPhInk4a/AWXYqZS0mA7sFz+xd8IRM41eJmLGTOyVygGs7k9o
 BsA85qPXiHKCCdPGOCfZB6k4azzlCEMUh+owaDO8sRwzYciTMoYaTrLZljtmQBQsI4Eb
 cHbhYwuRMjDJEcEJ/MHQ9uQ0wqy2Nsl3HPksZIjtZns//0XWZw8qRp+FfneVBsRHqny6
 8NZZ4Xsnvx60eLPYAkiExPyPpnvN2ZKVAIKy9TfAU7pzS6rR2b406T53sS8UVEzMLFqq
 YVRw==
X-Gm-Message-State: AOAM531h3OmjmCcMBYuBJ6Q9LEOClsNzJmt6Nz6Xmey2Y4s1/PZH8qZh
 3aKeOBb5xKYO3VBPLr5T/r7pxw==
X-Google-Smtp-Source: ABdhPJwnscqvTZrhX/moQuPSnEqG380QXLpEKaTHMNdBtnnG7y3QkW275rBZI2HxAd7jlFue7+2LgA==
X-Received: by 2002:a17:906:c7d0:: with SMTP id
 dc16mr1653465ejb.555.1634245390795; 
 Thu, 14 Oct 2021 14:03:10 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n16sm2977512eda.93.2021.10.14.14.03.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:03:10 -0700 (PDT)
Message-ID: <ff7f85f0-9f45-7370-9810-d652e38b1cf7@mind.be>
Date: Thu, 14 Oct 2021 23:03:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211009002727.972605-1-aduskett@gmail.com>
 <20211009002727.972605-2-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211009002727.972605-2-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH v4 1/2] package/python3: Add bzip2 option to
 host
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/10/2021 02:27, Adam Duskett wrote:
> The bzip2 module is needed to build the host variant of NodeJS 14.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>   package/python3/Config.in.host | 6 ++++++
>   package/python3/python3.mk     | 6 ++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
> index 70b5dacdde..65a8df0754 100644
> --- a/package/python3/Config.in.host
> +++ b/package/python3/Config.in.host
> @@ -7,6 +7,12 @@ config BR2_PACKAGE_HOST_PYTHON3
>   
>   if BR2_PACKAGE_HOST_PYTHON3
>   
> +config BR2_PACKAGE_HOST_PYTHON3_BZIP2
> +	bool "bzip2"
> +	select BR2_PACKAGE_HOST_BZIP2

  This option doesn't exist. I removed it.

  Applied to master, thanks.

  Sorry, the nodejs bump was a bit to big to include in the low-hanging-fruit 
apply, so that's for later.

  Regards,
  Arnout

> +	help
> +	  bz2 module for host Python3.
> +
>   config BR2_PACKAGE_HOST_PYTHON3_SSL
>   	bool "ssl"
>   	select BR2_PACKAGE_HOST_OPENSSL
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 3e88bc0ff4..779f6dcb6c 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -43,6 +43,12 @@ PYTHON3_DEPENDENCIES = host-python3 libffi
>   
>   HOST_PYTHON3_DEPENDENCIES = host-autoconf-archive host-expat host-zlib host-libffi
>   
> +ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
> +HOST_PYTHON3_DEPENDENCIES += host-bzip2
> +else
> +HOST_PYTHON3_CONF_OPTS += --disable-bzip2
> +endif
> +
>   ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
>   HOST_PYTHON3_DEPENDENCIES += host-openssl
>   else
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
