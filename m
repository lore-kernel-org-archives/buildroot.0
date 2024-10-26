Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFD5D10C07
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74E1B605CF;
	Sat, 26 Oct 2024 20:53:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0_snCR-20GxW; Sat, 26 Oct 2024 20:53:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 678F8605D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 678F8605D1;
	Sat, 26 Oct 2024 20:53:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78AA05C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58F3540227
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DtPDaOeIBP5 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:53:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF5DD4021F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF5DD4021F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF5DD4021F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:53:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB06260003;
 Sat, 26 Oct 2024 20:52:58 +0000 (UTC)
Date: Sat, 26 Oct 2024 22:52:57 +0200
To: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20241026225257.37df6834@windsurf>
In-Reply-To: <20240926124131.930145-1-aleksandr.o.makarov@gmail.com>
References: <20240926124131.930145-1-aleksandr.o.makarov@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729975979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IsGDH9oPvE8835gcPEMkzaG6vo4FSC6zlKeGALI2IM=;
 b=fCed7TbgLh2V1oNpoxDpEpA5hv9DrXqcJJbQsav+cvpcC+y8ozEqdTsMZ+Dip1AhkCcnwx
 XTKVIo2MiEmWdsyvlnSvOK7lbQ6Ig0W1thXWTfOsKKtK/Vk0TVw3fpuhhBaf49+o32NIEc
 OyjDjFb2qy6Z20weZvRm6HHo/vvHjhNYRoudRgNWLAEYBNokdpf5Jnfd+f2RDJd1NNHJ1Y
 xtSDTaXRvAknk83MFE/p1xloBlsLDJGwH5Mt1PpIgvEzm8jXHlAU+fAlxpUXMq+pHquShk
 9f+0OF2AazmMui+bdOvxQSY2crkiIGhU5Bp5PkMe6Yub69U7qUSlr7he3jMjTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fCed7Tbg
Subject: Re: [Buildroot] [PATCH 1/1] package/cpp-httplib: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Aleksandr,

On Thu, 26 Sep 2024 15:41:31 +0300
Aleksandr Makarov <aleksandr.o.makarov@gmail.com> wrote:

> Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>

Thanks, I have applied your patch after doing a few tweaks.

> ---
>  package/Config.in                    |  1 +
>  package/cpp-httplib/Config.in        | 21 +++++++++++++
>  package/cpp-httplib/cpp-httplib.hash |  3 ++
>  package/cpp-httplib/cpp-httplib.mk   | 44 ++++++++++++++++++++++++++++
>  4 files changed, 69 insertions(+)

An entry in the DEVELOPERS should be added, so I did that.


> diff --git a/package/cpp-httplib/Config.in b/package/cpp-httplib/Config.in
> new file mode 100644
> index 0000000000..ee24adff81
> --- /dev/null
> +++ b/package/cpp-httplib/Config.in
> @@ -0,0 +1,21 @@
> +comment "cpp-httplib needs a toolchain w/ C++, wchar, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +config BR2_PACKAGE_CPP_HTTPLIB
> +	bool "cpp-httplib"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_WCHAR
> +	help
> +	  A C++ header-only HTTP/HTTPS server and client library.
> +
> +	  https://github.com/yhirose/cpp-httplib
> +
> +if BR2_PACKAGE_CPP_HTTPLIB
> +config BR2_PACKAGE_CPP_HTTPLIB_COMPILE
> +	bool "compile"

"compile" was a bit short, so I changed to:

+       bool "compile as a shared library"
> diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
> new file mode 100644
> index 0000000000..9b66114851
> --- /dev/null
> +++ b/package/cpp-httplib/cpp-httplib.mk
> @@ -0,0 +1,44 @@
> +################################################################################
> +#
> +# cpp-httplib
> +#
> +################################################################################
> +
> +CPP_HTTPLIB_VERSION = 0.18.0
> +CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
> +CPP_HTTPLIB_LICENSE = MIT
> +CPP_HTTPLIB_LICENSE_FILES = LICENSE
> +CPP_HTTPLIB_CONF_OPTS = \
> +	-Dcpp-httplib_test=false
> +
> +

One two many lines.

> +ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
> +CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_compile=true
> +CPP_HTTPLIB_DEPENDENCIES += host-python3
> +else
> +CPP_HTTPLIB_INSTALL_STAGING = YES

You tried to do the right thing, but this wasn't the correct thing. In
fact, what was needed is:

CPP_HTTPLIB_INSTALL_STAGING = YES

unconditionally.

And

CPP_HTTPLIB_INSTALL_TARGET = NO when BR2_PACKAGE_CPP_HTTPLIB_COMPILE is
disabled.

Indeed, when BR2_PACKAGE_CPP_HTTPLIB_COMPILE is disabled, it's a header
only library. The header is needed in staging but not in tgarget.

When BR2_PACKAGE_CPP_HTTPLIB_COMPILE is enabled, you have a shared
library, it's needed both in the target and staging.

> +$(eval $(meson-package))
> +

Final empty line not needed.

Once again: I fixed those issues when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
