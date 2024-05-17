Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B59CC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 13:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19BC882277;
	Fri, 17 May 2024 13:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GB6qWHN-f-3J; Fri, 17 May 2024 13:52:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F126882280
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F126882280;
	Fri, 17 May 2024 13:52:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5E25A1BF3DE
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48B4D4061B
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E26joCelbbXD for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 13:52:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D1C93404E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1C93404E9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1C93404E9
 for <buildroot@buildroot.org>; Fri, 17 May 2024 13:52:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 012F813F8B5;
 Fri, 17 May 2024 15:52:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 15:52:46 +0200
Date: Fri, 17 May 2024 15:52:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZkdhLm2mI4MajXk-@landeda>
References: <20240517132039.7124-1-jarkko@kernel.org>
 <20240517132039.7124-5-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517132039.7124-5-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715953970;
 bh=ut1bTkuUoIA3vYb/X0p5zWXvJyR0Jy1LjeUX+ImWmwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TtCU0CNFdY4v2LswBUhrXgF825ymXaNEagio4rb96DetovMJSO2vvnjRpvCDOpAtS
 gYtqFB+Oz2fZhHsLZYQwo/y4bt5hH2DAy7nySEu10RuUbNowYTKmHp6vr3h5pEJVqP
 e/E632wrEvPmSMOuAZsRTpZNyGojtEIqkPfRquGcUSmqL9ALY5EPLkQIjmaEIDkRMx
 nu0OJ2t4da3UTHwnRQbDj1Hm3Pib95ZAxiQA4CHmawuO2l3eR+vg9U7moWzS1O5r8s
 +3WVRM3MofnJMyllzQ9J6A+70XqwTDdO3yVA/h2CqvJbvLkeZS2FBD8Z2UiNtcQUtB
 cK+Ec4CmhCsxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TtCU0CNF
Subject: Re: [Buildroot] [PATCH 4/4] package/swtpm: add host package
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

On 2024-05-17 16:20 +0300, Jarkko Sakkinen spake thusly:
> The SWTPM package provides TPM emulators with different front-end
> interfaces to libtpms. TPM emulators provide socket interfaces (TCP/IP and
> Unix) and the Linux CUSE interface for the creation of multiple native
> /dev/vtpm* devices.
> 
> Link: https://gitlab.com/jarkkojs/linux-tpmdd-test
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
[--SNIP--]
> diff --git a/package/swtpm/Config.in.host b/package/swtpm/Config.in.host
> new file mode 100644
> index 0000000000..264f74e458
> --- /dev/null
> +++ b/package/swtpm/Config.in.host
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_HOST_SWTPM

This is a host package (by name, and sourced from Config.in.host), so...

> +	bool "host swtpm"
> +	select BR2_PACKAGE_JSON_GLIB
> +	select BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBTASN1
> +	select BR2_PACKAGE_LIBTOOL
> +	select BR2_PACKAGE_LIBTPMS

... it should select target packages.

Usually, unless there is a good reason, we do not expose in menuconfig,
host packages that only provide libraries used by other host packages.

[--SNIP--]
> diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> new file mode 100644
> index 0000000000..29c8e37c47
> --- /dev/null
> +++ b/package/swtpm/swtpm.mk
> @@ -0,0 +1,17 @@
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
> +
> +HOST_SWTPM_DEPENDENCIES = host-m4 host-libtool host-pkgconf host-json-glib \
> +			  host-libopenssl host-libtasn1 host-libtpms

Lists should be alphabetically sorted, and long lists should be one-item
per line:

HOST_SWTPM_DEPENDENCIES = \
    host-json-glib \
    host-libopenssl \
    host-libtasn1 \
    host-libtool \
    host-libtpms \
    host-m4 \
    host-pkgconf

host-m4 is usualy only required when you need to autoreconf, in which
case it is automatically pulled in (because _AUTORECONF pulls in
host-autoconf in _DEPENDENCIES, which in turns pulls in host-m4). And as
you do indeed autoreconf, there is no reason to explicitly pul it in,
unless swtpm does have explicit m4 scripts besides those in the
autotools machinery.

Regards,
Yann E. MORIN.

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
