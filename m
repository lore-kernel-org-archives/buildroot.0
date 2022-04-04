Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32324C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 18:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE05E40309;
	Mon,  4 Apr 2022 18:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C9tsdLP0P8mq; Mon,  4 Apr 2022 18:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7052402B2;
	Mon,  4 Apr 2022 18:13:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F18421BF294
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF31060C16
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 18:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypZMArPZSiyF for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 18:13:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0745D60BF6
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 18:13:09 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id q26so4489568edc.7
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tidaMtUnDnyYFxOpcUGf50Y+7jSo/pEn8rgFmZX/5tM=;
 b=iFjFRf0mifoVK7+JpJot8047Vzx198yAZD22xSVsxLh6Q6YkR27N+vThXT7SMwh6z8
 E0KC6kgzjHIjWKSNUet5qJqP01vCqA+VOUzsMH5iKk97PlXGanqxf3h3RJVBwRFUZxb2
 IYCKBugeHhdNXdQptACm100i4pUdRSY4o8oxeFXrZRxmt50WwgHL2ypDtAu5L5vb3c2A
 xPpOQbPVXnIhojF6hs4n2R58sw/9nDfTzK+X2+FpXyvWJ2fZozGR8+adFH+cXWUEnUUv
 h4eph8Hes4eupT8NYUpVb19SSz9Umuyjoka4d5hccmG3iOWRTVSgba+48TbXjE2c1hdG
 ZzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tidaMtUnDnyYFxOpcUGf50Y+7jSo/pEn8rgFmZX/5tM=;
 b=qtnmLkpZ3xDi/dCuXuZY9z073oyy0g6cC4PEilifrnjzsIP6zD7ECBP10Kp34Zp4A+
 yiXlsoUZhRpFpZ8uzuVL2EsNtLMxP3QLk15c2UL3wIrBdJbcRDNpleHOKK7SveqHs5lO
 uSR/XgyPnzp2vUs1yZuqGSduTPYGJuedgkH71Lp30fglr/X3Rh7XMkz8eFnDV4zjTODX
 o0CdejzIJsZ21GlHX7luNZ+b3FkiD7lUXwlhT/sbo11PxpmiejCLychjEKWj4TpZ2tcD
 e7qv4++rPgK0H/A8J6oTGEPzDK/oYIwG6si645t2ZHIYXdHnuNydAtvF2bK44qVTvNDU
 lCaQ==
X-Gm-Message-State: AOAM530t/aIkn9XrOrD+wUlkhzezeiSXcxIWeJszsHOvYER7fpDc37jq
 hr/QauJjLBeC9mZIM/R21vGHkQ==
X-Google-Smtp-Source: ABdhPJxy+5g5zEHh3cexDC4+70+sRGHmKl9pql90wu6LcDbL86dWc/y0ETIk3vMUBaKzsUhw9KZzcw==
X-Received: by 2002:a05:6402:d6:b0:413:b81:6695 with SMTP id
 i22-20020a05640200d600b004130b816695mr1507726edu.176.1649095988215; 
 Mon, 04 Apr 2022 11:13:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a1709067f8300b006ce051bf215sm4591869ejr.192.2022.04.04.11.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 11:13:07 -0700 (PDT)
Message-ID: <b511d98d-447c-4b2b-3c36-8c64bc805591@mind.be>
Date: Mon, 4 Apr 2022 20:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220401211005.1052795-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220401211005.1052795-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeotiff: bump to version
 1.7.1
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
Cc: Murat Demirten <mdemirten@yh.com.tr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/04/2022 23:10, Fabrice Fontaine wrote:
> Update license, "X style license" means MIT:
> https://github.com/OSGeo/libgeotiff/commit/5d6619c1168845c5bd77686f01e197a82854cbf1)
> 
> https://github.com/OSGeo/libgeotiff/releases/tag/1.7.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libgeotiff/libgeotiff.hash | 4 ++--
>   package/libgeotiff/libgeotiff.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libgeotiff/libgeotiff.hash b/package/libgeotiff/libgeotiff.hash
> index ec9fccb492..883199501d 100644
> --- a/package/libgeotiff/libgeotiff.hash
> +++ b/package/libgeotiff/libgeotiff.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  fc304d8839ca5947cfbeb63adb9d1aa47acef38fc6d6689e622926e672a99a7e  libgeotiff-1.7.0.tar.gz
> -sha256  6a22340b8293c50a34ce8e95589489bd3ec65bcb8b93e61cbda3daaafe498375  LICENSE
> +sha256  05ab1347aaa471fc97347d8d4269ff0c00f30fa666d956baba37948ec87e55d6  libgeotiff-1.7.1.tar.gz
> +sha256  a822a731a7ac4ba7d8f18fa0dc29db2e68a5dcfc315b46e4a4c8956720d55d93  LICENSE
> diff --git a/package/libgeotiff/libgeotiff.mk b/package/libgeotiff/libgeotiff.mk
> index c49528565d..6ab60c93fc 100644
> --- a/package/libgeotiff/libgeotiff.mk
> +++ b/package/libgeotiff/libgeotiff.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -LIBGEOTIFF_VERSION = 1.7.0
> +LIBGEOTIFF_VERSION = 1.7.1
>   LIBGEOTIFF_SITE = http://download.osgeo.org/geotiff/libgeotiff
> -LIBGEOTIFF_LICENSE = X11-style, public domain
> +LIBGEOTIFF_LICENSE = MIT, public domain
>   LIBGEOTIFF_LICENSE_FILES = LICENSE
>   LIBGEOTIFF_DEPENDENCIES = proj tiff host-pkgconf
>   LIBGEOTIFF_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
