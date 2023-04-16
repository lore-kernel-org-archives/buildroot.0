Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE39C77B77
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 19:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C91141C7C;
	Sun, 16 Apr 2023 19:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C91141C7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hyDD0zj1Vshi; Sun, 16 Apr 2023 19:01:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C12641C78;
	Sun, 16 Apr 2023 19:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C12641C78
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6B301C416B
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF8478213A
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF8478213A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbnoJ7_3dJ6E for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 19:01:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F8CF81355
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F8CF81355
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 19:01:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 43D675FF93;
 Sun, 16 Apr 2023 21:01:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 21:01:31 +0200
Date: Sun, 16 Apr 2023 21:01:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20230416190131.GD2819@scaer>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
 <20220819151734.926106-9-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819151734.926106-9-Ben.Wolsieffer@hefring.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681671700;
 bh=jCA5nUEijiIeqXapA7kSLoPe6z5KlTEvwqn5A37iKcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kiSMxN/+KMHkyMNhXhxEylxQCANOYe5djZhx0mblSa2OyezjOp93oYOy0YpIEBkyQ
 U2WkDabBX67+TRzDFRLHS4HNIRQ5Sj61iwObq4J+UkxC19Gf6F8pqzt0LQx7fLIFc3
 ExRyKGB1kBVL9fqFU0bd6ZSp80vt/dznxcmw64RFZv3JBzKlLNtLeEu+Oc8n3udby8
 3w/Z2HHUmQSwPxwWdbVu9+4KGuiXsKOPUvvLERL7xqPDc0edADOrCjHn+qhMM0DUv6
 OGylHooeZA+0PN2K8ZBYjyOs6gZ/O0X0fYRz4dhGcwqPEbmfiux+doncSRmaztcFXg
 hRDxtaLagr2XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kiSMxN/+
Subject: Re: [Buildroot] [PATCH v3 8/8] package/pkg-autotools: patch libtool
 to support ARM FDPIC
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ben, All,

On 2022-08-19 11:17 -0400, Ben Wolsieffer spake thusly:
> Patch the target matching code in libtool to understand
> arm-*-uclinuxfdpiceabi targets. To avoid the need to run autoreconf,
> this patching must be performed in the configure script.
> 
> Without this patch, libtool refuses to build ARM FDPIC shared libraries.
> This is especially important because NPTL thread-local storage is broken
> in static libraries that are linked into dynamic FDPIC executables.

If static build is known to be broken with FDPIC, then maybe we should
just forbid it:

    config BR2_STATIC_LIBS
        bool "static only"
        depends on BR2_BINFMT_SUPPORTS_STATIC
        depends on !BR2_TOOLCHAIN_USES_GLIBC

    comment "static only needs a toolchain w/ uclibc or musl"
        depends on BR2_BINFMT_SUPPORTS_STATIC
        depends on BR2_TOOLCHAIN_USES_GLIBC

    config BR2_SHARED_LIBS
        bool "shared only"
        depends on BR2_BINFMT_SUPPORTS_SHARED

    config BR2_SHARED_STATIC_LIBS
        bool "both static and shared"
        depends on BR2_BINFMT_SUPPORTS_STATIC && BR2_BINFMT_SUPPORTS_SHARED

BR2_BINFMT_SUPPORTS_STATIC would be a new symbol that BR2_BINFMT_ELF
and BR2_BINFMT_FLAT would select, but not BR2_BINFMT_FDPIC.

Regards,
Yann E. MORIN.

> Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
> ---
>  package/pkg-autotools.mk | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index b6224b349d..60e70a6e2f 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -87,6 +87,16 @@ define CONFIGURE_FIX_POWERPC64_HOOK
>  	support/scripts/fix-configure-powerpc64.sh $($(PKG)_DIR)
>  endef
>  
> +#
> +# Hook to add support for arm-*-uclinuxfdpiceabi to the configure script
> +#
> +define CONFIGURE_FIX_UCLINUXFDPICEABI_HOOK
> +	@$(call MESSAGE,"Adding uclinuxfdpiceabi to configure")
> +	find $($(PKG)_DIR) -name configure \
> +		-exec grep -qF 'Generated by GNU Autoconf' {} \; \
> +		-exec sed -Ei 's#((\s|^)linux\*\B)#\1 | uclinuxfdpiceabi#' '{}' \;
> +endef
> +
>  #
>  # Hook to gettextize the package if needed
>  #
> @@ -269,6 +279,13 @@ ifneq ($$(filter powerpc64%,$$(if $$(filter target,$(4)),$$(ARCH),$$(HOSTARCH)))
>  $(2)_PRE_CONFIGURE_HOOKS += CONFIGURE_FIX_POWERPC64_HOOK
>  endif
>  
> +# Append a configure hook if building for ARM with FDPIC enabled.
> +# Must be added after other pre-configure hooks that might regenerate the
> +# configure script and overwrite the changes made here.
> +ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_BINFMT_FDPIC),y:y)
> +$(2)_PRE_CONFIGURE_HOOKS += CONFIGURE_FIX_UCLINUXFDPICEABI_HOOK
> +endif
> +
>  #
>  # Build step. Only define it if not already defined by the package .mk
>  # file.
> -- 
> 2.37.0
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
