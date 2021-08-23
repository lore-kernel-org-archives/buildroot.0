Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FD3C4320A
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 12:37:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE2B1613AB
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 12:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE2B1613AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87CE64012A;
	Mon, 23 Aug 2021 12:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ls87T8aeo3nk; Mon, 23 Aug 2021 12:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E32940188;
	Mon, 23 Aug 2021 12:37:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A448F1BF2BB
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 12:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CA1F401EB
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 12:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgsaJRIFMZPd for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 12:37:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD370401D7
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 12:37:07 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id j18so21488915ioj.8
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 05:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=REDJSYiHGgFBWeNuoT/Bvkqf0SyfwwwKoOvSwFVMO8s=;
 b=HCaYWFtoqHutG79HbHsYCLAkFoSR5dtml2M4euWW+44wt/sTr/g4Dw+tcTXr4zi3WS
 6SU08Z7iWzkEWdyvV1bW0nBjgcXbLMSwVmyZzg/WefGWxVsnvX62UAPFdBjSa0n6eJKp
 RKn70lqFeYvxft0tapvJf+9qA7I/iFNow2M8W3NCPgQKLINsOOpbqqcvtKgxm93CwIP0
 s0b8FmMP9Tre4qy4DeoCr3yyYGB5Pe7T8NkSTt+4XOKVSynMoZVil04xBK7uKNw8QKg3
 0DXolb+A3Oo56U7aF567pSbn6sVAftpeZHmxqaoCMtroAU3FDycSds9oe7doecmmXTPX
 ZWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=REDJSYiHGgFBWeNuoT/Bvkqf0SyfwwwKoOvSwFVMO8s=;
 b=Ke5fmWO0IaOdyKKWnHc0jQ5V5wOA+5HSf1pmCyHV7Vb438ujqcbTjIN5HQX+IdetLP
 M2favo8RMotseGqTDSbiussaXxwA/wjgNz1cav1mVVNZt3VsfmFufHghVV9s/YQmblGa
 7bO/SSbneavJTKc4gzf1KH/UZHzDwoH3K3SKSSOjRXJo51gTQVjomTPX6jSVBvLPiNhy
 q/nDnvJcL0rZ5HiXvV0bP7LiAU05Xjz4/RHQmemfAEy8qLhU8xiMV0lQ4DBdPM1jkbyH
 dLYskDonGPP1ZfWg/UaKLJt2ZN47AOVfNhTt7lGiuqJjGlrWNgjqCHFdZsbMeSkeI2Pn
 a8/A==
X-Gm-Message-State: AOAM532SLwqkWOFcrFYYVwLwHyTnuI9O7AAC+7P0f9dM626muBnGCTyS
 +KVmbOwh7rXkrtVPdMu40/EbdQuU6lfjSLWLYoaXHQ==
X-Google-Smtp-Source: ABdhPJyg49VHzrKLwHpKpQx6xVAsodpUZHcfmJsSBuupLhiORqdCopb6yB3Q90u+e/I+qIRoNKvxuWKraby6LSFyPHU=
X-Received: by 2002:a5d:8b17:: with SMTP id k23mr26281366ion.17.1629722226506; 
 Mon, 23 Aug 2021 05:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210819213131.1212610-1-illia.bitkov@mind.be>
 <20210819235042.166611c3@windsurf>
In-Reply-To: <20210819235042.166611c3@windsurf>
From: Illia Bitkov <illia.bitkov@mind.be>
Date: Mon, 23 Aug 2021 14:36:55 +0200
Message-ID: <CA+vtFZNfKBdn+MBwgFij-VwNCx47Sm6zEVXqGqLY1WWBQm6thA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mono: force internal
 libatomic-ops for some arm variants
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0292573624363788869=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0292573624363788869==
Content-Type: multipart/alternative; boundary="00000000000064d67105ca3946a9"

--00000000000064d67105ca3946a9
Content-Type: text/plain; charset="UTF-8"

Hello,

On Thu, Aug 19, 2021 at 11:50 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Thu, 19 Aug 2021 23:31:31 +0200
> Illia Bitkov <illia.bitkov@mind.be> wrote:
>
> > Error:
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_steal_mark_stack':
> > gc.c:(.text+0x2020): undefined reference to `AO_store_full_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_mark_from':
> > gc.c:(.text+0x51c0): undefined reference to `AO_store_full_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> gc.c:(.text+0x54dc): undefined reference to `AO_store_full_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> gc.c:(.text+0x5584): undefined reference to `AO_store_full_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_mark_and_push':
> > gc.c:(.text+0x574c): undefined reference to `AO_store_full_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> ../../external/bdwgc/.libs/libgc.a(gc.o):gc.c:(.text+0x5f0c): more
> undefined references to `AO_store_full_emulation' follow
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_mark_local':
> > gc.c:(.text+0xfae4): undefined reference to
> `AO_fetch_compare_and_swap_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_finalize':
> > gc.c:(.text+0x10990): undefined reference to `AO_store_full_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> gc.c:(.text+0x10ae8): undefined reference to `AO_store_full_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_malloc_kind':
> > gc.c:(.text+0x1682c): undefined reference to `AO_store_full_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> gc.c:(.text+0x16880): undefined reference to `AO_store_full_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> ../../external/bdwgc/.libs/libgc.a(gc.o): in function `GC_make_descriptor':
> > gc.c:(.text+0x16e04): undefined reference to `AO_store_full_emulation'
> >
> /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
> ../../external/bdwgc/.libs/libgc.a(gc.o):gc.c:(.text+0x177bc): more
> undefined references to `AO_store_full_emulation' follow
> > collect2: error: ld returned 1 exit status
> >
> > Fixes:
> >
> http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0/
> >
> http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/
> > Signed-off-by: Illia Bitkov <illia.bitkov@mind.be>
>
> Thanks, but I don't really see where are the additional explanations.
> Is libatomic_ops broken for those platforms? If so, why does it affect
> only Mono and not other packages using libatomic_ops?
>
>
Problem is not with mono but rather with the internal version of bdwgc
which doesn't link with external libatomic.
I will close this patch and create a new one which fixes the linkage
problem.


> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Thanks

--00000000000064d67105ca3946a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 19, 2021 at 11:50 PM Thomas Pet=
azzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni=
@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Thu, 19 Aug 2021 23:31:31 +0200<br>
Illia Bitkov &lt;<a href=3D"mailto:illia.bitkov@mind.be" target=3D"_blank">=
illia.bitkov@mind.be</a>&gt; wrote:<br>
<br>
&gt; Error:<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): =
in function `GC_steal_mark_stack&#39;:<br>
&gt; gc.c:(.text+0x2020): undefined reference to `AO_store_full_emulation&#=
39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): =
in function `GC_mark_from&#39;:<br>
&gt; gc.c:(.text+0x51c0): undefined reference to `AO_store_full_emulation&#=
39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: gc.c:(.text+0x54dc): undefined reference t=
o `AO_store_full_emulation&#39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: gc.c:(.text+0x5584): undefined reference t=
o `AO_store_full_emulation&#39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): =
in function `GC_mark_and_push&#39;:<br>
&gt; gc.c:(.text+0x574c): undefined reference to `AO_store_full_emulation&#=
39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o):g=
c.c:(.text+0x5f0c): more undefined references to `AO_store_full_emulation&#=
39; follow<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): =
in function `GC_mark_local&#39;:<br>
&gt; gc.c:(.text+0xfae4): undefined reference to `AO_fetch_compare_and_swap=
_emulation&#39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): =
in function `GC_finalize&#39;:<br>
&gt; gc.c:(.text+0x10990): undefined reference to `AO_store_full_emulation&=
#39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: gc.c:(.text+0x10ae8): undefined reference =
to `AO_store_full_emulation&#39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): =
in function `GC_malloc_kind&#39;:<br>
&gt; gc.c:(.text+0x1682c): undefined reference to `AO_store_full_emulation&=
#39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: gc.c:(.text+0x16880): undefined reference =
to `AO_store_full_emulation&#39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o): =
in function `GC_make_descriptor&#39;:<br>
&gt; gc.c:(.text+0x16e04): undefined reference to `AO_store_full_emulation&=
#39;<br>
&gt; /home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/b=
in/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-build=
root-linux-uclibcgnueabi/bin/ld: ../../external/bdwgc/.libs/libgc.a(gc.o):g=
c.c:(.text+0x177bc): more undefined references to `AO_store_full_emulation&=
#39; follow<br>
&gt; collect2: error: ld returned 1 exit status<br>
&gt; <br>
&gt; Fixes:<br>
&gt; <a href=3D"http://autobuild.buildroot.net/results/18b017dd5b9c1d8d6c91=
303ea4f1fdd3e1b086e0/" rel=3D"noreferrer" target=3D"_blank">http://autobuil=
d.buildroot.net/results/18b017dd5b9c1d8d6c91303ea4f1fdd3e1b086e0/</a><br>
&gt; <a href=3D"http://autobuild.buildroot.net/results/1d262e9ad5bf8bf437bc=
3f2a709d84acf854d298/" rel=3D"noreferrer" target=3D"_blank">http://autobuil=
d.buildroot.net/results/1d262e9ad5bf8bf437bc3f2a709d84acf854d298/</a><br>
&gt; Signed-off-by: Illia Bitkov &lt;<a href=3D"mailto:illia.bitkov@mind.be=
" target=3D"_blank">illia.bitkov@mind.be</a>&gt;<br>
<br>
Thanks, but I don&#39;t really see where are the additional explanations.<b=
r>
Is libatomic_ops broken for those platforms? If so, why does it affect<br>
only Mono and not other packages using libatomic_ops?<br>
<br></blockquote><div><br></div><div>Problem is not with mono but rather wi=
th the internal version of bdwgc which doesn&#39;t link with external libat=
omic.</div><div>I will close this patch and create a new one which fixes th=
e linkage problem.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Thanks,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Thanks <br></div></di=
v></div>

--00000000000064d67105ca3946a9--

--===============0292573624363788869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0292573624363788869==--
