Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE04EE77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 15:39:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7921881379;
	Mon,  6 Jan 2025 15:39:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6g7pDCc8KzB; Mon,  6 Jan 2025 15:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87B6D813B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87B6D813B6;
	Mon,  6 Jan 2025 15:39:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E4ED6B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 15:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E6C84087D
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 15:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KssMqPVTgSZ7 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 15:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6322D40863
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6322D40863
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6322D40863
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 15:39:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 087D41C0007;
 Mon,  6 Jan 2025 15:39:49 +0000 (UTC)
Date: Mon, 6 Jan 2025 16:39:49 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Thomas Devoogdt
 <thomas.devoogdt@barco.com>, buildroot@buildroot.org, Adrian Perez de
 Castro <aperez@igalia.com>
Message-ID: <20250106163949.5c49b568@windsurf>
In-Reply-To: <CACXRmJi=rGj9uA6R3fQ45sKuSy_+=Vi6u_Vdn_koVd4DkWZj8w@mail.gmail.com>
References: <20240917203311.1241557-1-thomas@devoogdt.com>
 <20241216181719.770389-1-thomas@devoogdt.com>
 <20241216181719.770389-2-thomas@devoogdt.com>
 <CACXRmJg8bzXKbHT48Ej8iUz3yzT18u3AtXep2-WVYKpsoTFyaQ@mail.gmail.com>
 <CACXRmJgAN=rDPQOtTufT0D7uWDp9o_W1xGN5EW6B_XFuQeR77Q@mail.gmail.com>
 <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
 <20241229230256.609289ea@windsurf>
 <CACXRmJi=rGj9uA6R3fQ45sKuSy_+=Vi6u_Vdn_koVd4DkWZj8w@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736177990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ArzUWjA+oZm+wVPF5Q++s0QuSovBJi3F6mXbnkDEn+o=;
 b=Nho1HsCnN3HGYPIuf0+6XidMxE0h8JCWKXEXgCl0U0lY120rmUyMeZyEUZsEmqLtCQGssv
 nIjLHDsqlNQy3t8p/Rf6Wl+4Iud1Ny8Yk/REnDv/DySDniZYj1Uw3V8Xzo/9Sxcpfwz29g
 AwfSj91GjbsFaLSJDL0V7z3awsCr5N33oW0XBNtmniOgkB50PsWQkJj6FAjPr10HpYrspv
 r3NZhkU1GV3Jm9hyl41MuP5zHaaNIiOE5vRa3DMZ1TEwM9TcPDoJqGB4BgYU/Zdgx2U9cW
 K3xy/xtB/qSZSE/8dDCo5XLvrK+SVGYPwFWROLouDRNhouPRfckbTU4h0QI/rw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nho1HsCn
Subject: Re: [Buildroot] [PATCH v3 2/2] package/webkitgtk: bump to 2.46.4
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

Hello Thomas,

Happy New Year and best wishes for 2025!

On Mon, 30 Dec 2024 18:31:31 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> >> Do you have a defconfig that exhibits the issue?  
> 
> I just used the test-pkg tool to figure this out.
> 
> $ cat webkitgtk.config
> BR2_PACKAGE_WAYLAND=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_OPENGL_EGL=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> BR2_PACKAGE_LIBGTK3=y
> BR2_PACKAGE_WEBKITGTK=y
> BR2_PACKAGE_WEBKITGTK_MINIBROWSER=y
> 
> $ ./utils/test-pkg -p webkitgtk -c webkitgtk.config

Thanks for providing this snippet.

> All builds will fail due to the same reason. Are there other possible
> side effects?; I don't know. All I know is that a similar issue was
> fixed years ago, which was re-introduced by bumping pkg-config. Btw, I
> was searching https://autobuild.buildroot.org/ for this issue, but I
> didn't find any webkitgtk build. Is there a reason why this one has
> never been compiled?

Webkitgtk is a huge beast with a lot of dependencies. Therefore, there
is a significant chance that something else fails in the build before
that...

You can find all builds that had BR2_PACKAGE_WEBKITGTK=y by using:

  http://autobuild.buildroot.net/index.php?symbols%5BBR2_PACKAGE_WEBKITGTK%5D=y

but as you can see, all of them failed on some other package, most
likely even before getting to webkitgtk.

Ah and also: webkitgtk starts with a "w". So if nothing depends on
webkitgtk, webkitgtk is going to be the last package to be built.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
