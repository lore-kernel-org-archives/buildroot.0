Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCBDD10C02
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 18:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53AEB40305;
	Sat, 26 Oct 2024 18:25:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gNoi9qGgNg8T; Sat, 26 Oct 2024 18:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3A01402FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A01402FE;
	Sat, 26 Oct 2024 18:25:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 00D1F5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 18:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F05B6605CA
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 18:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMeX3y_RxVx2 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 18:25:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.52;
 helo=mail-lf1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C908A605C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C908A605C6
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C908A605C6
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 18:25:41 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-539f72c913aso3901883e87.1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729967139; x=1730571939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8dJ2LoEnUa5r/kAUfXGNOqvZvQ2v/+i8S6hbXsvK/aQ=;
 b=K8g3V53+Hc2sfaZyXCwJpyL+RaZmyxCb6HkTQSGM1vQKCFLu/WHRTZ1XJDg+3ZvB3c
 f2wKlh6Se0jhyz3T08j7ycG7rwbmF3aHKaPQRyJPLjg0bBRzTb37B/bu11MuQwDDQZqz
 2TmQOy9cMI6FMEzPI7VtP0L25jtNgg0fXnLUGlYi5K22TdikJ7svKF4nCEdiZudI5TqZ
 6DXCdIqaVt4tO2GDBh4JONzrNTxiNgie04dutUg2tCxPP3MHbOwkACTJSzDbCoqGTMRM
 9csiqmwx6LY4qp41Y2OSbUroZTltqN8l63BFliXvK0ls8C2tAbxWkHxI+47A35MAHPEz
 rHrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrGumL1uksbyeFyH4j5U6ATqZkz+F4nSZ91mlUdVEdtJO8zzZdXQVryGlkoKMQMjqOxiOhVIqKYJY=@buildroot.org
X-Gm-Message-State: AOJu0Yx2FnWCnWfq3fMf8vCaN7Sl2vEJsN6Nkz+ZooTY5MDIxjAEEXON
 BIQdeXbIgbKxcEkoUA7DPPqMwy7Fklr8UvVhVhpZhhDWpdSpmxdKUKINqODF
X-Google-Smtp-Source: AGHT+IH5hp2iZ8CAupz62g8gbZTVzBrvES198VpM3oAKX90BsTG62E052hQohxuZvyqbd4Rfm/8Xrw==
X-Received: by 2002:a05:6512:3f1c:b0:539:e761:c21a with SMTP id
 2adb3069b0e04-53b34a365c7mr1423056e87.48.1729967138707; 
 Sat, 26 Oct 2024 11:25:38 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1df2f3sm568382e87.248.2024.10.26.11.25.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Oct 2024 11:25:37 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539fbe22ac0so3317298e87.2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:25:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTHaK7HVugynoI+1PAlnHPrtZuWInoqiWoJ1KK7TQ0EJp96C3PdTFAqDoalVuoUJKSt+8BqDrb2Lw=@buildroot.org
X-Received: by 2002:a05:6512:2393:b0:52c:dc97:45d1 with SMTP id
 2adb3069b0e04-53b348c3841mr1339945e87.10.1729967137620; Sat, 26 Oct 2024
 11:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240920062014.132862-1-thomas@devoogdt.com>
 <20240920062014.132862-2-thomas@devoogdt.com>
 <20241026164305.34881a98@windsurf>
In-Reply-To: <20241026164305.34881a98@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 26 Oct 2024 20:25:26 +0200
X-Gmail-Original-Message-ID: <CACXRmJgoySzrYAu0KCNSfnXAxrFwameDABJR-AXoAiYxSX+2iQ@mail.gmail.com>
Message-ID: <CACXRmJgoySzrYAu0KCNSfnXAxrFwameDABJR-AXoAiYxSX+2iQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org, 
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Bart Van Severen <bart.vanseveren@barco.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v1 2/2] package/libwebsockets: fix
 LWS_MAX_SMP when BR2_TOOLCHAIN_HAS_THREADS is set
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

Hi Thomas

Op za 26 okt 2024 om 16:43 schreef Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Thomas/Bart,
>
> On Fri, 20 Sep 2024 08:20:14 +0200
> Thomas Devoogdt <thomas@devoogdt.com> wrote:
>
> > From: Bart Van Severen <bart.vanseveren@barco.com>
> >
> > "If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
> >  in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
> >  amount of pthread mutex code is built into the library."
> >
> > This is a misconception, when unset, LWS_MAX_SMP is actually set to 1,
> > so mutexes aren't built in.
> >
> > To fix, set it to 32 explicitly when threads are enabled.
> >
> > https://libwebsockets.org/lws-api-doc-master/html/md_READMEs_README_8coding.html
> >
> > Signed-off-by: Bart Van Severen <bart.vanseveren@barco.com>
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > ---
> >  package/libwebsockets/libwebsockets.mk | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
>
> The question is then why 32, and not 8, 16, or 64 ?

The original comment mentioned the number 32, so it makes sense to keep that 32.

Also, see this older manual
https://libwebsockets.org/lws-api-doc-master/html/md_README.coding.html:
"You can control the context basic data allocation for multithreading
from Cmake using -DLWS_MAX_SMP=, if not given it's set to 32."

And this newer manual
https://libwebsockets.org/lws-api-doc-master/html/md_READMEs_README_8coding.html:
"You can control the context basic data allocation for multithreading
from Cmake using -DLWS_MAX_SMP=, if not given it's set to 1. "

So, given that the original manual talks about 32, it makes sense to
use it, even though it is no longer valid.
Other values will also work, as long the minimum is 2. But I guess
that this 32 is a good trade-off.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Kr,

Thomas Devoogdt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
