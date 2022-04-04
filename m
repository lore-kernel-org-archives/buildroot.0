Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F83C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CA564050C;
	Mon,  4 Apr 2022 18:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3XheijzDHmx; Mon,  4 Apr 2022 18:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94702401D5;
	Mon,  4 Apr 2022 18:41:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C30461BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1294608D8
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQDoh2p08ald for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:41:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1834360AF4
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:41:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id ot30so11901527ejb.12
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7hcd+xMo5+ZzCqB3LamjvYQ82qnW5jUctLs9wbWlBVg=;
 b=VWKHbhrRcwiwsK+vcZQ4kgjW4F77qx6uNCKJAiH7cI0L32GTJQFVRUqd4RY5s1WeqO
 CtJYgKeaYja2r6/3Ed93khypJPAEV0dOGD3MDQTBbZoE5Fi0qTRBchUUeCMPEOf8n0ck
 5HesUCxoTaiQRDyytV+BpI7J7UqW6VmKVSrGzo/DFo4JAd3j2q5RcDHssvz20++kjRnu
 s/8593mBrW3XRpnx9zeXSMd6nQa+DMkfMFXpDoPgz5SIUsUwTWCTP1ule/OOEDW+DBTC
 h88L3KaLlhl8XhxUVmJxsVj3L/sIiDXuWv2k4hSemU+TVhMZe4uIaHTBdsMDfGcdch49
 BCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7hcd+xMo5+ZzCqB3LamjvYQ82qnW5jUctLs9wbWlBVg=;
 b=CfuHTe1WP/7LoCvDY5rQuCAJ0j7gSH1iQjuETu0cpt5skz8NPb01qsg5ZqIahGnPlW
 r3DiufaCVpfcBpvxF0yqMntytBjw9fuSLsrHfy+3U2uqWxcGIQfChafVg5hKCNTlSq47
 f7nkkqIbEd9CrY2S4yslTKg0v2en7YK15eHrhzt3Ar8mhRZ94Kx0iTQBopdwmp5SP5St
 4OgNdzW254OUj/cjT1vyw/a/4bXgebWJ+fyN2tPGINKLqeTiVpVAOrpFuj33a0u9EMnk
 4JU58eJhix7qtr6UMdP9O0exbWLvzv0x2dsrCG9BJ+sWfLpSCZRO2Ky+5HA98/gzVCKv
 fxJw==
X-Gm-Message-State: AOAM533gXATTppRvg/OhL4YBnWzufqaFbUm8B/fS8RRUNqGPBy3LyOIW
 41sa489u/0ol2fu7sG5Jgslr3A==
X-Google-Smtp-Source: ABdhPJwOxk0484vEKdm49kqgsPc8kpbs41cV3Xb5Qk88EQnZCGz01LcmtBwndRoNQu/eZlNnOExGSA==
X-Received: by 2002:a17:906:dc8f:b0:6e0:5ce7:d80e with SMTP id
 cs15-20020a170906dc8f00b006e05ce7d80emr1454224ejc.435.1649097666342; 
 Mon, 04 Apr 2022 11:41:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 o3-20020aa7dd43000000b00419db53ae65sm5688775edw.7.2022.04.04.11.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:41:05 -0700 (PDT)
Message-ID: <ee0eb4ad-e6d6-5c0b-a7ae-8420f84582e4@mind.be>
Date: Mon, 4 Apr 2022 20:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220402020756.415845-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220402020756.415845-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] toolchain/toolchain-external: ensure
 BR2_TOOLCHAIN_EXTERNAL_PATH is set
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/04/2022 04:07, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   toolchain/toolchain-external/pkg-toolchain-external.mk | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 299b6008aa..8274ace980 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -69,6 +69,9 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
>   TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
>   else
>   TOOLCHAIN_EXTERNAL_INSTALL_DIR = $(abspath $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH)))
> +ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)

  You also need a condition on BR2_TOOLCHAIN_EXTERNAL, otherwise it will always 
fail with an internal toolchain.

  You also need a condition on BR_BUILDING, otherwise the error is printed even 
in situations where an invalid configuration is allowed (e.g. 'make help').

  I added both to all 4 patches and applied to master, thanks.

  Regards,
  Arnout

> +$(error No external toolchain path set, check your BR2_TOOLCHAIN_EXTERNAL_PATH setting)
> +endif
>   endif
>   
>   ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
