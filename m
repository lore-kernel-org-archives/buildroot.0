Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53A8C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 18:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7468E60FDA;
	Wed, 26 Feb 2025 18:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TGmpSb020qsX; Wed, 26 Feb 2025 18:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95A5760FF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95A5760FF6;
	Wed, 26 Feb 2025 18:14:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 68EFF68
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 18:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4276E410E5
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 18:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_BjgrzlavDs for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 18:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.43;
 helo=mail-lf1-f43.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E3E8401AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E3E8401AE
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E3E8401AE
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 18:14:21 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-546237cd3cbso48913e87.0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 10:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740593659; x=1741198459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B6hR6XWD57BxaXeWyo7Ws25LHMmc8P13mmcCfmwo+Yo=;
 b=QF2XDMGr+p8YxQkwcZs7vxByf+P7c0d1Yl0Bc0olaCcsvbo5fVbiLa7ICaOXDlRRrP
 6tVcCWIszB74GIFf42T6digOT4duG4uYrBDk5zdnlm81w6Inhqr5J0Wo895tQi3xcf1+
 DsnfQuDTh5vpXuycu/IEtDnLm4sDDGLP10nFG3zG2xvBkdUIMRP5UwF66i4tA2gt1goU
 1bLndh8iGsQ2wZRg9lkztPHcSHIdk9sQrcArzdOS2pFDBq9LevmLhD88E+o3nClY7jWr
 j7Xk/NkjBxfzTrSmC07h4R397qYqjcJ3tXQ32FZ61/9uSUivoXKeaPGlD3qBkrEm6FIe
 jgFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe6p6hmPTjbNQRWADpPnaO//ddX1g03Wdfp7XAXqKCzdOrpsvnKNFlXB0p2BgLB0ftsshKbzDztnE=@buildroot.org
X-Gm-Message-State: AOJu0Yz4JOar17GxsUVCewKoQfTId9V5TUPGcVu2KBlIwns4qRWZ8jjc
 aFwnYRGuvNt7va5r0jFnSz8GO3ximwNtY1Wa4e1bPWB8uxc3h348/HCl2rx6iKI=
X-Gm-Gg: ASbGncttU0mS21uRGn3htxW3f4cSIlkYZWrQWYew6saqD2y5CFGQIYui/excJKFIn/w
 NT0PmdbppkX+5qrq8iZXsuXMT3QI53nYVngTP5c4lZ1OHgIc+7TDkFziokTgE7Y60gJFFolOt6R
 SGRf36mfIfEAdJJ81vfdN/MpzEuKzwyhLs4lh1ak9+CCufnRe/wVGe4eES4RMCuoTSeycjrr2IR
 uuaI8klmB+6BpgmO5QvIAOxHI3DL4QUUba2+EngRL7rC5+OtNir3iLIuqCsKr6Kc5JVlZO76cxW
 GfTZSlx9bD8brkcwXgE1jywkqE76azbFtBD8jSrhVobymdpPFOZFCu4Igjn2eJg=
X-Google-Smtp-Source: AGHT+IElxhcCUyyHOlQzcWQ0IDA5O1vpdRJnFy0x2pGEvWnMHJNSe6uqjDPB/W891l4HpDImpfSIiQ==
X-Received: by 2002:a05:6512:690:b0:545:6a2:e56 with SMTP id
 2adb3069b0e04-548510ecf32mr5384147e87.37.1740593659066; 
 Wed, 26 Feb 2025 10:14:19 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514efd5esm519798e87.148.2025.02.26.10.14.18
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 10:14:18 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-548409cd2a8so25369e87.3
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 10:14:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV7lqZ6cxPp1oekJxr5HQ+WQhDsmRDKQkTUaHSm+kqZlr/949mfP7c/m2hyEuATiW5wlPxuhYxR6uI=@buildroot.org
X-Received: by 2002:a05:6512:3ca1:b0:545:617:6f07 with SMTP id
 2adb3069b0e04-548510ce76fmr4992306e87.6.1740593658070; Wed, 26 Feb 2025
 10:14:18 -0800 (PST)
MIME-Version: 1.0
References: <CACXRmJi-K=k+bwwhtVEjAOc6wEJaS1rg_5cDFwMY2nZmR24KVQ@mail.gmail.com>
 <20241218084337.3775491-1-thomas@devoogdt.com>
 <5cb9b337-7b71-43e4-a6cd-88aa7d0f838f@korsgaard.com>
In-Reply-To: <5cb9b337-7b71-43e4-a6cd-88aa7d0f838f@korsgaard.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 26 Feb 2025 19:14:06 +0100
X-Gmail-Original-Message-ID: <CACXRmJjKusWZWaP0Z6+A7qVGAUFseoMkD8BoNPY5EYqy++er9Q@mail.gmail.com>
X-Gm-Features: AQ5f1JpNaSQZgbr7J8Op4pPUvgRFeVs8b88XXR92w9H8-ElOuts1y_eJfzEMjzo
Message-ID: <CACXRmJjKusWZWaP0Z6+A7qVGAUFseoMkD8BoNPY5EYqy++er9Q@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org,
 aperez@igalia.com, james.hilliard1@gmail.com, thomas.devoogdt@barco.com, 
 thomas.petazzoni@bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1] package/pkgconf: fix sysroot being
 prepended twice to the pkgdatadir path
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


> This is a somewhat scary change as it is hard to know if any other
> packages expect pkgdatadir to be the build time path rather than the
> runtime one, but it has been pending for a while and I guess to only
> real way to know is to give it a try.
>
> So committed to master, thanks. Can you please have a look at the
> autobuilders the next few days to see if it causes any regressions? If
> so then we may have to revert it again for 2025.02.

Thx for considering this change. I will have a look in the coming days.


Kr,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
