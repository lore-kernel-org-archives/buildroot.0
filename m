Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23523CE7A9C
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 20:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B21654028F;
	Thu,  5 Sep 2024 20:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UAK7NeuXJmex; Thu,  5 Sep 2024 20:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3986F40A27
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3986F40A27;
	Thu,  5 Sep 2024 20:41:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18E761BF41B
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05B2740113
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 20:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-03uu34Ep_F for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 20:41:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52602400EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52602400EE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52602400EE
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 20:41:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE043FF803;
 Thu,  5 Sep 2024 20:41:45 +0000 (UTC)
Date: Thu, 5 Sep 2024 22:41:45 +0200
To: Yu Chien Peter Lin via buildroot <buildroot@buildroot.org>
Message-ID: <20240905224145.562521e1@windsurf>
In-Reply-To: <20240904051609.2871616-2-peterlin@andestech.com>
References: <20240904051609.2871616-1-peterlin@andestech.com>
 <20240904051609.2871616-2-peterlin@andestech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725568906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zeLK4U6Xmv+qDbH+GERndDSSsdaaw9hcrn5GHlBOXu4=;
 b=ZZhdUx7E8Lc7wE+oQTgdvdiyNP8zSzTvRDGRuJB/kwPTHqJ/8Kguqbwqp/Ln3Rlw+ZAq3r
 P/84Fu3eDO8/UJVSFbCMVpIk85Ru+XTlQY/+hktt3Au0zm6zhkj7Lq2FT5ZzzT2jyaI/3S
 XvJ+E3Bg59IC7VVKAcyYow39HktwZWzFj6aadtzrAdo+Je2UFhIRvDC1Ht4yR6Y+1qFrF6
 APH7fzYHxoDGICYKha8V+6oeqBp2+F3JOrqyj8VRPJqJLyEPuOj5Y+P5ADJf3qeQxHQ9as
 rSF6wqIABZdzVChNDISaeNXofKRfmLdqn//id9RnJ8I8rE1Lba/YsT2aAZmudA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZZhdUx7E
Subject: Re: [Buildroot] [PATCH v2 1/4] package: andes-spi-burn: new package
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
Cc: tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>,
 ycliang@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Peter,

Thanks for this patch! See some comments below.

The commit title should be:

	package/andes-spi-burn: new package

On Wed, 4 Sep 2024 13:16:06 +0800
Yu Chien Peter Lin via buildroot <buildroot@buildroot.org> wrote:


> diff --git a/package/andes-spi-burn/Config.in.host b/package/andes-spi-burn/Config.in.host
> new file mode 100644
> index 0000000000..fed4f49f5d
> --- /dev/null
> +++ b/package/andes-spi-burn/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_ANDES_SPI_BURN
> +	bool "host andes-spi-burn"
> +	depends on BR2_riscv
> +	help
> +		Andes Technology SPI_burn tool to program bootloader and
> +		device-tree blob onto flash memory of AE350 platform.
> +
> +		https://github.com/andestech/Andes-Development-Kit

Indentation of the help text is one tab + 2 spaces. You can run "make
check-package" to get some coding style check.

> diff --git a/package/andes-spi-burn/andes-spi-burn.hash b/package/andes-spi-burn/andes-spi-burn.hash
> new file mode 100644
> index 0000000000..170f362646
> --- /dev/null
> +++ b/package/andes-spi-burn/andes-spi-burn.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  6632bc0ddd0b6d07bd328758cd9132f48429d144079eb8011af60d95b0bdfd6b  flash.zip

No license file?

> diff --git a/package/andes-spi-burn/andes-spi-burn.mk b/package/andes-spi-burn/andes-spi-burn.mk
> new file mode 100644
> index 0000000000..2f7387ca2f
> --- /dev/null
> +++ b/package/andes-spi-burn/andes-spi-burn.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# andes-spi-burn
> +#
> +################################################################################
> +
> +ANDES_SPI_BURN_VERSION = 5.3.0
> +ANDES_SPI_BURN_SOURCE = flash.zip

This will unfortunately not work, as the file name doesn't include a
version. So when you will update the package, there will already be a
flash.zip in $DL_DIR/andes-spi-burn/ and the new one will not be
re-downloaded. Therefore, you need to find a way to make sure that the
filename contains the version.

Alternatively, perhaps you could simply use a git clone instead, with
ANDES_SPI_BURN_SITE_METHOD = git.

Except I see your Git repo doesn't actually contain anything... This is
really not great.

> +ANDES_SPI_BURN_SITE = https://github.com/andestech/Andes-Development-Kit/releases/download/ast-v5_3_0-release-windows
> +ANDES_SPI_BURN_LICENSE = Apache-2.0

No license file?

> +
> +define HOST_ANDES_SPI_BURN_EXTRACT_CMDS
> +	$(UNZIP) -q $(HOST_ANDES_SPI_BURN_DL_DIR)/$(ANDES_SPI_BURN_SOURCE) -d $(@D)
> +endef
> +
> +define HOST_ANDES_SPI_BURN_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/flash/src-SPI_burn clean

No need to do the "clean" first. We never do it in Buildroot packages.

> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/flash/src-SPI_burn --makefile=Makefile_SPIburn_linux
> +endef
> +
> +define HOST_ANDES_SPI_BURN_INSTALL_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/flash/src-SPI_burn/SPI_burn $(HOST_DIR)/bin/SPI_burn
> +endef
> +
> +$(eval $(host-generic-package))

The rest seems OK to me!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
