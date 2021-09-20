Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C36C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:08:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 338DC60F6B
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 19:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 338DC60F6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC9A160645;
	Mon, 20 Sep 2021 19:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zzpp_IzXvVQg; Mon, 20 Sep 2021 19:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F620605AA;
	Mon, 20 Sep 2021 19:08:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D15B01BF955
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEECC823FF
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 19:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ei8F8bYnCtF2 for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 19:08:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E671A823FB
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 19:08:39 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id h17so65358459edj.6
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 12:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+YVakehy2zTLnH5bdMyisHsqyrM6tTfDcP+Zmtw8xro=;
 b=AxThuYdMdYXnfvNdpEWQAFCIDgc3CRQqX5yXB+aQ4y9H4mWkKAXIKUlzCrDUQDc8z0
 NeWwPW9wzFBohK6AfXYM7gAl2L11QzcDKtkSw+SeGss3PTniYW/EhcuZg79gE2PHyG3c
 WGfBXwbNNg4l2tij3abDzqIrvwNSMOtTnN6q8jwuIKEnefeoxqp4oier2bKvqlKn+hoC
 f/vD5u8WKsHU9H6lbDJphEBzxeUzJHfDVhhAY44AMLEM6ff1Wa84MGQ1Pt28ORHy+V+l
 IeMGzBeVi9WFPwU51Jgve4HJ1bnBR/bcvOP4z0f6+6MvZwddeagW/+mgtnY/yra0F+pp
 pJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+YVakehy2zTLnH5bdMyisHsqyrM6tTfDcP+Zmtw8xro=;
 b=bHWPKSb1+o7/da7dM/k/D0NvGTlZnbnozgyJiv3XTi2JYKbIAv+nWGgT+ihz5IOQKz
 9hMpfQoMKtafqU6QyEB0XQOqeNapSCwC6olaKuwv7OJu7kAYpxwDEAToMZUKjO/5KdW2
 OeYiaa+bsQHuI2xeVlOYcrRYsy9NLFps7WzyWQOuyJ/IXJMdP+VFOnxDbMl6HhIzMwtn
 5sc+U6BLWv0GpKpVhzOmbPZx3e+DIeyz3g3b/Gt4hkkWKzylgUqq5Yj5vbd2R/AOpHsT
 +89ZFKgEofn6dgVG2XwJ81iJkGP6GwJoUDddhwPs+MypwThJW9Cvcac373fu0Ntan3D2
 6efw==
X-Gm-Message-State: AOAM531EK1ryYUuYaAse5aTwBA23sfIIDE4CAWHdRUipQuMSBdfOIK9V
 yodjXPFFwkqeQrBkiWOoVRMlhQ==
X-Google-Smtp-Source: ABdhPJxwULcZKASA1tGX04+ryoClHsIeWtlDu+4FGclD2cdyF//YgOzRXQm4+P1dNEYi83AbThXedg==
X-Received: by 2002:a17:907:98a5:: with SMTP id
 ju5mr28368988ejc.378.1632164918078; 
 Mon, 20 Sep 2021 12:08:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v25sm6436928eja.83.2021.09.20.12.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 12:08:37 -0700 (PDT)
Message-ID: <60eb6453-4d5b-c85e-f2f3-fe73631b07ed@mind.be>
Date: Mon, 20 Sep 2021 21:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
 buildroot@buildroot.org
References: <20210908133010.31005-1-nicolas.cavallari@green-communications.fr>
 <20210908133010.31005-2-nicolas.cavallari@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908133010.31005-2-nicolas.cavallari@green-communications.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/libressl: depend on threads
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 08/09/2021 15:30, Nicolas Cavallari wrote:
> If the toolchain does not have threads (e.g. br-arm-full-nothread),
> compilation fails:
> 
> In file included from /home/fail/br-test-pkg/br-arm-full-nothread/build/libressl-3.3.3/crypto/cryptlib.c:117:
> /home/fail/br-test-pkg/br-arm-full-nothread/build/libressl-3.3.3/crypto/../include/compat/pthread.h:114:15: fatal error: pthread.h: No such file or directory
>    114 | #include_next <pthread.h>
>        |               ^~~~~~~~~~~
> compilation terminated.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/openssl/Config.in | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index f69e85978f..bdcf7e2773 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -33,6 +33,7 @@ source "package/libopenssl/Config.in"
>   config BR2_PACKAGE_LIBRESSL
>   	bool "libressl"
>   	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	# uClibc on noMMU doesn't provide __register_atfork()
>   	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
>   	help
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
