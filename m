Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABF5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 12:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1B9F408EF;
	Sat, 12 Feb 2022 12:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21OaL14vWDQH; Sat, 12 Feb 2022 12:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C659A4089E;
	Sat, 12 Feb 2022 12:19:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2801F1BF84C
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1693881BD6
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 12:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zn6V-Hg37DVv for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 12:19:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5B8A81A95
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 12:19:41 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p9so5080916ejd.6
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 04:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lyk3P4Oz1bn2zPQignZH/fWZhoGFqTA4VUWyFJdN7As=;
 b=bb4Mo3mYVagN+WHOXHTxf+/C2MMVY6EzSmLs/rQ7adiMI20Wt79cfFF0vNJMLbo+fO
 rtwem48SX1CEr8CilWX9RpfUEu+6h7tlOfTBFtgU+cKvI+0AI340cwy4qyg7viSj1Fsy
 te+VwKSUYnIEXxgK1rlNt6iH1Igxz/V4rK74kRMJFWFgnUIQlgcjxwec6U4M1eHbJY/Q
 3Kmg5RfrvhYmAjR2O6qMoWN5L3L8VNEvVgJ8Uah7eNYoByqYbYesyPEjs+vQqrEmeWYd
 dCIodITi42Sbq8uWjTYtvjuFdbxVlCe3PUFHlxpt0dbN+8Pb1HUyeaMWQjPob1j7ajiE
 dV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lyk3P4Oz1bn2zPQignZH/fWZhoGFqTA4VUWyFJdN7As=;
 b=s+Oa8gNj8z1ZaDNl2h2j/flpyOz/M6+LLIaKLABAUm/AcBa64eMIG2Txup9oyXSK0l
 IhIx19c/Qq5Gcmc7/J9lBImgAnAEhfj2FjeoxGQL6+FeEXt/7aREaZ9JL0KQRgmMC21X
 OVsxuC6GSOO3vxtFM9NkHZaPp2/8qunsjwqk58kFmfeZNkOzwZRQjAG1IFLIIlu4op5W
 oc23avEKAA616AQfEcUcxsIG2P0zmUxLnJAdUjxSZ00udpJrkK/kMNaJAopnxCtj5qzP
 ZgQ8Ya/vahbais6QB/leQwUPHLs43PMTb//YU02F9RGZ/EYBKxfKK5GtjBFFI7qxC/Ru
 nnqw==
X-Gm-Message-State: AOAM5303oAod1vquyq1Huwei2ov27Fmi85jwWr5Z0kWVUQlLUb0TE5EF
 e7CJDOa+FMzw5dD+lRyAmNYQsw==
X-Google-Smtp-Source: ABdhPJwy4xzuva5Prmnpb5mpxV1TbkV24ACdsFYTdscaukzB4Vf/uw7FLPw71U+NYuQfB7Udkogy9g==
X-Received: by 2002:a17:907:2cc7:: with SMTP id
 hg7mr4809274ejc.83.1644668380012; 
 Sat, 12 Feb 2022 04:19:40 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u2sm8679687ejb.127.2022.02.12.04.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 04:19:39 -0800 (PST)
Message-ID: <449521f4-cef8-6209-7e94-bc2e7b9ca504@mind.be>
Date: Sat, 12 Feb 2022 13:19:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220130090535.404853-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220130090535.404853-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python: fix get_platform
 for target builds
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/01/2022 10:05, James Hilliard wrote:
> Replicate the logic used to set _PYTHON_HOST_PLATFORM in configure.ac:
> https://github.com/python/cpython/blob/v3.10.2/configure.ac#L441-L446
> 
> This should correctly set the sysconfig platform for cross builds:
> https://github.com/python/cpython/blob/v3.10.2/Lib/sysconfig.py#L704-L706
> 
> Not setting this appears to cause distutils/setuptools to use the
> wrong build directory names for c extensions, however this doesn't
> seem to cause build or runtime errors as the installation paths still
> appear to be correct for staging/target installs.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-python.mk | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 22ea77352c..d751311791 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -20,6 +20,13 @@
>   #
>   ################################################################################
>   
> +ifeq ($(BR2_arm)$(BR2_armeb),y)
> +PKG_PYTHON_ARCH = arm
> +else
> +PKG_PYTHON_ARCH = $(ARCH)
> +endif
> +PKG_PYTHON_HOST_PLATFORM = linux-$(PKG_PYTHON_ARCH)
> +
>   # basename does not evaluate if a file exists, so we must check to ensure
>   # the _sysconfigdata__linux_*.py file exists. The "|| true" is added to return
>   # an empty string if the file does not exist.
> @@ -33,6 +40,7 @@ PKG_PYTHON_DISTUTILS_ENV = \
>   	LDSHARED="$(TARGET_CROSS)gcc -shared" \
>   	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
>   	PYTHONNOUSERSITE=1 \
> +	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
>   	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>   	_python_sysroot=$(STAGING_DIR) \
>   	_python_prefix=/usr \
> @@ -60,6 +68,7 @@ HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
>   
>   # Target setuptools-based packages
>   PKG_PYTHON_SETUPTOOLS_ENV = \
> +	_PYTHON_HOST_PLATFORM="$(PKG_PYTHON_HOST_PLATFORM)" \
>   	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
>   	PATH=$(BR_PATH) \
>   	$(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
