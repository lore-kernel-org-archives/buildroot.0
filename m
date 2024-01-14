Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CFAC4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 18:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3495782389;
	Sun, 14 Jan 2024 18:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3495782389
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OokfsWrz5hGE; Sun, 14 Jan 2024 18:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 769F782310;
	Sun, 14 Jan 2024 18:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 769F782310
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D1CB1BF316
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 18:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 643434018A
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 18:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 643434018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tdg38YzEyb3V for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 18:00:54 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2942B40181
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 18:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2942B40181
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2cd46e7ae8fso88440231fa.1
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 10:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705255251; x=1705860051;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yaiYvbBFnfeYXEZ9HVxz4izZ+iUryAMXcjdBvScH4OY=;
 b=rQl2WNLJu7u8tYn2miabwuVSWWg8D1D0/LDoOytQDSS7ibPqIXOH5n64si7lsQOMkl
 Uf3+BOYQ6taboQO4zaKyyqcZhfs6MyUjpD1+w5JKi+xJH/88NF8//HXp7qER+YDv2En+
 yY5HK+ldijbMVQT5AHISOpKAIe6Jjvnr4Cu33152WElPF+JQpV1IAwUC9WjevGhJHIFR
 jPDEUZk8l5ikYF0J1NSD9XiVw7s3q6I3/f0noR6ixIU7GfDk+StPpoeTRHJYPKMnZIk1
 G4BDLjL16jUIBWfLf/pByAHsdmtdiACAWPVsZ0gru0u76YNX6WSkvhg3YuANCYA5agaE
 KqzQ==
X-Gm-Message-State: AOJu0YyYAw6rxjmmYufgIkimhQONLkMv4ihy3fDurzMEBtfaqvZKhOmY
 XTdg/j8FMeGHPswTFRLaMR31Bdq/XHb68A==
X-Google-Smtp-Source: AGHT+IGat25OGx2jq7PNirHKvceFhSRXZqGiej1vMuyoB/u/t9K+84NMp/oIh3hXEV29EvMcXpyYhA==
X-Received: by 2002:a2e:a4a6:0:b0:2cd:1c9d:42a1 with SMTP id
 g6-20020a2ea4a6000000b002cd1c9d42a1mr894323ljm.51.1705255251299; 
 Sun, 14 Jan 2024 10:00:51 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 5-20020a05651c00c500b002cca6703b16sm1134921ljr.44.2024.01.14.10.00.50
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jan 2024 10:00:51 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-50e7e55c0f6so9581134e87.0
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 10:00:50 -0800 (PST)
X-Received: by 2002:a05:6512:4023:b0:50e:8c2e:b0fb with SMTP id
 br35-20020a056512402300b0050e8c2eb0fbmr1306807lfb.33.1705255250785; Sun, 14
 Jan 2024 10:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20240113183715.404990-1-thomas@devoogdt.com>
 <ZaPNRFHggbqe4DNM@landeda>
In-Reply-To: <ZaPNRFHggbqe4DNM@landeda>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sun, 14 Jan 2024 19:00:37 +0100
X-Gmail-Original-Message-ID: <CACXRmJj_RLgX7yHPCc6cv7tn4mHkcJvrhY9kzJ9fbdH6Y-pa8Q@mail.gmail.com>
Message-ID: <CACXRmJj_RLgX7yHPCc6cv7tn4mHkcJvrhY9kzJ9fbdH6Y-pa8Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v1] package/libglib2: fix libintl support
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

I also thought that at first sight. I even patched the meson file to
skip it altogether when NLS is not enabled. By this, the configure
step was ok, but then, I got include errors later on. But this is
perhaps just a bug on their side. Will need some time to dig further.

Kind regards,

Thomas

Op zo 14 jan 2024 om 13:02 schreef Yann E. MORIN <yann.morin.1998@free.fr>:
>
> Thomas, All,
>
> On 2024-01-13 19:37 +0100, Thomas Devoogdt spake thusly:
> > Commit 12ba3563655e3ebab252e52daa6c710864fa869f disabled
> > support for wrap downloads, which is used to fetch a
> > fallback libintl implementation if needed. So add one ourselves,
> > the files are fetched from https://github.com/frida/proxy-libintl/tree/0.4.
>
> Isn't the fix jsut a matter of passing;
>     -Dnls=$(if $(BR2_SYSTEM_ENABLE_NLS),enabled,disabled)
>
> in the _CONF_OPTS ?
>
> See the review of the 2.76.4 bump:
>     https://patchwork.ozlabs.org/project/buildroot/patch/20230726171923.334017-1-bernd@kuhls.net/
>
> > Fixes: http://autobuild.buildroot.org/results/04d/04d9a17e64503e0bece7bad33549ef3ad4b237c9/build-end.log.
> >
> > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> > ---
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
