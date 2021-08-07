Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043DDC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 23:22:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D62061050
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 23:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D62061050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A2060628;
	Sat,  7 Aug 2021 23:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sug57bbQRhXB; Sat,  7 Aug 2021 23:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2AEC6064A;
	Sat,  7 Aug 2021 23:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F4FE1BF283
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 23:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 582F86064A
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 23:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zyk9_caZFubK for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 23:21:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6420360628
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 23:21:59 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id s184so20378089ios.2
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 16:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dN9lm4ESvCM9XJP15ZoGOML38N8QxD6vW9unCats0wk=;
 b=iXvjdGVNODu2+uuojGozGEn8MeeoeEZqL8TbPH25NDT5D/ba5KuLsO9Un55/kri2Fx
 uWBKusIS+DIiZyXF5Im2dQ5cKjeRptlMsXJ7R0fPIYNGCVDOTqqGvDWMiEOtw5aUp6nE
 JG+cxmFLn3fiFSGb3O4Rg7waibaWQnd4cLpRuXlvFeztX85RW6mlQ3SDxJL8MBojSChv
 EJqWhHnHpHd8kd5C072N8LMATuNje09jwkgu8T1wof1xDFrICz6E5bIjPuWAEDRpYaep
 PzffHOGXGhgxz5juHQV3pB+bnTtFzoBf+5Qmtj5Dsu51kgqjoZLXgsGxMflC5lg9oNFD
 EMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dN9lm4ESvCM9XJP15ZoGOML38N8QxD6vW9unCats0wk=;
 b=jUss1spOqHqvr8dKm2e10dZl4Lp2j7YAkChcJX65pCF/hSnN8w5o2wNjarmgqsMh2+
 kgUi9JsIFKTeb/f6Oh7NLhfqhumazf/5HLIcxL0M/TZfp0BCxgH1G/it9eFfPj2KfiFK
 FT4oroU7wNh6vce61lNkRzTlqTBVIf3EvHv4TU4gRh0g37CDHTNnjDOJJqIffhMt7FEd
 sVz7g8HbPjoiHwE7gAkRSmom1wWw2ncgEFLB1m2MelszfWkWnqRZaCBgdLnRMeilIpMK
 v/nI8BE1MhQYq1Fptvr9eU3j2Xw3iqAaphlAmF+bKs5QxpeN08pagR5gb0vQMG7irGVZ
 TLzA==
X-Gm-Message-State: AOAM53323mYeylUDmMu+oRlR5hnKi9FICbD6y515UuD9xH7tUuX0eStx
 43vLXC3MgWiGJtvCjpWVK5dfngxFB4bYN7Fo+Xk=
X-Google-Smtp-Source: ABdhPJzApQJbQKuoHRj8VQZUzjDKjQ8OoNDbhD3f0OH8CbaYaybYLcQFGijCviXf90+r9X2G2klSoUCcrjQ7I1jSPmQ=
X-Received: by 2002:a92:d84e:: with SMTP id h14mr620861ilq.267.1628378518424; 
 Sat, 07 Aug 2021 16:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210806184411.4062961-1-fontaine.fabrice@gmail.com>
 <20210807085303.GU27036@scaer>
In-Reply-To: <20210807085303.GU27036@scaer>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 8 Aug 2021 09:21:30 +1000
Message-ID: <CAKmqyKMgaCH0q1ZuX3dDO2-r9f55FmHLdNdK2nKghNF7mApk0g@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/guile: fix build on riscv32
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sat, Aug 7, 2021 at 6:53 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Fabrice, All,
>
> On 2021-08-06 20:44 +0200, Fabrice Fontaine spake thusly:
> > Fix the following build failure on riscv32:
> >
> > system/base/target.scm:132:16: In procedure triplet-pointer-size:
> > unknown CPU word size "riscv32"
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...stem-base-target.scm-support-riscv32.patch | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 package/guile/0004-module-system-base-target.scm-support-riscv32.patch
> >
> > diff --git a/package/guile/0004-module-system-base-target.scm-support-riscv32.patch b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
> > new file mode 100644
> > index 0000000000..cadd040f12
> > --- /dev/null
> > +++ b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
> > @@ -0,0 +1,33 @@
> > +From 995a5e1da735b75733f059615c593c330b534d80 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Fri, 6 Aug 2021 19:49:37 +0200
> > +Subject: [PATCH] module/system/base/target.scm: support riscv32
> > +
> > +Fix the following build failure on riscv32:
> > +
> > +system/base/target.scm:132:16: In procedure triplet-pointer-size:
> > +unknown CPU word size "riscv32"
> > +
> > +Fixes:
> > + - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +---
> > + module/system/base/target.scm | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/module/system/base/target.scm b/module/system/base/target.scm
> > +index 2088cd866..5544e234f 100644
> > +--- a/module/system/base/target.scm
> > ++++ b/module/system/base/target.scm
> > +@@ -121,6 +121,7 @@
> > +           ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2" "m68k" "sh3" "sh4")) 4)
> > +           ((member cpu '("s390x" "alpha")) 8)
> > +           ((string-match "^arm.*" cpu) 4)
> > ++          ((string-match "^riscv.*" cpu) 8)
>
> Are you sure that a 32-bit CPU will have 8-byte wide words? I would
> have naturrally expected them to be just 4-byte wide...
>
> If htis is indeed the case, then please explain that in the patch commit
> log...

It should be 4-byte words for riscv32. Basically the same as 32-bit
arm except when it comes to time_t types (which are always 64-bits).

Alistair
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
