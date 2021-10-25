Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B224DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:21:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D3F4610C7
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D3F4610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EAD04048B;
	Mon, 25 Oct 2021 19:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xY-0tM6bg_pP; Mon, 25 Oct 2021 19:21:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BFE240489;
	Mon, 25 Oct 2021 19:21:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8723A1BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B9160774
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhSvlK-TRvgF for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:21:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3F7E60765
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:21:35 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id j10so3838426eds.12
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eODo7Y1P3Nq3YoHoPN676f3T2x12/Nn7fKo7nUWtt9Q=;
 b=PO9pCMW6pQCWLfb9LfzjBrtNcpzA9ItjI7rkbVoOmZNMWkDNosIcHpKz9YG2NrggsH
 BvIaLen1cOhuKDKoUXu0y9DgFE5sWvvfP76kntw9EUxazCCar78ZnwiBdMmoYNOEfZ0F
 +KUvZ2ZB1bUJdqKDnS1eQzj2uBhVf+doOIHi+pguJtmjVty9im6B3kAPKov8+cpk+dpA
 lzJILieTsMU0wIBcEkhRjNsrUEofsK9wROHpS+TcnsbBVqb18mkY0AdJd+lnhZ/Rzt3y
 ZI84IKRCM76xpJdWHjxptCW1PXwDePQ7BG5ZineYfJhAcLIQBKJhGz2lkD5ZZQ9Pjo2k
 I7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eODo7Y1P3Nq3YoHoPN676f3T2x12/Nn7fKo7nUWtt9Q=;
 b=NDq2a+HGDKbf4WLLV/Zl5L6MCI+pjeovi8psQWL3b/kLLv37xXj3yoGHA06lnp/vMT
 rAo1sW/BJ5tuwg/vjhWYAmHokUqyywvHWgYZSYbel9qaIRAftE0ZvACjfzOOqFlNEdHE
 Tbl5zSvN194lxo85m8P7BYPXu9QYC/9MhzAIileUkS8b7dFtNX5YsFsozZuqxmgo8k9W
 9l8qp/JSTrqJ0cRzYYZwVOJHDbxYqivJH8LerTE1P5grNsvjjWrVu565br6SeWXUyY4r
 +LwUfV7VLrl7AVyrQJi5DuBIKeoLtsquDYDZVCQsklj+NXbDhWXuRVKGCboHsh0ecfEm
 IeSw==
X-Gm-Message-State: AOAM531aS+pj95GzY1KvCaBRy5T1YnqbNmOKEtCbSyX5W74doVudFgoa
 RPL6+NN2b6vQ65WtbQ7pFZIVWA==
X-Google-Smtp-Source: ABdhPJwDbT3jNNSlqFUX6j+nF7bHvtD6o5x06wTmSr4kqSVcErbGSB8+hHDzvW8wBp+YoQUoM2gq8Q==
X-Received: by 2002:a17:906:4793:: with SMTP id
 cw19mr23865178ejc.200.1635189694019; 
 Mon, 25 Oct 2021 12:21:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hp3sm7632561ejc.61.2021.10.25.12.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:21:33 -0700 (PDT)
Message-ID: <fe241f2e-2ef2-234e-7b4a-5562af726fdf@mind.be>
Date: Mon, 25 Oct 2021 21:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211014225849.832479-1-aduskett@gmail.com>
 <20211014225849.832479-6-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211014225849.832479-6-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 05/11] package/python-certifi: add host
 variant
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2021 00:58, Adam Duskett wrote:
> matplotlib 3.4.3 depends on host-python-certifi
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-certifi/python-certifi.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index 7c63633a8d..486548f8c2 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -12,3 +12,4 @@ PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>   PYTHON_CERTIFI_LICENSE_FILES = LICENSE
>   
>   $(eval $(python-package))
> +$(eval $(host-python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
