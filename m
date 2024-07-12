Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83A8C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 13:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76ADA40029;
	Fri, 12 Jul 2024 13:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVNR_T8njckj; Fri, 12 Jul 2024 13:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3136B4003B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3136B4003B;
	Fri, 12 Jul 2024 13:23:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBABE1BF4E6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A93946071E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 13:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXvjEz6ODNN7 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 13:23:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68DFA6071D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68DFA6071D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68DFA6071D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:23:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D40C24000C;
 Fri, 12 Jul 2024 13:23:25 +0000 (UTC)
Date: Fri, 12 Jul 2024 15:23:24 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240712152324.262c5edd@windsurf>
In-Reply-To: <20240207170959.2672846-3-buildroot@bubu1.eu>
References: <20240207170959.2672846-1-buildroot@bubu1.eu>
 <20240207170959.2672846-3-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720790605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bprBETAUGVBV0ZWVQSI0bkEPQT5dC8kKhN5klavapQM=;
 b=k9Y2yvfHQ2DyFxJLaDrZwYPGeqC8GDoILH2lsXYSCUm3peLAC0MoPqN9iLJkAXEsLqRgVU
 p1UpGuVbYqFV+9WWwD4EMC9W+bkSJ5pyAFKcfgvE0NFwKVO3j672h7W3sFx67XdkQPjWIu
 GX25aHuNEvoQQDftVgd8Gg7BHbPAptObm2JcQh7ZdqcnU6byM9n+1NXrNluvKGgfCzFar0
 cbm30jwugnKv5E6/f3vipxwcAtwSLqFCaFoOZkxLwxUfzzPAdmm15Ebsvev34+Xks0ynDR
 pC+JtA0vq1Miyx5CzKGS6hb3CXsSjWTqwkSpwEC1DWveWMR3AxsCwMO9YP6mIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k9Y2yvfH
Subject: Re: [Buildroot] [PATCH 3/4] package/python-ruamel-yaml-clib: new
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Wed,  7 Feb 2024 18:09:55 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> diff --git a/package/python-ruamel-yaml-clib/Config.in b/package/python-ruamel-yaml-clib/Config.in
> new file mode 100644
> index 0000000000..a06080873f
> --- /dev/null
> +++ b/package/python-ruamel-yaml-clib/Config.in
> @@ -0,0 +1,9 @@
> +if BR2_PACKAGE_PYTHON_RUAMEL_YAML
> +config BR2_PACKAGE_PYTHON_RUAMEL_YAML_CLIB
> +	bool "python-ruamel-yaml-clib"

Changed the if BR2_PACKAGE_PYTHON_RUAMEL_YAML to a depends on
BR2_PACKAGE_PYTHON_RUAMEL_YAML, which is more common for this type of
situation IMO.

> diff --git a/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
> new file mode 100644
> index 0000000000..3e5434fa9a
> --- /dev/null
> +++ b/package/python-ruamel-yaml-clib/python-ruamel-yaml-clib.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# python-ruamel-yaml

Bad copy/paste, should have been python-ruamel-yaml-clib.

> +#
> +################################################################################
> +
> +PYTHON_RUAMEL_YAML_CLIB_VERSION = 0.2.8
> +PYTHON_RUAMEL_YAML_CLIB_SOURCE = ruamel.yaml.clib-$(PYTHON_RUAMEL_YAML_CLIB_VERSION).tar.gz
> +PYTHON_RUAMEL_YAML_CLIB_SITE = https://files.pythonhosted.org/packages/46/ab/bab9eb1566cd16f060b54055dd39cf6a34bfa0240c53a7218c43e974295b
> +PYTHON_RUAMEL_YAML_CLIB_SETUP_TYPE = setuptools
> +PYTHON_RUAMEL_YAML_CLIB_LICENSE = MIT
> +PYTHON_RUAMEL_YAML_CLIB_LICENSE_FILES = LICENSE
> +PYTHON_RUAMEL_YAML_CLIB_CPE_ID_VENDOR = ruamel.yaml_project
> +PYTHON_RUAMEL_YAML_CLIB_CPE_ID_PRODUCT = ruamel.yaml

I dropped those two lines. Indeed, the CPE vendor/product (at least
product) cannot be the same as for python-ruamel-yaml, as they have
different versioning.

Also, the entry in the DEVELOPERS file was missing, so I added it.

Applied with those fixes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
