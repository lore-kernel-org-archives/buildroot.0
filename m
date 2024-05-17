Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EB5C25B78
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 19:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C76D040BF7;
	Fri, 17 May 2024 19:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThCywUbsysz7; Fri, 17 May 2024 19:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35E8240B9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35E8240B9A;
	Fri, 17 May 2024 19:23:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1151BF348
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 19:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27E116065C
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 19:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kJGdFjAbqhQM for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 19:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF045605F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF045605F8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF045605F8
 for <buildroot@buildroot.org>; Fri, 17 May 2024 19:23:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A2D2D13F8AD;
 Fri, 17 May 2024 21:23:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 21:23:46 +0200
Date: Fri, 17 May 2024 21:23:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZkeuwstEmdZjIC3h@landeda>
References: <20240517173140.24531-1-jarkko@kernel.org>
 <20240517173140.24531-4-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517173140.24531-4-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715973830;
 bh=CA0pOnUzF+lWd8R/vag3FySg6A1tlFQnwmzZNk4dGbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CzhHhkWt3xQahyMHVFfJL59i6WVaYZ1r2nTKvs3aZ39n8k4+rrKwBMgchyPLgFIj7
 zf5eLRAUIv2VAxydRLCUcZb1sWetcSdir3RXf+gQXIcRb+AVfiIAtAl/qGBLDGUbeD
 ZnXkQlLlF96bBIlBaLaUznHxNlzb5RWUM8B8Fn38lRFODmM7Dz7S9wYctsFRQKoSXm
 bmLygiqgn512g2rhMlwmpMixJ9zMU+xc3pcoTHrDWvd1Nza12ntouxXGOn7wmzy0BT
 F1h0EQKo6yKnsVii94eJuPnsaPfOPkZBsgmS1nTXaBCwpZvKDs0NDjr2ZVlfdjUJV/
 HdhUQcklFRJ2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CzhHhkWt
Subject: Re: [Buildroot] [PATCH v2 3/3] package/swtpm: add host package
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

On 2024-05-17 20:31 +0300, Jarkko Sakkinen spake thusly:
> The SWTPM package provides TPM emulators with different front-end
> interfaces to libtpms. TPM emulators provide socket interfaces (TCP/IP and
> Unix) and the Linux CUSE interface for the creation of multiple native
> /dev/vtpm* devices.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
[--SNIP--]
> diff --git a/package/swtpm/Config.in.host b/package/swtpm/Config.in.host
> new file mode 100644
> index 0000000000..79a9aa28af
> --- /dev/null
> +++ b/package/swtpm/Config.in.host
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_HOST_SWTPM
> +	bool "host swtpm"
> +	select BR2_PACKAGE_LIBTOOL

host-swtpm is a host package, so it should not select target packages,
like libtool. And the host variant for libtool has no Kconfig symbol.

> +	help
> +	  Compiles SWTPM software TPM emulator for the host.
> +
> +	  The SWTPM package provides TPM emulators with different
> +	  front-end interfaces to libtpms. TPM emulators provide socket
> +	  interfaces (TCP/IP and Unix) and the Linux CUSE interface for
> +	  the creation of multiple native /dev/vtpm* devices.
> +
> +	  https://github.com/stefanberger/swtpm/wiki
> diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
> new file mode 100644
> index 0000000000..934d3b6ee0
> --- /dev/null
> +++ b/package/swtpm/swtpm.hash
> @@ -0,0 +1,2 @@
> +sha256  b281b4e8c39f68e1928675f788abc70072e4081152e129144359a8c5c304c06b  swtpm-0.8.2.tar.gz
> +sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> new file mode 100644
> index 0000000000..1d42d72e71
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
> +SWTPM_AUTORECONF = YES

    # Straight out of the git repository
    SWTPM_AUTORECONF = YES

Almost there! ;-)

Regards,
Yann E. MORIN.

> +HOST_SWTPM_DEPENDENCIES = \
> +	host-json-glib \
> +	host-libopenssl \
> +	host-libtasn1 \
> +	host-libtool \
> +	host-libtpms \
> +	host-pkgconf
> +
> +HOST_SWTPM_CONF_OPTS = --with-openssl --without-seccomp
> +
> +$(eval $(host-autotools-package))
> --
> 2.45.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
