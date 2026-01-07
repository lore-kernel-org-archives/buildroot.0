Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18A0D0D178
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 22:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B42FF821DA;
	Wed,  7 Jan 2026 22:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YlAmbB47PH3W; Wed,  7 Jan 2026 22:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1785821E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767826049;
	bh=0RRH+VwCR5B2xGXL+a5/4geYVvBxITnIONg0IMPW1ZU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=equv08WKszKX2mzV4ZA/XTVMS4QGyFaImKt8ViwatE88PiQfcPyUhG9yWM+Xc1VuL
	 TJU0FUesJ8sQFrD6QG0Eaihx1erUWIaUxTkD/Xk8Yoaw02xQGxi3xVbgz3dWnaX+VT
	 3lkpT2a9iMW8Qng7KkojLVA15eLn6Ez5K4rGElbP0jkz3W96iS7T68x5iKYXh3uLVd
	 57nGiVrZWhPttDgoBLxo5emRCk70Ajj2TOnpEBx1BsIrOi0Tvh/J/YV/ajqClyhnbY
	 njkJKhD2SnE78AtzpubC06jvH9e9zIhOMukk8ccONtR2p7WliO5DFnL66i0c/AaBnj
	 NADwomh6JGSiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1785821E6;
	Wed,  7 Jan 2026 22:47:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 989C09ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C46A821DA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PldXeCVKIAMn for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 22:47:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D046821DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D046821DB
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D046821DB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:47:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 99A321A26E3
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 22:47:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67C2E606F8;
 Wed,  7 Jan 2026 22:47:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ADE52103C867C; Wed,  7 Jan 2026 23:47:24 +0100 (CET)
Date: Wed, 7 Jan 2026 23:47:23 +0100
To: Vincent Jardin via buildroot <buildroot@buildroot.org>
Cc: Vincent Jardin <vjardin@free.fr>
Message-ID: <20260107234723.330fc373@windsurf>
In-Reply-To: <20260107180108.2470425-2-vjardin@free.fr>
References: <20260107180108.2470425-1-vjardin@free.fr>
 <20260107180108.2470425-2-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767826045; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Xgmh0g61rrl+QBP86Aectyt6YNCcSo+IvToqNTtoNV0=;
 b=uvsyovLuEUUv0S1dIk0KqLqxcfzZqzM2yhCnYys6VGY6G5UnTAf+SXW4JCq3hl5Xo0/7yu
 Qvei6xcEZaBHKp+ORSNVpIonSMeLyluG8sjnS0jJrn/PI2ksMaGz21W4Rh6naO8xjFIkYr
 X9LPsRCKMxmu8qdb+EADRkYM/QRMeU3H11s8uENuEpLu9Lq4cPZIgQrjv03KvorFV50m4o
 lGhIHBGKz1I9cDq4tHWDmMmmN+1JVc/yJQ9XJxCDndnFnIaPi8vdZGLEAoBg/faE1V8yL9
 050SdgCdQXYpMzDjMS1FTlPZMVeS5LF6GtcCwv3BG+rbv9x5TC43xl+xnXXdaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=uvsyovLu
Subject: Re: [Buildroot] [PATCH v1 1/1] package/python-ncclient: new package
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

On Wed,  7 Jan 2026 19:01:08 +0100
Vincent Jardin via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/python-ncclient/Config.in b/package/python-ncclient/Config.in
> new file mode 100644
> index 0000000000..2be69efb2b
> --- /dev/null
> +++ b/package/python-ncclient/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_PYTHON_NCCLIENT
> +	bool "python-ncclient"
> +	depends on BR2_PACKAGE_PYTHON3

Not needed.

> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-paramiko
> +	select BR2_PACKAGE_PYTHON_LXML
> +	select BR2_PACKAGE_PYTHON_PARAMIKO
> +	select BR2_PACKAGE_PYTHON_SIX
> +	help
> +	  ncclient is a Python library for NETCONF clients. It
> +	  facilitates client-side scripting and application
> +	  development around NETCONF.
> +
> +	  https://github.com/ncclient/ncclient
> +
> +comment "python-ncclient needs python3 and host Rust (for paramiko)"
> +	depends on !BR2_PACKAGE_PYTHON3 || !BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS

Not needed. BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS is an
architecture dependency, so we don't write a comment about it, since
there's nothing the user can do about it.

> diff --git a/package/python-ncclient/python-ncclient.mk b/package/python-ncclient/python-ncclient.mk
> new file mode 100644
> index 0000000000..ca1b23e441
> --- /dev/null
> +++ b/package/python-ncclient/python-ncclient.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# python-ncclient
> +#
> +################################################################################
> +
> +PYTHON_NCCLIENT_VERSION = 0.7.0
> +PYTHON_NCCLIENT_SOURCE = ncclient-$(PYTHON_NCCLIENT_VERSION).tar.gz
> +PYTHON_NCCLIENT_SITE = https://files.pythonhosted.org/packages/source/n/ncclient
> +
> +PYTHON_NCCLIENT_LICENSE = Apache-2.0
> +PYTHON_NCCLIENT_LICENSE_FILES = LICENSE
> +
> +PYTHON_NCCLIENT_SETUP_TYPE = setuptools
> +
> +PYTHON_NCCLIENT_DEPENDENCIES = \
> +	python-lxml \
> +	python-paramiko \
> +	python-six

Are you sure these are build-time dependencies? Most of the time Python
modules are only run-time dependencies.

And as asked for some other patches, a test case in support/testing/
would be nice.

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
