Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B44C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 802D860E49;
	Tue, 19 Apr 2022 20:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3LrnD6e6qvC; Tue, 19 Apr 2022 20:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5D6160AB0;
	Tue, 19 Apr 2022 20:37:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3DF61BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF817404D7
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1gCLkvJ8P43f for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:37:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8BD64012D
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:37:38 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z12so22802861edl.2
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DUhsYAmMjvQNLfXmsOam3eEekbwhuNl9M+QQRzYDKIw=;
 b=gjI2sxknwwXOtlRat+EeyCOBNiBCGuqzfr2+6EpXnyvI+NzueEc+ILUI5HaeSLIuMf
 VInZmihgWwV/hKMAKjW/jrX9JUTxgkbZIiWz1CXlPfqOT8qzYudeciNxHlOdnZbtnn47
 6E13DGGyS+JYfyPeCL43uUnyeqhm1N0kE7tAzz4EItFcJgr1No2mvLhlNiKw/5nzVb7B
 zOAkVprVgU5WHdYM6jEFMAw6W2f8lNPUUWBfQ53ZU526WNfFND6sLoGFm6a8dfR9WVY1
 Z3nCh5SyJ8rEoXebd0zMmH0b+E6fh1Fzn3OiJ/b6KuCpqhJ7FyB/B5Sul1j/RQEyg43A
 8DFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DUhsYAmMjvQNLfXmsOam3eEekbwhuNl9M+QQRzYDKIw=;
 b=OUGvm5pAxkaA3yakG1gy1zMl14HtqCR44kbMG52QTIZaPX0YWMxxKI5dhcE9Z2t5Sw
 msZExkcjwGjEhvjIsGwNDVtU+F7eby5fzEP/Z1OXr6Kj/8VZzS/MZcz2ZBCDECQbboJA
 aAw/vFzMgyXawo5tgyE1lgd159+6YnPJtIl+E0/KxOZ5Z5l3ssDmVfI0hbnc7pOKUliI
 5nLH2hoHDDdGeKIykWYXafVy3rn24HCp5IvlaoCpdXZGLquiX2zCxFlEXVDOnbIyzRPK
 oHxY5VB2kVF/fThB1dBiX1Gk/MZXk0DDmM1gEDDFgpm/oh2yu+EwmtReEwuCN/eMH/CS
 9ykw==
X-Gm-Message-State: AOAM531omQ/dKZTgip3j/gwdM9AUjOun3XEbGw88Ogqy/x1oi4hGviRt
 yPKKu0+IQ60tRPMxPGZM9wl67Q==
X-Google-Smtp-Source: ABdhPJyQaU7DzEy/zN0XR8ve6lYRUF7A0+y/RZUM0uHk3s0fjB5AKr3gPn8zKqCqq4ez2CW/tLb4gA==
X-Received: by 2002:a05:6402:1581:b0:41d:9b15:1432 with SMTP id
 c1-20020a056402158100b0041d9b151432mr19734879edv.386.1650400657128; 
 Tue, 19 Apr 2022 13:37:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 cy5-20020a0564021c8500b0041fec3310desm9164116edb.68.2022.04.19.13.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:37:36 -0700 (PDT)
Message-ID: <1cb26340-3d1a-4918-cc59-174b310583bc@mind.be>
Date: Tue, 19 Apr 2022 22:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220418114103.276282-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220418114103.276282-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libkrb5: doesn't build with
 libressl
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
Cc: =?UTF-8?Q?Andr=c3=a9_Zwing?= <nerv@dawncrow.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/04/2022 13:41, Fabrice Fontaine wrote:
> libkrb5 does not build with libressl since commit
> b7a5b9d06d484700fc4fcbd354f2c15e0422688c and upstream is not interested
> in fixing this issue as a PR is opened for more than 4 years
> (https://github.com/krb5/krb5/pull/607):
> 
> pkinit_crypto_openssl.c: In function 'cms_signeddata_verify':
> pkinit_crypto_openssl.c:1700:22: error: implicit declaration of function 'OBJ_get0_data'; did you mean 'BIO_get_data'? [-Werror=implicit-function-declaration]
>   1700 |         print_buffer(OBJ_get0_data(etype), OBJ_length(etype));
>        |                      ^~~~~~~~~~~~~
>        |                      BIO_get_data
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/e623f4e1d6b6004e98815b8b7da3938238890bd8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libkrb5/libkrb5.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> index f406cd9e49..bd751d9c77 100644
> --- a/package/libkrb5/libkrb5.mk
> +++ b/package/libkrb5/libkrb5.mk
> @@ -49,7 +49,7 @@ else
>   LIBKRB5_CONF_OPTS += --without-ldap
>   endif
>   
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>   LIBKRB5_CONF_OPTS += \
>   	--enable-pkinit \
>   	--with-crypto-impl=openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
