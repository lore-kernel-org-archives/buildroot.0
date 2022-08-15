Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF5EC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 437EB607CE;
	Mon, 15 Aug 2022 16:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 437EB607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3IQiZ0wfhA0; Mon, 15 Aug 2022 16:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B9BB605E8;
	Mon, 15 Aug 2022 16:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B9BB605E8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 025CF1BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0E5B81BB0
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E5B81BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E6eR-MEif0iy for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:46:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3AC981B84
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3AC981B84
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 16:46:14 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id kb8so14495381ejc.4
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=9NYAw7Wu4OFuY/OpfOxP9/4T3N1z5JuDKmWq+XR3wpQ=;
 b=cOPn78Q2KSZuZAv2S/Vw/wqfV8Ti9X38iGvsgaRRX7+/OHHwtgIr/NplQEO1noVEwf
 gunG5j3t/yJeQr7712GnyQWrrZGqmw4QfCGR3oNX3+v1iqMYWREmX3QSj25E8iTtyc9r
 9qRmUTrdyCwX2ifl7YGU4d9aGzas5jamlQ7hnvOrM0Ejbx7jGSeMpCDrSaO52ySLt4UG
 fGKosb5XrqvBGtxHN6UcC/kBTZd2PTf4ubI7PrLAUwVYWc04Q8qj4CCjeh2BNvpSK428
 bmkMttuyNhNVfnI3Nn4lDMsfZrScHzyjKfg3oecSQ9Q7M0DylZI1UowFyhPAmWnZDzIU
 lJ5A==
X-Gm-Message-State: ACgBeo30ctFeAP8vC+qVKUuiT/dm2E9heutbwjk+/Ia1VZoVEX9F/jJE
 80cm/dMHKfTzHvtbIU0J+WPzDw==
X-Google-Smtp-Source: AA6agR6+niV7ApnAcKhKZyNGOXu62Ap68euQFRVBvAf5yciaxsZ5cttk/XQoAMlJr5WfiNCL+dHyng==
X-Received: by 2002:a17:907:724d:b0:731:8022:94e9 with SMTP id
 ds13-20020a170907724d00b00731802294e9mr11049889ejc.172.1660581972883; 
 Mon, 15 Aug 2022 09:46:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a17090653cd00b0073872f367cesm367121ejo.112.2022.08.15.09.46.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 09:46:12 -0700 (PDT)
Message-ID: <0c5bda1b-ffbc-68b9-c0fc-10fa1df1eef4@mind.be>
Date: Mon, 15 Aug 2022 18:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220809143126.1912662-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220809143126.1912662-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc;
 bh=9NYAw7Wu4OFuY/OpfOxP9/4T3N1z5JuDKmWq+XR3wpQ=;
 b=H0loLT95r/mRbXNuL4rg2z+p+smmZFh12PRgxcbF2RUa8gPRbdCVCJSdnJ3ArI25Sa
 nCSeX91xYJO5i7Ni7fnNrVPAKCxU1emdpUbtXCVgX33733OKIjuQDHBdZjTbw72uzGCv
 zX1J0XQ+AjOLnDerduNIl52eRcC4kSg+dPjOSoSsY0uISQpjpt+y4dempSmgNq2j45/j
 ENF3ohDzWu3emUo0Ldym/djPdniwBaopeTB272Ov4Q+SP4E8dfKLpbR0zdmwUPLGrimo
 nTfi74MF+EkjCCD4DN5enNUrSvqjXLMmNFQXyAh47cVbtPlrkqZ4hJplvjouQKRTGo1b
 klQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=H0loLT95
Subject: Re: [Buildroot] [PATCH v3,
 1/2] package/xenomai: rework custom handling
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/08/2022 16:31, Fabrice Fontaine wrote:
> - Drop default value of BR2_PACKAGE_XENOMAI_REPOSITORY
> - Add BR2_PACKAGE_XENOMAI_{CUSTOM_VERSION_VALUE,REPOSITORY_VERSION} to
>    mimick what is done by other packages (e.g. barebox, u-boot)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied both to master, thanks.

  I was a bit on the fence about master or next, but it fixes an autobuild problem.

  Regards,
  Arnout

> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>   - Don't set default values and rework custom handling
> 
> Changes v1 -> v2:
>   - Prepend v to version for custom git
> 
>   package/xenomai/Config.in | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> index ec6d9e5d29..269b85b5ce 100644
> --- a/package/xenomai/Config.in
> +++ b/package/xenomai/Config.in
> @@ -64,17 +64,29 @@ config BR2_PACKAGE_XENOMAI_CUSTOM_GIT
>   
>   endchoice
>   
> +config BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE
> +	string "Xenomai version"
> +	depends on BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
> +
>   config BR2_PACKAGE_XENOMAI_REPOSITORY
>   	string "URL of custom repository"
> -	default "https://gitlab.denx.de/Xenomai/xenomai.git"
>   	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT
>   
> +config BR2_PACKAGE_XENOMAI_REPOSITORY_VERSION
> +	string "Custom repository version"
> +	depends on BR2_PACKAGE_XENOMAI_CUSTOM_GIT
> +	help
> +	  Revision to use in the typical format used by Git, i.e a
> +	  SHA1 or a tag.
> +
>   config BR2_PACKAGE_XENOMAI_VERSION
> -	string "Custom Xenomai version" if \
> -		!BR2_PACKAGE_XENOMAI_LATEST_VERSION && \
> -		!BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
> +	string
>   	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
> +	default BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE \
> +                if BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
>   	default "custom" if BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
> +	default BR2_PACKAGE_XENOMAI_REPOSITORY_VERSION \
> +		if BR2_PACKAGE_XENOMAI_CUSTOM_GIT
>   
>   config BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL
>   	string "URL of custom tarball"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
