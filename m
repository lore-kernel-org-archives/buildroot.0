Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47F2C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 434824199E;
	Fri, 12 Jul 2024 21:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuW3KwaD2J1P; Fri, 12 Jul 2024 21:54:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56DD8419A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56DD8419A0;
	Fri, 12 Jul 2024 21:54:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0636F1BF3C4
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00AF2400DA
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 21:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otdrxagdXJhL for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 21:54:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1661F400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1661F400AC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1661F400AC
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 21:54:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2D17E0004;
 Fri, 12 Jul 2024 21:54:49 +0000 (UTC)
Date: Fri, 12 Jul 2024 23:54:49 +0200
To: Wilfred Mallawa via buildroot <buildroot@buildroot.org>
Message-ID: <20240712235449.766c2931@windsurf>
In-Reply-To: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
References: <20240402035140.71770-2-wilfred.mallawa@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720821290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrMwW01nwy2123FW3XxJuOUW0WxCxhodwLsqtu9sD8s=;
 b=T37XRIqh+QQciev0JgUPyz8qqkSJTQ4kxKxQ3nvWCHjCezyLSr5U38egQb6+EVIKyeoS/C
 9VFCiXgvgVoS3bkugLI/Kz2zFCC2SKhGrk321rC5KKW1bji1OuQoFnJpNCVi7vz+NmchkU
 gHoLQoF2h/4/8N1R73CoVj+ZepPSESjT+x+Z38tsHsNKNOpqVXQtZvop2cINqSLZsgevee
 NBMvJwau90s7DGDCyAEPktkKVpflECHSOKHIfZ2TZUajF4Bvmvzsr2XFP0uST8NoxqSq5x
 9l0Y/OMaLtzAUGa9t4d3Hh6gKsoGFbZdiRbSV+NVzj/WCFZHUNTozlk4OPO96Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T37XRIqh
Subject: Re: [Buildroot] [PATCH v2 1/1] package/spdm-utils: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>, alistair.francis@wdc.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Wilfred,

I wanted to merge this package, but got some build issues. See below.

On Tue,  2 Apr 2024 13:51:41 +1000
Wilfred Mallawa via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> ---
> Changes in V2:                                                   
>         - Added required python3 dependencies
>         - Now depends on `udev` instead of selecting `eudev`
>         - Now depends on `libspdm`
>         - Hook define moved below the hook, stylistically similar to
>             other packages
>         - Removed cargo package re-vendoring as we aren't patching
>         - Changed certificate/manifest installation path to be system wide.
> 
>  package/Config.in                  |  1 +
>  package/spdm-utils/Config.in       | 24 ++++++++++++++++++++
>  package/spdm-utils/spdm-utils.hash |  2 ++
>  package/spdm-utils/spdm-utils.mk   | 36 ++++++++++++++++++++++++++++++
>  4 files changed, 63 insertions(+)
>  create mode 100644 package/spdm-utils/Config.in
>  create mode 100644 package/spdm-utils/spdm-utils.hash
>  create mode 100644 package/spdm-utils/spdm-utils.mk

In order to validate the dependencies, I went back to a simpler
package, like this:

config BR2_PACKAGE_SPDM_UTILS
	bool "spdm-utils"
	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HAS_UDEV
	select BR2_PACKAGE_HOST_RUSTC
	help
	  SPDM-Utils is a Linux application designed to support,
	  test and develop SPDM requesters and responders.
	  SPDM-Utils uses libspdm as the backend to perform SPDM
	  communication. SPDM-Utils currently supports the
	  PCIe Data Object Exchange (DOE) Capability.

	  https://github.com/westerndigitalcorporation/spdm-utils

comment "spdm-utils needs udev /dev management"
	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
        depends on !BR2_PACKAGE_HAS_UDEV

and in the .mk file, reduced the DEPENDENCIES variable to:

SPDM_UTILS_DEPENDENCIES = udev

And with this, I get:

  Unable to find libclang: "couldn't find any valid shared libraries matching: ['libclang.so', 'libclang-*.so', 'libclang.so.*', 'libclang-*.so.*'], set the `LIBCLANG_PATH` environment variable to a path where one of these files can be found (invalid: [])"

However, none of your dependencies where related to libclang, so I
believe something is probably missing in terms of dependencies in your
submission. Could you double check?

Also, see below some comments.


> diff --git a/package/spdm-utils/Config.in b/package/spdm-utils/Config.in
> new file mode 100644
> index 0000000000..b96365451f
> --- /dev/null
> +++ b/package/spdm-utils/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_SPDM_UTILS
> +	bool "spdm-utils"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
> +	depends on BR2_USE_WCHAR # eudev

Not needed, you simply need BR2_PACKAGE_HAS_UDEV.

> +	depends on !BR2_STATIC_LIBS

Please drop, you have this line duplicated below.

> +	depends on BR2_USE_MMU # eudev

We don't care about eudev dependencies, BR2_PACKAGE_HAS_UDEV is enough.
However, BR2_USE_MMU is needed for python3, so add # python3 at the end
of this line (if python3 is really needed, of course)

> +	depends on !BR2_STATIC_LIBS  # python3

> +	depends on BR2_USE_MMU  # eudev, python3
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_PACKAGE_LIBSPDM

Please select this library, but then you need:

	depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS

> +	select BR2_PACKAGE_HOST_RUSTC
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_PCIUTILS
> +	select BR2_PACKAGE_EUDEV

This select is not needed.

> +	select BR2_PACKAGE_PYTHON3
> +	help
> +	  SPDM-Utils is a Linux application designed to support,
> +	  test and develop SPDM requesters and responders.
> +	  SPDM-Utils uses libspdm as the backend to perform SPDM
> +	  communication. SPDM-Utils currently supports the
> +	  PCIe Data Object Exchange (DOE) Capability.
> +
> +	  https://github.com/westerndigitalcorporation/spdm-utils

Please add Config.in comments about the dependencies. So probably:

comment "spdm-utils needs a toolchain w/ threads, dynamic library"
	depends on BR2_USE_MMU
	depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

comment "spdm-utils needs udev /dev management"
	depends on BR2_USE_MMU
	depends on BR2_PACKAGE_LIBSPDM_ARCH_SUPPORTS
	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
        depends on !BR2_PACKAGE_HAS_UDEV


> diff --git a/package/spdm-utils/spdm-utils.hash b/package/spdm-utils/spdm-utils.hash
> new file mode 100644
> index 0000000000..aaa243315e
> --- /dev/null
> +++ b/package/spdm-utils/spdm-utils.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  3f06f087220b126262a2becf68c9e06a59d8d613816f82a168c81093de087d1a  spdm-utils-0.3.0.tar.gz

This needs to be fixed with recent changes in the Cargo infrastructure.
Do a build, you'll notice.

> diff --git a/package/spdm-utils/spdm-utils.mk b/package/spdm-utils/spdm-utils.mk
> new file mode 100644
> index 0000000000..4176f61871
> --- /dev/null
> +++ b/package/spdm-utils/spdm-utils.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# spdm-utils
> +#
> +################################################################################
> +
> +SPDM_UTILS_VERSION = 0.3.0
> +SPDM_UTILS_SITE = $(call github,westerndigitalcorporation,spdm-utils,v$(SPDM_UTILS_VERSION))
> +SPDM_UTILS_LICENSE = Apache-2.0 or MIT
> +SPDM_UTILS_DEPENDENCIES += pciutils libspdm openssl udev

Just =, not +=. What about python3? Not needed as a dependency?

> +
> +# Note that we also copy `setup_certs.sh` and `generate_certs.sh`.
> +# `setup_certs.sh` shall be used by a responder to regenerate it's mutable
> +# certificate chain. `generate_certs.sh` can be used to generate a new
> +# certificate chain, which maybe useful in testing and development.
> +define SPDM_UTILS_INSTALL_CERTS
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/spdm_certs
> +	cp -r $(@D)/certs/generate_certs.sh $(TARGET_DIR)/usr/local/spdm_certs
> +	cp -r $(@D)/certs/openssl.cnf $(TARGET_DIR)/usr/local/spdm_certs
> +	cp -r $(@D)/certs/setup_certs.sh $(TARGET_DIR)/usr/local/spdm_certs
> +
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/spdm_certs/slot0
> +	cp $(@D)/certs/slot0/immutable.der $(TARGET_DIR)/usr/local/spdm_certs/slot0
> +	cp $(@D)/certs/slot0/device.cert.der $(TARGET_DIR)/usr/local/spdm_certs/slot0
> +	cp $(@D)/certs/slot0/device.der $(TARGET_DIR)/usr/local/spdm_certs/slot0
> +	cp $(@D)/certs/slot0/device.key $(TARGET_DIR)/usr/local/spdm_certs/slot0
> +	cp $(@D)/certs/slot0/param.pem $(TARGET_DIR)/usr/local/spdm_certs/slot0
> +	cp $(@D)/certs/slot0/bundle_responder.certchain.der $(TARGET_DIR)/usr/local/spdm_certs/slot0

Meh, a bit verbose. Maybe:

SPDM_UTILS_CERT_SCRIPTS = \
	generate_certs.sh \
	setup_certs.sh

SPDM_UTILS_CERT_DATA_FILES = \
	openssl.cnf \
	slot0/immutable.der \
	slot0/device.cert.der \
	slot0/device.der \
	slot0/device.key \
	slot0/param.pem \
	slot0/bundle_responder.certchain.der

and then in SPDM_UTILS_INSTALL_CERTS:

	$(foreach f,$(SPDM_UTILS_CERT_DATA_FILES),
		$(INSTALL) -D -m 0644 $(f) $(TARGET_DIR)/usr/local/spdm_certs/$(f)
	)

	$(foreach f,$(SPDM_UTILS_CERT_SCRIPTS),
		$(INSTALL) -D -m 0755 $(f) $(TARGET_DIR)/usr/local/spdm_certs/$(f)
	)

Also, why do we install those files in /usr/local/ ?
/usr/local/spdm_certs and /usr/local/spdm_manifest seem like very
unconventional paths. I would rather expect those in
/usr/share/spdm/certs/ and /usr/share/spdm/manifest/ or something like
this.

Could you have a look at those different suggestions, and come back
with a v3 of your submission?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
