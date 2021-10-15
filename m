Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CBCC433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:03:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 460DA61053
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 460DA61053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C07383B1E;
	Fri, 15 Oct 2021 20:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hBgznCQL_7i; Fri, 15 Oct 2021 20:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 690E183A5A;
	Fri, 15 Oct 2021 20:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D17E1BF41F
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79917605A1
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NL3yQCuLhIJW for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:03:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8D016058D
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:03:51 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z20so42459192edc.13
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zJCU7KAjyzLWzl1AdidNsVx8/GVSzY+s5ppuebtOFGM=;
 b=DE+z9b1IQ5M2Mikynj5m9T/U8q8B0qOXC9kbuagB4TE6QeVkPcJd+XAXAQ9IdjOwXm
 cBi01hIOn3EqYN77TulbhFkVQKWd4ZIfU1Yh6iQQzpwclfoDjgH2dWEg8fzKe5tKGfNz
 P3mYqZUxflXr+QU0DRphGBmQTb3ScoKkxNqqynH911e1b9xs0fX8maUzhnjUyme1CP5N
 9tozr88QVHW3yqMrG9RIjVFfV6iRjCOOzEGGdx7JcRpArMiRU9dyoyaLF1n7hwvgjbWT
 zG6U/VKYZRLEo6uGBWppnHnOoQgT7LVG1n7yZ7gt7tdUoT40oQliNAkoZquVPF0xiPoG
 zqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zJCU7KAjyzLWzl1AdidNsVx8/GVSzY+s5ppuebtOFGM=;
 b=oad91hY9hFo+yZVwyC54x+9J640Q7Ls+6n5flqe79tyBs/ElUm+FTxqylCj1+gpw9X
 0JEMgXBY9fcM6Tl6MqI4TieO1oDam5GwAoVxlzG3eosAbb4PvpOcIiRw6t2YvCTVUll0
 SjJ2jUue3pdHFkwDTel+4D8kpW+MLCZUQSQ39gkPCd+XSmboX5cQC/FpfCLtIeovMDnR
 77OTE100DmXTGC0EnWXlGft7pVyOxZT6jTUGTWJ7VFnQTveCj5dCR9JEs+hbOq2E7SWa
 3xCzUa6tilteRsb9dIgj4dZeodH2MXloLbapPZshbd/ASGiqpzPgQpYMzDW2x9fHF6Ba
 cumA==
X-Gm-Message-State: AOAM530w4EoYWrKNg0+8Cdv8GwbcXRVgSt28Clkx4+2JNeD5WVLuy9DP
 euDdcsyk980c8vcD/+PLRYrstQ==
X-Google-Smtp-Source: ABdhPJwGZdm7tjroQkKUCkdJKghB2eChKUlFGf0MhsK4TCunlJUnPR2GYxqGksPaCWUCn+HWpjI+TA==
X-Received: by 2002:a05:6402:51c9:: with SMTP id
 r9mr20097739edd.48.1634328230164; 
 Fri, 15 Oct 2021 13:03:50 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id u14sm275622edj.74.2021.10.15.13.03.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 13:03:49 -0700 (PDT)
Message-ID: <bb5894e3-f244-14e7-721e-98f7876f77d0@mind.be>
Date: Fri, 15 Oct 2021 22:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20211004201737.1976547-1-yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211004201737.1976547-1-yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH] package/edk2-platforms: fix installation
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
Cc: Kory Maincent <kory.maincent@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/10/2021 22:17, Yann E. MORIN wrote:
> There are currently three issues with the installation step:
> 
>   1. it does not ensure the parent destination directory exists before
>      copying into it, so if /usr/share has not been created in the
>      dependency chain of edk2-platforms, the installation fails, which
>      may very well happen easily as edk2-plaforms has nothing in its
>      dependency chain (except the toolchain et al.);
> 
>   2. all our dot-stampfiles and .files-list are also copied, as well as
>      the Readme, license files, and maintainers file. All of those are
>      useless on the target (and the .files-list introduce
>      non-reproduciiblity);
> 
>   3. of a lesser importance, the construct to install, and specifically
>      to reinstall, does not match what we usually do in Buildroot
>      (removal of the directory to copy).
> 
> We fix all three in one fell swoop:
> 
>   1. create the destination directory if needed;
>   2. copy just the directories with the actual platform descriptions
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Dick Olsson <hi@senzilla.io>
> Cc: Kory Maincent <kory.maincent@bootlin.com>

  I love it when the commit message is three times larger than the diff :-)

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/edk2-platforms/edk2-platforms.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
> index 47e6b1c51d..430791ae3e 100644
> --- a/package/edk2-platforms/edk2-platforms.mk
> +++ b/package/edk2-platforms/edk2-platforms.mk
> @@ -15,8 +15,8 @@ EDK2_PLATFORMS_INSTALL_STAGING = YES
>   # There is nothing to build for edk2-platforms. All we need to do is to copy
>   # all description files to staging, for other packages to build with.
>   define EDK2_PLATFORMS_INSTALL_STAGING_CMDS
> -	rm -rf $(STAGING_DIR)/usr/share/edk2-platforms
> -	cp -rf $(@D) $(STAGING_DIR)/usr/share/edk2-platforms
> +	mkdir -p $(STAGING_DIR)/usr/share/edk2-platforms
> +	cp -rf $(@D)/*/ $(STAGING_DIR)/usr/share/edk2-platforms/
>   endef
>   
>   $(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
