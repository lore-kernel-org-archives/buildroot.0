Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78389ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 11:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E969C60C24;
	Sat, 27 Aug 2022 11:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E969C60C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kj-vJ7163RE; Sat, 27 Aug 2022 11:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08C2760C1F;
	Sat, 27 Aug 2022 11:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08C2760C1F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDEED1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 11:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3935404F5
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 11:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3935404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XlGqoVyP-6qq for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 11:00:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EE9640139
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EE9640139
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 11:00:02 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id fy31so6885787ejc.6
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 04:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=GInNKSL9Z8Zo92xlSfdFCKe3iVB+SqLVOrfgaUUrow8=;
 b=PUoYllqFa0MjugStMn9VSYl6QZZJWGQ0OT96PdvGDeDqSol81f+jflEbhO6abEFzjG
 es6LIj7B23LT0Wal6mH1Q9NKTvlnp5Ut2jmyyGNQ+oMyjT7TfduSazL+F99hBB/dsk6v
 DPZSxsUjFqoP5xb8d5mAQ5Sy7ZW5pkZJ/xkxoDBhBSSD7xijBHJ56rScSe10xVQ2fQzS
 xdmeDQIef4wfq0ArRfvT+USHAi21j72waXML1fjeGhPTVEitpN2K3CC3lXxJyDM/ZZSX
 lJquMJEjEfHs8i+daLi3W8jpCbp94Jf5ymTkJ/xbGntEz0TRpgWppBibJ3rtdf8t12ws
 yM4Q==
X-Gm-Message-State: ACgBeo3Q9xyprC1PwfhneqXVFcVuZ7TbJtwA6xh1uv8jTKhmSXsSUX3i
 malzg985Ze9kAkEReBtXi6/pVZbEedU=
X-Google-Smtp-Source: AA6agR7RloOBjkfaEMldLaTtmZye767vrAjeHUiDS4leCBZ0bnxl5OoVVuKYCBtZ/NCmDcCVYFROpA==
X-Received: by 2002:a17:907:7212:b0:733:1ada:e413 with SMTP id
 dr18-20020a170907721200b007331adae413mr7993618ejc.309.1661598000824; 
 Sat, 27 Aug 2022 04:00:00 -0700 (PDT)
Received: from [192.168.178.38] (ip-037-201-005-119.um10.pools.vodafone-ip.de.
 [37.201.5.119]) by smtp.gmail.com with ESMTPSA id
 s14-20020a1709067b8e00b0073dc60271b2sm1964990ejo.32.2022.08.27.04.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 04:00:00 -0700 (PDT)
Message-ID: <a7ed0285-fea7-16f6-6ef8-9ff93fee1461@googlemail.com>
Date: Sat, 27 Aug 2022 12:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: buildroot@buildroot.org
References: <20220614175048.6352-1-raphael.pavlidis@gmail.com>
 <20220614180152.15846-1-raphael.pavlidis@gmail.com>
Content-Language: en-US
In-Reply-To: <20220614180152.15846-1-raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc;
 bh=GInNKSL9Z8Zo92xlSfdFCKe3iVB+SqLVOrfgaUUrow8=;
 b=R0PunKRa5s0NTf3+sz9Pu+PkZg+/Mij1k7VBJSVzuaauRmS2rXm4b4fblTMsNHXPam
 pY70+Hje0RBJmH93R+40SGdzXQ+zGGLrLKf4uhZsFTAlhJD3tSqm3bihoRGEA5pkYemU
 Z3eL8U/N0TEJRICyW1MezeORZeqRVupvyabaAD/nC7oPiwX4DvQDfdTbWC+a/ZQdkMIy
 BvHc4FLS5msJSXrHsz6YiY+GZViHdYHc44jyaJccBcNEZaZPSz8SboJ8+qONudJ6+g/D
 g/FSRvJajytCj3TLot0b3rdO7YZptfFac0hLk1KWEVLqOSGgicSf//an1oVUVe6ZAdh5
 YvoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R0PunKRa
Subject: Re: [Buildroot] [PATCH v2] package/slirp4netns: new package
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
From: Raphael Pavlidis via buildroot <buildroot@buildroot.org>
Reply-To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Can I do something, so this patch is accepted? :)


On 14.06.22 20:01, Raphael Pavlidis wrote:
> slirp4netns is for user-mode networking for unprivileged network
> namespace.
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
> Changes v1 -> v2:
>    - Fix typo in SLIRP4NETNS_LICENSE_FILES
> 
>   package/Config.in                    |  1 +
>   package/slirp4netns/Config.in        | 20 ++++++++++++++++++++
>   package/slirp4netns/slirp4netns.hash |  3 +++
>   package/slirp4netns/slirp4netns.mk   | 15 +++++++++++++++
>   4 files changed, 39 insertions(+)
>   create mode 100644 package/slirp4netns/Config.in
>   create mode 100644 package/slirp4netns/slirp4netns.hash
>   create mode 100644 package/slirp4netns/slirp4netns.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 3b089166da..216e04e98b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1903,6 +1903,7 @@ menu "Networking"
>   	source "package/rtmpdump/Config.in"
>   	source "package/siproxd/Config.in"
>   	source "package/slirp/Config.in"
> +	source "package/slirp4netns/Config.in"
>   	source "package/snmppp/Config.in"
>   	source "package/sofia-sip/Config.in"
>   	source "package/sysrepo/Config.in"
> diff --git a/package/slirp4netns/Config.in b/package/slirp4netns/Config.in
> new file mode 100644
> index 0000000000..22414dfbc9
> --- /dev/null
> +++ b/package/slirp4netns/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_SLIRP4NETNS
> +	bool "slirp4netns"
> +	depends on BR2_USE_MMU # libcap, libglib2, slirp
> +	depends on BR2_USE_WCHAR # libglib2, slirp
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, slirp
> +	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # libseccomp
> +	select BR2_PACKAGE_LIBCAP
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBSECCOMP
> +	select BR2_PACKAGE_SLIRP
> +	help
> +	  User-mode networking for unprivileged network namespaces.
> +
> +	  https://github.com/rootless-containers/slirp4netns
> +
> +comment "slirp4netns needs a toolchain w/ wchar, threads, headers >= 3.17"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
> diff --git a/package/slirp4netns/slirp4netns.hash b/package/slirp4netns/slirp4netns.hash
> new file mode 100644
> index 0000000000..e3115c1be0
> --- /dev/null
> +++ b/package/slirp4netns/slirp4netns.hash
> @@ -0,0 +1,3 @@
> +# Locally computed:
> +sha256  b584edde686d3cfbac210cbdb93c4b0ba5d8cc0a6a4d92b9dfc3c5baec99c727  slirp4netns-1.2.0.tar.gz
> +sha256  58db3cfabf8ec806bc060e54ab5466a31de4a3ae80fe4a8aa02fb6b1c053c93f  COPYING
> diff --git a/package/slirp4netns/slirp4netns.mk b/package/slirp4netns/slirp4netns.mk
> new file mode 100644
> index 0000000000..7ff594cc44
> --- /dev/null
> +++ b/package/slirp4netns/slirp4netns.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# slirp4netns
> +#
> +################################################################################
> +
> +SLIRP4NETNS_VERSION = 1.2.0
> +SLIRP4NETNS_SITE = $(call github,rootless-containers,slirp4netns,v$(SLIRP4NETNS_VERSION))
> +SLIRP4NETNS_LICENSE = GPL-2.0
> +SLIRP4NETNS_LICENSE_FILES = COPYING
> +SLIRP4NETNS_DEPENDENCIES = libcap libglib2 libseccomp slirp
> +
> +SLIRP4NETNS_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
