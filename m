Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A115CD0D178
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 22:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73959813F6;
	Wed,  7 Jan 2026 22:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pe0Gu6laOC75; Wed,  7 Jan 2026 22:45:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 706A581EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767825913;
	bh=g2lR78AKEF1L6DneeP6ZCqzLSN/InWalRMeq6kAR3uw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BGlPYj6Zreh/o34rP9gzyxfUrdTh8VNI3KBtNpb92vkclQtfY+iD4ACs+QR1Q2ONn
	 csIT1osAQlJPlwNUPfLUONEulF/cI0g0FOaFTvXNqn7D8X3lND6fvZQ/7Myp2aRiBd
	 XljtHiAL21IGYwaZBKAgTIuB+wBvItF534GTxVX6zmQI0fTzU7J6rLsdyH+4tbLmo1
	 Gh0ZMnqXi16Gg0Q4Fv4Nr9FHiLsHLE4OQu9M67h58sTh0T3MHujRJjNrJO8R9zj8DE
	 99VBRwbaqUkhMlEiUWemWLlS6N0BYYOA3QApa76cJkXFpLJVuEbDGYAqzCONZnA2Vz
	 cL9nChr5CT1WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 706A581EBB;
	Wed,  7 Jan 2026 22:45:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48E719ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A2054029F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Q5Y-wdTdT38 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 22:45:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99AAF4023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99AAF4023C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99AAF4023C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:45:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4C12B1A26D1;
 Wed,  7 Jan 2026 22:45:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21754606F8;
 Wed,  7 Jan 2026 22:45:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F193103C867C; Wed,  7 Jan 2026 23:45:07 +0100 (CET)
Date: Wed, 7 Jan 2026 23:45:05 +0100
To: Vincent Jardin via buildroot <buildroot@buildroot.org>
Cc: Vincent Jardin <vjardin@free.fr>
Message-ID: <20260107234505.0810d964@windsurf>
In-Reply-To: <20260107175446.2470125-3-vjardin@free.fr>
References: <20260107175446.2470125-1-vjardin@free.fr>
 <20260107175446.2470125-3-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767825907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/6F4mUt1POW/so1R21vqhtdzy+g4vLZkczkJjHSnaas=;
 b=zRlV0Wu7twzU0dcyy4Qdnj/gJocmSNPFYsEyVbJgrLKmyWovVIg1YA3lcy0o4zcpScbpkT
 SyuvSffWcgU9zmKF/6BltPxnQcfNGvgY1vWzGeJiQriyAkzmt00bDHTC1J6SLf673NOsFR
 HzUij5F1cPWInWTo9X1CZpu42rkN+oXE91RxiojfbnkDE71b6s2ZpYKaj8akx20Xxr3ecl
 15zPtfGXhO3McNI2M8IofFLN9jaXSSUZvqDUmTz2que4ZB+PRh2H/CMDxxD7P13rkuCr7U
 xd8CSs1Tb6sUMNXUu221nKcK6o+YdsdZrWo+31m74gnIwCwewfUBlsuMhP8FZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=zRlV0Wu7
Subject: Re: [Buildroot] [PATCH v1 2/2] package/python-sysrepo: new package
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

Hello Vincent,

Thanks for the patch.

On Wed,  7 Jan 2026 18:54:46 +0100
Vincent Jardin via buildroot <buildroot@buildroot.org> wrote:

> Python CFFI bindings for the sysrepo YANG datastore. This package
> provides the 'sysrepo' Python module which talks to the C sysrepo
> library.
> 
> Also fix sysrepo build on riscv32 where glibc doesn't define
> SYS_futex (only SYS_futex_time64). Use pthread-based condition
> variables instead of futex on this architecture.


> 
> Upstream: https://github.com/sysrepo/sysrepo/issues/3346
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  package/python-sysrepo/Config.in           | 26 ++++++++++++++++++++++
>  package/python-sysrepo/python-sysrepo.hash |  5 +++++
>  package/python-sysrepo/python-sysrepo.mk   | 18 +++++++++++++++
>  package/sysrepo/sysrepo.mk                 |  7 ++++++
>  4 files changed, 56 insertions(+)

Missing changes in DEVELOPERS and package/Config.in (because they are
mistakenly in PATCH 1/2).

> diff --git a/package/python-sysrepo/Config.in b/package/python-sysrepo/Config.in
> new file mode 100644
> index 0000000000..ce6b8611f2
> --- /dev/null
> +++ b/package/python-sysrepo/Config.in
> @@ -0,0 +1,26 @@
> +config BR2_PACKAGE_PYTHON_SYSREPO
> +	bool "python-sysrepo"
> +	depends on BR2_PACKAGE_PYTHON3

Not needed.

> +	depends on BR2_PACKAGE_SYSREPO

Should be a "select" + replication of sysrepo "depends on".

> +	# Python3 doesn't work with uClibc and kernel headers < 5.1
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1

Not needed.

> +	select BR2_PACKAGE_PYTHON_LIBYANG

select BR2_PACKAGE_PYTHON_LIBYANG # runtime

> +	help
> +	  Python CFFI bindings for the sysrepo YANG datastore.
> +
> +	  This package provides the 'sysrepo' Python module which
> +	  talks to the C sysrepo library packaged as
> +	  BR2_PACKAGE_SYSREPO.
> +
> +	  Upstream project name on PyPI is 'sysrepo'.
> +
> +	  https://github.com/sysrepo/sysrepo-python
> +
> +comment "python-sysrepo needs python3, uClibc needs kernel headers >= 5.1"
> +	depends on !BR2_PACKAGE_PYTHON3 || \
> +		(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1)

To be updated based on the actual dependencies.

> +comment "python-sysrepo needs sysrepo"
> +	depends on BR2_PACKAGE_PYTHON3
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
> +	depends on !BR2_PACKAGE_SYSREPO

Not needed.

> diff --git a/package/python-sysrepo/python-sysrepo.mk b/package/python-sysrepo/python-sysrepo.mk
> new file mode 100644
> index 0000000000..5e9e97df25
> --- /dev/null
> +++ b/package/python-sysrepo/python-sysrepo.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# python-sysrepo
> +#
> +################################################################################
> +
> +PYTHON_SYSREPO_VERSION = 1.7.6
> +PYTHON_SYSREPO_SOURCE = sysrepo-$(PYTHON_SYSREPO_VERSION).tar.gz
> +PYTHON_SYSREPO_SITE = https://files.pythonhosted.org/packages/source/s/sysrepo
> +PYTHON_SYSREPO_SETUP_TYPE = setuptools
> +
> +PYTHON_SYSREPO_LICENSE = BSD-3-Clause
> +PYTHON_SYSREPO_LICENSE_FILES = LICENSE
> +
> +PYTHON_SYSREPO_DEPENDENCIES = sysrepo
> +PYTHON_SYSREPO_DEPENDENCIES += python-libyang

Are you sure python-libyang is a build-time dependency, or is it only a
runtime dependency?

Also, with Python packages, it's always good to have a minimal test
case in support/testing/.

> diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
> index 59dc59a5df..329c0ee7c6 100644
> --- a/package/sysrepo/sysrepo.mk
> +++ b/package/sysrepo/sysrepo.mk
> @@ -26,6 +26,13 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  SYSREPO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
>  endif
>  
> +# riscv32 glibc doesn't define SYS_futex (only SYS_futex_time64)
> +# Use pthread-based condition variables instead of futex
> +# https://github.com/sysrepo/sysrepo/issues/3346
> +ifeq ($(BR2_RISCV_32),y)
> +SYSREPO_CONF_OPTS += -DSR_COND_IMPL=sr_cond_pthread
> +endif

This is unrelated and should really be in its own patch. I guess it fixes:

  https://autobuild.buildroot.net/results/b0f/b0f30feeddad1a8d51ac87af8b7c56fd9a9b5ff6/build-end.log

Correct?

If yes, then you should indicate in the patch that it fixes a build
issue, have the link to the autobuilder failure, and indicate when the
issue was introduced, so that we can understand if the fix should be
backported to our 2025.02 LTS branch.

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
