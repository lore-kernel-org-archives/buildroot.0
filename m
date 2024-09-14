Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B1AC021AF
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 19:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3114584147;
	Sat, 14 Sep 2024 19:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmkFEqERUijH; Sat, 14 Sep 2024 19:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 413AA841A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413AA841A0;
	Sat, 14 Sep 2024 19:59:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C00B31BF228
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB259405F0
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImFBRpZje23p for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 19:59:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.42;
 helo=mail-lf1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4539E4055D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4539E4055D
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4539E4055D
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 19:59:01 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53655b9bbcdso3930348e87.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726343938; x=1726948738;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SJq5CKrLFcIvwX2rM/vzUWHDMf1FfNUeXWVQz0qLYGU=;
 b=MAU21UluWJjhHkhrVXfL2rgiQGWL7REdUvLoLw8FriYWCG+r4y9pLcMg+lIEHVnl7P
 S3UliiFHFt4bvzUO6SK3ybeyhOc9zg+CIMPDhfg2QVBzfCHqdMMdzt3IuBTxW/HnzNcP
 3wCoOfmNH7iyml4RvIkt0XoElz9ySFDt5UHKNJBn9/UkYd3+hraaggd4eDAguVCB1SrC
 yhS54cDvJlAOtXDCyl5XqfFTvOcyPfZ/9fjAh9u4y33CYzhfDtXilOp2x4oG6VHj2GpW
 Y2o1vL2vFZRzRBvAwJeuwzj++2TrJlV1LEMRaJa3Zl1KRwOyGcFNWn9P4jm63zLJMQCp
 bPEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnB1V1rtayZPdkqvOXmMjORtw6YOluPlEjniPm1Z4ZOB/92PeSa8tHDAaOk0X5wVa087LcPVpGA8o=@buildroot.org
X-Gm-Message-State: AOJu0YysPRGaGCqN5gUwohkwExWE58+IIHps4weljlfFU7amopZsBWj1
 hVb9l0F69EWZv3RYnOFGUW9vVg9vPyNwLNKac3aIuNMrrgTIS+Iq5QK4AGw9FJg=
X-Google-Smtp-Source: AGHT+IG/cRjqSWfsWbizDCUYM5kP8EyHwTMWOdlpSHbFHT5kqGyBInDx/Fc36pBQjgIfNeDzQ6KNVA==
X-Received: by 2002:a05:6512:3c81:b0:52e:9b15:1c60 with SMTP id
 2adb3069b0e04-53678fe6502mr6326892e87.48.1726343937827; 
 Sat, 14 Sep 2024 12:58:57 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870a465esm347464e87.198.2024.09.14.12.58.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 12:58:57 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5356bb55224so3611553e87.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 12:58:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1ERWAlJeMpSnyT+k2y5zZAi/pKGUNg691RqZ7ytgxvp8ac8DFao3YmGQ1uKl4qLdHBJS4rJVAkGE=@buildroot.org
X-Received: by 2002:a05:6512:2313:b0:533:44a3:21b9 with SMTP id
 2adb3069b0e04-53678faaf31mr5926841e87.1.1726343937157; Sat, 14 Sep 2024
 12:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240829131232.2132854-1-thomas@devoogdt.com>
 <20240829131232.2132854-3-thomas@devoogdt.com>
 <20240903231453.2fc15914@windsurf>
 <CACXRmJgb8U6pjaiUYi_oKXu=fHeCOcC+Uvmyn03etCvb+_BmEg@mail.gmail.com>
In-Reply-To: <CACXRmJgb8U6pjaiUYi_oKXu=fHeCOcC+Uvmyn03etCvb+_BmEg@mail.gmail.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 14 Sep 2024 21:58:45 +0200
X-Gmail-Original-Message-ID: <CACXRmJiP6hotP2wwx+5bKMBHeAkFL9z9+tCBqWfU-qe3SM4L-A@mail.gmail.com>
Message-ID: <CACXRmJiP6hotP2wwx+5bKMBHeAkFL9z9+tCBqWfU-qe3SM4L-A@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1] package/libgtk4: fix cairo-pdf compile
 error
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,


I just had some time to have a quick look. It seems that you already
reported this issue 2 years ago. See
https://gitlab.gnome.org/GNOME/gtk/-/issues/5072. Some upstream work
was done for this in
https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/5325, but somehow
was never properly finished. I left a small remark there.


Kr,

Thomas Devoogdt

Op di 3 sep 2024 om 23:26 schreef Thomas Devoogdt <thomas@devoogdt.com>:
>
> Hi Thomas,
>
> I will report this issue when I have time for it again. I can update the patch message once this is done.
>
> Kr,
>
> Thomas Devoogdt
>
>
> Op di 3 sep. 2024 23:14 schreef Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
>>
>> On Thu, 29 Aug 2024 15:12:30 +0200
>> Thomas Devoogdt <thomas@devoogdt.com> wrote:
>>
>> > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
>> >
>> > ../gtk/print/gtkprintoperation.c:26:10: fatal error: cairo-pdf.h: No such file or directory
>> >
>> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
>> > ---
>> >  package/libgtk4/Config.in | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
>> > index af7f57b80e..2fcae311d7 100644
>> > --- a/package/libgtk4/Config.in
>> > +++ b/package/libgtk4/Config.in
>> > @@ -23,6 +23,7 @@ config BR2_PACKAGE_LIBGTK4
>> >       # https://gitlab.gnome.org/GNOME/gtk/-/issues/6866.
>> >       depends on BR2_PACKAGE_HAS_LIBEGL
>> >       select BR2_PACKAGE_CAIRO
>> > +     select BR2_PACKAGE_CAIRO_ZLIB
>>
>> We had a previous patch somewhat similar to this (but not exactly), and
>> I made this reply:
>>
>> https://lore.kernel.org/buildroot/20240815000358.6887f1bf@windsurf/
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
