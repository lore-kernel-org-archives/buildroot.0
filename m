Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DE6C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 09:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53568811C2;
	Thu,  6 Jun 2024 09:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ax5_UQEZk-f9; Thu,  6 Jun 2024 09:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55782811D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55782811D2;
	Thu,  6 Jun 2024 09:30:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 026321BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3BB56084B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjwQW3NNQOWk for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 09:30:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A78F560780
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A78F560780
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A78F560780
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 09:30:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id ECADF13F88F;
 Thu,  6 Jun 2024 11:30:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 11:30:05 +0200
Date: Thu, 6 Jun 2024 11:30:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZmGBnfkfL4h2SDac@landeda>
References: <20240605233503.23516-1-jarkko@kernel.org>
 <20240605233503.23516-4-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605233503.23516-4-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717666210;
 bh=GIgEhzQ723kK0IVze6n2HCsFulqLFhZi/MUg8Fx8RWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JWBCLQDMDxAAyxuE78BuiNGBIgpWuk7eh92vI1dBYmDFlV+AxBJx/YMtvN5Z0BMFk
 Oi3FR/8rnrxQw665zbsubtrw7APVpfUS6/I3ptpehsECozIh6sRoFQN9LmrN+ZtBsk
 SaitOxB37H7DBpHQY6aqfWEi0tE2lKEeBuPkN7SlqRgU2WTQlSX1eVCre1lkWlqsAo
 T2dZj1JQIG17KphiSYN8C7iqy7gPzbz6vhrv0/IOH8u8B5e+3aQHB47w1XeywbbRlW
 wdeOhlegpbFRGY7ZizVMzkBuP0HV+U0WampGZATO1OK9vYjiduHFRtI19NfhFlzHYA
 WSwz7vZmE3cuw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JWBCLQDM
Subject: Re: [Buildroot] [PATCH v7 3/3] package/swtpm: add host package
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jarkko, All,

On 2024-06-06 02:35 +0300, Jarkko Sakkinen spake thusly:
> The SWTPM package provides TPM emulators with different front-end
> interfaces to libtpms. TPM emulators provide socket interfaces (TCP/IP and
> Unix) and the Linux CUSE interface for the creation of multiple native
> /dev/vtpm* devices.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
[--SNIP--]
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> new file mode 100644
> index 0000000000..b05a248c03
> --- /dev/null
> +++ b/package/swtpm/swtpm.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# swtpm
> +#
> +################################################################################
> +
> +SWTPM_VERSION = 0.8.2
> +SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
> +SWTPM_LICENSE = BSD-4-Clause
> +SWTPM_LICENSE_FILES = LICENSE
> +
> +# Required because a plain Git clone is used:
> +HOST_SWTPM_AUTORECONF = YES
> +HOST_SWTPM_DEPENDENCIES = \
> +	host-json-glib \
> +	host-libopenssl \
> +	host-libtasn1 \
> +	host-libtool \
> +	host-libtpms \
> +	host-pkgconf
> +HOST_SWTPM_CONF_OPTS = --with-openssl --without-seccomp
> +
> +$(eval $(host-autotools-package))

    $ make defconfig
    $ make host-swtpm
    [...]
    configure: error: expect is required: expect package

It is only needed for tests, so I disabled those.

I took that opportunity to also reorganise the variables in a more
logical manner: first, depenencies, then autoreconf, finally configure
opts.

Applied to next, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
