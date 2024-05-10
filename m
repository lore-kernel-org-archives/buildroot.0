Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7984C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 11:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5ECDA4035D;
	Fri, 10 May 2024 11:44:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCv4bfDAz8k6; Fri, 10 May 2024 11:44:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 461A342A1E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 461A342A1E;
	Fri, 10 May 2024 11:44:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 708F41BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AE208187F
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5bP3MHkggpu for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 11:44:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B76A182060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B76A182060
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B76A182060
 for <buildroot@buildroot.org>; Fri, 10 May 2024 11:44:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E0CA1BF203;
 Fri, 10 May 2024 11:44:12 +0000 (UTC)
Date: Fri, 10 May 2024 13:44:11 +0200
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Message-ID: <20240510134411.27f5639b@windsurf>
In-Reply-To: <20240430045945.2164313-1-mika.westerberg@linux.intel.com>
References: <20240430045945.2164313-1-mika.westerberg@linux.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715341454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a7AHEG6NYp9bIXpqQX+PjAmwHdD84160hR+05t6gtzg=;
 b=Ueq5QzwkuA2qTXv/URWMlR2zV7Sl9HM9V7erGOikFeqZSMQotLG3nJQ1wG1eB++Gy2SN95
 hEv+D+WdocRkDio1zjWPCughZjPv3M1hesp0SYX+XH1yWgpA4ou1LZTj3U9yH3xX/Z6Pve
 oLKepzu9FtmgOLSqQgwWsVM1Zy8cc6t9dcL4HM1rMG2lpMRfEUYZYWZ8+2YVn4iLhBjzsy
 /XAREh4hoKIjCRSBHTkXoeVlJg1op1p5PKatHLWtPxro4qRPAgDLG7PYSl/cV7nV3iA7Qj
 QYPja7OpMDBA0RwVauiZCS6mXjjqjDSp6GHZ1mqTw01uyKbuREIpQm1TqTeWbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ueq5Qzwk
Subject: Re: [Buildroot] [PATCH v2] package/tbtools: new package
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
Cc: Aapo Vienamo <aapo.vienamo@linux.intel.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks for your patch. I fixed up a few things, wanted to apply... but
it fails to build for me. See below a number of comments, and details
about the build failure.

On Tue, 30 Apr 2024 07:59:44 +0300
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> This is a collection of tools for Linux Thunderbolt/USB4 development,
> debugging and validation.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> ---
> Changes from v1:
> 
> - Added dependency to udev (libudev) and 64-bit builds.
> - Added tag from Aapo.
> 
>  package/Config.in          |  1 +
>  package/tbtools/Config.in  | 11 +++++++++++
>  package/tbtools/tbtools.mk | 12 ++++++++++++
>  3 files changed, 24 insertions(+)

You need to add an entry to the DEVELOPERS file, like this:

+N:     Mika Westerberg <mika.westerberg@linux.intel.com>
+F:     package/tbtools/

(make sure to respect alphabetic ordering of developers)

> diff --git a/package/tbtools/Config.in b/package/tbtools/Config.in
> new file mode 100644
> index 000000000000..2627ea8bfcca
> --- /dev/null
> +++ b/package/tbtools/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_TBTOOLS
> +	bool "tbtools"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	depends on BR2_ARCH_IS_64

I think it was worth adding a comment about this:

+       # Fails to build on 32-bit systems

> +	select BR2_PACKAGE_HOST_RUSTC
> +	help
> +	  tbtools is a collection of tools for Linux Thunderbolt/USB4
> +	  development, debugging and validation.
> +
> +	  https://github.com/intel/tbtools

You need a Config.in comment:

+comment "tbtools needs udev /dev management"
+       depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+       depends on BR2_ARCH_IS_64
+       depends on !BR2_PACKAGE_HAS_UDEV


> diff --git a/package/tbtools/tbtools.mk b/package/tbtools/tbtools.mk
> new file mode 100644
> index 000000000000..61986ca8d311
> --- /dev/null
> +++ b/package/tbtools/tbtools.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# tbtools
> +#
> +################################################################################
> +
> +TBTOOLS_VERSION = v0.3.2
> +TBTOOLS_SITE = $(call github,intel,tbtools,$(TBTOOLS_VERSION))
> +TBTOOLS_LICENSE = MIT
> +TBTOOLS_LICENSE_FILES = LICENSE

You're missing:

+TBTOOLS_DEPENDENCIES = udev

without which udev is not built before tbtools. Without this, it fails
with a pkg-config detection issue.

But even with udev built before, I get a build failure:

  = note: /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-musl/12.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld: cannot find -ludev: No such file or directory
          collect2: error: ld returned 1 exit status

You can reproduce the following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_MUSL_STABLE=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_TBTOOLS=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you have a look and submit a v2 ?

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
