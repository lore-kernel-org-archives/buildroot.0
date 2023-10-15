Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA101CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88CD2414A4;
	Sun, 15 Oct 2023 18:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88CD2414A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRInXTy0I0qQ; Sun, 15 Oct 2023 18:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C3484149A;
	Sun, 15 Oct 2023 18:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C3484149A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 165D61BF573
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2BBB4097F
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2BBB4097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bxRyguVNUYWt for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:20:35 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6AF91411C6
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AF91411C6
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-533c5d10dc7so6544916a12.3
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 11:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697394033; x=1697998833;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Se3kgnnk6zh7NosN+xR4DREbcATv5EUFOuoNJGXbTVc=;
 b=Z+gcjl6fx2Vd5FGYt85r0EqLYc2DnJSIk2Df+p7YVYYsl1wZl69iNa1O2LagSczoSS
 uZ5URrycWVefiwZIeeydohqJFKYj4J7+OXUegMcpzLImrZ3niA27oEFluFqw05B4BonC
 jssti2NyUPBJpW1KYIQGRDuVP3Kd5dZbVDEYfJBru7Ret88vHE3tNmBGRNbXOxWQG3Jq
 rixqo4UWGSTCyiGR4rIoJUWTj49skf8dyEF1Xs7i5/qT7vbc1ITjtMI337KNPMxGIn8R
 cUzcF9Ktg/cQaSPRRSiEXw4qCN3cA7IRPxTzhFPq0b3reuKM2tcO87s40ZVuQIpmZMO3
 2zdQ==
X-Gm-Message-State: AOJu0Yzv6rFTxHn0bwlZLTsL8jF/LK5+MF4C58UoXiifbD3W5BMNOtHZ
 N5uS+G3AJbllj/TECIY8LlcLaA==
X-Google-Smtp-Source: AGHT+IHkxpODCaG4tZAP0HMudVtqT4hd6EQksssDCjziUM7LAuEd5ITTeTp7E3c82JuoxRZGI/OMqQ==
X-Received: by 2002:a05:6402:1859:b0:530:8a17:39e0 with SMTP id
 v25-20020a056402185900b005308a1739e0mr28532158edy.13.1697394033247; 
 Sun, 15 Oct 2023 11:20:33 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a056402095000b0053e15aefb0fsm4722217edz.85.2023.10.15.11.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 11:20:32 -0700 (PDT)
Message-ID: <5f76c7de-bdaf-d208-9cca-c3d7ac9635a2@mind.be>
Date: Sun, 15 Oct 2023 20:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20221227154300.10556-1-brandon.maier@collins.com>
In-Reply-To: <20221227154300.10556-1-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1697394033; x=1697998833; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Se3kgnnk6zh7NosN+xR4DREbcATv5EUFOuoNJGXbTVc=;
 b=dJcpca2p3pBK7zaJmSRSXAf5qIkcirQvYUNL4MIADgAfx6eB1Oy1NSg+pW9aJSmdng
 o2aaPfy5ZOWSbXKrr+M9VZvmH7QFO13rLI8LPka/kwQI0+04tueWMuIPsErIrUpPuQSa
 BVpSap7MttwIv7DS02cqVBwjDjMDRd72pkcvzhA5TZGvpRTCWh+RPopiwUxPyXCl/gKU
 HRIEqTGghruNtHLUpnf1ykSyz2JeXgsrsTO8P/6bTlsWnVy10uDm+3KdpnhV1gSiZJQ2
 z6qbEdg675qPm6u+g1Son5xE4CrW1ti48A4c9kUahx9okhj1UR5x3MUI6pL/4KshsNt0
 TD4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dJcpca2p
Subject: Re: [Buildroot] [PATCH v2 1/1] Makefile: fix SDK relocation for
 per-package-dirs
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/12/2022 16:43, Brandon Maier wrote:
> The relocate-sdk.sh script does not work correctly when
> BR2_PER_PACKAGE_DIRECTORIES is enabled. relocate-sdk.sh expects
> everything to point at $HOST_DIR, but each package will be pointing at
> its $(O)/per-package/*/host.
> 
> Use the same command for scrubing host paths during the build, to scrub
> to the final host directory location.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

  Applied to master, thanks.

  And thank you Charles for the review.

  Regards,
  Arnout

> ---
> v2:
> - drop original implementation in favor of reusing the existing
>    PPD_FIXUP_PATHS code.
> ---
>   Makefile               |  1 +
>   package/pkg-generic.mk | 12 +-----------
>   package/pkg-utils.mk   | 15 +++++++++++++++
>   3 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 88f90cd2fa..ac3540b36c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -598,6 +598,7 @@ prepare-sdk: world
>   	@$(call MESSAGE,"Rendering the SDK relocatable")
>   	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath host
>   	PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath staging
> +	$(call ppd-fixup-paths,$(BASE_DIR))
>   	$(INSTALL) -m 755 $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)/relocate-sdk.sh
>   	mkdir -p $(HOST_DIR)/share/buildroot
>   	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f24e03a325..210af1bbef 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -92,18 +92,8 @@ endif
>   
>   ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
>   
> -# Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
> -# proper staging and host directories for the current package: find
> -# all text files that contain the PPD root, and replace it with the
> -# current package's PPD.
>   define PPD_FIXUP_PATHS
> -	$(Q)grep --binary-files=without-match -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \
> -	|while read -d '' f; do \
> -		file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
> -		printf '%s\0' "$${f}"; \
> -	done \
> -	|xargs -0 --no-run-if-empty \
> -		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g'
> +	$(call ppd-fixup-paths,$(PER_PACKAGE_DIR)/$($(PKG)_NAME))
>   endef
>   
>   # Remove python's pre-compiled "sysconfigdata", as it may contain paths to
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 0945e6ed31..f22562fbed 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -233,6 +233,21 @@ define prepare-per-package-directory
>   	$(call per-package-rsync,$(1),host,$(HOST_DIR))
>   	$(call per-package-rsync,$(1),target,$(TARGET_DIR))
>   endef
> +
> +# Ensure files like .la, .pc, .pri, .cmake, and so on, point to the
> +# proper staging and host directories for the current package: find
> +# all text files that contain the PPD root, and replace it with the
> +# current package's PPD.
> +# $1: destination root directory containing host and staging
> +define ppd-fixup-paths
> +	$(Q)grep --binary-files=without-match -lrZ '$(PER_PACKAGE_DIR)/[^/]\+/' $(HOST_DIR) \
> +	|while read -d '' f; do \
> +		file -b --mime-type "$${f}" | grep -q '^text/' || continue; \
> +		printf '%s\0' "$${f}"; \
> +	done \
> +	|xargs -0 --no-run-if-empty \
> +		$(SED) 's:$(PER_PACKAGE_DIR)/[^/]\+/:$(1)/:g'
> +endef
>   endif
>   
>   #
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
