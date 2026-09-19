Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64C4C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 629CE60BC8;
	Sat, 19 Sep 2026 16:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qldfSY0JBZMn; Sat, 19 Sep 2026 16:25:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 776F5606FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789835109;
	b=L7+wZ0abUhl9ShKr7VnbNShIlBqkqtgBysF8N/P7WA//02kfrKEBI0xjiCwvKIMvTGxe
	 mvBCBbUiTLA7hw6R46mNQjqrbqEgq69UJClmnyAeOXBMrimlgJiOZT/QilXrDFEgXKzKw
	 FkZKlYdIWUHm1KEtXJ62/vP7/auNYRRM4VksGwk+a3rVrDhfaOc0E8w1pLQRI7HJBRPPb
	 3VlM0Ub5z1oNRiJZUA9y7sjmF93TFFY7zL5Y/F8iYVLK13sqIspkWuoO5QdJISwajv6qe
	 T+pWZpHkKo6JXmVrNlghiWoGmVAuxT39B/Q8mfKwldbSEj8aRXBnmbHWPdavPbWU0mA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789835109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3X7jxrShfjRjGasChs+vi1lWzH4dr8AiXaEGHQQ2ZZs=;
	b=Qy0ufTL9+xNWQKsT5Z7c1dTZocob+aS720qGOn+2DM43y0uRvc1PB0aiR/KUYX4GUlYU
	 FC1QFLJB90L+L1L2vWlnCyePergZLwaDp9okaUHGN76xxYjXYJnXVefUcGFXPhKuayiSu
	 LpDleEdIxZJoZ3IS85licCDl/TiUIDq6PWIrRKp2wbkQmIxctH/wYVFsncvh5MbaccasR
	 HgeWIBjLyNGxhf0uDCpOatz6ZX81bxYP/zIN7O9/EVK1y4A2flXZ7vtremzX4ba2YOSu7
	 2ZUuVbFWZ63iqDV7yf++dA9XxVH4Ynv8MwHXBar4mgNPDZXS928W48x7KtK4lzGPkAQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789835109;
	bh=3X7jxrShfjRjGasChs+vi1lWzH4dr8AiXaEGHQQ2ZZs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HU4MigGa7JQmtmaLFfHViaS25zKIlkeHebTkmdKzolDzjZtDJE+194QCApr0uAZU1
	 BhnhBo900QXuYqeFfTtsv8SCFwc+EJhZC7krOXTey2OnT57gakSwX0SPw9L0l0sc7I
	 rKgIHB9dNZhweZ0+OS63PR17nA3k7d082pse1a+WJEtwgerpqo7ZlS+sFrFQgdVHno
	 lnSNYCasFTemAufybQk06xVzZo3OQykoTszXtH93dlrNjuQN90m/1RVHq2jwuTO3xG
	 5cEsGaFW7odgGFHognxE+1OZ4atsvyzuF1xb4gZJmozNz0rt1Go7WzEvTJjsTmfC0z
	 0jLSuIRMjFuVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 776F5606FA;
	Sat, 19 Sep 2026 16:25:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ADB4333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C6A9606FA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gc8haalDna1p for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:25:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 45CA7606EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789835107;
 b=C6sVTyJEDpvLvExciDNwWR4mAbiAz7w/TSSIOob+e1CsEf7AE7yGHOqMCQ5Yss37vcTQ
 11ELpVq+YadX0AiGKFevbud61tRJLvoF2Bcz+VjRDyyeK7oxh4MQVqpm22XIf3xzGCzz9
 nqWUlGRib/A/GVw6/FmC8Ya2VOGPnY4A9dzK0ZOQS6CTI9tIxCrrXYEpXk6noHP4DATl4
 9Ymnr+m2fHg3dIW4GXg2V/FGWVI8RIFxGgGmcTWeRBRLB+8GBo9GX/lL+g9uycnTf7Dok
 MGzFFZbTDvzr0dwkUngR0SU42s3S/lTWRnuR1DUxKJotAoObrRTcyg+FOvgiFCmSy3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789835107;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Vd6Oz5TJ4hnNTsbWp+nkw7dDx73MkVVM/l1t7wLed0U=;
 b=MfmF9V8XTW3z6a0O8IHom0EgtOzkVXuwM+SwbAYh/JzYATH7peG0JLHP1Nf/YhyhpHpP
 l3xOFECmEXpr6CfADm1jIdhb9Fvk2Sr+3MM5kqPguSfhDF1jRR7Nvm9u//UgbyMwACAdr
 /Uft0C69duzLUADQXnmb3tJB5CK5kBC/TSZSZQtMeBVx+BbBhYhVB97xUM4T14FQtqtEF
 ItT6t4j82FS4AVtCrFheP/9/mQPF1Xi2GXqjo79nPeeZjbRxgF8vrWAHre5twM6V7Z5HB
 wd5zcc5i4EDzP5qx5+9uC1EksnplGTxmug45D5woaoAobsBmRY4uN4mk2ICeX8FuwOQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EFUdRgay; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45CA7606EE
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:25:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D17A8C5145F
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 727AE606CA;
 Sat, 19 Sep 2026 16:25:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0BCB610328B89; 
 Sat, 19 Sep 2026 18:24:56 +0200 (CEST)
Date: Sat, 19 Sep 2026 18:24:43 +0200
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aq63CL62s6rU-pxP@windsurf>
References: <20260830181907.106154-1-alexander.sverdlin@gmail.com>
 <20260830181907.106154-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260830181907.106154-2-alexander.sverdlin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] boot/syslinux: Don't delete host
 syslinux installer
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

On Sun, Aug 30, 2026 at 08:19:02PM +0200, Alexander Sverdlin wrote:

> diff --git a/boot/syslinux/0005-mtools-Use-the-host-toolchain-for-syslinux-installer.patch b/boot/syslinux/0005-mtools-Use-the-host-toolchain-for-syslinux-installer.patch
> new file mode 100644
> index 0000000000..3fe431ac37
> --- /dev/null
> +++ b/boot/syslinux/0005-mtools-Use-the-host-toolchain-for-syslinux-installer.patch
> @@ -0,0 +1,48 @@
> +From 3eb38370b831ede21ecb8cda7ed04b6123531df4 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
> +Date: Thu, 6 Apr 2017 09:43:46 +0200
> +Subject: [PATCH] mtools: Use the host toolchain for syslinux installer

A more detailed description would be relevant.

> +
> +Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

We require all patches to be submitted upstream, and carry an
Upstream: tag pointing to the upstream submission (PR, or link to the
mailing list archive pointing to the patch submission).

Could you send a v2 taking into account this feedback?

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
