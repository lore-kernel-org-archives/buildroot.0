Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D8BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 15:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF26860E42;
	Sun, 19 Jun 2022 15:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF26860E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJMXZVlJ8bz7; Sun, 19 Jun 2022 15:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4D6660E39;
	Sun, 19 Jun 2022 15:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4D6660E39
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1AC81BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D4F081819
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D4F081819
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1qFMiZwEan0 for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:53:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E2A81815
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77E2A81815
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:53:59 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u12so16833904eja.8
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 08:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JBVTjOkImuD9pFGjvgntFN433vAbH1+q/mzx5bGR1UE=;
 b=4MUb5f2vYWYROJE+5tbcJK2mT9xdtgOj4yYDNX9klb11xrqU41A2qO5u9NfFDAGtRh
 jmrmK5owSfVGQ+cvIvnK9nL8V+9250u+OEL4e00ioz4Uruza40tCFe2kAuUGKlgZPj7c
 RX6qgQAZE3bTOfmnb/JYKXvgw54KIjDYU2Bx/iy5s0vD6wRmdFvjl7VivSP064BZ4uUh
 MyTj6dc4DCAWRn4fEpwiC2NlMFadMrF/r3g2br4xjIt4VtbuZQURFMg/BcUardl2n2VP
 cdlMT482TWcuZTCUrxxAH1+1M9TLvR48KomNOlqKRmivD/nJibQRcUYGE3Cetb37tshp
 twlA==
X-Gm-Message-State: AJIora+v+IF6ZwEg/XJXrg/uBqI2+hRfPeNPX4XTKLvGRWMBYyQkWu/8
 MZ8XXwin49XKksoSopiovpI+XA==
X-Google-Smtp-Source: AGRyM1vb7BwY6s9figFKb3jdfgZBa2EuC5o6Dr/ZjJ7KnEySRd3y1Vbm7Yyf685007CiOnQ6yzYpJQ==
X-Received: by 2002:a17:906:72c5:b0:711:d2cb:28b0 with SMTP id
 m5-20020a17090672c500b00711d2cb28b0mr17521652ejl.229.1655654037692; 
 Sun, 19 Jun 2022 08:53:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p18-20020aa7c4d2000000b004351f58451dsm8085047edr.17.2022.06.19.08.53.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 08:53:57 -0700 (PDT)
Message-ID: <ee3bb199-4f03-b816-bf00-a979874b52b7@mind.be>
Date: Sun, 19 Jun 2022 17:53:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220613200620.292365-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220613200620.292365-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=JBVTjOkImuD9pFGjvgntFN433vAbH1+q/mzx5bGR1UE=;
 b=Ty6JywrA5vXTIcSYHCTnrr9IupijKT47Zrg8iKwgw57d0cV0FoFzRd8i+HBj/C1z5Y
 D6zZ4erbu6Kb6CXw/TmuvsxriZkejaZ45i4PW58UqtUgjMaIsJzNI4DZQ9SdG4Qa2oMC
 utMtumsg97/E7lvZXzQh9UZ6JeUfQMbdvplhyCOXJuC1LoIjonhB8BRy+wS1wtugAadJ
 6wKSCVVm/Ify0pjukFWisIEh5Ksb7G8amJJk8G3jSsJ9mA4gZVlOmCauYnGVkPJa3gFY
 /nzzWI+gWG/kmRBew33f94eHCZyIKhYhmmgFhofDuV7mtwn5r29u0C+iFpDmhrjbzfGt
 Pl3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ty6JywrA
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: needs dynamic
 library with libcurl and mbedtls
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 13/06/2022 22:06, Fabrice Fontaine wrote:
> libmodsecurity embeds several mbedtls source files since version 3.0.0
> and
> https://github.com/SpiderLabs/ModSecurity/commit/a3ae686f2555bdacbfc9e1889ad05065711a165d
> resulting in the following static build failure if curl is built with
> mbedtls support:
> 
> /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real: /home/buildroot/autobuild/instance-0/output-1/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libmbedcrypto.a(md5.c.o): in function `mbedtls_md5_free':
> md5.c:(.text+0x16): multiple definition of `mbedtls_md5_free'; ../../src/.libs/libmodsecurity.a(libmbedtls_la-md5.o):md5.c:(.text+0x16): first defined here
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/98472a3a41cdbcb3d02289a437074a267f4b2e8e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Since upstream seemed to risk not accepting the package, I added a comment 
that hopefully will tickle them.

  Regards,
  Arnout

> ---
>   package/libmodsecurity/Config.in    | 5 +++++
>   package/nginx-modsecurity/Config.in | 5 +++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
> index 87f7a9c103..f65ab3de93 100644
> --- a/package/libmodsecurity/Config.in
> +++ b/package/libmodsecurity/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_LIBMODSECURITY
>   	bool "libmodsecurity"
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	# libmodsecurity embeds several mbedtls source files
> +	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS)
>   	select BR2_PACKAGE_PCRE
>   	help
>   	  Libmodsecurity is one component of the ModSecurity
> @@ -17,3 +19,6 @@ config BR2_PACKAGE_LIBMODSECURITY
>   
>   comment "libmodsecurity needs a toolchain w/ C++, threads"
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "libmodsecurity needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
> diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
> index b1fcbadd7a..5cbe57a866 100644
> --- a/package/nginx-modsecurity/Config.in
> +++ b/package/nginx-modsecurity/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
>   	depends on BR2_PACKAGE_NGINX_HTTP
>   	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
> +	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS) # libmodsecurity
>   	select BR2_PACKAGE_LIBMODSECURITY
>   	help
>   	  The ModSecurity-nginx connector is the connection
> @@ -14,3 +15,7 @@ config BR2_PACKAGE_NGINX_MODSECURITY
>   comment "nginx-modsecurity needs a toolchain w/ C++, threads"
>   	depends on BR2_PACKAGE_NGINX_HTTP
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "nginx-modsecurity needs a toolchain w/ dynamic library"
> +	depends on BR2_PACKAGE_NGINX_HTTP
> +	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
