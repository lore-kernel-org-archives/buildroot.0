Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDB5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CB374165F;
	Sat, 23 Jul 2022 15:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CB374165F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vQhqOpG0njCJ; Sat, 23 Jul 2022 15:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8011A4051E;
	Sat, 23 Jul 2022 15:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8011A4051E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E17581BF859
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB29F60A6F
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB29F60A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mHu6CSY9Bifi for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:03:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC3FC60D58
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC3FC60D58
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:03:16 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k11so9639714wrx.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ve5tG6Eb2dryaHXqvIcUdOWbiJqxJWsFJ0uNneZyI3I=;
 b=HusS8T3jS+rXY3F2Ddv9Ppm0zlyxUlVlo+mgoVVSq6ogZDcLwl0z8LwrWccXyGCWGt
 cRS2y57FjHdkI+uxd5cL3A4Uh+AOwptz2iL8yPrce40+fGT1+X/j/XyxI5i6IGii3sM3
 bqLTpdTjmmE5qdW3LceplJjUUHceJT+V8HXkw5KIKPmImZYnQRqG5gCgisikg2qD+m5X
 aEzx7L1nLVVCRbSMZL/VpuPi+5hEC8iYBw8bB2GI2izTD+Z7p4RflPVKON6SYD61WAvC
 3Bg8asURA926Eum4UMrWGujZMJIVPrG+0uVt39CoX1ZtXie4voJmhl+CJp3fPimbtEKT
 mtzA==
X-Gm-Message-State: AJIora80jVzzaZhU5PNbvTUtvgvLep62+5Iq2dWea3sC4hubsPldt6FI
 XOf/Z5FywRhoORr+HPoc7QxosDPYPszQCw==
X-Google-Smtp-Source: AGRyM1u7qs3Lsmc3wLXpvdcHdtM02uqg1v0aJuF4RxADSLhzBB/6DqVbT5IQ02CanjSK5R83su27UQ==
X-Received: by 2002:a5d:5984:0:b0:21e:6350:1477 with SMTP id
 n4-20020a5d5984000000b0021e63501477mr2845255wri.587.1658588595101; 
 Sat, 23 Jul 2022 08:03:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a5d4350000000b0021e4b0aac41sm7086074wrr.24.2022.07.23.08.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 08:03:14 -0700 (PDT)
Message-ID: <6c4d97ae-f6d0-cf2a-2d73-18c72b9fb25b@mind.be>
Date: Sat, 23 Jul 2022 17:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220719222159.3194065-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220719222159.3194065-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ve5tG6Eb2dryaHXqvIcUdOWbiJqxJWsFJ0uNneZyI3I=;
 b=G8D7zienYaDR4p14h7cnsQB6L9/zMEML86BtYHx5IJvQazc3EClQBL9AaPJ8FnHH6s
 QJqOL2qbZXTpXH3WluIaqqSesrAEEd/jAciumyq97UZa4GSqPvMARYMYe3rWBWjCnAKL
 XFUVUJ+g/IJ5Ju0HG//AnnX1fWQKmlE3AV3LsWCCUGng/oxZlnA1TC85R9TuGL41kZhD
 KfmcvQIUBUUaBOXOJJn2TKXzQ+RsaY5WM778ASeBsR9P/qH8lYDEdRK7th/wLCdV/XXo
 KX/b08k3tPHHixlfQVXd8VmYXgfxtnKhpn20fYPAZAX3lEkpWYEohxZasMDWctj0OLJC
 M3hA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G8D7zien
Subject: Re: [Buildroot] [PATCH 1/1] package/protobuf-c: security bump to
 version 1.4.1
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 20/07/2022 00:21, Fabrice Fontaine wrote:
> - Fix CVE-2022-33070: Protobuf-c v1.4.0 was discovered to contain an
>    invalid arithmetic shift via the function parse_tag_and_wiretype in
>    protobuf-c/protobuf-c.c. This vulnerability allows attackers to cause
>    a Denial of Service (DoS) via unspecified vectors.
> - Use official tarball (and so drop autoreconf)
> - Update hash of COPYING (year updated with
>    https://github.com/protobuf-c/protobuf-c/commit/471aaa5f6d54406c6c17bf3179d5aea18f15073b)
> 
> https://github.com/protobuf-c/protobuf-c/releases/tag/v1.4.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/protobuf-c/protobuf-c.hash | 4 ++--
>   package/protobuf-c/protobuf-c.mk   | 6 ++----
>   2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
> index 13e1b474bc..ec00442277 100644
> --- a/package/protobuf-c/protobuf-c.hash
> +++ b/package/protobuf-c/protobuf-c.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  1068bca1e9870e9492096f97c409cd15f10c5019c183e52ec6d53e8d18630cbf  protobuf-c-1.4.0.tar.gz
> -sha256  20e800cad4550f4b19bb37fc9577dac21de13333ae66497c4c45ae489c35c34a  LICENSE
> +sha256  4cc4facd508172f3e0a4d3a8736225d472418aee35b4ad053384b137b220339f  protobuf-c-1.4.1.tar.gz
> +sha256  b8999cb392cc5bbe8cd679de59584ad8d2f26033123e76f1d662fa14b9d4f287  LICENSE
> diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
> index 7dd3b09a6c..0742a33db2 100644
> --- a/package/protobuf-c/protobuf-c.mk
> +++ b/package/protobuf-c/protobuf-c.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -PROTOBUF_C_VERSION = 1.4.0
> -PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,v$(PROTOBUF_C_VERSION))
> +PROTOBUF_C_VERSION = 1.4.1
> +PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
>   PROTOBUF_C_DEPENDENCIES = host-protobuf-c
>   HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
>   PROTOBUF_C_MAKE = $(MAKE1)
> @@ -14,8 +14,6 @@ PROTOBUF_C_INSTALL_STAGING = YES
>   PROTOBUF_C_LICENSE = BSD-2-Clause
>   PROTOBUF_C_LICENSE_FILES = LICENSE
>   PROTOBUF_C_CPE_ID_VENDOR = protobuf-c_project
> -PROTOBUF_C_AUTORECONF = YES
> -HOST_PROTOBUF_C_AUTORECONF = YES
>   
>   # host-protobuf needs c++11 (since 3.6.0)
>   HOST_PROTOBUF_C_CONF_ENV += CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
