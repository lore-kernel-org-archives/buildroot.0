Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E0DC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 18:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7681040328;
	Fri, 17 May 2024 18:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gqnw-WAN2P84; Fri, 17 May 2024 18:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F1F540385
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F1F540385;
	Fri, 17 May 2024 18:44:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 415091BF312
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 18:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A931406CA
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 18:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gw4JzGSp2gC8 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 18:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BDEA440693
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDEA440693
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDEA440693
 for <buildroot@buildroot.org>; Fri, 17 May 2024 18:44:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1121C13F8A2;
 Fri, 17 May 2024 20:44:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 20:44:32 +0200
Date: Fri, 17 May 2024 20:44:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZkelkMYnP8ykEFkY@landeda>
References: <20240517173140.24531-1-jarkko@kernel.org>
 <20240517173140.24531-3-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517173140.24531-3-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715971476;
 bh=tT+pXoVar3jw89ocxOgInadsIwggbBJvGF5XF68U1bY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yrrz03uaWU4oAqI7doCmUZdSveJtfAijsYjwSgNDOl4X45eDd0qT8Yhaom6RJZ0Bf
 JboisGEHh0DAwzk0j0peKDbgkSRPMFKThli08pXyK2NOT2gFtbsIy1gmbrEFSzAWRE
 JUBFg8PSm3gyq9srsL5JfZjFK7Yuj9iQ7McDDEOYk92xWHqkNlrrONZl+Wno3ryUgI
 +5XChV7lvmm0A53JKIvCoiNdjG1YBlkGkZQNV+h5w1dkMZmsussnznJkEiCCOWQ8Pr
 9qxdFX2gMaPH4th0cU3oYOYliACeAPKLG47CJSabiuuev1ZANZZtBmrhvRciU3k81O
 3xhHX/qkmVqjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yrrz03ua
Subject: Re: [Buildroot] [PATCH v2 2/3] package/libtpms: add host package
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
> Libtpms is a library that targets the integration of TPM functionality
> into hypervisors, primarily into Qemu. Libtpms provides a very narrow
> public API for this purpose so that integration is possible. Only the
> minimum of necessary APIs are made publicly available.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> v2:
> - Use host packages in package/libtpms/Config.in.
> - Select BR2_HOST_PACKAGE_LIBOPENSSL.

s/HOST_PACKAGE/PACKAGE_HOST/

However [0]...

[--SNIP--]
> diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in
> new file mode 100644
> index 0000000000..9308458248
> --- /dev/null
> +++ b/package/libtpms/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_HOST_PACKAGE_LIBTPMS

s/HOST_PACKAGE/PACKAGE_HOST/

> +	bool "libtpms"
> +	select BR2_HOST_PACKAGE_LIBTOOL

[0]... here you select libtool instead of openssl.

And we can't select libopenssl; instead we select openssl:

    $ git grep 'select BR2_PACKAGE_LIBOPENSSL\>'
    [nada, naught, zilch]

    $ git grep 'select BR2_PACKAGE_OPENSSL\>'
    [156 results]

And anyway, in this case again there is no need for a Kconfig xymbo, as
libtpms only provides a library, so there is only the need for
libtpms.mk (and the hash file too).

[--SNIP--]
> diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
> new file mode 100644
> index 0000000000..c588b2892c
> --- /dev/null
> +++ b/package/libtpms/libtpms.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# libtpms
> +#
> +################################################################################
> +
> +LIBTPMS_VERSION = 0.9.6
> +LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
> +LIBTPMS_LICENSE = BSD-4-Clause
> +LIBTPMS_LICENSE_FILES = LICENSE
> +LIBTPMS_INSTALL_STAGING = YES
> +LIBTPMS_AUTORECONF = YES

Sorry, I missed that in my previous review, but we usually add a little
comment why autoreconf is needed:

    # Straight from the git repository
    LIBTPMS_AUTORECONF = YES

Regards,
Yann E. MORIN.

> +HOST_LIBTPMS_DEPENDENCIES = host-libtool host-pkgconf host-libopenssl
> +HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
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
