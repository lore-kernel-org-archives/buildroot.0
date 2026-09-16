Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EEDC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C35A98086E;
	Wed, 16 Sep 2026 19:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id duFyAxiOH4dp; Wed, 16 Sep 2026 19:43:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B078F80906
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789587810;
	b=pVvm7DdqbFZLLw0H5s3c6oj8LxWHdrO3U9yXFyic8By7YC4k32/qLDdartg+qD2J3KnQ
	 T0t4u38v42kxmNdNk44a3Il2DnvrvIeJi6CpbDfpqGmjPqx9JdgLjm/CZKKN71FCJ2zB/
	 OmxDQmJL9ETcaBHKt++59PA2J86ZUTnObdKjrmgDRoHbm0g58+If4zLIaclqZRjiRfrr3
	 vpCT1FBQ0cokROtS6nDVUEUUqWAzjpM0CpPXS/6ZwVCjjEj6TiBD4GiO4Ol+tnPVwCuVf
	 TqVq08BqTIPb0uIbiX/42DxlG4THJyKLDEgt1D3/p6kvkWPGx4V/pDgSuRiSKTe3EJA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789587810;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xsCIiP3GgMf5lRmfx9xpibMJKWRO6z1wzMB6stoTM+Q=;
	b=rE7lfGGwe08WTdWo5D9TQwstr/RFkYnZwZsQqg1SA6hBKJcF27xtO0PnrCuryucb6f1m
	 Ui0PX3+GeJp69pSNHGRkKVLrYM/OJdqvK8jpNsaXEYloYtZHVk7w6EiHbIDqH4GsCnjia
	 W7BWoFRFNtogRGc0hoGnBOrjtWgOeOA0vpfAMtOOvYFA4YFIlADvMDb8DXgKQ9LIs8mjO
	 hWi7kfWKU0+VyFcv8ONjJxoHVUlk3bsIuE3sSA9pLPIsM5WcS6199km59JdsOoFFtnyfc
	 ostajxGTWQtD2RZU/Jaj1uOGeo31o4jpfaKrTSzw9pQJtfG5BH0rEepEnNO8krUliTg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789587810;
	bh=xsCIiP3GgMf5lRmfx9xpibMJKWRO6z1wzMB6stoTM+Q=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qoaf3ahQjgp9dWdxonDdrhyNNpp3P2eGaGLV7i7LvPdqrc6txbiGoqcmZlPVQCh7O
	 foH3jI4TsjfhbcHbWONQKweMSQsMqqG9vnZ6bii0dieuGz/kE0iE8OYT7MudHThdRS
	 vTXj+ndoKlFP6mfdT2zfqZEg+bST4nlXdoUKlRoCDudpwrKZS4L6fTcPR8qlkdM2zr
	 Ust8nU7kFFDfSiWyWOEzSVwZ9ep+0iBoJ882C/YkZ2mwHhA9QwidZ/T+JaOysdZaUD
	 ykMjsSagFpGeWz+d9Ggz27cznZLVyxc2AtweGBuuuZTlUb57RI2g0tGuW6cGn8jz1G
	 ek2CdK6mAl5dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B078F80906;
	Wed, 16 Sep 2026 19:43:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C13D2E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DB6840441
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uaZkHmmVJVh for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:43:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EF1F5402D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789587808;
 b=b/BOMMGdHAXqwpDwzC5lW58P7Jp/ISD3SsgzrGtSCgzA+naLN0kgSsp8E3kH4BrP6WLg
 IgF5Ng8FyGMaAJGBy5HEJeZjg/v+7f7abyl+qlf0c05yrt+d3RK4i3wK0PVTLZwUrbjjp
 YP4p+nUV026LdHxud4a1Z2O58lYp9kzuGWF5ZtS3UQSwHRkx+KuFs+BrrMKT/HTbTUWWc
 qIlv076lKqvJFYkhCWRJhoOEIQ0MjWaf4QBs3z4i/67sr23+5//kGqHGY4dJHGWx6ggq/
 VmCVfAs9DcgTNaiMLPLblKG4xndDAtixCUsUUc0dbi5zfwd/b8GnkDfp61Fvc6x71Rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789587808;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=rn9a4ADC19FXZwSD0UsHHN1IlK8iQy8qEImxccyGeTE=;
 b=S0eN6EWdS/0gLT1wD8+vvunvmWZ3hVUqerCaoG5DT0bDjdNcqCgOmNhT0nY/ieSd7Qla
 jmDlg9K5QpblTfY5RD1pJJO15qq5ZkZienj6jtZUCuNkfkW4MjokpBKlPv5QxhVA3USVA
 aafXFhuKThZieMmygBaxyjRrOhIfhwvbBwqe33Io4l8fWoA3AXcCk3bjrt3VwGC5rwJ1w
 nhw0p0WqkIyEdcZ+9VTzxGWXZmtddSQJ4UIw2aB4WHx0mTxDpwAHv6+k0nFDm2dIpHFox
 1Cq0nlc2v6RUIrqwgBg4n81qodyQZmcP6XS+D9GKsIzSydo87m+TJclReHo4lBUOAcA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JiUnpmt8; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF1F5402D2
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:43:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 724764E40754;
 Wed, 16 Sep 2026 19:43:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44EA160337;
 Wed, 16 Sep 2026 19:43:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5E73611C7B052; 
 Wed, 16 Sep 2026 21:43:23 +0200 (CEST)
Date: Wed, 16 Sep 2026 21:43:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <aqrxVUpN1-kJ0oHG@windsurf>
References: <20260909182214.935730-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260909182214.935730-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webengine-chromium: fix
 build with glibc >= 2.43
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

On Wed, Sep 09, 2026 at 08:22:13PM +0200, Bernd Kuhls wrote:
> No autobuilder errors were recorded, the build error can be reproduced
> with this defconfig:
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_QT5=y
> BR2_PACKAGE_QT5WEBENGINE=y
> BR2_PACKAGE_XORG7=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
