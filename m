Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B07C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 14:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D58BE4060A;
	Sun, 24 Mar 2024 14:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sciabIa8biNk; Sun, 24 Mar 2024 14:57:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82B514062A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82B514062A;
	Sun, 24 Mar 2024 14:57:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13BCB1BF59A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2F8C40624
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 14:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7B6dtAH6_Rj6 for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 14:57:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82E184060A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E184060A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82E184060A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:57:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41400a9844aso26202315e9.0
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 07:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711292227; x=1711897027;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zl5YPF82+dbd5CqlE9N+lQjl2zXOu06RFnsgsmnDOE8=;
 b=WoFfNKvy+xFqKx+nUPpKMwl49iSIV1iPgglpEuyE/SiS8/RhDm4zkZ00DHuU9aP4d9
 OPcLyJPkbBQee48mE9P0ceoGEUTaVRh33b4TJq1XUqAM0ioargjcn23PH27k+NLgJUWv
 5bC84C+uXGSu+L0ylA91PITf7a2cT/vSlqb79lpLK+ht+Yrk9kkJQ1+6GlDsvSMv/0Z5
 u9/9NMZpFQKlgdB419pMuT9B08n6XFUvcOcL/+BdxGrGut6exwCUMUrykuR6EZWifmpQ
 ntu0MGrq6fqwpYhQ69TuAU6T03UwGL5f0FwWYGOGl2sWTTUCsqjRklBsb5d2DCJIoS31
 99Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/X9d+gwCThSrBUpHk3cTg7SgB4nzAaCg1NxOMPxz24kLZutqx8K7c//nRnPntuUSCjk9QwzSRviO7/gvQGhVBgt0+xwt9tw==
X-Gm-Message-State: AOJu0YwmcfGDelP3R+mT5ywOtUEEHHctqgdEznBCz9obv6adFUNYOuWQ
 uusmTcPSO5tVft2O+gcZHOVR9WHhbi3WY3VPo1OjnLyBiBDJCXqy9dH8OAXZT7YTbyWGVdu26kT
 D
X-Google-Smtp-Source: AGHT+IE3xrNPP5eHVUhibUYoQ+cJbzT9qf6ebNHRoqB5naOrN5o1cMTs5wEV36M3nmxCSf9Gjv+lsw==
X-Received: by 2002:a05:6000:4c6:b0:341:b5ca:9e9c with SMTP id
 h6-20020a05600004c600b00341b5ca9e9cmr3149277wri.25.1711292227452; 
 Sun, 24 Mar 2024 07:57:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 co1-20020a0560000a0100b00341cb22a8d4sm1198840wrb.108.2024.03.24.07.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 07:57:07 -0700 (PDT)
Message-ID: <97af42c9-2ec8-4bde-b759-b99e29e831f1@mind.be>
Date: Sun, 24 Mar 2024 15:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240324130451.29707-1-bernd@kuhls.net>
In-Reply-To: <20240324130451.29707-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711292227; x=1711897027; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zl5YPF82+dbd5CqlE9N+lQjl2zXOu06RFnsgsmnDOE8=;
 b=GqTfIpw8ZhRc1LCz8GANL23d5+1t4uFPur/jNhn2UPU40DMPPPB5wrGG3g7YZjqDYZ
 hyUB2tWqPmZuZh5UU4B+UDHrl2RDU9hrA+gxdRuUwBxb7BH3NfEEh/ZOfD1qLY64ioU2
 3pYD9hn/SdjmmYYl7IVVpWWBLpxxWETjwboDjjBoXToKpShxiFD/gAA4Jk2hDmkLz+8f
 E2+q5mBax2P5A8WJSJrcbi221j+XvvJJtuGijLd6DesPZDr6g2AeNy+X0IfNlmdP4Vx2
 XAcAjjWwoP9/bqEskS0uf7o+CuWJ5F4R9+XzEoOmXWqhpsTs9u5JEf1UFP3ZLNE5IAtZ
 MApg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GqTfIpw8
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.4.1
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



On 24/03/2024 14:04, Bernd Kuhls wrote:
> Release notes:
> https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dav1d/dav1d.hash | 4 ++--
>   package/dav1d/dav1d.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
> index 0b2c53ec21..a62193810e 100644
> --- a/package/dav1d/dav1d.hash
> +++ b/package/dav1d/dav1d.hash
> @@ -1,4 +1,4 @@
> -# From https://download.videolan.org/pub/videolan/dav1d/1.3.0/dav1d-1.3.0.tar.xz.sha256
> -sha256  6d8be2741c505c47f8f1ced3c9cc427759243436553d01d1acce201f87b39e71  dav1d-1.3.0.tar.xz
> +# From https://download.videolan.org/pub/videolan/dav1d/1.4.1/dav1d-1.4.1.tar.xz.sha256
> +sha256  8d407dd5fe7986413c937b14e67f36aebd06e1fa5cfec679d10e548476f2d5f8  dav1d-1.4.1.tar.xz
>   # Locally computed
>   sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
> diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
> index 3650f28730..74c68d1660 100644
> --- a/package/dav1d/dav1d.mk
> +++ b/package/dav1d/dav1d.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DAV1D_VERSION = 1.3.0
> +DAV1D_VERSION = 1.4.1
>   DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
>   DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
>   DAV1D_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
