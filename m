Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46E1E77191
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 23:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A885A60A37;
	Sun, 29 Dec 2024 23:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HetLAmiEFx4z; Sun, 29 Dec 2024 23:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C57A60A3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C57A60A3E;
	Sun, 29 Dec 2024 23:08:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0CEF72
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 23:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA6284040A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 23:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qt4duh0H2qd5 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 23:08:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3CA74004A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3CA74004A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3CA74004A
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 23:08:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A835D240002;
 Sun, 29 Dec 2024 23:08:17 +0000 (UTC)
Date: Mon, 30 Dec 2024 00:08:16 +0100
To: Tim Gover via buildroot <buildroot@buildroot.org>
Cc: Tim Gover <tim.gover@raspberrypi.com>
Message-ID: <20241230000816.34cc40be@windsurf>
In-Reply-To: <20241216125800.219227-2-tim.gover@raspberrypi.com>
References: <20241216125800.219227-1-tim.gover@raspberrypi.com>
 <20241216125800.219227-2-tim.gover@raspberrypi.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735513697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q10UU3xIfzo2jn7U8OFcQEFOiWOGxyv+c6TBGpDcR1c=;
 b=LuAEmVdoYCm7PX+IdhXkQ6zT0XnQSmvuJC4we84xOyHULrLOAEWZWFcV1tLDRFa1oEedC9
 avucimoJSCnZ9VthRtMS65Jx93L/htFkCqrYws+6VfAmaBifvUhGMZZdScAJSaJpyTzL5e
 wFh4XuYf+OzbVYVcg/kHdYlUgYpFb+f5ywTsbJEIFl3+Yzl+hclLNg8BTidwpammOIBMWr
 P3yeKf+Cv7bLoejgNcmml55Sr/rluWxZRx8tOLKAs+yf9xlZkCoo/8WjjwDY+0qXWwuRGY
 ATC8BHQAdYpkIJXv6ESEhKF+jABkl11cPhdpnPlblCEPUbWS0zCmZ5AWlzWfxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LuAEmVdo
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-eeprom: New package for RPi
 bootloader tools
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

Hello Tim,

Thanks a lot for your submission, and sorry for the delay in getting
back to you! See below some feedback.

On Mon, 16 Dec 2024 12:58:00 +0000
Tim Gover via buildroot <buildroot@buildroot.org> wrote:

> This package adds the host and OS tools for configuring
> the bootloader and building/signing tools for signed boot.
> 
> Normally, the host tools would be invoked from a post-build
> script to sign the boot.img file. The device tools would be
> invoked from a custom on-device software update process e.g.
> using rpi-eeprom-digest to verify the signature of a boot.img
> file against a public key retrieved from the EEPROM.

Thanks for the good explanation of why both a target and host package
are needed.

>  configs/raspberrypi5_defconfig     |  1 +
>  package/Config.in                  |  1 +
>  package/Config.in.host             |  1 +
>  package/rpi-eeprom/Config.in       |  9 +++++++++
>  package/rpi-eeprom/Config.in.host  |  9 +++++++++
>  package/rpi-eeprom/rpi-eeprom.hash |  1 +
>  package/rpi-eeprom/rpi-eeprom.mk   | 27 +++++++++++++++++++++++++++
>  7 files changed, 49 insertions(+)
>  create mode 100644 package/rpi-eeprom/Config.in
>  create mode 100644 package/rpi-eeprom/Config.in.host
>  create mode 100644 package/rpi-eeprom/rpi-eeprom.hash
>  create mode 100644 package/rpi-eeprom/rpi-eeprom.mk

Could you please add an entry in the DEVELOPERS file for this new
package?

> diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
> index 8cbd533eee..6d364ad32f 100644
> --- a/configs/raspberrypi5_defconfig
> +++ b/configs/raspberrypi5_defconfig
> @@ -31,3 +31,4 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  BR2_PACKAGE_HOST_KMOD_XZ=y
>  BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_RPI_EEPROM=y

I'd prefer to see this done as a separate commit (possibly in the same
patch series). However, the bigger question is why is this only done
for RPi5, and not the other RaspberryPi? Is there anything that makes
this tool RPi5-specific?

> diff --git a/package/rpi-eeprom/Config.in b/package/rpi-eeprom/Config.in
> new file mode 100644
> index 0000000000..02e1109264
> --- /dev/null
> +++ b/package/rpi-eeprom/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_RPI_EEPROM
> +	bool "rpi-eeprom"
> +	select BR2_PACKAGE_LIBOPENSSL

Why is openssl needed? You don't even depend on it in the .mk file.

Also, you should directly select BR2_PACKAGE_LIBOPENSSL. But you should
select BR2_PACKAGE_OPENSSL, and then if only openssl is supported (and
not libressl), you also need to select
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL. openssl is kind of a special
beast, as it's a virtual package with two implementations: libopenssl
and libressl.

> +	select BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX

Are these runtime dependencies? If so:

	select BR2_PACKAGE_PYTHON3 # runtime
	select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX # runtime

> +	help
> +	  Raspberry Pi bootloader tools.

A slightly longer help text with more details would make sense, perhaps
borrowing some details from your commit log on the use case (here for
the target package).

> +	  https://github.com/raspberrypi/rpi-eeprom
> diff --git a/package/rpi-eeprom/Config.in.host b/package/rpi-eeprom/Config.in.host
> new file mode 100644
> index 0000000000..3d36d7bec8
> --- /dev/null
> +++ b/package/rpi-eeprom/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_RPI_EEPROM
> +	bool "host rpi-eeprom"
> +	select BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX

These selects don't make sense, as you're selecting target packages...
while we're here in the option enabling the host variant of rpi-eeprom.
Most likely you don't need any "select" here.

> +	help
> +	  Raspberry Pi bootloader tools.
> +
> +	  https://github.com/raspberrypi/rpi-eeprom
> diff --git a/package/rpi-eeprom/rpi-eeprom.hash b/package/rpi-eeprom/rpi-eeprom.hash
> new file mode 100644
> index 0000000000..27cd0bfdf3
> --- /dev/null
> +++ b/package/rpi-eeprom/rpi-eeprom.hash
> @@ -0,0 +1 @@
> +sha256  90970fd9a72c29449a8f4f27577395a1fb418f87b979adeb81d51300f959dab9  rpi-eeprom-fe7bfc720165464d9dfe2f85fe090ca22a625bd7.tar.gz

Please add a comment on where this hash comes from. Most likely:

# Locally calculated

Also, please add a hash for the LICENSE file (see other packages).

> diff --git a/package/rpi-eeprom/rpi-eeprom.mk b/package/rpi-eeprom/rpi-eeprom.mk
> new file mode 100644
> index 0000000000..db1634315f
> --- /dev/null
> +++ b/package/rpi-eeprom/rpi-eeprom.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# rpi-eeprom
> +#
> +################################################################################
> +
> +RPI_EEPROM_VERSION = fe7bfc720165464d9dfe2f85fe090ca22a625bd7
> +RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
> +RPI_EEPROM_LICENSE = BSD-3-Clause
> +RPI_EEPROM_LICENSE_FILES = LICENSE
> +
> +HOST_RPI_EEPROM_INSTALL = YES
> +RPI_EEPROM_INSTALL = YES

Neither of these are needed/have an effect.

You will most likely need:

HOST_RPI_EEPROM_DEPENDENCIES = host-python3 host-python-pycryptodomex

indeed, for the host package, we need the package to be fully
functional right after its installation, as other packages depending on
it might use it right after.

However, for the target package, we only care that everything is on the
target once it runs, hence select BR2_PACKAGE_PYTHON3 + select
BR2_PACKAGE_PYTHON_PYCRYPTODOMEX in Config.in is sufficient.

Could you have a look at adjusting those details and submitting a
second iteration of this patch?

Once again, thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
