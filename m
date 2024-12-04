Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF83E7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 20:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 103984148E;
	Wed,  4 Dec 2024 20:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FK71hHOwNtVn; Wed,  4 Dec 2024 20:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDB3841490
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDB3841490;
	Wed,  4 Dec 2024 20:16:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36B3C1DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2497042F5F
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mwFKHSNK0Dx for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 20:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CACF4416EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CACF4416EA
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CACF4416EA
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:16:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43494a20379so1856825e9.0
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 12:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343377; x=1733948177;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tA1zQF6UomEXrY7i7eMtf4MqDYPKT1ILa9J9/x/oRwI=;
 b=kCys0ZoUnKhJ8y6g4NAJDlgd/VkvS9A4OWqxUG9+gv5Ggtycc03a6ObOaMhaHz0KF0
 rCYmNys3wCa6Jp5sbXhoP72fj81gZa7HTm5v2LhYPhZe3n9TxpQzcgZ9ef0LWoxCv34v
 hy95noBkUpuuZgKWGr2HOK3lfRnFGBJ1CJkHVjR4u5e1onsjJh1lnK1APUuNY7ySUIv6
 TKAVta9HBT53vK0JDRaNfIqA4H/qN+voYWO5j4PUAKqKQhd0UmkUpgr5VHx2JySqveLB
 giBHnj7YBC6ECz+TixoxEjmz6/yNmAwaV7vC6DPcIOntjyP3l5Fr6DSBZwAEyy+EB83w
 wXnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZh0rKCgsEp4a2N7gY9suGmw2swlxuRtjw1fk4wHmF0YO05K/2dnty+7TWnalWT4Scqu58NTbLVbM=@buildroot.org
X-Gm-Message-State: AOJu0Yy7BCgX7FlC0av3o6SLd7fTafSjwwxSuXmKigro/wdA/r2HiGjR
 q8KjTTbbKLUikIyYmnAHaeekYxPPAWLzrSy0IOmA0Em1xVi9KLTBr8WvoVW8wdg=
X-Gm-Gg: ASbGncuzHeMNzRNGaZXTp72UkC7VFe1OCiif3l5AIR21d4plVa8BMusfEsDUy2C6QZN
 nQSuA4d4EUhVAp60GxBV7AMeWB6PxflhFxOOSJRb+aLQShQqoVKyo35Q/fodQNLfyxP9FqX45ls
 7QHWTsczUvzqh8AhbH31/qEvF8tKCfaCYUtK2ORZDon7Htju3ubl2paR0Y/T19y3sW9CeqkVoIZ
 Rbgi/iVOYSgZf60AvXFsbYwpKKDpkOcEMMjydzQ5qD/iAiTJ7H6q7ANfMHMxto6PVML8SSeo8/Y
 3uY/rSjjrR3WTTjTXospKdFHQIvfN0WPFtjpHeFDnUqkdmZcl9G9C84qrTdxAj+Lkouuco86wUw
 PVSBM
X-Google-Smtp-Source: AGHT+IHNFckeVTZSGbRFz4wSkRd/j0f3Vm6l0a3stPJ20PKQJ4k2Hy8tZRRVhBHkK0ML/XVC7mru8g==
X-Received: by 2002:a05:600c:1ca2:b0:434:9e1d:7626 with SMTP id
 5b1f17b1804b1-434d0a03d92mr65268725e9.25.1733343376767; 
 Wed, 04 Dec 2024 12:16:16 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d527e12dsm34850395e9.10.2024.12.04.12.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 12:16:16 -0800 (PST)
Message-ID: <80034fdc-2ef0-4ef1-8074-655c0166dfc4@mind.be>
Date: Wed, 4 Dec 2024 21:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
References: <20241104211157.639393-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20241104211157.639393-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733343377; x=1733948177; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tA1zQF6UomEXrY7i7eMtf4MqDYPKT1ILa9J9/x/oRwI=;
 b=Ghai3FRnt3vLOcyLAXgwkyIgtPcgN2+BVUsXD6wOFKFU+hiQmM6HiMDKeZH7CUgGJE
 vbxhA0OABAE5G0MPpiEfcMt3K48885pbr263u2UHsB88FaUDprlDFkbceMXuhOLGaCn3
 PqlAqDEAQfuqZsQvilZFuxtG7aFo0q/L5H3o1ZZ1BZ5Gu9qf03pC+C4JREkN+2us1XhW
 YGDsfZAw1tJOltmCBmFrpGrr15C0Ktu4Nvj8eHvcDgSBeDx+tb6wxqOi27jmK20Hjspz
 hr7fBF4NWKk+BUc/TeYrPPBVEaryYQTdy8PL7r5wCjo6gPe2KarxeH+PiIjxucRvcOQI
 oyGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ghai3FRn
Subject: Re: [Buildroot] [PATCH 1/1] package/opkg: fix --without-xattr
 configure option typo
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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



On 04/11/2024 22:11, Julien Olivain wrote:
> Commit efe93b34e "package/opkg: bump to version 0.7.0" [1] introduced
> a use of --without-xattrs (with an extra 's') configure option.
> 
> When compiling opkg, the configure step show the warning:
> 
>      configure: WARNING: unrecognized options: ... --without-xattrs
> 
> The actual option name is "--without-xattr" (without an extra 's').
> See [2].
> 
> This commit fixes the typo.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/efe93b34ec678c0d35b2ec062128fccf55912b8e
> [2] https://git.yoctoproject.org/opkg/tree/configure.ac?h=v0.7.0#n167
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/opkg/opkg.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
> index 0323a49f0b..4922d8fc0f 100644
> --- a/package/opkg/opkg.mk
> +++ b/package/opkg/opkg.mk
> @@ -13,7 +13,7 @@ OPKG_INSTALL_STAGING = YES
>   OPKG_CONF_OPTS = \
>   	--enable-sha256 \
>   	--without-acl \
> -	--without-xattrs
> +	--without-xattr
>   
>   ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
>   OPKG_CONF_OPTS += --enable-gpg

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
