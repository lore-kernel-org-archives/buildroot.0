Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A31C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52DF84190C;
	Wed, 23 Mar 2022 20:24:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NjF6sbvBILTB; Wed, 23 Mar 2022 20:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4180D418E6;
	Wed, 23 Mar 2022 20:24:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA3221BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A681D400C4
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APGTZyiI9Eet for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:24:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EB8D401A1
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:24:50 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r23so3285094edb.0
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=RMi61oX5zz/gEwqHISB1qopHGy6dm5Dhr4URdEXwccE=;
 b=JEDkehMdv4TgMWExe1DeXIPBrAZrlsM1cW4W298SsiPbvb44G0/KsbeKkWemJ2oEAg
 p0yZTmqZZAXwzKGkyxfoyTovriK1g/WzvUrZSb9/+9qZNGEmNsE8EkOtQDA1atEguxYz
 MRBZg0Z9TtGS47xREho3iRv3roslabPEch7dZkopsxtcwlmSJR7ExOjBwGjQRYCtJPVE
 XNEd1LM54sD2AqizmzagVqVCiLIg9pJSPe9uvRJ53TwvaThOzm1RMDvGA/dnK3envwaV
 rcW0TJrvDYmnUlhHtHGkcrVDpMxjKPeNaka/XcWAbmNCm1DUs487NirWub5KQcVd+mJS
 0rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RMi61oX5zz/gEwqHISB1qopHGy6dm5Dhr4URdEXwccE=;
 b=lXkMr3LKPtx1lSJBE/UY4APZ54Ibp8u5LC6v+Rg1cJBG9JIf9N4MzQaoP50IqmQ+Qz
 DfwIWZetzSkoVj99j08PizWn4Di57t6Ax4Ncq/K1UO2AFtYbrdvEUsRWo7ctNTmxIL2G
 cx9A72SOuceStDCl4G+1h944cHGHf3NAjh5WG2jGA7Q1Htqh2wKZKLXEXsklferaNt0K
 LSk4Y4iKNyTMVZy7DNJhNrc72gIseT2FFWD3u/eJ9rGSjZAMPo4opragp2AkuIZEw61J
 8wVPUUBKjjEXw6tEHg0d1OxDuoE4CerxTrsey63wRzxeLfJfNvoAxZ434vydGLA5G0OB
 tk4A==
X-Gm-Message-State: AOAM530Lqde8YUNJUsFxkPX9D/gPPMAK2aux/p/wVG69V4y8dnsvmINe
 nqAn7OUmf9JvzcdwwgEnMAbPCUpKTg0ykA==
X-Google-Smtp-Source: ABdhPJzKdomMgihJpuoXglFDnN3LprI2ct36V/obHC4GoigbwMkdyOZE6OtC0zRQM2ckia4DARlITQ==
X-Received: by 2002:a50:ec96:0:b0:419:75fb:a07b with SMTP id
 e22-20020a50ec96000000b0041975fba07bmr2445746edr.316.1648067089262; 
 Wed, 23 Mar 2022 13:24:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a056402349400b00419651e513asm455136edc.45.2022.03.23.13.24.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:24:48 -0700 (PDT)
Message-ID: <66140637-e996-c494-aab2-52fcd102eda0@mind.be>
Date: Wed, 23 Mar 2022 21:24:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220312201627.690544-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220312201627.690544-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/4] package/poco: reorder options
 alphabetically
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



On 12/03/2022 21:16, Julien Olivain wrote:
> This commit reorders dependencies and Kconfig package options
> alphabetically for better maintainability.
> 
> This commit does not change anything else.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  All four applied to master, thanks!

  Nice series!

  Regards,
  Arnout

> ---
>   package/poco/Config.in | 82 +++++++++++++++++++++---------------------
>   package/poco/poco.mk   | 28 +++++++--------
>   2 files changed, 55 insertions(+), 55 deletions(-)
> 
> diff --git a/package/poco/Config.in b/package/poco/Config.in
> index dd87ee36bb..df3d3cbc66 100644
> --- a/package/poco/Config.in
> +++ b/package/poco/Config.in
> @@ -28,41 +28,50 @@ if BR2_PACKAGE_POCO
>   
>   comment "poco components"
>   
> +config BR2_PACKAGE_POCO_CPP_PARSER
> +	bool "cpp_parser"
> +
> +config BR2_PACKAGE_POCO_CRYPTO
> +	bool "crypto"
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_OPENSSL
> +
> +config BR2_PACKAGE_POCO_DATA
> +	bool
> +
> +config BR2_PACKAGE_POCO_DATA_MYSQL
> +	bool "mysql"
> +	depends on BR2_USE_MMU # mysql
> +	select BR2_PACKAGE_MYSQL
> +	select BR2_PACKAGE_POCO_DATA
> +
> +config BR2_PACKAGE_POCO_DATA_SQLITE
> +	bool "sqlite"
> +	select BR2_PACKAGE_POCO_DATA
> +	select BR2_PACKAGE_SQLITE
> +
>   config BR2_PACKAGE_POCO_JSON
>   	bool "json"
>   
> -config BR2_PACKAGE_POCO_XML
> -	bool "xml"
> -	select BR2_PACKAGE_EXPAT
> +config BR2_PACKAGE_POCO_JWT
> +	bool "jwt"
> +	select BR2_PACKAGE_POCO_CRYPTO
> +	select BR2_PACKAGE_POCO_JSON
>   
> -config BR2_PACKAGE_POCO_UTIL
> -	bool "util"
> -	select BR2_PACKAGE_POCO_XML
> +config BR2_PACKAGE_POCO_MONGODB
> +	bool "mongodb"
> +	select BR2_PACKAGE_POCO_NET
>   
>   config BR2_PACKAGE_POCO_NET
>   	bool "net"
>   
> -config BR2_PACKAGE_POCO_CRYPTO
> -	bool "crypto"
> -	select BR2_PACKAGE_OPENSSL
> -	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
> -
>   config BR2_PACKAGE_POCO_NETSSL_OPENSSL
>   	bool "netssl_openssl"
> -	select BR2_PACKAGE_POCO_NET
> -	select BR2_PACKAGE_POCO_CRYPTO
> -	select BR2_PACKAGE_POCO_UTIL
>   	select BR2_PACKAGE_OPENSSL
> -
> -config BR2_PACKAGE_POCO_ZIP
> -	bool "zip"
> -	select BR2_PACKAGE_POCO_XML
> +	select BR2_PACKAGE_POCO_CRYPTO
>   	select BR2_PACKAGE_POCO_NET
>   	select BR2_PACKAGE_POCO_UTIL
>   
> -config BR2_PACKAGE_POCO_CPP_PARSER
> -	bool "cpp_parser"
> -
>   config BR2_PACKAGE_POCO_PDF
>   	bool "pdf"
>   	select BR2_PACKAGE_POCO_JSON
> @@ -73,28 +82,19 @@ config BR2_PACKAGE_POCO_REDIS
>   	bool "redis"
>   	select BR2_PACKAGE_POCO_NET
>   
> -config BR2_PACKAGE_POCO_MONGODB
> -	bool "mongodb"
> -	select BR2_PACKAGE_POCO_NET
> -
> -config BR2_PACKAGE_POCO_DATA
> -	bool
> -
> -config BR2_PACKAGE_POCO_DATA_SQLITE
> -	bool "sqlite"
> -	select BR2_PACKAGE_POCO_DATA
> -	select BR2_PACKAGE_SQLITE
> +config BR2_PACKAGE_POCO_UTIL
> +	bool "util"
> +	select BR2_PACKAGE_POCO_XML
>   
> -config BR2_PACKAGE_POCO_DATA_MYSQL
> -	bool "mysql"
> -	depends on BR2_USE_MMU # mysql
> -	select BR2_PACKAGE_POCO_DATA
> -	select BR2_PACKAGE_MYSQL
> +config BR2_PACKAGE_POCO_XML
> +	bool "xml"
> +	select BR2_PACKAGE_EXPAT
>   
> -config BR2_PACKAGE_POCO_JWT
> -	bool "jwt"
> -	select BR2_PACKAGE_POCO_JSON
> -	select BR2_PACKAGE_POCO_CRYPTO
> +config BR2_PACKAGE_POCO_ZIP
> +	bool "zip"
> +	select BR2_PACKAGE_POCO_NET
> +	select BR2_PACKAGE_POCO_UTIL
> +	select BR2_PACKAGE_POCO_XML
>   
>   endif # BR2_PACKAGE_POCO
>   
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index 857f215e3a..81409ffec4 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -11,29 +11,29 @@ POCO_LICENSE_FILES = LICENSE
>   POCO_CPE_ID_VENDOR = pocoproject
>   POCO_INSTALL_STAGING = YES
>   
> -POCO_DEPENDENCIES = zlib pcre \
> -	$(if $(BR2_PACKAGE_POCO_XML),expat) \
> +POCO_DEPENDENCIES = pcre zlib \
>   	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl) \
> -	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
> +	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql) \
>   	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
> -	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql)
> +	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
> +	$(if $(BR2_PACKAGE_POCO_XML),expat)
>   
>   POCO_OMIT = Data/ODBC PageCompiler \
> +	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
> +	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
> +	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
> +	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
> +	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
>   	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
> -	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
> -	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
> +	$(if $(BR2_PACKAGE_POCO_JWT),,JWT) \
> +	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
>   	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
>   	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
> -	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
> -	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip) \
> -	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
>   	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
>   	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
> -	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
> -	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
> -	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
> -	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
> -	$(if $(BR2_PACKAGE_POCO_JWT),,JWT)
> +	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
> +	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
> +	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip)
>   
>   ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
>   POCO_CONF_OPTS += --no-fpenvironment --no-wstring
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
