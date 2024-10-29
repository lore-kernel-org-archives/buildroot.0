Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D83AD3A67B
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B92EC606CE;
	Tue, 29 Oct 2024 18:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8s1CM5mHg3Tr; Tue, 29 Oct 2024 18:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4A8E60648
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A8E60648;
	Tue, 29 Oct 2024 18:50:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41612494E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FE1360648
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jl7c3OjjkH3K for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:50:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C34EF605AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C34EF605AD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C34EF605AD
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:50:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E2B13240006;
 Tue, 29 Oct 2024 18:50:16 +0000 (UTC)
Date: Tue, 29 Oct 2024 19:50:16 +0100
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241029195016.27fc140d@windsurf>
In-Reply-To: <20241029054713.786223-1-fancp2007@gmail.com>
References: <20241024002847.10348-1-fancp2007@gmail.com>
 <20241029054713.786223-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730227817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tdxBN/xMyloRaP0hwwbaitXcSApAYTNQ5RP1Tibw+mk=;
 b=jK+C/6ZIU6BMMXB/6xfUJyPf7RetBYix9fQQoTXM9+QyT/iKhCC5AZljUKZ8sUqRTyjrkv
 kJarZ/YtCk2SVyo/tJnztzA+xvnxW7ZutgTA6laWvaJfDQ59yRGNDMIoj9/Yncw1zHM5C7
 ucTMCQ+/zMzgGOrTxmT7h+QN4u0yRd+vG+ejl3W++IkdkB331CDr0x5Wmi+c5LlAnzTJCs
 NfK7jp5qbu6DLIQjqMKFortBGpd2jeTKAOMFJ+TzJa6WItwGVWerwzMyiU68/mm9uWGXjg
 bOAgWLfN7FIsgYl44DIWBilMr3YETe9PMEX5JsJfLeSw3LtoaR5MEsbk7JGw2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jK+C/6ZI
Subject: Re: [Buildroot] [PATCH v3] package/python-pgcopy: new package
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

Hello Scott,

Thanks for this new iteration! Some small comments/questions below.

James: if you could review, if would be very helpful. Thanks!

On Tue, 29 Oct 2024 13:47:11 +0800
Scott Fan <fancp2007@gmail.com> wrote:

>  package/Config.in                        |  1 +
>  package/python-pgcopy/Config.in          | 18 ++++++++++++++++
>  package/python-pgcopy/python-pgcopy.hash |  5 +++++
>  package/python-pgcopy/python-pgcopy.mk   | 27 ++++++++++++++++++++++++
>  4 files changed, 51 insertions(+)

An entry in the DEVELOPERS file should be added.


> diff --git a/package/python-pgcopy/Config.in b/package/python-pgcopy/Config.in
> new file mode 100644
> index 0000000000..b5bde7c3b0
> --- /dev/null
> +++ b/package/python-pgcopy/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_PYTHON_PGCOPY
> +	bool "python-pgcopy"
> +	depends on BR2_USE_WCHAR # postgresql
> +	depends on !BR2_OPTIMIZE_FAST # postgresql

You also need BR2_USE_MMU from postgresql, and !BR2_STATIC_LIBS from
postgresql.


> diff --git a/package/python-pgcopy/python-pgcopy.mk b/package/python-pgcopy/python-pgcopy.mk
> new file mode 100644
> index 0000000000..09fd7ea584
> --- /dev/null
> +++ b/package/python-pgcopy/python-pgcopy.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# python-pgcopy
> +#
> +################################################################################
> +
> +PYTHON_PGCOPY_VERSION = 1.6.0
> +PYTHON_PGCOPY_SOURCE = pgcopy-$(PYTHON_PGCOPY_VERSION).tar.gz
> +PYTHON_PGCOPY_SITE = https://files.pythonhosted.org/packages/b0/7d/a5c833f921b20cdb1e8538e72a6065bcc67bbb270fa7a35e98f2d397ce0c
> +PYTHON_PGCOPY_SETUP_TYPE = setuptools
> +PYTHON_PGCOPY_LICENSE = MIT
> +PYTHON_PGCOPY_LICENSE_FILES = LICENSE.txt
> +PYTHON_PGCOPY_DEPENDENCIES = postgresql python-psycopg2 python-pytz

Are you sure python-psycopg2 and python-pytz are build-time
dependencies? I.e are they needed during the build, or only at runtime?

> +define PYTHON_PGCOPY_CLEAN_PY2_SCRIPT
> +	$(RM) $(@D)/pgcopy/errors/py2.py
> +endef
> +PYTHON_PGCOPY_POST_EXTRACT_HOOKS += PYTHON_PGCOPY_CLEAN_PY2_SCRIPT

What is this hook needed? A small comment would be useful.

> +
> +# Force pgcopy to use the Buildroot provided postgresql version
> +# instead of the one from the host machine
> +define PYTHON_PGCOPY_CREATE_SETUP_CFG
> +	printf "[build_ext]\ndefine=\npg_config=$(STAGING_DIR)/usr/bin/pg_config\n" > $(@D)/setup.cfg
> +endef
> +PYTHON_PGCOPY_PRE_CONFIGURE_HOOKS += PYTHON_PGCOPY_CREATE_SETUP_CFG
> +
> +$(eval $(python-package))

Otherwise, sounds reasonable to me.

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
