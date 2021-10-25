Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9BDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:16:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E10760C49
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 20:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E10760C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 493A880D37;
	Mon, 25 Oct 2021 20:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUrh_xQqDhzx; Mon, 25 Oct 2021 20:16:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D4D480D89;
	Mon, 25 Oct 2021 20:16:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 440811BF870
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33B03608A9
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 20:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TTz3XIahGbxj for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 20:16:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A5DF608A8
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 20:16:14 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g10so4028115edj.1
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 13:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MfXtWmeNiKPQvn6UL/6UH3EeCvKph9u73BLF8Q8M394=;
 b=COokwUlDWyJapwsuROAmKU+fki+UYEMNkz0xiCyt35Y+LMw2JsU16iEOtSBn1jdzh+
 pd827wUGkAPea55CND/oVfxrjwoKP2z1KXg+MOUzMI4gIP8LJhecKj1wyiUQHYyDQXmd
 9KQI4gg5utfDpRLSuDSv9KoDAQ2E9dWRWTYWvCfIn980B+08whWVyk0J9jWTv15+awzk
 3RhqvLilHif6YWdwXqXl4TCHg5hS8B87eDj9F/w8jr1NfRPb571fF1yqiT1Rp3Hq449F
 RoHnZ6TL4GweYrTwBphJHva6PE2h2Xr3ToRENhBq303Ag+gYuhcGEiS37JrSIZuakFEi
 QM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MfXtWmeNiKPQvn6UL/6UH3EeCvKph9u73BLF8Q8M394=;
 b=1xPAyWgfTX484hseqHtqirBTNSwj4J5ucIvtLoyWOXJA1ngKg3tmPSzI8RXTAVJTue
 jGkB5vrxgNwjjBvpFp/Q7w5W9K4wlMO5BLWK3POkef/wLsWK/Qc+iS6Ss2wh1DlUI84a
 YbOYKDqmp5VwE+9VjtCBUXZwAAKcXx+bRzA5r+UTnU6sooDhOABF5DA73fmKH19lSlSo
 eyFWAs89+Yl9X+j+Qz3bjaEjS5VJed5rVieOlG/kp1I257zqKwppqlNNWRFZ6AK7lJ9d
 7L2g/atw1kr/jcZVQl62qnJjbFPmEfqWKri2dAs6kMHkX8SLpc5WZQ/34qBDsrqjiueE
 TRIA==
X-Gm-Message-State: AOAM532OOIxbvCFYmC6MNzdiHkXb9aXhfvayqRbni5i4eEZsPx0iZxEt
 2cG0fvkRLFu0y3xL54afXRBt/g==
X-Google-Smtp-Source: ABdhPJwL7msEBeaLywr3P21sDMERryOTUeaDIpYibCsNmUlCfKtiTTEoQ1pRNT9naVgacfbtD/87jQ==
X-Received: by 2002:a17:907:7703:: with SMTP id
 kw3mr25005636ejc.34.1635192972338; 
 Mon, 25 Oct 2021 13:16:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id i4sm9542856edt.29.2021.10.25.13.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 13:16:12 -0700 (PDT)
Message-ID: <319f6514-b60a-f0d2-dddc-a4d5b6386c10@mind.be>
Date: Mon, 25 Oct 2021 22:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211016205914.400173-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211016205914.400173-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/strongswan: fix build without
 eap-sim
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



On 16/10/2021 22:59, Fabrice Fontaine wrote:
> Build of eap-sim-file or eap-simaka-reauth fails without eap-sim since
> commit 89f20c1c3f9d667ec0a40bcfe17db94ff098e6c0:
> 
> make[6]: *** No rule to make target '../../../../src/libsimaka/libsimaka.la', needed by 'libstrongswan-eap-sim-file.la'.  Stop.
> 
> make[6]: *** No rule to make target '../../../../src/libsimaka/libsimaka.la', needed by 'libstrongswan-eap-simaka-reauth.la'.  Stop.
> 
> So select eap-sim or eap-aka if needed to enable build of simaka library
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/0c550721c20946e5b9d07951a9698b88e9c53e7f
>   - http://autobuild.buildroot.org/results/354a022f789067edfe7ebd464991d1695a697a7a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/strongswan/Config.in | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
> index 4f02efb79d..23334470fd 100644
> --- a/package/strongswan/Config.in
> +++ b/package/strongswan/Config.in
> @@ -86,11 +86,13 @@ config BR2_PACKAGE_STRONGSWAN_EAP_SIM
>   config BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE
>   	bool "Enable EAP-SIM file backend"
>   	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
>   
>   config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
>   	bool "Enable EAP-SIM smart card backend"
>   	depends on !BR2_STATIC_LIBS # pcsc-lite
>   	select BR2_PACKAGE_PCSC_LITE
> +	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
>   
>   config BR2_PACKAGE_STRONGSWAN_EAP_AKA
>   	bool "Enable EAP-AKA"
> @@ -100,18 +102,25 @@ config BR2_PACKAGE_STRONGSWAN_EAP_AKA_3GPP2
>   	bool "Enable EAP-AKA 3GPP2 algorithms"
>   	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
>   	select BR2_PACKAGE_GMP
> +	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
>   
>   config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_SQL
>   	bool "Enable EAP-SIM/AKA backend based on a triplet/quintuplet SQL database"
>   	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
> +	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
>   
>   config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_PSEUDONYM
>   	bool "Enable EAP-SIM/AKA pseudonym storage"
>   	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
> +	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
>   
>   config BR2_PACKAGE_STRONGSWAN_EAP_SIMAKA_REAUTH
>   	bool "Enable EAP-SIM/AKA reauthentication data storage"
>   	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
> +	select BR2_PACKAGE_STRONGSWAN_EAP_AKA
> +	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
>   
>   config BR2_PACKAGE_STRONGSWAN_EAP_IDENTITY
>   	bool "Enable EAP-Identity"
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
