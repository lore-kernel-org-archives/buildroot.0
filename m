Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 323A5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:52:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D747A6108F
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D747A6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DDEC80C69;
	Sun, 31 Oct 2021 17:52:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a3NUd-zn6szH; Sun, 31 Oct 2021 17:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE99680C4E;
	Sun, 31 Oct 2021 17:52:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62CC81BF39F
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50FFA40210
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YU7_rqNpkaoi for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 17:52:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E02FC40190
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 17:52:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id E505820000B;
 Sun, 31 Oct 2021 17:52:37 +0000 (UTC)
Date: Sun, 31 Oct 2021 18:52:36 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "irgstg@gmail.com" <irgstg@gmail.com>
Message-ID: <20211031185236.25e4b639@windsurf>
In-Reply-To: <20211030083753.192-1-irgstg@gmail.com>
References: <20211030083753.192-1-irgstg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/glibc: optional MTE support in glibc
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Thanks a lot for your contribution! See below some comments.

On Sat, 30 Oct 2021 11:37:50 +0300
"irgstg@gmail.com" <irgstg@gmail.com> wrote:

> Adding option BR2_PACKAGE_GLIBC_MTE to configure glibc with MTE support.
> When enabled, glibcs configuration process runs with `--enable-memory-tagging` [1].
> 
> MTE (Memory Tagging Extension) is an ISA extension which aims to improve security on ARMv8.5-A [2].
> The linux kernel supports this feature via CONFIG_ARM64_MTE.
> In order for glibc's MTE support to work properly, the running kernel has to support that.

Could you wrap the lines of your commit log to 72 columns?

> dependencies:
>  - supported on aarch64 only (BR2_aarch64)
>  - requires binutils version 2.33.1 or newer (!B2_BINUTILS_VERSION_2_32_X)
>  - requires at least linux 5.4 headers (BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4)
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=blob;f=INSTALL;h=02dcf6b1ca3a4c43a17fdcae5e7dae8189c1c50b;hb=HEAD#l145
> [2] https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/posts/enhancing-memory-safety
> 
> Signed-off-by: irgstg@gmail.com <irgstg@gmail.com>

Could you resend with a real name ? We cannot accept anonymous
contributions.

> +config BR2_PACKAGE_GLIBC_MTE
> +	bool "Install glibc support for MTE"

Repeating that it's glibc related is not necessary, and making "MTE"
explicit seems useful. So perhaps:

	bool "enable Memory Tagging Extension (MTE) support"

> +	depends on BR2_aarch64
> +	depends on !BR2_BINUTILS_VERSION_2_32_X
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
> +	help
> +	  Enabling this option will configure, compile
> +	  and install glibc support for MTE (Memory Tagging Extension).
> +	  Please be aware, in order for that to work properly,
> +	  kernel support for MTE (CONFIG_ARM64_MTE), and a
> +	  supported CPU are needed.

Instead of just saying so, you could do this in glibc.mk:

ifeq ($(BR2_PACKAGE_GLIBC_MTE),y)
GLIBC_CONF_OPTS += --enable-memory-tagging
define GLIBC_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_ARM64_MTE)
endef
endif

Of course, you need to add $(GLIBC_CONF_OPTS) inside
GLIBC_CONFIGURE_CMDS.

Other than that, it looks good to me.

Do we need special compiler options to make use of MTE ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
