Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E81C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD6E61021;
	Thu, 16 Dec 2021 19:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wOp6ik3PwMb; Thu, 16 Dec 2021 19:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A772D60EB9;
	Thu, 16 Dec 2021 19:37:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7361BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BE6C41703
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRU_YYi9k_mK for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:37:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9956B410AA
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:37:28 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id o20so91172580eds.10
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2VAKIzG9cZWe8LewA1/bbPzht3zelEhjd8g5CBQgWVs=;
 b=Dkl7mZM/zieaPsGix9hWnUyI281O9k32iglIsXVn1EjnWONoQKHJ89ou0yFyQvCXmv
 yDaWqIIanMCa1ft15TF7KWT/WI2uSjxguAH7ThJN4xCodu3Om4Cmx0NcsCZij8vO9NR7
 F1EIlJrJcPFyK2UUOr28xxG7KwM5upi8+rhW9Nj99aK2HyzbSE/5NBcOXtilFqufVgyo
 NYQWonv/eXFx35wmEaen/2ixfaFPk9w+2iu8h29f0sltMx1P47xQqOegljr/4TGFvoHS
 P2d/z6TfUKrU8LHLLvfFTZLxJCBO39h4sGsm34ahA+uTSjj119YVANs4LuBrbrbuAie/
 KEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2VAKIzG9cZWe8LewA1/bbPzht3zelEhjd8g5CBQgWVs=;
 b=stS3UC/t3OIs7tBXUEPJqy2X+iX9Ap7xf5S5ppH8FVcsRM6AqZhflxU+OaqIhuWFXi
 M+2ltD3LxBHf0P1aMMqp4sR668J8xtTRvtZBvTxRPIob+sNySksDMf2NOb7DKy4qTVZr
 ws/PcwWz0gY5qx61ESzVLr5keshdJhdyEq34Pl+KKeV8IhUu+oRJhxIL0AbgPtgL8AqQ
 8mSaju+f/4X/ZpNpq3r+aI2FGIkp16mSTYd5BvKcXUriHw9qQUGVaiUQCg3CUPIVMt/C
 UPPshs39A4+h4sMIZuNcQfMeCeuLL0STGvivUG0ixDP1qJxkfLheSz4CZr5lLvIQNSzs
 gpxg==
X-Gm-Message-State: AOAM531MAqAdKoAN6dRVwoar9o9gNd8vR3B7+7PLjWKstnJ+A9tTsELD
 4xq0+i6+0A3CtBROU+sBwT47Kg==
X-Google-Smtp-Source: ABdhPJyjPfkY0+rnbS5SEDUoWrwbt6usH0OCJa1MAfZogV5+zHMZUhfHKvygxHVd1PEO19lQjtk0og==
X-Received: by 2002:aa7:cd12:: with SMTP id b18mr10040173edw.355.1639683446874; 
 Thu, 16 Dec 2021 11:37:26 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p26sm2697466edt.94.2021.12.16.11.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:37:26 -0800 (PST)
Message-ID: <48934827-1d3b-85a2-5985-783652fd8e13@mind.be>
Date: Thu, 16 Dec 2021 20:37:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211215215007.3983784-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215215007.3983784-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/civetweb: fix
 BR2_STATIC_SHARED_LIBS typo
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



On 15/12/2021 22:50, Fabrice Fontaine wrote:
> Fix typo BR2_STATIC_SHARED_LIBS -> BR2_SHARED_STATIC_LIBS added by
> commit db47bc99976c2d4ffb509620a76cfdd369b30559
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/civetweb/civetweb.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
> index 33c3bfdf33..22618fb443 100644
> --- a/package/civetweb/civetweb.mk
> +++ b/package/civetweb/civetweb.mk
> @@ -54,12 +54,12 @@ ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
>   CIVETWEB_INSTALL_STAGING = YES
>   CIVETWEB_INSTALL_TARGETS += install-headers
>   
> -ifeq ($(BR2_STATIC_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>   CIVETWEB_BUILD_TARGETS += lib
>   CIVETWEB_INSTALL_TARGETS += install-lib
>   endif
>   
> -ifeq ($(BR2_SHARED_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>   CIVETWEB_BUILD_TARGETS += slib
>   CIVETWEB_INSTALL_TARGETS += install-slib
>   endif
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
