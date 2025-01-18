Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB94C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 17:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7785423FA;
	Sat, 18 Jan 2025 17:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fo5tf-Va9ucL; Sat, 18 Jan 2025 17:56:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7BBC424BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7BBC424BC;
	Sat, 18 Jan 2025 17:56:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D5B4B89
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 17:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1D2D4244F
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 17:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nynK0TAwqhfN for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 17:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AC60423FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AC60423FA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AC60423FA
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 17:56:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2665913F8A2;
 Sat, 18 Jan 2025 18:56:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41776])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jan 2025 18:56:00 +0100
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 18:56:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250118012320.2252811-1-james.hilliard1@gmail.com>
References: <20250118012320.2252811-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <c0d0962bfefcaf6945d089b3870d8f29@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737222961;
 bh=1saohi1oPly/47aZOvYU6tzulwkW0cbr7iIzno95uKM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i1jrl/xbKtON8rCg8aq9dR+ADvdOb8sIlhcWpsj7l/4WaaEUto+9OclKBYOkzWPNA
 ioAuf1ClAJizEmke5CGAKXOaRbkL/xJvcK64HAmspWem27bd43pxkMTaz+HvMSxGVQ
 gy8/QiTj5MNHeqY0qcdB02yWUtui6lFZxM3Mj63rxykvTuCijcE9nVjuQ8tvnbG6/n
 2KrFPKWlKBjZcg+MjD9CbcCy2I+zaB2+yyCfdpaRibX8+0Xsecsq0VQajGprAQ1fi3
 b5u4EwaftBUztpwgGAdcT/wC/xWekSGVvGEfQJHoVMjVob+n3hKCeLcZpEQAEgrJRj
 2aCIF1RrqdGdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=i1jrl/xb
Subject: Re: [Buildroot] [PATCH v2 1/1] package/fwupd: bump to version 2.0.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James,

Thanks for the updated patch.

It still generates build failures when running
"utils/test-pkg -a -p fwupd".

See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1630902005

I was able to spot two sources for the failures:

The first seems related to uclibc:

In file included from ../libfwupdplugin/fu-block-device.c:12:
/buildroot/br-test-pkg/br-i386-pentium4-full/host/i686-buildroot-linux-uclibc/sysroot/usr/include/scsi/sg.h:38:3: 
error: unknown type name 'size_t'
    38 |   size_t iov_len;             /* Length in bytes  */
       |   ^~~~~~

See for example:
https://gitlab.com/jolivain/buildroot/-/jobs/8888799791

So a package patch might be needed.

On 18/01/2025 02:23, James Hilliard wrote:
[...]
> diff --git a/package/fwupd/fwupd.mk b/package/fwupd/fwupd.mk
> index 9283eb43aa..5dc11dd953 100644
> --- a/package/fwupd/fwupd.mk
> +++ b/package/fwupd/fwupd.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -FWUPD_VERSION = 1.9.20
> +FWUPD_VERSION = 2.0.3
>  FWUPD_SITE = 
> https://github.com/fwupd/fwupd/releases/download/$(FWUPD_VERSION)
>  FWUPD_SOURCE = fwupd-$(FWUPD_VERSION).tar.xz
>  FWUPD_LICENSE = LGPL-2.1+
> @@ -14,6 +14,7 @@ FWUPD_DEPENDENCIES = \
>  	host-python-jinja2 \
>  	libglib2 \
>  	libjcat \
> +	libusb \
>  	libxmlb \
>  	zlib
> 
> @@ -24,34 +25,47 @@ FWUPD_CONF_OPTS = \
>  	-Ddocs=disabled \
>  	-Dlvfs=true \
>  	-Dman=false \
> -	-Dgusb=disabled \
>  	-Dpassim=disabled \
>  	-Dp2p_policy=none \
>  	-Dcbor=disabled \
>  	-Dplugin_acpi_phat=enabled \
> +	-Dplugin_android_boot=enabled \
> +	-Dplugin_bcm57xx=enabled \
>  	-Dplugin_cfu=disabled \
> +	-Dplugin_emmc=enabled \
>  	-Dplugin_ep963x=enabled \
>  	-Dplugin_fastboot=disabled \
> +	-Dplugin_igsc=enabled \
> +	-Dplugin_intel_me=enabled \
> +	-Dplugin_kinetic_dp=enabled \
>  	-Dplugin_logitech_bulkcontroller=disabled \
>  	-Dplugin_logitech_scribe=disabled \
>  	-Dplugin_logitech_tap=disabled \
> +	-Dplugin_mediatek_scaler=enabled \
> +	-Dplugin_mtd=enabled \
> +	-Dplugin_nitrokey=enabled \
> +	-Dplugin_nvme=enabled \

The second seems to be related to "-Dplugin_nvme=enabled" which needs
"linux/nvme_ioctl.h". This header is available in Kernel >= 4.5.
For the details, you can have a look at:
https://patchwork.ozlabs.org/project/buildroot/patch/20250111113625.326385-1-ju.o@free.fr/

See for example:
https://gitlab.com/jolivain/buildroot/-/jobs/8888799802

So this option might need the same logic as you did
for -Dplugin_gpio.

Could you have a look to those issues, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
