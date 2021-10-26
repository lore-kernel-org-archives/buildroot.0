Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48419C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:35:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 125D860F56
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 125D860F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBAAC60AC9;
	Tue, 26 Oct 2021 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MOiij2Bl2_eL; Tue, 26 Oct 2021 19:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3774B607AE;
	Tue, 26 Oct 2021 19:35:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1A8F1BF3CD
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E63C607AE
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfOOnbZ-Rs4E for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:35:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C43A6067F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:35:25 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id s1so945919edd.3
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JszZnb5Rut3Hs77q/FlxLRqvh35Cqoerans24YNs7Jk=;
 b=NKqpFMPmtfPUYHbwh+8kZxcio8JAOoATnK0xhPwbyZ4ZrQQmzJDuUyTE8ymT1x+wvy
 ExDDRHfcxvoxjdYrkvldaegGnGyH/56GoQIgZoSTNPkNZD9gNLsfD5gGbz4O/58zDD2n
 UbIGCYVjEqlPW1i5eY+is4vCcXVTdrJi3+EHhz+rA6yUSWTm4dCnSc5+BQ3nzP/sS3rP
 1EUXfb2Bh7yqgBNTWA9reu9Ht0MVNuk1e9im+DnfQ18r8Ko34rgI1HnalQydPxRm8d5r
 78LOAHK++FR9XZLVtw6vGPG7qOh6/fuvBp6DaqT0P6eR01cemDUXgZbRBh9PUDNIDz6T
 mZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JszZnb5Rut3Hs77q/FlxLRqvh35Cqoerans24YNs7Jk=;
 b=FlNbvCMA2GFIgOvyVyOGTgqHnHp3MloYL62VnmX2ki3KUEijuY8GYeIeTJ3QDiX6ay
 rCAPD2lTy7R9GJP+JwsvfFOPZLwOLX91MYR3MD+uWLq2Ne0t2aW5arzTwZ58JgjoDZGg
 XO+d1tu9jshjPsFCnXt6gdgE/1TpHsSp4ptkKMG8wIgb8HCFvA5gqIlEu+1Zptm/i0Fg
 rsbD4p5ov8gZeFziCF2ktpP+N069IHKl4cjorHLTchJRnesYEIJgqOC2QcpLuJINWMLO
 D+O2/zznR6EN+n3mlO3qxpPScb86L6xRGGz/9H0Upcq41GtI4fadZhx8n9+kWdCeggN3
 JXTQ==
X-Gm-Message-State: AOAM530SozyzcN9S77t7FZB91HSxITNdu74G6krTyNUJ6kjpsWMTl0Xt
 r0wLuCioVp+9jbtgx7hDB3KkUrrLlTRl9g==
X-Google-Smtp-Source: ABdhPJzBHslM3d8JxtghJfgBE/8Fo4WpaekWylVymoQvlz69EYoC2dGpO2+Ad7Tr/uwEJEVSg+v07g==
X-Received: by 2002:a17:907:6da4:: with SMTP id
 sb36mr14879929ejc.490.1635276923875; 
 Tue, 26 Oct 2021 12:35:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y26sm4464565edv.88.2021.10.26.12.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 12:35:23 -0700 (PDT)
Message-ID: <e047a26b-ca74-afc8-f8ad-cdb76eda988e@mind.be>
Date: Tue, 26 Oct 2021 21:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211024215438.3551045-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211024215438.3551045-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.4
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/10/2021 23:54, Fabrice Fontaine wrote:
> - Fixed a denial-of-service vulnerability in the gmp plugin that was
>    caused by an integer overflow when processing RSASSA-PSS signatures
>    with very large salt lengths. This vulnerability has been registered
>    as CVE-2021-41990.
> - Fixed a denial-of-service vulnerability in the in-memory certificate
>    cache if certificates are replaced and a very large random value
>    caused an integer overflow. This vulnerability has been registered as
>    CVE-2021-41991.
> 
> https://www.strongswan.org/blog/2021/10/18/strongswan-vulnerability-(cve-2021-41991).html
> 
> https://github.com/strongswan/strongswan/blob/5.9.4/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/strongswan/strongswan.hash | 6 +++---
>   package/strongswan/strongswan.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
> index a19b311458..69b3547f91 100644
> --- a/package/strongswan/strongswan.hash
> +++ b/package/strongswan/strongswan.hash
> @@ -1,7 +1,7 @@
> -# From http://download.strongswan.org/strongswan-5.9.1.tar.bz2.md5
> -md5  1f4db969d072e120dc12d1c116a0f658  strongswan-5.9.1.tar.bz2
> +# From http://download.strongswan.org/strongswan-5.9.4.tar.bz2.md5
> +md5  9c387eb77f0159fdefbcf7e81c905c35  strongswan-5.9.4.tar.bz2
>   # Calculated based on the hash above
> -sha256  a337c9fb63d973b8440827755c784031648bf423b7114a04918b0b00fd42cafb  strongswan-5.9.1.tar.bz2
> +sha256  45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518  strongswan-5.9.4.tar.bz2
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 2967682767..850bb7326e 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -STRONGSWAN_VERSION = 5.9.1
> +STRONGSWAN_VERSION = 5.9.4
>   STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
>   STRONGSWAN_SITE = http://download.strongswan.org
>   STRONGSWAN_LICENSE = GPL-2.0+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
