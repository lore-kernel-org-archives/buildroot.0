Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E26D767FA
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 19:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0865D60B48;
	Thu, 31 Oct 2024 19:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0V7Z0iCOE2I; Thu, 31 Oct 2024 19:56:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECC5D60B52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECC5D60B52;
	Thu, 31 Oct 2024 19:56:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AB695E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2821B400D7
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5Dl8Lg0zbIp for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 19:56:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F3C740ED4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F3C740ED4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F3C740ED4
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 19:56:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 851FD20004;
 Thu, 31 Oct 2024 19:56:22 +0000 (UTC)
Date: Thu, 31 Oct 2024 20:56:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>, Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20241031205621.064eceae@windsurf>
In-Reply-To: <20240921185558.3647651-2-bernd@kuhls.net>
References: <20240921185558.3647651-1-bernd@kuhls.net>
 <20240921185558.3647651-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730404582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5IEX+7dTc3PsckDN1C7XM18nx0xNRtvVf/PXDc/m0U=;
 b=BC+97KfjopVEzBvA4wnDoGkwuXZyjtp24UnmDTgaUJtkD4L03d0Fsb82bHJn61Gkq7lrzR
 9aB1Z5EyJUN8qkb15fiNaF8zEkqprlPGNTtc5d9aCfMYWm5li5NKRc4/Bfdy88iD+mh+dZ
 09oNAhCz7Z3z15oe03LPGaqurIJR3EtGNbWF/TQpBAKlQJc+5NxXWkRX7UlrLrXNWxkPfJ
 CRMYE4DRgYz2iJzPJruWKlPImTjazpIhzoA7RjCIREAVJ7GjuTbbKHAHo1GAm929j/TIY9
 OYoHq3NUd8B74EkapPL8D7MeOaCw3FBi9NySfwayPV+dqnrUDZefXzAfGfZbyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BC+97Kfj
Subject: Re: [Buildroot] [PATCH 2/2] package/python-emailproxy: new package
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

Hello Bernd,

Thanks for this patch.

James: could you help reviewing this patch? In particular, I find it
odd that it needs host-python-cryptography host-python-pyasyncore as
build dependencies. Could you provide some guidance on this?

Thanks a lot,

Thomas

On Sat, 21 Sep 2024 20:55:58 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  DEVELOPERS                                       |  1 +
>  package/Config.in                                |  1 +
>  package/python-emailproxy/Config.in              | 14 ++++++++++++++
>  package/python-emailproxy/python-emailproxy.hash |  5 +++++
>  package/python-emailproxy/python-emailproxy.mk   | 15 +++++++++++++++
>  5 files changed, 36 insertions(+)
>  create mode 100644 package/python-emailproxy/Config.in
>  create mode 100644 package/python-emailproxy/python-emailproxy.hash
>  create mode 100644 package/python-emailproxy/python-emailproxy.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c9443558c1..b89b32ea51 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -496,6 +496,7 @@ F:	package/privoxy/
>  F:	package/pure-ftpd/
>  F:	package/python-couchdb/
>  F:	package/python-cssutils/
> +F:	package/python-emailproxy/
>  F:	package/python-glslang/
>  F:	package/python-mako/
>  F:	package/python-mwclient/
> diff --git a/package/Config.in b/package/Config.in
> index 4661e3d600..084b95c4e1 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1096,6 +1096,7 @@ menu "External python modules"
>  	source "package/python-dpkt/Config.in"
>  	source "package/python-dtschema/Config.in"
>  	source "package/python-ecdsa/Config.in"
> +	source "package/python-emailproxy/Config.in"
>  	source "package/python-email-validator/Config.in"
>  	source "package/python-engineio/Config.in"
>  	source "package/python-entrypoints/Config.in"
> diff --git a/package/python-emailproxy/Config.in b/package/python-emailproxy/Config.in
> new file mode 100644
> index 0000000000..f5c72d3a18
> --- /dev/null
> +++ b/package/python-emailproxy/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_PYTHON_EMAILPROXY
> +	bool "python-emailproxy"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
> +	select BR2_PACKAGE_HOST_PYTHON3
> +	select BR2_PACKAGE_HOST_PYTHON3_SSL
> +	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
> +	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
> +	select BR2_PACKAGE_PYTHON_PYASYNCORE # runtime
> +	help
> +	  An IMAP/POP/SMTP proxy that transparently adds OAuth 2.0
> +	  authentication for email clients that don't support this
> +	  method.
> +
> +	  https://github.com/simonrob/email-oauth2-proxy
> diff --git a/package/python-emailproxy/python-emailproxy.hash b/package/python-emailproxy/python-emailproxy.hash
> new file mode 100644
> index 0000000000..e210ad3898
> --- /dev/null
> +++ b/package/python-emailproxy/python-emailproxy.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/emailproxy/json
> +md5  ea254ae1e8d771bb169be41ccc575967  emailproxy-2024.9.12.tar.gz
> +sha256  b3fef87ebf803dbd8ed998521b3ec424c4fe7f8f02b6ef1e1e08b2c3a6992f72  emailproxy-2024.9.12.tar.gz
> +# Locally computed sha256 checksums
> +sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> diff --git a/package/python-emailproxy/python-emailproxy.mk b/package/python-emailproxy/python-emailproxy.mk
> new file mode 100644
> index 0000000000..89ce3a5daa
> --- /dev/null
> +++ b/package/python-emailproxy/python-emailproxy.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-emailproxy
> +#
> +################################################################################
> +
> +PYTHON_EMAILPROXY_VERSION = 2024.9.12
> +PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
> +PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/a5/aa/42e408ec6f9c9e06d451b26ae97e127f4644860336b28636bbf14845a35a
> +PYTHON_EMAILPROXY_DEPENDENCIES = host-python-cryptography host-python-pyasyncore
> +PYTHON_EMAILPROXY_SETUP_TYPE = setuptools
> +PYTHON_EMAILPROXY_LICENSE = Apache-2.0
> +PYTHON_EMAILPROXY_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))



-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
