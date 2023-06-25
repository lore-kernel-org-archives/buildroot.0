Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A60EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1451181E56;
	Sun, 25 Jun 2023 19:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1451181E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGG35OJoSkGy; Sun, 25 Jun 2023 19:54:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44EA581973;
	Sun, 25 Jun 2023 19:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44EA581973
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC0D1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72E4381973
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72E4381973
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPbUM2c_l8VM for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:54:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 225F581919
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 225F581919
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:54:09 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-991aac97802so59986266b.1
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687722847; x=1690314847;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fdd8vCrFnhh1XdioS/vMdKl4sZC7mRrlw4bEfZtWZVA=;
 b=grRqo4WnJgdlTgxSxXtINbHuFmdwwwWjapc1MV3UeaV28Ov1WZdgvrHJudg971jfJu
 4kPNfbFU7MbxNg5UaJIP1iL+znevAJFH53I7GoFrTpCVPc7Tmf49+gNJKOheHDnJPLDF
 VG837j98DhcJ055MmEyH9W9LTiryx6Ofezrsv1dt53HsLRlO8SID/1qz6NyYj+xNnbT1
 1r9p2k0+czqJ83Taf3l+CieNXuR5+JK3MbPn2KT8dKuF/36qThg5hJfGIZeVmvyr16hK
 66eUf8eZ1b+oZvT3wINN6I69zQfyr/CYymI3nYmG8klmSYiKVdKzwExmMXx4P9uyhs4b
 L91A==
X-Gm-Message-State: AC+VfDwfmykwNg2nLbQyDXLbTNde+BNd4Jpsp3+VjCIu8mjUzWWK+RyH
 5VEKxsa9hDfYyjt5+1NoCthtQA==
X-Google-Smtp-Source: ACHHUZ6fCxubIiLymjO/uhirsdP4tAJVR9LKl/wakMUcS8K0/qDkMG43wNxy52CBMzH6z3x6untKfQ==
X-Received: by 2002:a17:907:6e88:b0:988:8536:8886 with SMTP id
 sh8-20020a1709076e8800b0098885368886mr24236802ejc.21.1687722847323; 
 Sun, 25 Jun 2023 12:54:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 c4-20020aa7d604000000b0051a4a1abdbbsm2055310edr.49.2023.06.25.12.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:54:06 -0700 (PDT)
Message-ID: <54d0881e-8d06-24b1-d120-b4494ddf5d58@mind.be>
Date: Sun, 25 Jun 2023 21:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Alexey Romanov <avromanov@sberdevices.ru>, etienne.carriere@linaro.org
References: <20230621090747.74080-1-avromanov@sberdevices.ru>
In-Reply-To: <20230621090747.74080-1-avromanov@sberdevices.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687722847; x=1690314847;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fdd8vCrFnhh1XdioS/vMdKl4sZC7mRrlw4bEfZtWZVA=;
 b=Dfsx1IQrtsrf5Kn51k+yDJFlumHNkQ501ULdcRcukSvtp/QFft+xRraV+XOQM/OklT
 NVOuSV1/uM5ayuoKf6zvi9YIC01oXmWsGAIedfCaM9Wrs5ucZb1Y0FZ5mLCtBJUEO0Nq
 OgYvdtMntM0p8QqtJhb0H8XouHReUAXCXwo4U2I4ugNW3M91cBIodBFEuiAaz9QPBqJO
 /UmBKoSU/OaYdJGw/v7bxgL2id+TAefJtCffMi2N1/QD1SGb1hASE5pYkTNQmLr6x9dQ
 0hSgLgEGL7UIFuOsS8vL1Bh2DEWdKNFh6O1aSuCA6kN27VlGEx0dw5uVDYcFtUIBqav9
 BFiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Dfsx1IQr
Subject: Re: [Buildroot] [PATCH v1] optee-client: add option to set
 tee-supplicant startup priority
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: kernel@sberdevices.ru, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/06/2023 11:07, Alexey Romanov via buildroot wrote:
> In some cases, it is necessary to explicitly specify the startup
> priority of the tee-supplicant script in init.d.
> 
> In most cases of system operation, the S30 priority is acceptable.
> However, there are cases when the user needs to choose the startup
> priority of the tee-supplicant.

  This kind of issue exists for every init script. We don't want to have such an 
option every time we add init scripts. So this kind of customization is 
something for a post-build script, that simply does

mv ${TARGET_DIR}/etc/init.d/S30tee-supplicant \
    ${TARGET_DIR}/etc/init.d/S01tee-supplicant


  Therefore, I've marked this patch as Rejected.

  Other maintainers may disagree though.

  Regards,
  Arnout

> 
> For example, for encryption/decryption of the user's file system,
> OPTEE is usually required, i.e. the tee-supplicant daemon needs to
> be running. Usually, such a script runs on the earliest priorities
> in the system, for example, S01.
> 
> By default, the priority remains at 30, but for specific scenarios,
> the user can specify their own priority.
> 
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> ---
>   package/optee-client/Config.in       | 7 +++++++
>   package/optee-client/optee-client.mk | 4 +++-
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
> index cc7f176c77..d074a36b08 100644
> --- a/package/optee-client/Config.in
> +++ b/package/optee-client/Config.in
> @@ -37,6 +37,13 @@ config BR2_PACKAGE_OPTEE_CLIENT_SUPP_PLUGINS
>   	help
>   	  Enable TEE supplicant plugin support.
>   
> +config BR2_PACKAGE_OPTEE_CLIENT_TEE_SUPPLICANT_INITD_PRIORITY
> +	string "Priority startup for tee-supplicant init.d script"
> +	default "30"
> +	help
> +	  Use this option in cases when you clearly need to specify
> +	  the priority of launching tee-supplicant init.d script.
> +
>   endif
>   
>   comment "optee-client needs a toolchain w/ threads, headers >= 4.3"
> diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
> index 13a9eb6b20..bd977909f8 100644
> --- a/package/optee-client/optee-client.mk
> +++ b/package/optee-client/optee-client.mk
> @@ -26,9 +26,11 @@ else
>   OPTEE_CLIENT_CONF_OPTS += -DCFG_TEE_SUPP_PLUGINS=OFF
>   endif
>   
> +TEE_SUPPLICANT_PRIORITY=$(call qstrip,$(BR2_PACKAGE_OPTEE_CLIENT_TEE_SUPPLICANT_INITD_PRIORITY))
> +
>   define OPTEE_CLIENT_INSTALL_INIT_SYSV
>   	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30tee-supplicant \
> -		$(TARGET_DIR)/etc/init.d/S30tee-supplicant
> +		$(TARGET_DIR)/etc/init.d/S$(TEE_SUPPLICANT_PRIORITY)tee-supplicant
>   endef
>   
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
