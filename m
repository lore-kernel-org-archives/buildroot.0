Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A00FC25B79
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 13:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E9A8108D;
	Fri, 17 May 2024 13:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bwFa5SqcIRmF; Fri, 17 May 2024 13:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC1E88129A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC1E88129A;
	Fri, 17 May 2024 13:44:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B0961BF3F0
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 176644036E
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNhnu_xK_bGN for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 13:44:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E389840217
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E389840217
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E389840217
 for <buildroot@buildroot.org>; Fri, 17 May 2024 13:44:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DA96313F8B8;
 Fri, 17 May 2024 15:44:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 15:44:14 +0200
Date: Fri, 17 May 2024 15:44:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZkdfLpYoJCo-yfUa@landeda>
References: <20240517132039.7124-1-jarkko@kernel.org>
 <20240517132039.7124-4-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517132039.7124-4-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715953458;
 bh=tYXmlkWBQiz43Z0bDhUlszX/4TJRhIqWFdXoxkyv7Ak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uCFhRhRzypADRwSahAh/j/WSWNffV8KQjmqWG7bDWdmapki9luhwTjYGJtLuPnF/m
 Xop/MCSoSqCBRasfIU0BG4K18t44MZ3L/vt8BlC1VHWWwuoI636COryO/uZoD6vg1C
 FutdASNsavzfSpYk5TC6mOs+oMvjbv6l+mhcv/6U2avEveb0Kys8/y6z6zAL2jNXnq
 r+rFDJ3FCkthqjH+IlNUwxo6bY55vnikAYyRzSykB8znuq6zGNYwBiwrw+0Cry3kAI
 +YxuDUWjuFFni+pLs5WUI+/cRvhRyqJBTp06kNhKmzIUOxSg4xvGToAzOBxObQ+P3H
 1UBrKIrc9ZUNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uCFhRhRz
Subject: Re: [Buildroot] [PATCH 3/4] package/libtpms: add host package
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
> Libtpms is a library that targets the integration of TPM functionality
> into hypervisors, primarily into Qemu. Libtpms provides a very narrow
> public API for this purpose so that integration is possible. Only the
> minimum of necessary APIs are made publicly available.
> 
> Link: https://github.com/stefanberger/libtpms
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
[--SNIP--]
> diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in
> new file mode 100644
> index 0000000000..d5ae47375a
> --- /dev/null
> +++ b/package/libtpms/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_LIBTPMS

BR2_PACKAGE_LIBTPMS is for target package; for the host variant, you'd
have to name it BR2_PACKAGE_HOST_LIBTPMS.

The Config.in is sourced from ackage/Config.in, too, which is for target
packages.

> +	bool "libtpms"
> +	select BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBTOOL

It even selects target packages.

However [0]...

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
> +
> +HOST_LIBTPMS_DEPENDENCIES = host-libtool host-pkgconf host-libopenssl
> +HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
> +
> +$(eval $(host-autotools-package))

[0]... you've made it a host-only package.

So it means that if one enable BR2_PACKAGE_LIBTPMS in the menuconfig,
there will be no libtpms available in the target.

For host packages that only provide a library used by other host
packages, we usually do not add a Kconfig symbol at all, and just rely
on the _DEPENDENCIES to bring in the library.

Regards,
Yann E. MORIN.

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
