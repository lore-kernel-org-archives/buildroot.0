Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF724C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 20:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C4A241BE1;
	Thu, 21 Apr 2022 20:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kujO-desa-is; Thu, 21 Apr 2022 20:56:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 003A0419DA;
	Thu, 21 Apr 2022 20:56:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 46FAD1BF3E3
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3373C60A74
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 20:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sk2ptelB103G for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 20:56:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FB8960C19
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 20:56:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b19so8256402wrh.11
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 13:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+eLvQwYZkd7rOkdtZOxEaN+CLEFLBPpeE+AcYXXfzp8=;
 b=X8/4pJ+OTsm9arutM1OHJUgoA/uCKrGnSTrhctaO2R5DhyOuZuSFPbSlznvthJUwDG
 wXts/ntT8iZQMstN4ffPgHeZz5RRFsTAbIVI+akjCw0KT1sUZdWy99kb9/n4X3q+fnp0
 p7KHL50WbFLYcA+r/7Nr0TTZVFY6fYG58/MVC2EhwrSPFvxZw3vAy+7cQItD1m3b+XA1
 thQR3mLKbPcy6flktxzKgQoQVjnY8I6xlQzYLYYJG1HX/KKiQxyTeo2G98U64QmeSBcW
 06sTOn5tJxvsiqL/OU4ZTRx5YBh8LdHORrVRjm650tNMtegDBD/la3sEMb/ALIUjA8lv
 TrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+eLvQwYZkd7rOkdtZOxEaN+CLEFLBPpeE+AcYXXfzp8=;
 b=uJSLZF3ua36bmKgKqtWi83m5kykigeneZBOja7S59EMJJZ1Sd+ZkTAAGKNWdu+GBT8
 an/ZOuh4/EF51VkBdtu09Af01cFuQeBMMxjiT541ysftToMl605JWJG+FL2f7eMm84Gf
 U9XnyCd0019XRIlkk38i+PV4C+ksmZ3FiddIpRdWiZ9TXPwFrxpeuw15vJsqoKj2owep
 vI93LjGjKFpkTDSLXBIlSndJaVS2Xjt8QEJyF1nA8MXMhl3r8amCJ9n8+KoV5nbXIaKh
 Z+m+Nkt6FmtL0FpjKj0CvOUjJfO+vSg+zwM9g64tiQ2IhKxehKduOJJQjq5f5akevAQS
 pOWw==
X-Gm-Message-State: AOAM531IxHi9OqcmAXIu6NI2tztr5MRLQvKoQ5QxaRr0ezqHQ9KdW+Zw
 mtM7ywRXQVnx18HpoPfpb8mSeg==
X-Google-Smtp-Source: ABdhPJxkbuHg0y1/5eoThlV/z+RLLL7+D2jO5dgwt6dgWVrRWCtdQBKLLo4AmaPZCwq8qWw0bhlOfQ==
X-Received: by 2002:a05:6000:15ca:b0:20a:c416:e60a with SMTP id
 y10-20020a05600015ca00b0020ac416e60amr1105649wry.60.1650574610290; 
 Thu, 21 Apr 2022 13:56:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d6c63000000b0020a94e82a3dsm83204wrz.64.2022.04.21.13.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 13:56:49 -0700 (PDT)
Message-ID: <b6944363-3228-7af0-e48a-f8d9c8636fc5@mind.be>
Date: Thu, 21 Apr 2022 22:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220417213111.664923-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220417213111.664923-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/quazip: doesn't build with
 zlib-ng
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/04/2022 23:31, Fabrice Fontaine wrote:
> quazip doesn't build with zlib-ng since bump to version 1.9.9-b1 in
> commit 1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and the removal of
> z_crc_t and FAR:
> https://github.com/zlib-ng/zlib-ng/commit/4db4cfdb5badc8860f7410732b12c45216d709b3
> https://github.com/zlib-ng/zlib-ng/commit/0db1040667b13c0f9405af810f669857a487b08e:
> 
> /nvmedata/autobuild/instance-16/output-1/build/quazip-1.2/quazip/unzip.c:196:11: error: unknown type name 'z_crc_t'
>    196 |     const z_crc_t FAR * pcrc_32_tab;
>        |           ^~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/02272c154ce58bacf0518dab5fc1ef0084121e1a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

> ---
>   package/quazip/Config.in | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/quazip/Config.in b/package/quazip/Config.in
> index e980297558..a670ed458c 100644
> --- a/package/quazip/Config.in
> +++ b/package/quazip/Config.in
> @@ -1,10 +1,13 @@
>   config BR2_PACKAGE_QUAZIP
>   	bool "quazip"
> +	depends on BR2_PACKAGE_LIBZLIB
>   	depends on BR2_PACKAGE_QT5
> -	select BR2_PACKAGE_ZLIB
>   	help
>   	  QuaZIP is a simple C++ wrapper over Gilles Vollant's
>   	  ZIP/UNZIP package that can be used to access ZIP
>   	  archives. It uses the Qt toolkit.
>   
>   	  http://quazip.sourceforge.net
> +
> +comment "quazip needs libzlib"
> +	depends on !BR2_PACKAGE_LIBZLIB

  Perhaps we should have something like with force-openssl, to be able to still 
select zlib. Yann, what do you think?

  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
