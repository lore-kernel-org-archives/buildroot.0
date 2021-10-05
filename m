Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFED5C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:34:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F66B61211
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F66B61211
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C35E4024E;
	Tue,  5 Oct 2021 19:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpBYPe6C_0Kt; Tue,  5 Oct 2021 19:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D9EE407BE;
	Tue,  5 Oct 2021 19:34:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10A511BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:34:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE7A9407C1
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KnKSmUYd7FCS for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:34:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 840F24024E
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:34:25 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g10so944583edj.1
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 12:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=GGsQnC3ix3rckfh8EwTQ3Y7dp5KbcmFhmXa0Y3iyZQ4=;
 b=aQdUPQP76pwAx+bFS8MsUQJMpngi+7n6OKcZqeI6GbOXKoJPJKmJ5NiymlGBod31P9
 Dl7zbo1SgUKQ5eIVjKLwJWS6Nd+8MNRvYZnlGFR5AJbA7yInOWT7hcIyZZYJTM1CTBS+
 lvHBF/kdJBvylDHZS368UaHJ1G2nfFx+g+4tCwKc9uGFiofQRTsAfVlQMxHENnW0sLb3
 QvBE68kOB4DBztyAF4kJtjZX+17XUbGFxF7FUqOXHEhXe6hffr1z3KKQ4bSkXRrfvxuU
 3zhA0TTiOvmYr72A4x+CTBYSzdwv2MQd3rGkmYGR6st1/E6pfyJqLSRiltJdzf11ajiX
 INvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=GGsQnC3ix3rckfh8EwTQ3Y7dp5KbcmFhmXa0Y3iyZQ4=;
 b=sQEYJz9vbu4hSujJ6bR1vrNPSBmqywTqvZDO7gxOYZk64Ztl7vWpfIbr2XxFCgUplP
 H6AbdkQF5ZhrEfhSO5N8e8qMl0Gog0YOxSkdOacfzZiPvteORmN4XJbdyI/JoAb5UUYg
 mPYHDk/VJu8PAaOVtWDGTV1h8+sVaO0dNZdwUzRaWngFlGcexrKWrHy5yUwIyNreoLt8
 YC4cplfA+B2qbaUtrmXZLPYClfTR1y47k3/XU8/isYWKp5inI1qEe5N+hrl5aIgYRSaz
 qxPUXnBkoDqqq/6vY7KksA7Da20nCcb41zzB6kZbPP9Qa4ujobSjzJJYlw/HZ/HU21Cx
 I0bw==
X-Gm-Message-State: AOAM532bqiLRoNZVrfm2pXJzxtcrC/aP2/kvfEZ5XAWvX2vJDW0tjZOC
 oHi8BVEBlPGbsWUq7h/ej1QM6y40M+aChHbK
X-Google-Smtp-Source: ABdhPJx8YcRsm+lNumtDhbQdk8+rxSgyTwUE2Bxa+Bj1/wHDDBwYucj6vt4rmi7Dp+cq6tKGQS9I4Q==
X-Received: by 2002:a17:906:6691:: with SMTP id
 z17mr27055072ejo.207.1633462463486; 
 Tue, 05 Oct 2021 12:34:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i4sm8994523edt.29.2021.10.05.12.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:34:23 -0700 (PDT)
Message-ID: <9d1acd83-599f-0dec-7db4-f2c39b1c8bd7@mind.be>
Date: Tue, 5 Oct 2021 21:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210927192540.1940198-1-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210927192540.1940198-1-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH] package/dc3dd: disable on arc
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



On 27/09/2021 21:25, Giulio Benetti wrote:
> Disable dc3dd on arc like we've done for riscv32 because of the size of
> time_t:
> 
> In file included from getdate.y:40:
> verify.h:132:30: error: negative width in bit-field 'verify_error_if_negative_size__'
>    132 |       (struct { unsigned int verify_error_if_negative_size__: (R) ? 1 : -1; }))
>        |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> verify.h:138:61: note: in expansion of macro 'verify_true'
>    138 | # define verify(R) extern int (* verify_function__ (void)) [verify_true (R)]
>        |                                                             ^~~~~~~~~~~
> getdate.y:116:1: note: in expansion of macro 'verify'
>    116 | verify (LONG_MIN <= TYPE_MINIMUM (time_t) && TYPE_MAXIMUM (time_t) <= LONG_MAX);
>        | ^~~~~~
> 
> Fixes:
> http://autobuild.buildroot.net/results/9e2/9e2a8f0548ecb5ce9539eda007cd886ddea7dc0a/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dc3dd/Config.in | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
> index 715451beb7..bd181b7065 100644
> --- a/package/dc3dd/Config.in
> +++ b/package/dc3dd/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_DC3DD
>   	bool "dc3dd"
>   	depends on !BR2_RISCV_32
> +	depends on !BR2_arc
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on !BR2_TOOLCHAIN_USES_MUSL
>   	help
> @@ -13,5 +14,6 @@ config BR2_PACKAGE_DC3DD
>   
>   comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
>   	depends on !BR2_RISCV_32
> +	depends on !BR2_arc
>   	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
>   		BR2_TOOLCHAIN_USES_MUSL
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
