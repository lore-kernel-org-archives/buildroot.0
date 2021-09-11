Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B321EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:55:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50DE861153
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 19:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50DE861153
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ED5B40506;
	Sat, 11 Sep 2021 19:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVVBkvZdFbsg; Sat, 11 Sep 2021 19:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51BA94050A;
	Sat, 11 Sep 2021 19:55:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB3C11BF285
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9CF6608CC
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 19:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N6yIkWFKPpnC for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 19:55:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B63CE607B4
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 19:55:12 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id o20so923689ejd.7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 12:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D6QLapcfkor1CptzoyUVXIrbZt0zy70ZzUfhV1+g0mc=;
 b=ZBcXjiNE1PGCA/A13CkT/I3CSFq/yf/fgi6flzEEWM+Q4n9Sz3jvFesceb2+zw3YrD
 pWFYvDVhRsBB+Ha4inU5rTr5q99sqhhHxTjfVdkli3HdpVZ2TbQSDqG/x/Eryr/Z/Ui3
 t3PzJJvhYAWBoG28eL63diADTAiEZuLxxWm/e8UZ2tWT/BjQmNlTsG9yvd8u494kDyrB
 eoQhMcZLzPOYZU3w6Y68pSoaBnhx4RrlmniEsiNA0N1KWGE3rMNykAY8155je6pOZyDj
 SWTLKbHGJUNoJI5N7kcILJwxoMxzGotCsXaq2Z3xt20PgE74mnIPdE2YX0I7GX+/2XDr
 ou6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=D6QLapcfkor1CptzoyUVXIrbZt0zy70ZzUfhV1+g0mc=;
 b=Iba8VnSgsX+ZcHlVSqqXijYq/QlDipnxjoqbU5V7JDaPHu9TmNhmZqfAhAZvg6y9nZ
 mucCmPGgk18vtSW9Af6o2HUAc/sUM5vig9fCTjEyX8F0+Cc/1c5z5tzglr1yCAHkh57d
 Qcp2DvoTwo+EtL+NwGkt4r6QcwISCVegWSQhjpkj367lbLuCU0QNf0/D1RVDU1kVYcI8
 V9SWlBdjWLUHeN6uLG16/hvQAcQ/TdYK2yadI3lyYAMEK484Ig2E548/smDL2SEQsInp
 Gkkre0ry/EseySBoOZopKj3fuAG6dnSfgAOK3H6NvM1AimEbKvYcmCYOoPegde/V2Zi8
 n+5w==
X-Gm-Message-State: AOAM531kPPEAs35/NbwDipL91wVkMa+lafro5NUeiYmlRyUIiren37XQ
 bzJzDwxCHbaQMriUpl4u48D9bg==
X-Google-Smtp-Source: ABdhPJy92F6EFhS2zoBEjdAmun3kmrPUD8JJ7LCpVWHriwUW91syUNPRse1mUSbrYUoBS2e4JHqQWg==
X-Received: by 2002:a17:906:12d8:: with SMTP id
 l24mr4156640ejb.126.1631390110670; 
 Sat, 11 Sep 2021 12:55:10 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y4sm1340931edw.1.2021.09.11.12.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 12:55:10 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210904113632.1623223-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <1eb1c1dc-3f07-7f52-9ab9-d3dd82ff7bbb@mind.be>
Date: Sat, 11 Sep 2021 21:55:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904113632.1623223-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx-dav-ext: needs libxslt
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Samuel Martin <s.martin49@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 04/09/2021 13:36, Fabrice Fontaine wrote:
> Build is broken since bump to version 3.0.0 in commit
> 45524f10cd84855868c9be3901c2bd6ea1c9f079 because libxslt is needed
> instead of expat since
> https://github.com/arut/nginx-dav-ext-module/commit/37772c545314aa4a250066f4e7cbc8806d406fa8:
> 
> adding module in /tmp/instance-0/output-1/build/nginx-dav-ext-3.0.0
>  + ngx_http_dav_ext_module was configured
> checking for PCRE library ... found
> checking for PCRE JIT support ... found
> Package libxslt was not found in the pkg-config search path.
> Perhaps you should add the directory containing `libxslt.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'libxslt', required by 'virtual:world', not found
> Package libxslt was not found in the pkg-config search path.
> Perhaps you should add the directory containing `libxslt.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'libxslt', required by 'virtual:world', not found
> checking for libxslt ... not found
> checking for libxslt in /usr/local/ ... not found
> checking for libxslt in /usr/pkg/ ... not found
> checking for libxslt in /opt/local/ ... not found
> 
> ./configure: error: the HTTP XSLT module requires the libxml2/libxslt
> libraries. You can either do not enable the module or install the libraries.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8735d20ca7ccf4eda2f79f9400bed70474855b40
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/nginx-dav-ext/Config.in        | 2 +-
>  package/nginx-dav-ext/nginx-dav-ext.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nginx-dav-ext/Config.in b/package/nginx-dav-ext/Config.in
> index 1e60321fe3..9e3a0faf28 100644
> --- a/package/nginx-dav-ext/Config.in
> +++ b/package/nginx-dav-ext/Config.in
> @@ -1,7 +1,7 @@
>  config BR2_PACKAGE_NGINX_DAV_EXT
>  	bool "nginx-dav-ext"
>  	depends on BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
> -	select BR2_PACKAGE_EXPAT
> +	select BR2_PACKAGE_LIBXSLT
>  	help
>  	  NGINX WebDAV missing commands support (PROPFIND & OPTIONS).
>  
> diff --git a/package/nginx-dav-ext/nginx-dav-ext.mk b/package/nginx-dav-ext/nginx-dav-ext.mk
> index 1b3071851a..cce527e179 100644
> --- a/package/nginx-dav-ext/nginx-dav-ext.mk
> +++ b/package/nginx-dav-ext/nginx-dav-ext.mk
> @@ -8,6 +8,6 @@ NGINX_DAV_EXT_VERSION = 3.0.0
>  NGINX_DAV_EXT_SITE = $(call github,arut,nginx-dav-ext-module,v$(NGINX_DAV_EXT_VERSION))
>  NGINX_DAV_EXT_LICENSE = BSD-2-Clause
>  NGINX_DAV_EXT_LICENSE_FILES = LICENSE
> -NGINX_DAV_EXT_DEPENDENCIES = expat
> +NGINX_DAV_EXT_DEPENDENCIES = libxslt
>  
>  $(eval $(generic-package))
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
