Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA32BCD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99B0B400E5;
	Sun,  7 Apr 2024 19:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AY0inW9ILud1; Sun,  7 Apr 2024 19:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 958BB401B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 958BB401B1;
	Sun,  7 Apr 2024 19:45:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E401C1BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E67CD40210
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixuvBimQOvk8 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:45:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C017A401B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C017A401B1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C017A401B1
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:45:49 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-343cfe8cae1so2268063f8f.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712519148; x=1713123948;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QtXSEImmKGPIowgD8VehaRh25/OQ90+3s4imobcUbpA=;
 b=lNWtYr3ubr3wdyTiS6+GHPqAtMNYgbt4zCEgAynS5No5LMzco8bYZ2I0/l+r0a/Rq/
 jg3RtIPPc0US2QHiFcpWGy6ppeywxD+lowbaZJDPWYTtbpYPXkmtCqiqu7swfLgCp2R5
 MSBqr32TEW7bppMxNZwLGY8lBRb32V35XRHWSJh9CerOd2z7nGQDdAMSzS6lXKiq3UZM
 Gqm+kpFy7Hm80uSNQHgxqJjdkoPmTOKr6eEe+J1xKs6JmXImIr347BWdlquw0Wm7M2HX
 OWEYuZBZjPEpFINfjoEbp7QYAg+bld+8HygQNzBNg4d/iBpO7WUAlqhlQLJJCuYLUAn3
 mw4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdfsciU5+HZRdU/lvKy1JwPlJFF9+0rojvdMuqf5GVmKi7VMUA0RAlHMNqMSXKP1WEK2jhJedscpIzjhXnIF311EeXRlaphA==
X-Gm-Message-State: AOJu0YwRSZO/yS+ZGtBeXWbUa9g2oXufPml7cncRWsts2qg/1wneRs4x
 AT2wrR/cqZxZNU3Pi0eq77Mll5cH4QLiYHfyMpjPd3nW1iqXFwAqc8dcNpN5yHc=
X-Google-Smtp-Source: AGHT+IFDkD4eD6lVYf0GiinsY9wwN7H/eV5xIQLDkLoI9sihPeN26HcKtgoD3VY9f+AY5gYlR0tzLg==
X-Received: by 2002:adf:f349:0:b0:343:dffa:ef0f with SMTP id
 e9-20020adff349000000b00343dffaef0fmr4952567wrp.32.1712519147575; 
 Sun, 07 Apr 2024 12:45:47 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adfce05000000b00343e760c637sm6780186wrn.84.2024.04.07.12.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:45:47 -0700 (PDT)
Message-ID: <ff40a019-1bbd-42d4-9bb8-446ab917b146@mind.be>
Date: Sun, 7 Apr 2024 21:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407170706.2785735-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407170706.2785735-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712519148; x=1713123948; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QtXSEImmKGPIowgD8VehaRh25/OQ90+3s4imobcUbpA=;
 b=aWV46zRgefk6iMe0J81YnYtT20KEj1DCH5qZgwl7fMvodjrILYm+fZU5pIVIP1ifVS
 sjmfSuoSGWmqstheuhjjYPaatazz2rYafKPVayvz0APotGwiWYRSd0npTrEHEkyFzwM8
 QIMBTQx/XKGHucQwenCqOOBNM7I0yBmVKsgEqAmTvb24HHjejl4WdoQdZGcEroHYh/6w
 J2rFZ+1xI+O+fKrf3OqTccxn2Zpcybzx9uOavp5+6mmyPFHfKDMlfKGQe4ThBy/q2MCE
 29ZjkomUO0mLmSnbRCIJNydXTZMUlbHlAXNVMaROf/siiOoaq5w1ItLW7Kych+iqdBIQ
 7Qvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aWV46zRg
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.7.0
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 19:07, Fabrice Fontaine wrote:
> Vulnerabilities
>   - [High] CVE-2024-0901 Potential denial of service and out of bounds
>     read. Affects TLS 1.3 on the server side when accepting a connection
>     from a malicious TLS 1.3 client. If using TLS 1.3 on the server side
>     it is recommended to update the version of wolfSSL used.
>   - [Med] CVE-2024-1545 Fault Injection vulnerability in
>     RsaPrivateDecryption function that potentially allows an attacker
>     that has access to the same system with a victims process to perform
>     a Rowhammer fault injection.
>   - [Med] Fault injection attack with EdDSA signature operations. This
>     affects ed25519 sign operations where the system could be susceptible
>     to Rowhammer attacks.
> 
> No official tarball provided so switch to github and set autoreconf
> 
> https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.0-stable
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/wolfssl/wolfssl.hash | 2 +-
>   package/wolfssl/wolfssl.mk   | 6 ++++--
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
> index 59e42e98b9..e705bba9fd 100644
> --- a/package/wolfssl/wolfssl.hash
> +++ b/package/wolfssl/wolfssl.hash
> @@ -1,5 +1,5 @@
>   # Locally computed:
> -sha256  75aaafe3b8c776d1ac417288116c8d444115f9fac5acb382a39a7d163dfd618d  wolfssl-5.6.6.tar.gz
> +sha256  2de93e8af588ee856fe67a6d7fce23fc1b226b74d710b0e3946bc8061f6aa18f  wolfssl-5.7.0.tar.gz
>   
>   # Hash for license files:
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
> index 68c69afd59..893408eca4 100644
> --- a/package/wolfssl/wolfssl.mk
> +++ b/package/wolfssl/wolfssl.mk
> @@ -4,14 +4,16 @@
>   #
>   ################################################################################
>   
> -WOLFSSL_VERSION = 5.6.6
> -WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/releases/download/v$(WOLFSSL_VERSION)-stable
> +WOLFSSL_VERSION = 5.7.0
> +WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
>   WOLFSSL_INSTALL_STAGING = YES
>   
>   WOLFSSL_LICENSE = GPL-2.0+
>   WOLFSSL_LICENSE_FILES = COPYING LICENSING
>   WOLFSSL_CPE_ID_VENDOR = wolfssl
>   WOLFSSL_CONFIG_SCRIPTS = wolfssl-config
> +# From git
> +WOLFSSL_AUTORECONF = YES
>   WOLFSSL_DEPENDENCIES = host-pkgconf
>   
>   WOLFSSL_CONF_OPTS = --disable-examples --disable-crypttests
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
