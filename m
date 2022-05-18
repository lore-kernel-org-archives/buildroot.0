Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA8DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 19:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 344BF41C7A;
	Wed, 18 May 2022 19:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbM5wrcPx9Dt; Wed, 18 May 2022 19:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E2941C79;
	Wed, 18 May 2022 19:18:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F72E1BF427
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E07661263
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 19:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id os5e77-45_2H for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 19:18:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E56E61260
 for <buildroot@buildroot.org>; Wed, 18 May 2022 19:18:51 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id z2so5682950ejj.3
 for <buildroot@buildroot.org>; Wed, 18 May 2022 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=bbP7YAlX7rGUCE2S7yajIStKN7zKrLN9r8IuZr1q7+g=;
 b=LBAsQ4kqTnugQLJBowQ0hU1UDCx1VfvrqF9PYkpfU3oqZjdo5tX/BR7cKh5iXTt++n
 sf6y9SCaFJ7KWJskV6SZ3L3AGzLtwRaZTMOlyion961W7FDAjjcazCQG11LHOd1blNYv
 j6maAX2j8pYXiMb78ghjDdk07nDX70IvPAY87M35NH5TWK8ZYQMEvHYgQtUJazAdD80Q
 bNZItnPOUlAhrykdnJVhe/Zajrfy19ZEJVnszg9x6AVbY5zKwRmyUDVu9s5CX8HNGxIv
 4n5H1J3qZHG2X04/K4aLdobiPhkUUUZquQ+psNjpG+Kl6z8DRpp70lCZUFHOVKpNwm53
 Fkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=bbP7YAlX7rGUCE2S7yajIStKN7zKrLN9r8IuZr1q7+g=;
 b=ePS8pRDxqr6DfznTFB1Lr1Gb4VNfFj1t2DtLaw2vK28Ed5nPCtm4UWuopRgiKRLnXB
 aH637v0y8CtZQf6DEv/JoP0pC4SOdqPeiDEqr8zuqSP2PcIzyeXSi3kGnvrW8855DmqZ
 1hOny/l9DPYkscCKMIm4gtoFUft1N+AbQVsjCTDrons3FK8SpVl8SAVvHABbehzln5iq
 phgmDM3tq3qab4vhOKsl9bKDgoenefSJHgHCvgZvz31WWTjiOwwZQtlxCtrZI7w9+akt
 0B65pLa/ps63uanF3Pz3BmIy9PWyoOaeV3Ube+rkfrwXJCVsHe6druogx4KGPJf6PQBu
 s2eQ==
X-Gm-Message-State: AOAM530MnSJlUGBoBTX1Rt96HAS6LlljJDAF6pIYQd1cbLimG5hjVFz3
 3AgOXcSOTiBrKosTwQYeHpx/kVUz6FpLPg==
X-Google-Smtp-Source: ABdhPJxKi8n/n27JfyfEo/yx+O4M/uObXX9QnUhybW1hoKEVfg/r4XyE3UCufAT3MYz6QPJzHYfFUw==
X-Received: by 2002:a17:907:6d22:b0:6f4:85c1:5a07 with SMTP id
 sa34-20020a1709076d2200b006f485c15a07mr946298ejc.733.1652901530729; 
 Wed, 18 May 2022 12:18:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a170906739800b006f3ef214e29sm1234725ejl.143.2022.05.18.12.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 12:18:50 -0700 (PDT)
Message-ID: <a0b985f7-157f-298c-761e-00d54dd8a1b3@mind.be>
Date: Wed, 18 May 2022 21:18:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220517225821.1572443-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220517225821.1572443-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: add ARM trusted
 firmware fixup
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



On 18/05/2022 00:58, James Hilliard wrote:
> Fixes:
> boot/arm-trusted-firmware/arm-trusted-firmware.mk:200: *** No repository specified. Please check BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL.  Stop.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   utils/genrandconfig | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index 60ef8739cc..cf43778183 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -426,6 +426,27 @@ def fixup_config(sysinfo, configfile):
>           configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL=y\n')
>           configlines.remove('BR2_KERNEL_HEADERS_CUSTOM_TARBALL_LOCATION=""\n')
>   
> +    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
> +       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y\n' in configlines and \
> +       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y\n')
> +        configlines.append('BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y\n')
> +        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=""\n')
> +
> +    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
> +       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y\n' in configlines and \
> +       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y\n')
> +        configlines.append('BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y\n')
> +        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION=""\n')
> +
> +    if 'BR2_TARGET_ARM_TRUSTED_FIRMWARE=y\n' in configlines and \
> +       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y\n' in configlines and \
> +       'BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=""\n' in configlines:
> +        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y\n')
> +        configlines.append('BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION=y\n')
> +        configlines.remove('BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL=""\n')
> +
>       if 'BR2_TARGET_AT91BOOTSTRAP3=y\n' in configlines and \
>          'BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG=""\n' in configlines:
>           configlines.remove('BR2_TARGET_AT91BOOTSTRAP3=y\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
