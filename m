Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6A2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F17040017;
	Sat, 23 Jul 2022 19:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F17040017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mI_wlL7Kvocw; Sat, 23 Jul 2022 19:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83213400EC;
	Sat, 23 Jul 2022 19:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83213400EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7A571BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFAB360E62
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFAB360E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QuA8wZFfgaOF for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:09:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D73EE606C0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D73EE606C0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:09:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u5so10631674wrm.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cPlRMJwxyAnMUf8QRqn8PJwIrlN2QmcAgAAv6UsWBPc=;
 b=3NrdSnaNUXMZn8MG+ytIS4cRHYAYOwPMkmB76269EnZjM24pLlz62oNBZ0xLjF+aWr
 PhlZfkmtPdFMBHNFDLwm0KRORHCX6DnnQwJ6c71WoT5td5ZFTyi9zW/vaWhsSTgb5mPk
 khv4jUEnHMuFiivaHZwKqdJQBoHnk49rGIkngSiHQsTHUV66a79nL4EhcXdx+AOLRPyL
 zWfsfBdef/lq0vJjnc1MlBGyTXDCCEcwk2xFPM4VNkjjODhNOMp2Yiw56sXOVgZTx6xt
 hX+WepVLxEm1cDZLila6pWr0tYOaoSXHMXf5zXuK1NV8KEr7zrfIYfHGvA6iZEwpHH5D
 TfUw==
X-Gm-Message-State: AJIora/GOmICW8shqkeyrUK6YO5QvIxnSTrBUigZ+Bf6ogsmEZZIYjAK
 LxT17xCRP/os0poudszFqliWNA==
X-Google-Smtp-Source: AGRyM1unSUHP7Q4D0emNIr7CyZg2PtjRfKqAZb7nsbW2YpH9PcSqRATwBRGHlCKMpvmHLfWd0ybAlg==
X-Received: by 2002:adf:d1c2:0:b0:21e:6dd4:5ece with SMTP id
 b2-20020adfd1c2000000b0021e6dd45ecemr2992247wrd.119.1658603367921; 
 Sat, 23 Jul 2022 12:09:27 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c430200b003a2e89d1fb5sm12009433wme.42.2022.07.23.12.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 12:09:27 -0700 (PDT)
Message-ID: <a631a0bc-bead-b99b-ca3c-e5c122877beb@mind.be>
Date: Sat, 23 Jul 2022 21:09:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Thomas Huth <huth@tuxfamily.org>, buildroot@buildroot.org
References: <20220618060641.24736-1-huth@tuxfamily.org>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220618060641.24736-1-huth@tuxfamily.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cPlRMJwxyAnMUf8QRqn8PJwIrlN2QmcAgAAv6UsWBPc=;
 b=TsTY0VGhtaXv2MulJRxUPL1bEhIwC3VZuo3tklX/hsD8oYUnZOP6BQj1Ra+NYYjS8i
 tDYGQjC4AfZpV1uL1sPgJTysd4etNhEsxBvf4bPJauc11UVZinOXELe76PtMY39XhtM+
 3TBLDoRiWSMcCVMfnLmy71fPFR/HLNO2DjfvfOvAFDC/dw2QXobUiC5q4CSg60zNmv5u
 HCxRxmhkV8XzmGQeefzXkmDj6qLxr7NrCMX/Hz5Tbt1Z4VcSUIyKHQnPHP0Bj+KzbmB9
 VnNIYHwRcr0lyiDqMnb/XKybzmx0hy+g3wiJFX88etfVdGBZvGXkU3tCrfPi+IPe9MBf
 wfXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TsTY0VGh
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: Completely disable
 the tests on big endian ARM
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
Cc: Cornelia Huck <cohuck@redhat.com>, Cyril Bur <cyrilbur@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 18/06/2022 08:06, Thomas Huth wrote:
> Though the code compiles with a big endian toolchain, the kvm-unit-tests
> do not work at all in big endian mode on ARM. Until someone steps up to
> fix this, disable the package completely on big endian ARM targets.
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/kvm-unit-tests/Config.in | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> index 2b797e13b4..7658877ce9 100644
> --- a/package/kvm-unit-tests/Config.in
> +++ b/package/kvm-unit-tests/Config.in
> @@ -1,12 +1,13 @@
>   config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
>   	bool
> -	# On ARM, it uses virtualization extensions
> -	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
> +	# On ARM, it needs virtualization extensions and little endian CPUs
> +	default y if (BR2_arm || BR2_aarch64) && \
> +		(BR2_cortex_a7 || BR2_cortex_a12 || \
>   		BR2_cortex_a15 || BR2_cortex_a15_a7 || \
>   		BR2_cortex_a17 || BR2_cortex_a17_a7 || \
>   		BR2_cortex_a55 || BR2_cortex_a75 || \
>   		BR2_cortex_a75_a55 || BR2_cortex_a76 || \
> -		BR2_cortex_a76_a55
> +		BR2_cortex_a76_a55)
>   	default y if BR2_i386 || BR2_x86_64
>   	default y if BR2_powerpc64 || BR2_powerpc64le
>   	default y if BR2_s390x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
