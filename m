Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6060CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:22:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 316226113B
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 316226113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE98180F32;
	Mon, 25 Oct 2021 19:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lyU2PIeqTDBH; Mon, 25 Oct 2021 19:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42B7F80F0A;
	Mon, 25 Oct 2021 19:22:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 820651BF309
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 719F860774
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_nxlwkRUJnB for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:22:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C95B60765
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:22:30 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id r4so3462292edi.5
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=27aLE0hZafsYk+GkBV8WzBq5AUU5ra/SwIW6DuQUPJg=;
 b=E1Ubd00DojV+oGl6v/QsJKzKYjI54rykpG2g1ed52sTRa1NfOPlBfHQLcEBeMb/+QS
 gBz0sudH6aa8tz7aXjT+LMmlEYcDRKRn9GWECp3eqSFqJYcom1wJgk5mz1l2n5JYQ16e
 rbD42hiBNT6lC/KRG5NXYwIVM66lgMHXx87l6skr72x10IbrvmD3Gbw4TmZ+bcoQ+qAm
 ET1A8Fm1fAg7AkB6JFgmyTMvAWxIIebOFAsObCyCrM7mAKdiX3ibWg0hdGvOI5N295Xz
 eCscyaxM2T4zoeimLD90W+E9dUFt6I3GzGKeAu7/2M1HIrVPbeskTfr2lIcFhEaBlVMm
 QSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=27aLE0hZafsYk+GkBV8WzBq5AUU5ra/SwIW6DuQUPJg=;
 b=uAC9PjOP3zheEdsPfDNiIkP29cW/SPG9QZjShShy+/dvya6gUWjhGu9xDmzqahRdbF
 UL3hwDbvVs/v5i0fbi7Tou2TrKlMNxUjn2p1EbKlIdqJHucp/kz7chp7V/zIZr2Cmh4f
 Y830Z4bLBMfeTvYLG5omBq0XPdABdvH9QPATUhKOkHifnnAO5KCXu9JXhKrRr5YS/rlW
 JCKwslIdELKKBVKw7mBJ+zyB0zunyETtVrCZxv025zC10iOMNwCw0DiKCwHJfas9QzuJ
 bJXANP4Qe3Zp0hOmpV2Re7M5/e2u6nfKnwVoAOdQTwZXMOyJ4c+pmjxfUahdQi/Ygw20
 nHNA==
X-Gm-Message-State: AOAM532ldVY2eDcEemqeOMOGy/PrtyO+O8RJk/eHzIAo59LwpDp8IwIX
 879iYJF6FtyhHHlW03XzAkDbug==
X-Google-Smtp-Source: ABdhPJxAIq7gHA6euZiLCIAYSzbonEzJmQkn4nI75On6OT7gDW7ud1b3diI0+dYtmy3+6L8PKqytpw==
X-Received: by 2002:a05:6402:1d49:: with SMTP id
 dz9mr29574618edb.17.1635189748425; 
 Mon, 25 Oct 2021 12:22:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b9sm4531118ede.12.2021.10.25.12.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:22:28 -0700 (PDT)
Message-ID: <df8d1e98-e975-9cea-6eca-dc1acbba9f78@mind.be>
Date: Mon, 25 Oct 2021 21:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211014225849.832479-1-aduskett@gmail.com>
 <20211014225849.832479-7-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211014225849.832479-7-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 06/11] package/python-matplotlib: bump to
 version 3.4.3
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/10/2021 00:58, Adam Duskett wrote:
> - Remove upstreamed patches
> - Add BR2_PACKAGE_PYTHON_CERTIFI and BR2_PACKAGE_QHULL as dependencies
> - Add a new file: setup.cfg. This file is needed to force matplotlib to use
>    the system-provided freetype and qhull, and to disable lto.
>    The setup.cfg file is copied to the source directory before configuring.
> 
> LTO must be disabled or else compile errors such as:
> "Relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZSt3hexRSt8ios_base'
> which may bind externally can not be used when making a shared object;
> recompile with -fPIC"
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

[snip]
> diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
> index afc090856f..f38618d709 100644
> --- a/package/python-matplotlib/Config.in
> +++ b/package/python-matplotlib/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
>   	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
>   	select BR2_PACKAGE_FREETYPE # runtime
>   	select BR2_PACKAGE_LIBPNG # runtime
> +	select BR2_PACKAGE_PYTHON_CERTIFI

  Since you don't depend on it, I guess this is a runtime dependency, so I added 
that.

>   	select BR2_PACKAGE_PYTHON_CYCLER
>   	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
>   	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
> @@ -13,6 +14,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
>   	select BR2_PACKAGE_PYTHON_NUMPY # runtime
>   	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
>   	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
> +	select BR2_PACKAGE_QHULL
>   	select BR2_PACKAGE_ZLIB # runtime
>   	help
>   	  Matplotlib strives to produce publication quality 2D
> diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
> index ccb22eefa5..81e83ac0de 100644
> --- a/package/python-matplotlib/python-matplotlib.hash
> +++ b/package/python-matplotlib/python-matplotlib.hash
> @@ -1,4 +1,4 @@
>   # sha256 from https://pypi.org/project/matplotlib/#files
> -sha256	e1d33589e32f482d0a7d1957bf473d43341115d40d33f578dad44432e47df7b7  matplotlib-3.0.3.tar.gz
> +sha256	fc4f526dfdb31c9bd6b8ca06bf9fab663ca12f3ec9cdf4496fb44bc680140318  matplotlib-3.4.3.tar.gz
>   # Locally computed sha256 checksums
>   sha256	5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
> diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
> index 8d00ac8a07..2f55dd5d5d 100644
> --- a/package/python-matplotlib/python-matplotlib.mk
> +++ b/package/python-matplotlib/python-matplotlib.mk
> @@ -4,17 +4,23 @@
>   #
>   ################################################################################
>   
> -PYTHON_MATPLOTLIB_VERSION = 3.0.3
> +PYTHON_MATPLOTLIB_VERSION = 3.4.3
>   PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
> -PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/26/04/8b381d5b166508cc258632b225adbafec49bbe69aa9a4fa1f1b461428313
> +PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/21/37/197e68df384ff694f78d687a49ad39f96c67b8d75718bc61503e1676b617
>   PYTHON_MATPLOTLIB_LICENSE = Python-2.0
>   PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
> -PYTHON_MATPLOTLIB_DEPENDENCIES = host-pkgconf freetype host-python-numpy \
> -	libpng python-cycler
> +PYTHON_MATPLOTLIB_DEPENDENCIES = \
> +	host-pkgconf freetype host-python-numpy \
> +	libpng python-cycler host-python-certifi qhull

  I've taken the opportunity to make this one per line and sort alphabetically.

  Applied to master, thanks.

  Regards,
  Arnout

>   PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
>   
>   ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
>   PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
>   endif
>   
> +define PYTHON_MATPLOTLIB_COPY_SETUP_CFG
> +	cp $(PYTHON_MATPLOTLIB_PKGDIR)/setup.cfg $(@D)/setup.cfg
> +endef
> +PYTHON_MATPLOTLIB_PRE_CONFIGURE_HOOKS += PYTHON_MATPLOTLIB_COPY_SETUP_CFG
> +
>   $(eval $(python-package))
> diff --git a/package/python-matplotlib/setup.cfg b/package/python-matplotlib/setup.cfg
> new file mode 100644
> index 0000000000..4bda0d4376
> --- /dev/null
> +++ b/package/python-matplotlib/setup.cfg
> @@ -0,0 +1,10 @@
> +[libs]
> +# Disable LTO to prevent the following error:
> +# Relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `_ZSt3hexRSt8ios_base'
> +# which may bind externally can not be used when making a shared object;
> +# recompile with -fPIC
> +enable_lto = False
> +
> +# Freetype and qhull are provided by Buildroot
> +system_freetype = True
> +system_qhull = True
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
