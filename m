Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D69CD5BB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55DD48148D;
	Thu,  5 Sep 2024 19:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdPjlvpI1Qat; Thu,  5 Sep 2024 19:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 346E4817B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 346E4817B5;
	Thu,  5 Sep 2024 19:23:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4621BF95A
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B47040114
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxqFOJdUdsmF for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB77640175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB77640175
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB77640175
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:23:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05D2120003;
 Thu,  5 Sep 2024 19:23:33 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:23:33 +0200
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Message-ID: <20240905212333.410c2f83@windsurf>
In-Reply-To: <20240905172607.1322733-2-guillaume.chaye@zeetim.com>
References: <20240905172607.1322733-1-guillaume.chaye@zeetim.com>
 <20240905172607.1322733-2-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725564214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wmp1K3auV/wi+w8FliGmRcWXMZJ6kL65f6vEolai4c=;
 b=OKZy3e9rA4q0NxGJoY5cYLdhEDB2Lnb1t0rd8OKDOaerrzQqFVoDz1hmKHvnF8cWAXsqN+
 33bhTCh0BJhSfn0a7Cxn7815axe/CZ0nmScNZ8hFWpQXoNrlESQjqPhKoeeNrlY/NlizE5
 qyuFeYJo91Bc96pw88ae3cRe2G5Vcpyrc3sULW7tvQcxABQ0Ly92iqgRWtf8AUsisYQ3+M
 kurU6HcFrkti5VeH2ka2MTcnQiS2q0fbwK5dHoihZd/JKbkX8X0RKFJ8S3sClLZprQTyF+
 RQbQDfNeV/86ssEQz6hSCfL2DWSlmvCx3y8iHbhEmx5dD4byOjg30oEoUYm8GQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OKZy3e9r
Subject: Re: [Buildroot] [PATCHv2 2/2] package/efitools: efitools is a set
 of utilities to manipulate efi variables
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
Cc: Christopher McCrory <chrismcc@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Guillaume,

On Thu,  5 Sep 2024 19:26:07 +0200
"Guillaume GC. Chaye" <guillaume.chaye@zeetim.com> wrote:

> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
> ---
>  package/efitools/Config.in   |  6 ++++++
>  package/efitools/efitools.mk | 24 ++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 package/efitools/Config.in
>  create mode 100644 package/efitools/efitools.mk

Thanks for this patch! I have a number of comments.

First of all, your patch does not really add the package completely,
because you forgot the change in package/Config.in, to include
package/efitools/Config.in.

Then, you also need to add an entry in the DEVELOPERS file for this new
package.

> 
> diff --git a/package/efitools/Config.in b/package/efitools/Config.in
> new file mode 100644
> index 0000000000..acc41cd49b
> --- /dev/null
> +++ b/package/efitools/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_EFITOOLS
> +	bool "efitools"
> +    select BR2_PACKAGE_GNU_EFI
> +    select BR2_PACKAGE_OPENSSL
> +    help

The indentation of those lines is incorrect. If you run "make
check-package", you will have a coding style check that will spot this
kind of issues.

Also, when you "select" an option, you need to replicate its
dependencies. In this case, you need to replicate:

	depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS

due to the fact that you select BR2_PACKAGE_GNU_EFI.

> +        A set of utilities to manipulate efi variables
> \ No newline at end of file

Please add a new line at the end of the file.

You also need to add the upstream URL of the project in the help text.
See the help texts of other packages for examples of this.

> diff --git a/package/efitools/efitools.mk b/package/efitools/efitools.mk
> new file mode 100644
> index 0000000000..5b249e81e4
> --- /dev/null
> +++ b/package/efitools/efitools.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# efitools
> +#
> +################################################################################
> +
> +EFITOOLS_VERSION = 1.9.2
> +EFITOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git/snapshot
> +EFITOOLS_SOURCE = efitools-$(EFITOOLS_VERSION).tar.gz

This EFITOOLS_SOURCE is not needed, as
efitools-$(EFITOOLS_VERSION).tar.gz is anyway its default value.

> +EFITOOLS_LICENSE = GPL-2.0+, LGPL-2.1+
> +EFITOOLS_DEPENDENCIES = openssl gnu-efi host-perl-file-slurp
> +
> +EFITOOLS_INCDIR=-I$(@D)/include/ -I$(STAGING_DIR)/usr/include/efi -I$(STAGING_DIR)/usr/include/efi/$(ARCH) -I$(STAGING_DIR)/usr/include/efi/protocol

Why is this needed?

> +EFITOOLS_LIB_INCDIR=-I$(TARGET_DIR)/usr/include

This is wrong, TARGET_DIR does not have header files, so pointing to
TARGET_DIR/usr/include for header files is always incorrect.

> +
> +define EFITOOLS_BUILD_CMDS
> +$(TARGET_MAKE_ENV) INCDIR="$(EFITOOLS_LIB_INCDIR)" $(MAKE) -C $(@D) INCDIR="$(EFITOOLS_INCDIR)"

Please indent with one tab.

But this will not cross-compile the code: you are not even telling to
use the cross-compiler. The canonical invocation is:

	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)

indeed $(TARGET_CONFIGURE_OPTS) defines CC, LD, AS, AR, CFLAGS,
LDFLAGS, and a whole bunch of other useful variables.

And then starting from that, depending on how the efitools Makefile is
written, additional tweaks may be needed.

> +endef
> +
> +define EFITOOLS_INSTALL_TARGET_CMDS
> +$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)

Indentation with one tab here.

> +endef
> +
> +$(eval $(generic-package))
> \ No newline at end of file

Please add the newline at end of the file.

Also, could you test this new package with ./utils/test-pkg ?

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
