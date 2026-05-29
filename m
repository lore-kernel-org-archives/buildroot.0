Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4499CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3F83605B0;
	Fri, 29 May 2026 08:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAzgFFPEWyVV; Fri, 29 May 2026 08:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDBAE61462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780044433;
	bh=iXuhyWd9j1DbrxVRjanNNnsf7CViEAy7Tqw3DcHekw8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=blWaLrVRqjYygPedrhN5TNSlYgvMF4AT42gNsLYnHscLs7amgQMLAnDO4CBCTl+jv
	 43+htFR2OkeehcAFWjJaMSBUhexomm6sCaMKdkFDXfzFQtMEPC/rDmQcZ58qJ54ZvZ
	 hKtk55xYGZ0spmF0dRaAFRmJSfPTkCBgTQJ6iLb2JAHzM1krGoPO0BhBduA1pTwNZl
	 zbOjlkO0d/jp91lpK9Prh5nQ0w0+yB2wh64e68r95t5zEbBAlZi1mRhZMdfjbi1ujZ
	 1nVHpKWpluw+ZCrUYveKK1iO6KbOcaBOssqP0Aw5TTQSzOoxnWBYkez/LYztBbY562
	 ICafRfbLLfScg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDBAE61462;
	Fri, 29 May 2026 08:47:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39E12288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3756C605B0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLrY457VSOXP for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:47:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4E9961470
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4E9961470
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4E9961470
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9E243B97C4B4; Fri, 29 May 2026 10:47:04 +0200 (CEST)
Message-ID: <8f68973a-5a24-40b2-a3b9-5a5bbae71f76@rnout.be>
Date: Fri, 29 May 2026 10:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andreas Mohr <and@gmx.li>, buildroot@buildroot.org
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Laurent Vivier <laurent@vivier.eu>, Sen Hastings <sen@hastings.org>,
 Christian Stewart <christian@aperture.us>, Petr Vorel
 <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
References: <20260523151911.10285-1-and@gmx.li>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260523151911.10285-1-and@gmx.li>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780044429; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=F+gQ7POs93kLZR6w0f2jdN5zglZOO8RjB42eJlGRGVs=;
 b=c6JGUvt62kp6Pf7rVIcPKyTexjx6zS5cnNr4CHbZnLskq1I9dqrxCCSw3zGUBZow+JzNWZ
 +zSxaEAc1a8VD26F3nVxwqSjjrNX/QpOxX2gjXad26Q0s2YLiR4P3YQa2uWlwGi+HPym0O
 o4kXhi59o/GeJSIU1ThUC2RuLvPcOeyVJc9+15ZtRmtbVLbSK6KJMdMIPfuDQETc89ag5d
 kW1J9Jh/6q3NzDTT/HkLmL9BK0RG6rL+EHVWOnZqTPwLIH8CkgmXI8A0cHc8Oaq5dlivCv
 KvpHjQkbHGazOWcOgkNH8uYx0Ih/5j2pPSMKHPITp4lwxeQByWLMxnJ6BylUXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=c6JGUvt6
Subject: Re: [Buildroot] [PATCH/next v2 1/9] package/lvm2: add static build
 support
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/05/2026 17:19, Andreas Mohr via buildroot wrote:
> Add static build support for device mapper
> 
> Lvm2 standard install still requires dynamic library
> 
> Signed-off-by: Andreas Mohr <and@gmx.li>

  Applied series to next, thanks.

  Regards,
  Arnout

> ---
>   package/lvm2/Config.in | 9 ++++++---
>   package/lvm2/lvm2.mk   | 9 +++++++++
>   2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
> index ddb398d1..4f15504e 100644
> --- a/package/lvm2/Config.in
> +++ b/package/lvm2/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_LVM2
>   	bool "lvm2 & device mapper"
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>   	depends on BR2_USE_MMU # needs fork()
> -	depends on !BR2_STATIC_LIBS # It fails to build statically
>   	help
>   	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
>   	  LVM supports enterprise level volume management of disk and
> @@ -26,13 +25,17 @@ if BR2_PACKAGE_LVM2
>   config BR2_PACKAGE_LVM2_STANDARD_INSTALL
>   	bool "standard install instead of only dmsetup"
>   	default y
> +	depends on !BR2_STATIC_LIBS
>   	select BR2_PACKAGE_LIBAIO
>   	help
>   	  Install the standard suite of lvm2 programs. When this option
>   	  is not set, only dmsetup is installed.
>   
> +comment "lvm2 standard install needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
>   endif
>   
> -comment "lvm2 needs a toolchain w/ threads, dynamic library"
> +comment "lvm2 needs a toolchain w/ threads"
>   	depends on BR2_USE_MMU
> -	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 3a1dded5..8db1899e 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -48,6 +48,15 @@ else
>   LVM2_CONF_OPTS += --disable-selinux
>   endif
>   
> +ifeq ($(BR2_STATIC_LIBS),y)
> +# configure: error: --enable-cmdlib requires dynamic linking.
> +LVM2_CONF_OPTS += --disable-cmdlib
> +# configure: error: --enable-dmeventd requires --enable-cmdlib to be used as well
> +LVM2_CONF_OPTS += --disable-dmeventd
> +# install static version of the devmapper library
> +LVM2_CONF_OPTS += --enable-static_link
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
>   LVM2_DEPENDENCIES += libaio
>   LVM2_INSTALL_STAGING_OPTS += install

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
