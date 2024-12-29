Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009B8E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 22:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3B7B40258;
	Sun, 29 Dec 2024 22:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 38GKXjpgTakB; Sun, 29 Dec 2024 22:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D51B4022F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D51B4022F;
	Sun, 29 Dec 2024 22:03:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79004CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 596F9608B4
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1_RmYOorX9F for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 22:02:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C658608A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C658608A0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C658608A0
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 22:02:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EDB711BF203;
 Sun, 29 Dec 2024 22:02:56 +0000 (UTC)
Date: Sun, 29 Dec 2024 23:02:56 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Thomas Devoogdt
 <thomas.devoogdt@barco.com>, buildroot@buildroot.org, Adrian Perez de
 Castro <aperez@igalia.com>
Message-ID: <20241229230256.609289ea@windsurf>
In-Reply-To: <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
References: <20240917203311.1241557-1-thomas@devoogdt.com>
 <20241216181719.770389-1-thomas@devoogdt.com>
 <20241216181719.770389-2-thomas@devoogdt.com>
 <CACXRmJg8bzXKbHT48Ej8iUz3yzT18u3AtXep2-WVYKpsoTFyaQ@mail.gmail.com>
 <CACXRmJgAN=rDPQOtTufT0D7uWDp9o_W1xGN5EW6B_XFuQeR77Q@mail.gmail.com>
 <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735509777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4i98FdCd517su68MLRLMldYyy1gPnEA28+dQqIceOsY=;
 b=hYvSSRU8/9hPnKTd9NKt+W5O3DR33uyUlMUUwrDk1W2l/xWztDMiPSaVWLbKVABIZv5WoQ
 oSGKKC04laNRh/kp5KGuhQW8LzdN2vLowQTeHahMJOtjO7JxdV3zEvzd1EMdBi5aRMvbwy
 uth6Cy9wqs74Of4tPJ9eyRYth5Ci1/aSgiZoEl724EVbJKBZBIl8f7hLWOTMxtwJ8QVlcN
 damDjTVdJKHRmN8+mnGcWhbazjLtEeZgEXtW8S4gFlozJ5ytsaay7rrswzBA2odJVGAuDl
 2k9MPMkKf8yMELXohFH1yEBsTmoTyNck5hda2Va6nuZjNE4/0b/TElNhRWeIEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hYvSSRU8
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

On Tue, 17 Dec 2024 23:20:47 +0100
Thomas Devoogdt <thomas@devoogdt.com> wrote:

> I discovered that dropping "pkgdatadir" in the
> package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
> fixes the problem.
> It's btw the same key that was added years ago by commit
> 3e74c1312d35866c05813b4690412548eaaff61a.
> 
> It fixed this error back then:
> 
> Making all in xwayland
> make[3]: Entering directory
> '/home/buildroot/br5/output/build/xserver_xorg-server-1.19.0/hw/xwayland'
> make[3]: *** No rule to make target
> '/usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xml',
> needed by 'relative-pointer-unstable-v1-client-protocol.h'. Stop.
> 
> It's the same wayland-protocols that now give me those problems. So I
> think that we can just drop "pkgdatadir" from the patch list.

Do you have more details about "the same wayland-protocols that now
give me those problems" ? Do you have a defconfig that exhibits the
issue?

Essentially, I'm obviously concerned by the side effect of changing how
this pkgdatadir pkg-config variable gets handled. Your change will fix
some stuff for sure, but will it break something else?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
