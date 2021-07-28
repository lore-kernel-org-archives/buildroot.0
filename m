Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02176C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:25:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF3216103A
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF3216103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 915F281D4D;
	Wed, 28 Jul 2021 19:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7PAFqQ9fFbMO; Wed, 28 Jul 2021 19:25:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64BB481CE7;
	Wed, 28 Jul 2021 19:25:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4351BF2BC
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CB854022B
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66LQukG-GTsa for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 19:25:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47EA440142
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 19:25:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:453b:e753:6c2:161c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0B7102003AE;
 Wed, 28 Jul 2021 21:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627500318;
 bh=59o8A6WhenfMumty8RK604Cnqou9xijdt+Kx/p597vI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3LdlrCxACZah3gnILqhd805HvjY2CLXgon3YTQ5+eUuTqidIg4Atg7yhWA12zWPe
 CvIUEKdstYmxOlMCRXYXmiQgRfZvuDFwH+npf+T4JeHwfyltRMq/P1YmSF62JOBg7H
 w0MogNubQ/bTeTPAG2k9+Pz2P9bimyLgOa31oqpZAmZ+H54xp7Zt4dft6fPTVmaSE4
 oCLglSCnVf2NQBYokfVxgOq8mDEaphyhgL1KNVeXl1Ejz5R8DcB0lE5fA+n7DjaapW
 u5wJg3Sg9mFtLhN1ZnFSUe1arpqsCQJgkw3Eb79DvZ/7faSkDW+CRcrUaWKmfLcr5G
 igGdMafB75lHQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 28 Jul 2021 21:25:07 +0200
Date: Wed, 28 Jul 2021 21:25:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20210728192507.GC3189549@scaer>
References: <20201101114712.1696943-1-geomatsi@gmail.com>
 <20201101114712.1696943-3-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201101114712.1696943-3-geomatsi@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 2/2] package/gpsd: enable python support
 and modules
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Olivier Dautricourt <olivier.dautricourt@orolia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Sergey, All,

On 2020-11-01 14:47 +0300, Sergey Matyukevich spake thusly:
> Add option that enables gpsd python support including modules, tools,
> and gpsfake test harness. If python is enabled then install python
> modules unconditionally. Note that gpsd python modules run compatibly
> under Python 2 and 3.x for x >= 2. So enable gpsd python support when
> any Python version is enabled in board configuration. If no Python is
> enabled, but gpsd Python support is requested, then select Python 3.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  package/gpsd/Config.in | 10 ++++++++++
>  package/gpsd/gpsd.mk   | 13 ++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
> index 5dd57c34b8..e63c3d66b9 100644
> --- a/package/gpsd/Config.in
> +++ b/package/gpsd/Config.in
> @@ -79,6 +79,16 @@ config BR2_PACKAGE_GPSD_MAX_DEV_VALUE
>  config BR2_PACKAGE_GPSD_SQUELCH
>  	bool "squelch gpsd_report and gpsd_hexdump to save cpu"
>  
> +config BR2_PACKAGE_GPSD_PYTHON
> +	bool "build Python support and modules"
> +	depends on BR2_USE_WCHAR # python
> +	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
> +	help
> +	  Python libraries and tools for the gpsd service daemon including gpsfake test harness.

    $ make check-package
    package/gpsd/Config.in:87: help text: <tab><2 spaces><62 chars>
    (http://nightly.buildroot.org/#writing-rules-config-in)

> +comment "GPSD python support not available with toolchain w/o wide characters support"
> +	depends on !BR2_USE_WCHAR

As per the manual
    https://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options

    gpsd needs a toolchain w/ wchar

>  comment "Protocols"
>  
>  config BR2_PACKAGE_GPSD_AIVDM
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index 62c4c611c3..8934d525e5 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -23,7 +23,6 @@ GPSD_SCONS_OPTS = \
>  	prefix=/usr \
>  	sysroot=$(STAGING_DIR) \
>  	strip=no \
> -	python=no \
>  	qt=no \
>  	systemd=$(if $(BR2_INIT_SYSTEMD),yes,no)
>  
> @@ -186,6 +185,18 @@ endif
>  ifeq ($(BR2_PACKAGE_GPSD_MAX_DEV),y)
>  GPSD_SCONS_OPTS += max_devices=$(BR2_PACKAGE_GPSD_MAX_DEV_VALUE)
>  endif
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +	GPSD_SCONS_OPTS += \
> +		python=yes \
> +		python_libdir="/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages"
> +else ifeq ($(BR2_PACKAGE_PYTHON),y)
> +	GPSD_SCONS_OPTS += \
> +		python=yes \
> +		python_libdir="/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages"
> +else
> +	GPSD_SCONS_OPTS += \
> +		python=no

    $ make check-package
    package/gpsd/gpsd.mk:191: unexpected indent with tabs
    package/gpsd/gpsd.mk:195: unexpected indent with tabs
    package/gpsd/gpsd.mk:199: unexpected indent with tabs

I've fixed those three, and Applied to master, thanks.

Regards,
Yann E. MORIN.

> +endif
>  
>  GPSD_SCONS_ENV += \
>  	LDFLAGS="$(GPSD_LDFLAGS)" \
> -- 
> 2.29.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
