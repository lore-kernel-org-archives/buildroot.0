Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3B7E77188
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 17:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3468E60B0F;
	Mon, 30 Dec 2024 17:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A9Hbi3TU1cTW; Mon, 30 Dec 2024 17:31:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33E9060B05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33E9060B05;
	Mon, 30 Dec 2024 17:31:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FBF7968
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 17:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C7B14089D
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 17:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TK4SNoHLvlB4 for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 17:31:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.47;
 helo=mail-lf1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0D9B40895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0D9B40895
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0D9B40895
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 17:31:46 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-540215984f0so9883261e87.1
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 09:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735579904; x=1736184704;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gbv2LlfQtlhSIMQRzcE3uuABNuYX1cyUIZCa+ENfgiY=;
 b=PM3hsuYkmrb2n3uthNO2Io2ANsGYqiIyk8Gj5W8YA/vqwXCRbQuZkiKNupGM3iP76d
 tKiI42KzbdUTbIgJbMAZKXg2FlwyHRAgYiv1FpDbDadIUHj9gf9NYSDmxyMomAbFVnES
 dlNUmbax5vGp5c7dQG1r9k1kDENgU87V8Jtrjxtb/2tLPP6wgADg6trWoSKOCSM2PlWg
 9dK1cQGu8ckFtV7vLF+QcJpEXKhsALvbj2E/QP9KM21T6e+hjhOR4sHzmvDU9cURYkqs
 q8RmlWUyZV63X5+/zi2TNrxIfOHGDIASCCk9lRiG3N3V9tqNqgjss3cb1r+PN0sIZm2V
 1P+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX2+PrMKK6MAtWLDkbnr0b2O7n6BGfwryjtJ0JrjIdVv7Jb0DsxcabyvI21lLZ+D/VpBNDHd6psvc=@buildroot.org
X-Gm-Message-State: AOJu0YyGmgoLny63g1UacpVHGjcyY+/1Gh4d5QSkRmJSRb+tLKY8oa11
 Say2BsNwctploimB/2f374o6YTowp96lHgu/j5oaXAjeDHJTNx0Ki8M67hVggak=
X-Gm-Gg: ASbGncvMlIy3yK6JNIopzfZGmwuP26bIeDd+jQm/qsp6yYKc37DTPuipwggQjqvcZzo
 +GelX9ggHrRZZNpTVZuv3d8kryZuixHgVEtDhTlnAxaiIpXTz3rnOloZcaFdq8jroc9pYJFClcQ
 kHiFlA0DQ0jY3tTQWzJLqqWioZKErSatiSeEHTpneym6GHDt4a15AUiAXRch+7494P1Rmkt71ML
 0mtYmEXKENtQolp2P8Zh+6TxDHkzKTF7luUOexoZXb2+kOEALSpV6BBYTnJABGRz9GBo846qysh
 GkJC0fxG5u8x6XeH2g==
X-Google-Smtp-Source: AGHT+IEwnKeBc9ikqI3BRgQTwoBsLKLCnQote08ojYfwSaAKQAbNx58sMthzm76mvRbDGJe8iEsy3w==
X-Received: by 2002:a05:6512:3994:b0:542:214c:532 with SMTP id
 2adb3069b0e04-54229538b3amr9987672e87.13.1735579903627; 
 Mon, 30 Dec 2024 09:31:43 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238216e9sm3144422e87.214.2024.12.30.09.31.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2024 09:31:42 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso11509660e87.3
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 09:31:42 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKjKQzpwYoe+pY+umkZcSp9/KmXpN8Hdlz08xXhP0TaUEON0nzDbNPwUc8/v45ddT92NUWIZEvVAc=@buildroot.org
X-Received: by 2002:a05:6512:110d:b0:540:2a92:7da9 with SMTP id
 2adb3069b0e04-54229539f3dmr7310703e87.21.1735579902599; Mon, 30 Dec 2024
 09:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20240917203311.1241557-1-thomas@devoogdt.com>
 <20241216181719.770389-1-thomas@devoogdt.com>
 <20241216181719.770389-2-thomas@devoogdt.com>
 <CACXRmJg8bzXKbHT48Ej8iUz3yzT18u3AtXep2-WVYKpsoTFyaQ@mail.gmail.com>
 <CACXRmJgAN=rDPQOtTufT0D7uWDp9o_W1xGN5EW6B_XFuQeR77Q@mail.gmail.com>
 <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
 <20241229230256.609289ea@windsurf>
In-Reply-To: <20241229230256.609289ea@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 30 Dec 2024 18:31:31 +0100
X-Gmail-Original-Message-ID: <CACXRmJi=rGj9uA6R3fQ45sKuSy_+=Vi6u_Vdn_koVd4DkWZj8w@mail.gmail.com>
Message-ID: <CACXRmJi=rGj9uA6R3fQ45sKuSy_+=Vi6u_Vdn_koVd4DkWZj8w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 James Hilliard <james.hilliard1@gmail.com>, 
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org, 
 Adrian Perez de Castro <aperez@igalia.com>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,


>> Do you have a defconfig that exhibits the issue?

I just used the test-pkg tool to figure this out.

$ cat webkitgtk.config
BR2_PACKAGE_WAYLAND=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_LIBGTK3=y
BR2_PACKAGE_WEBKITGTK=y
BR2_PACKAGE_WEBKITGTK_MINIBROWSER=y

$ ./utils/test-pkg -p webkitgtk -c webkitgtk.config

All builds will fail due to the same reason. Are there other possible
side effects?; I don't know. All I know is that a similar issue was
fixed years ago, which was re-introduced by bumping pkg-config. Btw, I
was searching https://autobuild.buildroot.org/ for this issue, but I
didn't find any webkitgtk build. Is there a reason why this one has
never been compiled?


Kind regards,

Thomas Devoogdt


Op zo 29 dec 2024 om 23:03 schreef Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Thomas,
>
> On Tue, 17 Dec 2024 23:20:47 +0100
> Thomas Devoogdt <thomas@devoogdt.com> wrote:
>
> > I discovered that dropping "pkgdatadir" in the
> > package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
> > fixes the problem.
> > It's btw the same key that was added years ago by commit
> > 3e74c1312d35866c05813b4690412548eaaff61a.
> >
> > It fixed this error back then:
> >
> > Making all in xwayland
> > make[3]: Entering directory
> > '/home/buildroot/br5/output/build/xserver_xorg-server-1.19.0/hw/xwayland'
> > make[3]: *** No rule to make target
> > '/usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xml',
> > needed by 'relative-pointer-unstable-v1-client-protocol.h'. Stop.
> >
> > It's the same wayland-protocols that now give me those problems. So I
> > think that we can just drop "pkgdatadir" from the patch list.
>
> Do you have more details about "the same wayland-protocols that now
> give me those problems" ? Do you have a defconfig that exhibits the
> issue?
>
> Essentially, I'm obviously concerned by the side effect of changing how
> this pkgdatadir pkg-config variable gets handled. Your change will fix
> some stuff for sure, but will it break something else?
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
