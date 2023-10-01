Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C06E748EE
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A74081DFC;
	Sun,  1 Oct 2023 16:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A74081DFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFtHIwrY3pVf; Sun,  1 Oct 2023 16:38:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 278A681B83;
	Sun,  1 Oct 2023 16:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 278A681B83
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B22F71BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B0E541E10
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B0E541E10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5B13XXV05C_e for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:38:18 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5DA8641E0D
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:38:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DA8641E0D
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-50308217223so24019259e87.3
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 09:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696178296; x=1696783096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mhtU5+k8yvGRIZR0jJ87jiCGnMyugiugN5nNmkfE/Vs=;
 b=FlPntt45We8/eG9BSF3oVxJeaAEXsfItxbLnBxuDwalYpwpavqOMY339KNZEy0u7X/
 PTKvmhi6fuckEjkInmObFlCVtM2Scd5r39nyKYY+iaV4MyNDdNd99p1uJrD43MDIJ5Ti
 DtxzSmIr16LBNOZ1rlbYxXTEAK2RcPITRNd+f/71rDrDsDpexWPkWnmRPfICYdq/HyYP
 POCtmKFN3EcpLN/T5z74nUUEiZWmMWusxpWUirENZZEfS+7uRAF0KWTHwd7nZjY0I4qW
 flPFmVNY+jjxeT7j5eu0t4J9Rc/NhuNhru6urRVvgyvH6IFO79dqcUMjKkGVZkcw/wKR
 L0hQ==
X-Gm-Message-State: AOJu0Yzr1dshtPTotJWnRb/1ZUWrYI8vLtbBX3wYE0LjegNQrUeySSHy
 p9951ZW0Eoc/PxgbWVJpdlhWL7OF4HllPabm
X-Google-Smtp-Source: AGHT+IFxKArCEKzQIoAmmyu2T7fi9O8Yx8pkDCK2rbIvaf0ps7G1ENQ0jAJoPCGj6uRHoo/F7HBH/g==
X-Received: by 2002:a05:6512:39c7:b0:504:30eb:f2ac with SMTP id
 k7-20020a05651239c700b0050430ebf2acmr9190913lfu.68.1696178295480; 
 Sun, 01 Oct 2023 09:38:15 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 j26-20020a19f51a000000b0050420eff124sm1648513lfb.152.2023.10.01.09.38.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 09:38:15 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-50307acd445so24051346e87.0
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 09:38:14 -0700 (PDT)
X-Received: by 2002:ac2:46d7:0:b0:500:c534:3e4e with SMTP id
 p23-20020ac246d7000000b00500c5343e4emr7184292lfo.60.1696178294795; Sun, 01
 Oct 2023 09:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230929075844.1145939-1-thomas.devoogdt@barco.com>
 <20230929075844.1145939-3-thomas.devoogdt@barco.com> <87r0me5y6h.fsf@48ers.dk>
In-Reply-To: <87r0me5y6h.fsf@48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 1 Oct 2023 18:38:03 +0200
X-Gmail-Original-Message-ID: <CACXRmJg2Bt7-mYCYrWo_+eJWx9W6yDNv8i4gS6c_+114BD28rA@mail.gmail.com>
Message-ID: <CACXRmJg2Bt7-mYCYrWo_+eJWx9W6yDNv8i4gS6c_+114BD28rA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v3 3/4] package/webkitgtk: select
 wpebackend-fdo if wayland target is enabled
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter, all,

Yes, the links in the git message are about the OptionsGTK and not the
OptionsWPE, so yes, these are apparently both sharing the
wpebackend-fdo lib.

Kr,

Thomas

Op zo 1 okt 2023 om 14:23 schreef Peter Korsgaard <peter@korsgaard.com>:
>
> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > libwep & wpebackend-fdo are mandatory if ENABLE_WAYLAND_TARGET and EGL_FOUND
>  > https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L388-L400
>
>  > egl is mandatory if ENABLE_WAYLAND_TARGET
>  > https://github.com/WebKit/WebKit/blob/2e35890b1fa9da39ffaa88e0acd973beb55d4ad2/Source/cmake/OptionsGTK.cmake#L462-L473
>
>  > So wpebackend-fdo (-> libwpe) has to be selected if BR2_PACKAGE_LIBGTK3_WAYLAND.
>
> Huh? I cannot say that I understand the webkit mess, but I thought that
> webkitgtk and wpewebkit were two completely separate "ports"?
>
> Adrian, maybe you can clarify?
>
> --
> Bye, Peter Korsgaard
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
