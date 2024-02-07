Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F0DC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9687260F4D;
	Wed,  7 Feb 2024 19:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PagkLAIeNwxT; Wed,  7 Feb 2024 19:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E8BF61478
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E8BF61478;
	Wed,  7 Feb 2024 19:15:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB6FF1BF577
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8ACF8213C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mavjb02zlSST for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:15:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.42;
 helo=mail-lf1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D9E082132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D9E082132
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D9E082132
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:15:19 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-50eac018059so1453132e87.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 11:15:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707333317; x=1707938117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wxwgOSqlTAyIBS1BBkNVwn7otqtEvSlhvHAofkF8TG4=;
 b=WUIYDGJHyU8ascX4T2vvCHr6crlH1sPMZgaHf2r0MizjHwj9tbwgYPh3O+wQF78K1C
 bb0GpNFjClY+OQdxsZoZSJbM5VEXvMJtWlDhNLye5qLk9T/hkC+QbUUALt5EM2edDeHC
 Pw59XbEZVmn1iO6y9NUu+Bs/Wp7oRqRky4vbvsfTEe+gaUg3laeTgAwZJBPq29iupQcE
 9mLkTDx0dDl4EE2q/ic1MN0SmSOECa9GNUHvM7R/ERz5e1KSM5yywkon7iGhhvL+2R3s
 reQ67J33jJ1wbg7WzyY4ESJbsBg/08SGSIaaLKmd0/9AwIrb5RWW2f1K3Pu/G503v3EE
 x0Bg==
X-Gm-Message-State: AOJu0YxZI3vV1FSTk0N+dPLQ+Ev9CDNU+lkiNj0Lq8ageHfzWpmM62Ee
 nOhNWWFfAGOZZSkp4YrfXBs28AIWWJsN7gmTXCykclqd6VFIBI7kQJ1YNdhaWnaYvA==
X-Google-Smtp-Source: AGHT+IE63L17ogps/NwP/3s6Vq3go0YzZXz9663hzrKX3ll7rQmYFV4Li/9FXmAEie7C8cLBJEdLnw==
X-Received: by 2002:a05:6512:33cb:b0:511:4f8c:c299 with SMTP id
 d11-20020a05651233cb00b005114f8cc299mr5659840lfg.13.1707333316790; 
 Wed, 07 Feb 2024 11:15:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWncdDjk2DkAjLeY6nzL9E2AKr5jBaUt7jhr4uQE3xqRPNFGABwkTSS+wbFeCekekU+lLsb3KRcaQzrCoVnehI6aq7JF2OX3w==
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176]) by smtp.gmail.com with ESMTPSA id
 o6-20020ac24bc6000000b0051169bcd180sm144820lfq.258.2024.02.07.11.15.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 11:15:16 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d07ffa0a9cso10454391fa.2
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 11:15:16 -0800 (PST)
X-Received: by 2002:a2e:a16e:0:b0:2cf:127d:a79f with SMTP id
 u14-20020a2ea16e000000b002cf127da79fmr4940686ljl.51.1707333315995; Wed, 07
 Feb 2024 11:15:15 -0800 (PST)
MIME-Version: 1.0
References: <20240205212300.3178519-2-thomas@devoogdt.com>
 <20240205213035.3180167-1-thomas@devoogdt.com>
 <87le7wz1tv.fsf@48ers.dk>
In-Reply-To: <87le7wz1tv.fsf@48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 7 Feb 2024 20:15:04 +0100
X-Gmail-Original-Message-ID: <CACXRmJhGiYC3tN9+0hPhMsvO-DzvqTMPOB1HufaBzYszoT5eTg@mail.gmail.com>
Message-ID: <CACXRmJhGiYC3tN9+0hPhMsvO-DzvqTMPOB1HufaBzYszoT5eTg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v8 1/2] package/cairo: move to the meson
 build system
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
Cc: eric.le.bihan.dev@free.fr, Thomas Devoogdt <thomas@devoogdt.com>,
 yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 aperez@igalia.com, fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,


I compiled cairo with the same config,
once with autotools (current master), and once with the meson patch.


Compile with autotools-package:

CAIRO_CONF_OPTS += --enable-xlib --enable-xcb --with-x


cairo (version 1.17.4 [snapshot]) will be compiled with:

The following surface backends:
  ...
  Xlib:          yes
  Xlib Xrender:  no (disabled, use --enable-xlib-xrender to enable)
  XCB:           yes

The following functions:
  ...
  X11-xcb functions: no (disabled, use --enable-xlib-xcb to enable)
  XCB-shm functions: yes



Compile with meson-package:

CAIRO_CONF_OPTS += -Dxcb=enabled -Dxlib=enabled


cairo 1.17.4

  Surface Backends
    ...
    Xlib                    : YES
    Xlib Xrender            : YES
    XCB                     : YES

  Functions
    ...
    X11-xcb                 : YES
    XCB-shm                 : YES

So it seems that autotools just didn't compile xrender support,
while meson does require it.

See https://gitlab.freedesktop.org/cairo/cairo/-/blame/1.17.4/meson.build#L277.

So it seems that the git commit message should be adapted slightly.


Kr,

Thomas

Op wo 7 feb 2024 om 17:17 schreef Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > - Moved BR2_PACKAGE_CAIRO_{SCRIPT,PS,PDF,XML} to Config.in.legacy
>  >   since they are not selectable anymore in the meson-build options.
>  >   BR2_PACKAGE_CAIRO_ZLIB serves for all of them now.
>
>  > - Moved BR2_PACKAGE_CAIRO_SVG to Config.in.legacy since the PNG
>  >   option already selects that one. This is now in sync with the
>  >   meson build options.
>
>  > - Note that the dependencies for the various options are slightly changed,
>  >   but there is not much mentioned about that, the meson introduction is done
>  >   in one big commit: [1].
>
>  > - Added xlib_libXrender dependency, which was already required
>  >   before meson, it just came to my attention since it's a hard
>  >   error now.
>
> In what configuration do you see that? I just did a test with current
> master (commit 6008f2b1b901b) and the following defconfig without
> issues:
>
> BR2_arm=y
> BR2_cortex_a9=y
> BR2_ARM_ENABLE_VFP=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_CAIRO=y
> # BR2_TARGET_ROOTFS_TAR is not set
>
> --
> Bye, Peter Korsgaard
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
