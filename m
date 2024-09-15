Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE043C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B616F80F11;
	Sun, 15 Sep 2024 07:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNShNVthAk_E; Sun, 15 Sep 2024 07:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B649F80F1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B649F80F1F;
	Sun, 15 Sep 2024 07:52:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 111631BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0072980F1F
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJAXGG_0bwhb for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BAFD80F11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BAFD80F11
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BAFD80F11
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:52:17 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cc43454d5so18318905e9.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726386735; x=1726991535;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XElDIm78KyxlCczibm6z3V3H3dv+X9ellPdAgR/pz/0=;
 b=vSklGvyszSKHu/L5kqnhpYvQn1qIOxs35uw3j/z7e/MK5td4+xvIoS4LboepIJsWuR
 ef/oAdVeQ+Tpubw03j3v+sYITKhoMwL4TF0MqoDUBBPQSoLgSjQ8IWH7PJ0krl+zblZf
 YAyH1PyLL8VWs7f9DXRQ1HB9LjNvCfwKHxTWjbiFe45TQ8Zlc1od11KVASjiVao5MRoO
 DyOb6YqpBfPxnoPIYzBn4u89JRyjJ58kgoN/dV74YMWzt+ROJtnIVd/45ETlWZ6CfFWt
 fZJtoTCdZ4xP7a/C6UPw+0UGL1D960YSbHEOJbpho31Q4Kkr5qHc6PfTztBdTNa8FjHj
 sXag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6CDLJojW34XGvQ0eG3gzs1TT3yRK82xw2V8nxcSqSTNFxzHOMCqtlURqdWcADUnvQPUGE6m6+JZE=@buildroot.org
X-Gm-Message-State: AOJu0Yxv/hAD41OpQRwTa8w5fCmPWRkm6vvVEhb+J60kae+aDHBoXxPk
 oOK1p98+A0Ig8Upy5YNqDyrD0164CoL6Z5EOadSGoXET4dLciuQaLiWKGJO8vFqk8LGHkgspeXW
 /4os++g==
X-Google-Smtp-Source: AGHT+IG84waDKclIZjNDEScz2p+wra+0UM5EOz0XzkxGYkiaeP4dgyPPh0GmnmISrvSXTH9QhdE87Q==
X-Received: by 2002:a05:600c:4892:b0:42d:a024:d6bb with SMTP id
 5b1f17b1804b1-42da024d788mr28187565e9.20.1726386734859; 
 Sun, 15 Sep 2024 00:52:14 -0700 (PDT)
Received: from [192.168.197.114] (92-184-117-99.mobile.fr.orangecustomers.net.
 [92.184.117.99]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22e6540sm42498545e9.21.2024.09.15.00.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 00:52:14 -0700 (PDT)
Message-ID: <2d94fd06-278c-434c-8eff-267c79573d7d@mind.be>
Date: Sun, 15 Sep 2024 09:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZsC4BZadtEq7CZQw@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <ZsC4BZadtEq7CZQw@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726386735; x=1726991535; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XElDIm78KyxlCczibm6z3V3H3dv+X9ellPdAgR/pz/0=;
 b=GbfztnvsJa7OOZEXuHPlDYkiWMfWBE6Q4DYid5IILWdhldm1SyZYftfI3qgSdCOHd0
 9CUf03f1BJC1xgSFFVdA06yWz4doXADW/rfYyXPajPswFXTYvDTaXhPY2T+Sr6pFHegX
 ftPjKPMK78znGe2+GKMze5+9NwnX3cZF5Klg81JZPI9O0hF32vzBG6t9xOIKIJVQ6a4i
 z6pO/WpAJYSmOOtRMxkLLyuhFBpBhA62xUcz+/FiyQgKk3+EfUUgRfqr70khqCkCgC3c
 50FuNhAl0DA/2yHGEYWWG5jvZPVgQP4SbiA7r4ZWXvPM/cNvWoeJlpv70xL/nuMOV5ns
 mVwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Gbfztnvs
Subject: Re: [Buildroot] [PATCH next] package/strongswan: update to 5.9.14
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/08/2024 16:47, Waldemar Brodkorb wrote:
> For a changelog see here:
> https://github.com/strongswan/strongswan/releases/tag/5.9.14
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/strongswan/strongswan.hash | 6 +++---
>   package/strongswan/strongswan.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
> index ed8cf0ae31..f6b16fc8a2 100644
> --- a/package/strongswan/strongswan.hash
> +++ b/package/strongswan/strongswan.hash
> @@ -1,7 +1,7 @@
> -# From http://download.strongswan.org/strongswan-5.9.13.tar.bz2.md5
> -md5  9ada6be0c89846fb7ded1787a17cfbb2  strongswan-5.9.13.tar.bz2
> +# From http://download.strongswan.org/strongswan-5.9.14.tar.bz2.md5
> +md5  21ca3fc7c18456405d03b77266ba630a  strongswan-5.9.14.tar.bz2
>   # Calculated based on the hash above
> -sha256  56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55  strongswan-5.9.13.tar.bz2
> +sha256  728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678  strongswan-5.9.14.tar.bz2
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
> diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
> index 41959793a3..a3fd9fe449 100644
> --- a/package/strongswan/strongswan.mk
> +++ b/package/strongswan/strongswan.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -STRONGSWAN_VERSION = 5.9.13
> +STRONGSWAN_VERSION = 5.9.14
>   STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
>   STRONGSWAN_SITE = http://download.strongswan.org
>   STRONGSWAN_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
