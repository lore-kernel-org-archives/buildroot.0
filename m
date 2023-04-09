Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA190C77B70
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 14:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9011F4015E;
	Sun,  9 Apr 2023 14:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9011F4015E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Lrbm_xJvodL; Sun,  9 Apr 2023 14:09:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1317401D2;
	Sun,  9 Apr 2023 14:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1317401D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 654A01BF41F
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44293415ED
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 14:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44293415ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4uXahApx5L1 for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 14:09:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5542408D1
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5542408D1
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 14:09:50 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id ud9so6869627ejc.7
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 07:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681049389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w8l0Q7DNHFSdRGE6UOVtDzn4mnbiQhXnIzqwSOvHuaE=;
 b=HeQps1E56oo9aweRv4rKc19fyYQvFndMCVr7liYxJ4+SU9h/IwZ6tI0qkUFy+u4/Tb
 hm9Wj1FT8abzZaLMdlZ+62WQc0fXbFw1ma4Ym2q79fpPwy8RQRWbFniq8leJmx1XNKGr
 TNRY331/+3SDAJxhWYGiNo4eRCmTVzlhAc9e4ZKNiQaz0esdSMAAZOsyGNgzA30Bmw3i
 OIa5LDJSZ9uD/WBWziLFrTeTyQi2yh/CucNk26J/irJ4bBpWHIeRC8h0+3SWfUenJbn5
 bnl/A0L2ysqL4zxYX9S19yCBT8Obgo8YM8tB50Xu/QbbqrvmiV99LxESdd/TGrxSI1UB
 gf2w==
X-Gm-Message-State: AAQBX9d0iplxSQ8AG8AFcberJg/b3g04hXRcugx4G7v0TSxt3L4t+hiK
 0uepT0U71aAo4oG4Vw7hekqyduboKRprm5dmC3w=
X-Google-Smtp-Source: AKy350ZAyKjtgCBDc4Go1p3X03tZrl3Pp4aJ1htqLYps0mRVL2h3o0sM2FNA3/8czPd1JTxA+4gMKg==
X-Received: by 2002:a17:906:2658:b0:878:61d8:d7c2 with SMTP id
 i24-20020a170906265800b0087861d8d7c2mr5408082ejc.39.1681049388864; 
 Sun, 09 Apr 2023 07:09:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a170906379000b008b17de9d1f2sm4250008ejc.15.2023.04.09.07.09.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 07:09:48 -0700 (PDT)
Message-ID: <533915f3-c09d-dce8-c14d-19c6a13c4b37@mind.be>
Date: Sun, 9 Apr 2023 16:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
References: <20230405200445.50475-1-dalang@gmx.at>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230405200445.50475-1-dalang@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681049389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w8l0Q7DNHFSdRGE6UOVtDzn4mnbiQhXnIzqwSOvHuaE=;
 b=FWqiE2rT3KrWBB27yPxNmGxlou1nDJsx5p+G9jJG5uw9N3p78ZvBKp+WvlEAsk/c9n
 XOKrBXvVjvGltbBhVSKEgxmiku4fT7HKP5w1phzluDf8ZIvSmBtCLvg9gSMuemqdbLoK
 oHBjgwNMOdgh3iZgaRy8OczIckfaXl1ZzhB9zn3bzA8saPQwDtF+ZuW/+SGaGEkdEYjh
 AbtaKCvv5ZXIHbWryGx3jfgzDaW2wONolcIwB38fzGjVF/Shi90k12oX4G5cz1dnk6Ju
 k3VRrUh6x/0ejNe8XU1yCgaHQBUeKlWtIifD5e3bm1Qp1cQYsyvpBqlVW9Z9SFlXXk94
 ob0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FWqiE2rT
Subject: Re: [Buildroot] [PATCH] package/libmodbus: bump to version 3.1.10
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
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2023 22:04, Daniel Lang wrote:
> https://github.com/stephane/libmodbus/releases/tag/v3.1.10
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>   package/libmodbus/Config.in      | 2 +-
>   package/libmodbus/libmodbus.hash | 2 +-
>   package/libmodbus/libmodbus.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libmodbus/Config.in b/package/libmodbus/Config.in
> index 642b57cd8c..2e93fa4bee 100644
> --- a/package/libmodbus/Config.in
> +++ b/package/libmodbus/Config.in
> @@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBMODBUS
>   	  according to the Modbus protocol. This library is written in C
>   	  and supports RTU (serial) and TCP (Ethernet) communications.
>   
> -	  http://libmodbus.org
> +	  https://libmodbus.org
> diff --git a/package/libmodbus/libmodbus.hash b/package/libmodbus/libmodbus.hash
> index 83b0c3a012..a7b7e583a8 100644
> --- a/package/libmodbus/libmodbus.hash
> +++ b/package/libmodbus/libmodbus.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  b122f2bc29f749702a22c0a760a7ca2182d541f5fa26bf25e3431f907b606f3c  libmodbus-3.1.8.tar.gz
> +sha256  899be4e25ab7fe5799d43f9567510d6f063d2e8f56136dd726b6fd976f9b2253  libmodbus-3.1.10.tar.gz
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
> diff --git a/package/libmodbus/libmodbus.mk b/package/libmodbus/libmodbus.mk
> index 2f8c1735da..2fffa1e0e9 100644
> --- a/package/libmodbus/libmodbus.mk
> +++ b/package/libmodbus/libmodbus.mk
> @@ -4,12 +4,12 @@
>   #
>   ################################################################################
>   
> -LIBMODBUS_VERSION = 3.1.8
> +LIBMODBUS_VERSION = 3.1.10
>   LIBMODBUS_SITE = https://github.com/stephane/libmodbus/releases/download/v$(LIBMODBUS_VERSION)
>   LIBMODBUS_LICENSE = LGPL-2.1+
>   LIBMODBUS_LICENSE_FILES = COPYING.LESSER
>   LIBMODBUS_CPE_ID_VENDOR = libmodbus
>   LIBMODBUS_INSTALL_STAGING = YES
> -LIBMODBUS_CONF_OPTS = --without-documentation --disable-tests
> +LIBMODBUS_CONF_OPTS = --disable-tests

  If you make changes like this, please explain why in the commit message.

  Applied to master, thanks.

  Regards,
  Arnout

>   
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
