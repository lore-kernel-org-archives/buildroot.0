Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83ECCEFD05
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9838260719;
	Tue,  6 Jan 2026 20:44:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuSaeJg05o2G; Tue,  6 Jan 2026 20:44:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 914C36073D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767732245;
	bh=/gLmT7g+RnmJPI1akffAFk6X+tvHmSyCGscQlxlyXTY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S15hcuUwTauw1kaAiwOEkBQFS21Qnfn5k5CvZW151zxL7D0U4An4Q2ErRLAUfu2bZ
	 xbUNHUEsdvzIReCNOYXAVxxU9aw/lnu5shcC4smhog5PyPExODVYF22fFMHQB37zfY
	 aGaqRfivNpMUjoAd7sjUbzGt3mkGtTOh446KF5hzDsINQJG5/gI6vzCQeUVhczaCGu
	 SRTe7zSnRoVu0N3PNVUvEu4EI/v5bQh3BkYi+UxEyLEcrp79/gcNh/sMwlpIpsF20C
	 AZEnpQo8t0t2ywaq5BwI8zD7ma9r/ZUSNZB7b2Y3FGohV6PbQ4i1TrntCPjpOfvx/X
	 QpoSRB6V/t8Bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 914C36073D;
	Tue,  6 Jan 2026 20:44:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 190702A3
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDE02403C9
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:44:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoIJ4huz-6Hw for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DEF8D40223
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEF8D40223
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEF8D40223
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:44:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AA4971A26AE
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:43:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 76BE960739;
 Tue,  6 Jan 2026 20:43:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7C563103C85F6; Tue,  6 Jan 2026 21:43:58 +0100 (CET)
Date: Tue, 6 Jan 2026 21:43:57 +0100
To: Michael Cullen <michael@michaelcullen.name>
Cc: buildroot@buildroot.org
Message-ID: <20260106214357.456c12bd@windsurf>
In-Reply-To: <20260106185726.654877-1-michael@michaelcullen.name>
References: <20260106185726.654877-1-michael@michaelcullen.name>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767732239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XiN6FnNMhFAIB1jW0C6xjpwnya5B1TbSLVNaNkEQih4=;
 b=d4ypml9BsLZwL0w8ZvVWhAxICEgE4snb4+/GsZmJKCnsBv9xmZoVP7DbAtGP8PPsPRYe88
 jykwP9naqrzj0b/yM6UD1RqkrAkFIcMNWF1ypAl0O56TPzyoi0dTukDqjH1ZhEA7eQz+6/
 BFGPS2t7mqIhBLZ5nHmAIV9Iz/n5PTqc1+H3galbxDn3Yq8fplf1tnj5OrS2UV1mxOiWUo
 1lJWKgXH6qoJLQenZuJEugRTUQIQaWQuBjVEL6O4q5hGIW31Xv8+M/316o2Rso+RMySqwa
 dUvQioHv2CVcq+lJfAoA8x0kp0CC8K3A866JtKtEqFZKdAQHf7AegZsjdO0Ptw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=d4ypml9B
Subject: Re: [Buildroot] [PATCH] package/zimg: add zimg package
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

Hello Michael,

On Tue,  6 Jan 2026 19:57:26 +0100
Michael Cullen <michael@michaelcullen.name> wrote:

> This commit adds an image transformation library called zimg.
> 
> There are a number of patches applied. One is from upstream and supports
> building on GCC-15, the others are autotools patches to allow installing
> various components useful for verifying the library is working on the
> target, which are not usually installed by the upstream project.
> 
> Note that while this version of zimg claims to support C++11 upwards,
> upstream is moving towards only supporting C++17 upwards in the master
> branch.
> 
> This has been tested on a Raspberry Pi 4 and a Raspberry Pi 5, and on
> x86_64 (run in a chroot).
> 
> Signed-off-by: Michael Cullen <michael@michaelcullen.name>

Thanks for this patch! It overall looks good, and I only have a few
comments see below.


> diff --git a/package/zimg/0002-Install-test-app.patch b/package/zimg/0002-Install-test-app.patch
> new file mode 100644
> index 0000000000..cbafd0bd51
> --- /dev/null
> +++ b/package/zimg/0002-Install-test-app.patch
> @@ -0,0 +1,55 @@
> +From d4da533bec77c7f11aef08bed4888a82e1af8cba Mon Sep 17 00:00:00 2001
> +From: Michael Cullen <michael@michaelcullen.name>
> +Date: Tue, 6 Jan 2026 10:35:15 +0100
> +Subject: [PATCH] Install test app
> +
> +To make sure zimg is working, it would be useful to be able to run the
> +test app on the target. Currently, however, it is not installed.
> +
> +This patch renames it and installs it.
> +
> +Upstream: N/A - running test app on the target only applies to cross-compilation situations

For this one, and the other 2 patches that you marked as not
upstreamable, could you take the same approach as your patch
0004-Add-option-to-install-tests.patch, which is to add a ./configure
option to enable/disable installation of the test application, of the
examples. And then it makes that upstreamable. You keep the default as
disabled, so nothing changes, but you allow people like you/Buildroot
who need those features to actually enable them. There's nothing "not
upstreamable" in those changes IMO, and it would anyway not be nice to
integrate a brand new package in Buildroot that has so many
non-upstream patches.

> diff --git a/package/zimg/Config.in b/package/zimg/Config.in
> new file mode 100644
> index 0000000000..3fbac545dc
> --- /dev/null
> +++ b/package/zimg/Config.in
> @@ -0,0 +1,27 @@
> +config BR2_PACKAGE_ZIMG
> +	bool "zimg"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
> +	help
> +	  Scaling, colorspace conversion, and dithering library
> +
> +	  https://github.com/sekrit-twc/zimg
> +
> +if BR2_PACKAGE_ZIMG
> +
> +config BR2_PACKAGE_ZIMG_TESTAPP
> +	bool "zimg test app"
> +
> +config BR2_PACKAGE_ZIMG_EXAMPLES
> +	bool "zimg examples"
> +
> +config BR2_PACKAGE_ZIMG_UNIT_TESTS
> +	bool "zimg unit tests"
> +
> +config BR2_PACKAGE_ZIMG_DISABLE_SIMD
> +	bool "Disable SIMD in zimg"
> +
> +endif
> +
> +comment "zimg needs a toolchain w/ C++11 support"

This should be:

comment "zime needs a toolchain w/ C++, gcc >= 4.9"

> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> diff --git a/package/zimg/zimg.mk b/package/zimg/zimg.mk
> new file mode 100644
> index 0000000000..0dc314c765
> --- /dev/null
> +++ b/package/zimg/zimg.mk
> @@ -0,0 +1,33 @@
> +################################################################################
> +#
> +# zimg
> +#
> +################################################################################
> +
> +ZIMG_VERSION = release-3.0.6
> +# This project uses submodules so the tarballs aren't really useful
> +ZIMG_SITE_METHOD = git
> +ZIMG_GIT_SUBMODULES = yes
> +ZIMG_SITE = https://github.com/sekrit-twc/zimg.git
> +ZIMG_LICENSE = WTFPL
> +ZIMG_LICENSE_FILES = COPYING
> +ZIMG_INSTALL_STAGING = YES
> +ZIMG_AUTORECONF = YES
> +
> +ifeq ($(BR2_PACKAGE_ZIMG_TESTAPP),y)
> +ZIMG_CONF_OPTS += --enable-testapp
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZIMG_EXAMPLES),y)
> +ZIMG_CONF_OPTS += --enable-example
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZIMG_UNIT_TESTS),y)
> +ZIMG_CONF_OPTS += --enable-unit-test --enable-install-tests
> +endif

Please add explicit disable in "else" clauses:

ifeq (...)
FOO_CONF_OPTS += --enable-bar
else
FOO_CONF_OPTS += --disable-bar
endif

> +
> +ifeq ($(BR2_PACKAGE_ZIMG_DISABLE_SIMD),y)

Meh, can we instead rely on existing architecture options, like MMX,
SSE, AVX, NEON, etc. to decide whether to enable SIMD or not?

> +ZIMG_CONF_OPTS += --disable-simd
> +endif
> +
> +$(eval $(autotools-package))

Aside from those comments, looks good. Could you rework a bit, and
submit a v2?

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
