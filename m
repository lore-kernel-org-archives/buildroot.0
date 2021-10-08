Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED047C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 21:17:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E64A60F51
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 21:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E64A60F51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E0840669;
	Fri,  8 Oct 2021 21:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-DAq1bm892l; Fri,  8 Oct 2021 21:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 547BB40689;
	Fri,  8 Oct 2021 21:17:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 235531BF2F6
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 21:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E03F608A2
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 21:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-jPUoXogA_v for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 21:17:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF51160777
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 21:17:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 54D6F240003;
 Fri,  8 Oct 2021 21:16:58 +0000 (UTC)
Date: Fri, 8 Oct 2021 23:16:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20211008231657.43d2f9aa@windsurf>
In-Reply-To: <20211008204342.370220-3-aduskett@gmail.com>
References: <20211008204342.370220-1-aduskett@gmail.com>
 <20211008204342.370220-3-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/2] package/nodejs: bump version to
 14.17.6
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri,  8 Oct 2021 13:43:42 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> Changes include:
>   - Remove the dependency on Python2, as nodejs 14 supports Python 3.
>   - Remove --without-snapshot as it's no longer a supported config option.
>   - Remove /openssl to the shared-openssl-includes config option, as the build
>     system automatically appends /openssl to the includes path.
> 
>   - Add a qemu wrapper. V8's JIT infrastructure requires binaries such as
>     mksnapshot and mkpeephole to be run in the host during the build.
>     However, these binaries must have the same bit-width as the target
>     (e.g. a x86_64 host targeting ARMv6 needs to produce a 32-bit binary).
>     To work around this issue, cross-compile the binaries for the target and
>     run them on the host with QEMU, much like gobject-introspection.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  .../0001-add-qemu-wrapper-support.patch       | 76 ++++++++++++++++++
>  package/nodejs/Config.in                      | 15 +++-
>  package/nodejs/nodejs.hash                    |  6 +-
>  package/nodejs/nodejs.mk                      | 78 +++++++++++--------
>  package/nodejs/v8-qemu-wrapper.in             | 12 +++
>  5 files changed, 146 insertions(+), 41 deletions(-)
>  create mode 100644 package/nodejs/0001-add-qemu-wrapper-support.patch
>  create mode 100644 package/nodejs/v8-qemu-wrapper.in
> 
> diff --git a/package/nodejs/0001-add-qemu-wrapper-support.patch b/package/nodejs/0001-add-qemu-wrapper-support.patch
> new file mode 100644
> index 0000000000..9b81e3adab
> --- /dev/null
> +++ b/package/nodejs/0001-add-qemu-wrapper-support.patch
> @@ -0,0 +1,76 @@
> +From fa09fa3ad6a21ae0b35fb860f76d1762e5f29972 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Mon, 27 Sep 2021 12:55:09 -0700
> +Subject: [PATCH] 1

This is perhaps a bit weak as a commit title and commit description :-)


> +# V8's JIT infrastructure requires binaries such as mksnapshot and
> +# mkpeephole to be run in the host during the build. However, these
> +# binaries must have the same bit-width as the target (e.g. a x86_64
> +# host targeting ARMv6 needs to produce a 32-bit binary). To work around this
> +# issue, cross-compile the binaries for the target and run them on the
> +# host with QEMU, much like gobject-introspection.
> +define NODEJS_INSTALL_V8_QEMU_WRAPPER
> +	$(INSTALL) -D -m 755 $(NODEJS_PKGDIR)/v8-qemu-wrapper.in \
> +		$(@D)/out/Release/v8-qemu-wrapper
> +	$(SED) "s%@QEMU_USER@%$(QEMU_USER)%g" \
> +		$(@D)/out/Release/v8-qemu-wrapper
> +	$(SED) "s%@TOOLCHAIN_HEADERS_VERSION@%$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)%g" \
> +		$(@D)/out/Release/v8-qemu-wrapper
> +	$(SED) "s%@QEMU_USERMODE_ARGS@%$(call qstrip,$(BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS))%g" \
> +		$(@D)/out/Release/v8-qemu-wrapper
> +endef
> +NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_INSTALL_V8_QEMU_WRAPPER
>  
> +define NODEJS_WRAPPER_FIXUP
> +	$(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/node.gyp
> +	$(SED) "s%@MAYBE_WRAPPER@%'<(PRODUCT_DIR)/v8-qemu-wrapper',%g" $(@D)/tools/v8_gypfiles/v8.gyp
> +endef
> +NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_WRAPPER_FIXUP
>
> +# Do not run the qemu-wrapper for the host build.
> +define HOST_NODEJS_WRAPPER_FIXUP
> +	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/node.gyp
> +	$(SED) "s%@MAYBE_WRAPPER@%%g" $(@D)/tools/v8_gypfiles/v8.gyp
> +endef
> +HOST_NODEJS_PRE_CONFIGURE_HOOKS += HOST_NODEJS_WRAPPER_FIXUP

Would have been great for MAYBE_WRAPPER to be a ./configure option :-)
But fair enough.

Overall, except the commit title/log of the patch, I don't see much
problem with this patch.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
