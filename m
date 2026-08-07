Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C24FC5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 08:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 224BE409E9;
	Fri,  7 Aug 2026 08:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9leCMCCCfwCW; Fri,  7 Aug 2026 08:29:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CD05409ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786091365;
	bh=LUu4VLJA4DqrW1FptFntHH8JKYlnpTYiF0KzpxIueZM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eJBbUv29djWgHCmUDDckD6UaKWXJhkC1zCsUMSYAd6u29R5LpZFH7MJrQOvxnjaya
	 HO6TAtika22oV3zYlke3e2jp02YCoVrPs/8XUdIDsaIpMu3MmX9c6MpTj1l0HDrTyQ
	 xlTXraLHOjlWIvI1O+TJJNkfa3t88hxQukQdMLTtfWjXamY2ltuC3dEp/hbBYHGnKw
	 mikExbYRGO2PyZoSmZnXQpZgRlG1ZjeOk6tr908F3dd+F8rAeNsACIdB4xee2i3Sb+
	 WZigvPvd2Yk23MoqssetF1H3mlus1O7kE36nI0ZS/E3UGs7vDRSDsX0+oLIL71zuvH
	 bm+0gV08yP1Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CD05409ED;
	Fri,  7 Aug 2026 08:29:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6182B10E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 08:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47B2D40122
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 08:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QVpTTBqRb4AH for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 08:29:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E82F40084
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E82F40084
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E82F40084
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 08:29:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0D5B51A1495;
 Fri,  7 Aug 2026 08:29:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D7651603F0;
 Fri,  7 Aug 2026 08:29:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D7DC411C3739F; 
 Fri,  7 Aug 2026 10:29:14 +0200 (CEST)
Date: Fri, 7 Aug 2026 10:29:14 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, 
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Message-ID: <anWV0uzil1jp4BNN@windsurf>
References: <20260806-host_tools-v1-0-19c63ecc3b10@bootlin.com>
 <20260806-host_tools-v1-2-19c63ecc3b10@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260806-host_tools-v1-2-19c63ecc3b10@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786091355; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=33m5FdQ8vXBtV6qRVaztQIsjOOawnvF3+i5pGN0hMt8=;
 b=uRhkw15bDCMxuguc6A/PYSOXksSaEnOq9LcfmurrGcMS83j7XRWCvEgHNOY/V+8wRZxv0w
 Lb6CB4DPuSP75ymk2QOVjbaoQQgwWQwEq1Ix5akBplE5MRUdL2v3yjh9AHgM5usVcxrJuI
 NqujlhwAouk+sY+pYY7CVnvlUE9T2C9nVsH/IeglyBUC6vCqtXIH3cvE1ITQcs6mUHPBd5
 FGloBHGwajk8wpmZ9eN5jvnqrrOpuVpWLkmDkhFsZN1s/iYVJEJYC+Egdoewm6frSVq6PY
 oGB86sK6+G3EJx87224lUqEGw/ZQSGQZmONN5+KhG6esaC4j7wRl7Sf4HfUwng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=uRhkw15b
Subject: Re: [Buildroot] [PATCH 2/2] package/sass: new package
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexis,

On Thu, Aug 06, 2026 at 11:24:23PM +0200, Alexis Lothor=E9 wrote:
> sass is a css extension adding programming features to css.
> =

> https://github.com/sass/dart-sass
> =

> The source configured for the package is not a github repository, as the
> official sources for sass are in fact in Dart: those sources are
> automatically built into a javascript module by the corresponding github
> workflow ([1]). Rather than trying to replicate the whole dart build,
> this new package just downloads the sources for sass from npmjs
> directly.
> =

> [1]
> https://github.com/sass/dart-sass/blob/main/.github/workflows/release.yml
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

I am not super clear on what sass exactly does/is. But some time ago,
we dropped all JS libraries from Buildroot:

  https://lore.kernel.org/buildroot/20250829103340.158873-1-thomas.perale@m=
ind.be/

But sass doesn't seem to be one of those static JS libraries I guess
because it installs some executable host tool?

> diff --git a/package/sass/sass.mk b/package/sass/sass.mk
> new file mode 100644
> index 000000000000..c79109be44a2
> --- /dev/null
> +++ b/package/sass/sass.mk
> @@ -0,0 +1,30 @@
> +########################################################################=
########
> +#
> +# sass
> +#
> +########################################################################=
########
> +
> +SASS_VERSION =3D 1.102.0
> +SASS_SOURCE =3D sass-$(SASS_VERSION).tgz
> +SASS_SITE =3D https://registry.npmjs.org/sass/-
> +SASS_LICENSE =3D MIT
> +SASS_LICENSE_FILES =3D LICENSE
> +HOST_SASS_DEPENDENCIES =3D host-nodejs
> +
> +define HOST_SASS_BUILD_CMDS
> +	$(HOST_DIR)/bin/npm install \
> +		--prefix $(@D) \
> +		--production \
> +		--no-audit \
> +		--no-fund

What is this "npm install" doing? Isn't it downloading random stuff
from the Internet?

> +endef
> +
> +define HOST_SASS_INSTALL_CMDS
> +	$(INSTALL) -m 0755 -d $(HOST_DIR)/lib/node_modules/sass
> +	$(INSTALL) -m 0755 $(@D)/sass.js $(HOST_DIR)/lib/node_modules/sass/
> +	$(INSTALL) -m 0755 $(@D)/sass.dart.js $(HOST_DIR)/lib/node_modules/sass/
> +	rsync -a $(@D)/node_modules $(HOST_DIR)/lib/node_modules/sass/

"cp -dpfr" instead of "rsync -a".

> +	ln -sf ../lib/node_modules/sass/sass.js $(HOST_DIR)/bin/sass
> +endef
> +
> +$(eval $(host-generic-package))
> diff --git a/support/testing/tests/package/test_sass.py b/support/testing=
/tests/package/test_sass.py
> new file mode 100644
> index 000000000000..2739eff7f680
> --- /dev/null
> +++ b/support/testing/tests/package/test_sass.py

Please add this file to the DEVELOPERS file.

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
