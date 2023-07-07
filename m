Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BCEEB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 20:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1D1682F77;
	Fri,  7 Jul 2023 20:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1D1682F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQDz6CaiM6y0; Fri,  7 Jul 2023 20:20:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA9B582F6C;
	Fri,  7 Jul 2023 20:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA9B582F6C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE4F31BF215
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 20:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6CB882F6C
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 20:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6CB882F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUpWI69cJryM for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 20:20:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31DEC82F32
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31DEC82F32
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 20:20:01 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-992b27e1c55so279575866b.2
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 13:20:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688761199; x=1691353199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7FLVf7mT7XsSJluACffCPjaNb47F/KRd/5ruYmLyFck=;
 b=b7pzOEz6ZckSkczzOzgdlGRWmhgqIc6/l6AAEJYbjX7Zu7QrCw4CnKWUCDaMb3h1fg
 vE0Uf/aCaHHH1oME6kQ7sPI1qoWRyxhL5e+Eda15xnstFhBebhNGiGxR+sGdRXPSUKQj
 pzqVix0sbT8o/nmqRgbSWs6s0BwN97YxggPFHxC/JbJgiNxDhIJSrY/C9mDhPUy9Pl3B
 olPq3uw2bNtj2wlaW+Gnn1uDKi78wf6q+Y6GgpFQZjF62opFGuoAWCOZwWgLvAZRCdXS
 sSlOZqscloYYI9+hSgxyWWxiXokFEthsHX3n/aUrMGnP4m83kqNDpwSbPgEgIRe4FFcu
 mS8A==
X-Gm-Message-State: ABy/qLZw16yMcA1rk01ZDemu5JM0Bk/U4BPFPo5CxwC3gzKsX9GIVwHR
 MC1EcUAGUYJT9Dp61mADzZYnATkzdCCkdCZRfHLEPQ==
X-Google-Smtp-Source: APBJJlH1lsjYWvVbgXhxn7XNhk5jPDeVScjQ5itYL/G1eJvKcTto3y9Rm7FVWMAPDn/3K9i7ndBQYg==
X-Received: by 2002:a17:906:2de:b0:98a:29ca:c58e with SMTP id
 30-20020a17090602de00b0098a29cac58emr5122176ejk.27.1688761198972; 
 Fri, 07 Jul 2023 13:19:58 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com.
 [209.85.128.44]) by smtp.gmail.com with ESMTPSA id
 v27-20020a170906339b00b0098654d3c270sm2540887eja.52.2023.07.07.13.19.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 13:19:58 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3fbc12181b6so25508935e9.2
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 13:19:58 -0700 (PDT)
X-Received: by 2002:a05:600c:c8:b0:3fb:ce46:c0b3 with SMTP id
 u8-20020a05600c00c800b003fbce46c0b3mr5426862wmm.35.1688761198077; Fri, 07 Jul
 2023 13:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230707185106.98208-1-ckhardin@gmail.com>
 <CA+h8R2ro85otAvxzWshcrrwPVyrAiZ0vEdtrMNKXLX8mvOBwdA@mail.gmail.com>
 <CA+h8R2qsM9OGKgvHz_oZBSD+t4-oMjK+TMu34AneoaJVnPsnDA@mail.gmail.com>
 <CAN=fXj0yUyOncAf40AUnjt6=23ZQhqdBU7aoihfW1wViYjqWTw@mail.gmail.com>
In-Reply-To: <CAN=fXj0yUyOncAf40AUnjt6=23ZQhqdBU7aoihfW1wViYjqWTw@mail.gmail.com>
Date: Fri, 7 Jul 2023 13:19:47 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pjzUe3Vxo-ua79TxksHU2ofn+9mVXxBQ0M=UQyBQB4Kw@mail.gmail.com>
Message-ID: <CA+h8R2pjzUe3Vxo-ua79TxksHU2ofn+9mVXxBQ0M=UQyBQB4Kw@mail.gmail.com>
To: Charles Hardin <ckhardin@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1688761199; x=1691353199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7FLVf7mT7XsSJluACffCPjaNb47F/KRd/5ruYmLyFck=;
 b=NqashWo/gr5BXdiXC0ZlfxaNTZs+rwaJOc0az9DSlSVxrLKdH9KwaMKjLASwc2gh+Z
 TH67gq9iTLd2l1TZAesv/y2SSnpp+pnAk8zXnyAjYzL5avKDOvS7aNKwdswapRbijAW1
 RSrKFjh+sNLKnPUDbKecedC8+tAZn23Ge0YemDjU3UP+zU8lXDmVOj+YBDmOq/2ZRlGu
 95I6eZ6T3ul06q76Nl2Sxg5mt3OHNsbYI5O9ulCEblPxrW84up0iZXkRA1uS2DEhZdk6
 ZJOb58uicnb/pRaxYfbVjsXuYYbPUVxTdWjh1Uma+wHNDWfqofHsKntSpkDWN//SGI40
 kLnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=NqashWo/
Subject: Re: [Buildroot] [PATCH 1/1] package/go-native: add a new download
 only package for go compilers
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4118876083399067354=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4118876083399067354==
Content-Type: multipart/alternative; boundary="000000000000526fce05ffeb5b37"

--000000000000526fce05ffeb5b37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Charles,

On Fri, Jul 7, 2023, 1:05 PM Charles Hardin <ckhardin@gmail.com> wrote:

> Christian
>
> On Fri, Jul 7, 2023 at 12:08=E2=80=AFPM Christian Stewart <christian@aper=
ture.us>
> wrote:
>
>> Hi Charles,
>>
>>
>> On Fri, Jul 7, 2023 at 12:04=E2=80=AFPM Christian Stewart <christian@ape=
rture.us>
>> wrote:
>> > This is not necessary with this patch series:
>> >
>> > https://patchwork.ozlabs.org/project/buildroot/list/?series=3D358451
>> >
>> > We can correctly bootstrap on arm64.
>>
>> I should clarify: actually go bootstrap stage1 cannot work on arm64
>> (you're correct on this).
>>
>> I had submitted this patch as well to use the host "go" in this case:
>>
>>
>> https://patchwork.ozlabs.org/project/buildroot/patch/20230215073256.1864=
76-3-christian@paral.in/
>>
>> Similar to how we use host gcc.
>>
>>
> Weird - i was looking for a fix and never saw - perhaps i didn't have the
> magic google search keywords. So, this was "our fix" to just get somethin=
g
> working specifically on a aarch64 builds. This is our annual timeline of
> let's take our patches we have locally and send them upstream to see what
> happens and see if we can drop our local patches in favor of upstream fix=
es.
>
>
>> However, I understand that your series intends to add downloading the
>> binaries for the Go compiler to Buildroot as well.
>>
>> This is potentially useful but I still submit that we need to merge
>> the above series updating to Go 1.20 and splitting the bootstrap into
>> two phases before merging the go-native series.
>>
>>
> I just went for a quick and dirty to just use a native instead of doing
> the bootstrap - we have a major issue in that we don't have many x86_64
> build systems anymore and we are having to move to aarch64 builds almost
> exclusively. So, not having a way to get the compiler going was becoming =
a
> headache.
>

Ah - okay this makes sense. In this case I recommend using my patch to use
the host Go compiler to bootstrap the Go compiler.

This still compiles whatever version of Go buildroot has in the tree from
source using the host Go compiler to bootstrap.

Thomas, all; I do request that we merge the go 1.20 series and the "use
host compiler to bootstrap on unsupported architectures" patch asap as
these are significant blockers for some users (as seen here)

Thanks!

Christian

--000000000000526fce05ffeb5b37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Charles,<br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 7, 2023, 1:05 PM Charles Hardin=
 &lt;<a href=3D"mailto:ckhardin@gmail.com">ckhardin@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
>Christian</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Jul 7, 2023 at 12:08=E2=80=AFPM Christian Stewart &lt;<a =
href=3D"mailto:christian@aperture.us" target=3D"_blank" rel=3D"noreferrer">=
christian@aperture.us</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi Charles,<br>
<br>
<br>
On Fri, Jul 7, 2023 at 12:04=E2=80=AFPM Christian Stewart &lt;<a href=3D"ma=
ilto:christian@aperture.us" target=3D"_blank" rel=3D"noreferrer">christian@=
aperture.us</a>&gt; wrote:<br>
&gt; This is not necessary with this patch series:<br>
&gt;<br>
&gt; <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?series=
=3D358451" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patchwor=
k.ozlabs.org/project/buildroot/list/?series=3D358451</a><br>
&gt;<br>
&gt; We can correctly bootstrap on arm64.<br>
<br>
I should clarify: actually go bootstrap stage1 cannot work on arm64<br>
(you&#39;re correct on this).<br>
<br>
I had submitted this patch as well to use the host &quot;go&quot; in this c=
ase:<br>
<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20230215073=
256.186476-3-christian@paral.in/" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://patchwork.ozlabs.org/project/buildroot/patch/20230215073256.=
186476-3-christian@paral.in/</a><br>
<br>
Similar to how we use host gcc.<br>
<br></blockquote><div><br></div><div>Weird=C2=A0- i was looking for a fix a=
nd never saw - perhaps i didn&#39;t have the magic google search keywords. =
So, this was &quot;our fix&quot; to just get something working specifically=
 on a aarch64 builds. This is our annual timeline of let&#39;s take our pat=
ches we have locally and send them upstream to see what happens and see if =
we can drop our local patches in favor of upstream fixes.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
However, I understand that your series intends to add downloading the<br>
binaries for the Go compiler to Buildroot as well.<br>
<br>
This is potentially useful but I still submit that we need to merge<br>
the above series updating to Go 1.20 and splitting the bootstrap into<br>
two phases before merging the go-native series.<br>
<br></blockquote><div><br></div><div>I just went for a quick and dirty to j=
ust use a native instead of doing the bootstrap - we have a major issue in =
that we don&#39;t have many x86_64 build systems anymore and we are having =
to move to aarch64 builds almost exclusively. So, not having a way to get t=
he compiler going was becoming a headache.</div></div></div></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ah - okay this make=
s sense. In this case I recommend using my patch to use the host Go compile=
r to bootstrap the Go compiler.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">This still compiles whatever version of Go buildroot has in the t=
ree from source using the host Go compiler to bootstrap.</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Thomas, all; I do request that we merge th=
e go 1.20 series and the &quot;use host compiler to bootstrap on unsupporte=
d architectures&quot; patch asap as these are significant blockers for some=
 users (as seen here)</div><div dir=3D"auto"><br></div><div dir=3D"auto">Th=
anks!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Christian</div></d=
iv>

--000000000000526fce05ffeb5b37--

--===============4118876083399067354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4118876083399067354==--
