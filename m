Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D27C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 07:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9525D608C2;
	Fri,  7 Aug 2026 07:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpW63w6Y0WAN; Fri,  7 Aug 2026 07:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5897A608C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786088673;
	bh=5sakLlOukwsdUTuE/63lGlNwA7T7Ms3/zZ25jB3f6dU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h3M6HKbGyE0jxajDzLFLRluZLRVe4UcD5J0B75krC4XNuVPH/G8U/q/VWpkBpmL/J
	 Um8rbNqk6tHPLItcWMmBdbpd6fGQRDkp0YQKAQ05ebQrQBEQR9VWCGn+qN/ybzo5j2
	 fEKH2Jiu3LnG4mSslUtx++qPxMxzQ7FHm27lkw241e+xBo7D+FyQPi5Ry3ww68M0w4
	 xY2ELYt8dpyqaTvK5VSIdRGXh02j933nu+u19vfNz6xe0+UccCb6nvzzLzLMBbXFkI
	 Xj1P480uzobiLfsuJBj/38WqT7w3C3OLI7hfdkVcahb7yyH+VN+A9Qp1DR9moJm9pC
	 hM10qJPihxO+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5897A608C0;
	Fri,  7 Aug 2026 07:44:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55DED392
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 07:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5355D409C8
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 07:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1hUTylm0MK6S for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 07:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 76F59409C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76F59409C7
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76F59409C7
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 07:44:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 48F034E4112C;
 Fri,  7 Aug 2026 07:44:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 05BB8603F0;
 Fri,  7 Aug 2026 07:44:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5C2211C372E8; 
 Fri,  7 Aug 2026 09:44:19 +0200 (CEST)
Date: Fri, 7 Aug 2026 09:44:17 +0200
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, 
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Message-ID: <anWMFshKM90_1I-z@windsurf>
References: <20260806-host_tools-v1-0-19c63ecc3b10@bootlin.com>
 <20260806-host_tools-v1-1-19c63ecc3b10@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260806-host_tools-v1-1-19c63ecc3b10@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1786088662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Fk+42aVivXUQt9uKQwUUEbcbTV2vXI0jAWpE/vfinX8=;
 b=fYxUZxRZTiy5ie0h+Uxyd2s49AYBuKb86440y6+xIkOadK+oH7TuPsfs6SKVL6t36e9wG+
 JoT+TPSDqEKHMbTjVWRHmTV+YSfTfTS/7w25BZpOXIC61k82LrKB8XZCwh5DW0melCowQF
 WAV7Al5gxuv4KAjNCxMKEV+edJebeVDB5q0NCTL9/nPMONsGq+nR/4sTaQ3Sf0dyv3meeT
 /8v9awmQUUKW3VAnSKWw9OmRKRK5h8xdcdWsBqWkawV30N5JtCWbIpzmgb9WAwiEgehI9a
 WtAXI/WGt2gmB6Fk4g4dhBw858I594Rj2+gBloK9Gef14Vpg8T76jxMmU6k9OQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=fYxUZxRZ
Subject: Re: [Buildroot] [PATCH 1/2] package/uglifyjs: new package
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

On Thu, Aug 06, 2026 at 11:24:22PM +0200, Alexis Lothor=E9 wrote:
> uglifyjs is a JavaScript parser, minifier, compressor and beautifier
> toolkit.
> =

> https://github.com/mishoo/UglifyJS
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Thanks for the patch. Overall looks good. One or two suggestions below.

> new file mode 100644
> index 000000000000..921d4dffee8e
> --- /dev/null
> +++ b/package/uglifyjs/uglifyjs.mk
> @@ -0,0 +1,23 @@
> +########################################################################=
########
> +#
> +# uglifyjs
> +#
> +########################################################################=
########
> +
> +UGLIFYJS_VERSION =3D 3.19.3
> +UGLIFYJS_SITE =3D $(call github,mishoo,UglifyJS,v$(UGLIFYJS_VERSION))
> +UGLIFYJS_LICENSE =3D BSD-2-Clause
> +UGLIFYJS_LICENSE_FILES =3D LICENSE
> +HOST_UGLIFYJS_DEPENDENCIES =3D host-nodejs
> +
> +define HOST_UGLIFYJS_INSTALL_CMDS
> +	$(INSTALL) -m 0755 -d $(HOST_DIR)/lib/node_modules/uglify-js
> +	rsync -a $(@D)/bin $(HOST_DIR)/lib/node_modules/uglify-js/
> +	rsync -a $(@D)/lib $(HOST_DIR)/lib/node_modules/uglify-js/
> +	rsync -a $(@D)/tools $(HOST_DIR)/lib/node_modules/uglify-js/

We more commonly use "cp -dpfr" for this kind of situation, and you
could also use a loop?

> +	$(INSTALL) -m 0755 $(@D)/package.json $(HOST_DIR)/lib/node_modules/ugli=
fy-js/

Something like:

	$(foreach p,bin lib tools package.json,\
		cp -dpfr $(@D)/$(p) $(HOST_DIR)/lib/node_modules/uglify-js/
	)

> +	ln -sf ../lib/node_modules/uglify-js/bin/uglifyjs $(HOST_DIR)/bin/uglif=
yjs
> +

Drop this empty new line.

> +endef
> +
> +$(eval $(host-generic-package))
> diff --git a/support/testing/tests/package/test_uglifyjs.py b/support/tes=
ting/tests/package/test_uglifyjs.py
> new file mode 100644
> index 000000000000..666a5fb46ff1
> --- /dev/null
> +++ b/support/testing/tests/package/test_uglifyjs.py

Forgot about commenting on this on the DEVELOPERS file: please add
this file to the DEVELOPERS file as well, under your name. This way if
this test fails in our CI, you'll get notified.

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
