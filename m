Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2306C54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 21:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A302981461;
	Mon, 25 Mar 2024 21:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 05kS8UuKL9C8; Mon, 25 Mar 2024 21:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E5A981459
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5A981459;
	Mon, 25 Mar 2024 21:09:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D21041BF2CB
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 21:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF079405F8
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 21:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbOWnu_yb6Yn for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 21:09:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29C37405F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29C37405F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29C37405F1
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 21:09:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2397F13F8B8;
 Mon, 25 Mar 2024 22:09:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Mar 2024 22:09:24 +0100
Date: Mon, 25 Mar 2024 22:09:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-ID: <ZgHoBHMS08GuhZMh@landeda>
References: <20240314213913.535911-2-wilfred.mallawa@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240314213913.535911-2-wilfred.mallawa@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711400968;
 bh=Zhftm+KTRXaUeMUzc1YHO2wCqxF6Aw+Y1KgvMdocWiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NbgSYSytrlA78jr/nN/U1ameBBarYz1Ixp16gtLtvCFM9+20vm3RNccW4jpK1gWgM
 SJSqJ/e3iqSe2dW4+/dW2KgLl3BAmaHf61Owlmfz6loFPWKpBs5K63NmaeyTN+cZ1S
 ffV9JXE9vdqyk2ShgAj23e2fE3WAxVdQNl58ecF1a7pYTqK4z/DO0Pt9WmZa0ChN8D
 8KSrG/YaAhdWy7Pe+wlzzuh9Si4UzvAveTFFVpXAddS12gd9NaWAf4RI28P72RToC3
 ZS5AEEeyIGnw3nBV8eRmNRsIlYWJgpcLQjtSHbPjT9JuY/CmbWWa/T2ZzL2hI8cXoe
 G6NPl0sDG6kAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=NbgSYSyt
Subject: Re: [Buildroot] [PATCH 1/1] package/spdm-utils: new package
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
Cc: Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Wilfred, Alistair, All,

On 2024-03-15 07:39 +1000, Wilfred Mallawa via buildroot spake thusly:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
[--SNIP--]
> diff --git a/package/spdm-utils/Config.in b/package/spdm-utils/Config.in
> new file mode 100644
> index 0000000000..97dbc51c6d
> --- /dev/null
> +++ b/package/spdm-utils/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_SPDM_UTILS
> +	bool "spdm-utils"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_USE_WCHAR # eudev
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_MMU # eudev

MMU and !static-libs are also needed for python3, so it should
identified as well:

    depends on !BR2_STATIC_LIBS  # python3
    depends on BR2_USE_MMU  # eudev, python3

(but see below for eudev).

> +	select BR2_PACKAGE_HOST_RUSTC
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_PCIUTILS
> +	select BR2_PACKAGE_EUDEV

eudev is the provider of a virtual package, so you can't select it.

Instead, you have two cases:

  - the package needs a udev daemon (or library), in which case it
    should "depends on BR2_PACKAGE_HAS_UDEV" (and on 'udev' in the .mk),

  - or the package really needs eudev, in which case it can only depend
    on it.

> +	select BR2_PACKAGE_PYTHON3

python3 needs threads, so it must be propagated as well.

> +	select BR2_PACKAGE_LIBSPDM

libspdm has architecture dependencies, so it should be propagated.

[--SNIP--]
> diff --git a/package/spdm-utils/spdm-utils.mk b/package/spdm-utils/spdm-utils.mk
> new file mode 100644
> index 0000000000..5129635b06
> --- /dev/null
> +++ b/package/spdm-utils/spdm-utils.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# spdm-utils
> +#
> +################################################################################
> +
> +SPDM_UTILS_VERSION = 0.3.0
> +SPDM_UTILS_SITE = $(call github,westerndigitalcorporation,spdm-utils,v$(SPDM_UTILS_VERSION))
> +SPDM_UTILS_LICENSE = Apache-2.0 or MIT
> +SPDM_UTILS_POST_PATCH_HOOKS += SPDM_UTILS_FETCH_CRATES
> +SPDM_UTILS_POST_INSTALL_TARGET_HOOKS += SPDM_UTILS_INSTALL_CERTS

Keep the _HOOKS assignments close to where the hooks are actually
defined.

Also, it looks more sensible (and usual) that the variables are ordered
in a logical(ish) way:

  - metadata: VERSION and SITE, LICENSE and LICENSE_FILES, CPE ID (if
    any)...

  - then the build info: DEPNDENCIES, CMDS and related HOOKS

> +SPDM_UTILS_DEPENDENCIES += pciutils libspdm openssl
> +
> +# We want to run the cargo-post-process script which is
> +# manually run in dl-wrapper after downloading the tarball.
> +# This will re-vendor in the crates, which needs to be done
> +# after we patch in our extra dependencies.

Why do we need to patch the depenencies? This should be explained in the
commit log.

Also, this means that it is no longer possible to do off-line builds,
which is something we try to avoid.

But in fact, this change adds no patch to the package at all, so we are
not modifying the dependencies, so we should not have to re-run the
vendoring...

Can you clarify that point?

> +define SPDM_UTILS_FETCH_CRATES
> +	cd $(SPDM_UTILS_SRCDIR) && \
> +	cargo vendor \
> +	    --manifest-path Cargo.toml \
> +		--locked VENDOR
> +endef

Note that, if you really, really need to re-vendor the package, you'd
need more than just calling cargo.

First, cargo may not be installed system-wide, so you'd have to be using
the one built by Buildroot, which means passing PATH=${BR_PATH), and to
be sure that it looks for crates in the proper location, i.e. passing
CARGO_HOME=$(BR_CARGO_HOME)

But again, it looks like this really is not necessary, since the package
is not patched.

> +define SPDM_UTILS_INSTALL_CERTS
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/root/certs
> +	cp -r $(@D)/certs/generate_certs.sh $(TARGET_DIR)/root/certs/
> +	cp -r $(@D)/certs/openssl.cnf $(TARGET_DIR)/root/certs/
> +	cp -r $(@D)/certs/setup_certs.sh $(TARGET_DIR)/root/certs/
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/root/certs/slot0
> +	cp $(@D)/certs/slot0/immutable.der $(TARGET_DIR)/root/certs/slot0
> +	cp $(@D)/certs/slot0/device.cert.der $(TARGET_DIR)/root/certs/slot0
> +	cp $(@D)/certs/slot0/device.der $(TARGET_DIR)/root/certs/slot0
> +	cp $(@D)/certs/slot0/device.key $(TARGET_DIR)/root/certs/slot0
> +	cp $(@D)/certs/slot0/param.pem $(TARGET_DIR)/root/certs/slot0
> +	cp $(@D)/certs/slot0/bundle_responder.certchain.der $(TARGET_DIR)/root/certs/slot0
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/root/manifest
> +	cp $(@D)/manifest/manifest.out.cbor $(TARGET_DIR)/root/manifest

Why are those installed in the home for the root user, rather than
installed system-wide?

Also, why would we need the generate_certs.sh and setup_certs.sh
scripts, if certificates are installed at build time?

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(cargo-package))
> -- 
> 2.44.0
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
