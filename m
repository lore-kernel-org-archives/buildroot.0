Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4E5C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5710840371;
	Thu, 16 Dec 2021 18:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBUXu388KBA4; Thu, 16 Dec 2021 18:21:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43EFB4017B;
	Thu, 16 Dec 2021 18:20:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3A711BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2D59417A2
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:20:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V2HNgYVn_SrZ for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:20:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D21BA4179E
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:20:56 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z9so34678826edb.5
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=gqBpV+OxBOHKbUsWC5M57gzlRHzasOMjNWzfSz8Mk08=;
 b=NOiKQ9ZQILXBAKcFBl6s1fbO8xeyCFBie70A4WnrAagLATALEsct/7iVje39SrCIiG
 9M5DRnpo8mGrtXno0h3vXfSur8kgbawMZvpXois7Ffj4hqWJ5ogJq5ql4mB1ifV47Fdy
 gs7NfuD+ZwLeGSif5sn8E/WTZil7xkZQfp5PGkDk2fwGPLkQKaf6GWdLEfsd3rz6P5HT
 Xryjy+Fa1PjWyn1K6U02lrdaQbGly0iMGv13Ghfxxmc4CpwbgkfoPbThuTRn6Y90XmiE
 6hdyqMmEsctU55EtEGSJrXJm5Amhu9wXw4jRghUCkJTMNUn6rbQS4fJernkwZs5sEjNN
 NKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gqBpV+OxBOHKbUsWC5M57gzlRHzasOMjNWzfSz8Mk08=;
 b=XUVm7ri9Vnty6If8YENbHkRj5i0CNLjIGKpPVMKDe1cRdhBNjl5QJBs5tSsVAzVJu6
 XzbjxnliOnwybyDUyeYux6fdxKSnOxYTAnFWDGuTn9ZbehRUX4WLs6qmPFXoTaMarN5w
 fGU5mVpddBH8RhcrKf6GAsvI7M/6h9tq72oZxBt66k7iQSR9x4hgBQ2FGLFsIzKD3EV9
 KLSDjZRWzGOQhjbQ7+u0XgH6UicRDXUsabEQU6D6b9MmA/H/e+jT89LHhH94USgqwiOL
 AXn9wFD34YW9xfgbcejyJq8/b5/vlDYZG6lks0mqeB+WYxWTq0FtQnl06rA7fYECUcV1
 ALHA==
X-Gm-Message-State: AOAM530lzcyfKwj515WBQ+9OAMgAQYKOB2lPjCCn8qtFNG6PR/CtJ4L7
 P/XQV5sCwDSTFDsPEnp0/mn/VA==
X-Google-Smtp-Source: ABdhPJwNK6fRa2TEl+lmG1TBcU4QjNh4PDgr0Knr6GXmE6VAD1TjBVAszyuqPDE/c8HTPu4m+pTGXQ==
X-Received: by 2002:aa7:c915:: with SMTP id b21mr21335291edt.195.1639678855094; 
 Thu, 16 Dec 2021 10:20:55 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d19sm2663167edt.34.2021.12.16.10.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:20:54 -0800 (PST)
Message-ID: <b542eefc-70a0-cb8d-10c3-cdae637ca6d7@mind.be>
Date: Thu, 16 Dec 2021 19:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211214220827.2625100-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214220827.2625100-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: always enable DES support
 in openssl
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



On 14/12/2021 23:08, Fabrice Fontaine wrote:
> Fix commit 075b01f2f7b5a9241b4bfe76db8f14af0284060c which forgot to

  It's weird that it was not needed on uClibc before the version bump, and now 
it suddenly is. But autobuilders seem to agree with you, so applied to master, 
thanks.

  Regards,
  Arnout

> always enable DES support in openssl resulting in the following build
> failure with musl:
> 
> pppcrypt.c:65:22: error: 'DES_cblock' undeclared (first use in this function)
>     65 |  DES_set_odd_parity((DES_cblock *)des_key);
>        |                      ^~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/3a7358de6199bb069bd38139747e2d50f9416fd0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/pppd/Config.in | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/pppd/Config.in b/package/pppd/Config.in
> index ca139a50e9..898d95f0ee 100644
> --- a/package/pppd/Config.in
> +++ b/package/pppd/Config.in
> @@ -3,8 +3,7 @@ config BR2_PACKAGE_PPPD
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_USE_MMU
>   	select BR2_PACKAGE_OPENSSL if BR2_TOOLCHAIN_USES_GLIBC
> -	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL \
> -						 && BR2_TOOLCHAIN_USES_GLIBC
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>   	help
>   	  An implementation of the Point-to-point protocol.
>   
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
