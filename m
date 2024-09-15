Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EF8C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF1ED40012;
	Sun, 15 Sep 2024 14:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1C2GquJoXbre; Sun, 15 Sep 2024 14:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87BD24063E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87BD24063E;
	Sun, 15 Sep 2024 14:18:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB2061BF365
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E375C60707
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 14:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8bUJZQ2-SgI for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 14:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE9C7606BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE9C7606BD
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE9C7606BD
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 14:18:00 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-710d861eb56so1606536a34.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726409880; x=1727014680;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TikDOAVu5A8nLGATWAGvWGZ3FT+BhWPFnuea3WweGa8=;
 b=pVdkPEDdghYmL4Vvc0CKgnfHI5aFLwlJNQmYKhoeUr4lW1IiiVOUGosKqXRrr4LgJh
 CYFhv6biez9q7Cn9mzPYn9NrNgXZhozp7rKNENw4SJHGtE8JP1nyD0varm0H4CLDrKBx
 4uWL2TY1X3wPqxA9NgaRyaIYwfsSBT45HDEULB1QCsmG7HIh5oBUix8XS3eucSBVZE/a
 0pQcEKQHIW4RLAzdKX2ebCFZxXrA54vjmFENBnTrRkHdvyHvufLevRKVQlqI196Lk6DX
 /0LDmSmEHq/McsMr0xSTAfzK6bh7/QjuuvuxknmNRMNRl6SnnfiCoMQieMbCpPyLaDIH
 n3EQ==
X-Gm-Message-State: AOJu0YxVaWoH0XWkmMlXtHuPlsiRLv0PnihZshF0ORNKBK6bHe3X39Lj
 ov8HOutrYMABBlSugqs7Jp9hx9pqbQ/XLBu8QRbzLWDydHyB+gz00gIvET4Ho2H9syaf1iMrRwK
 9xK0=
X-Google-Smtp-Source: AGHT+IHMxY9361wQri87fo5MGG1bSJZGL0KjXBvTeGiPSy+3M8uR9QXDxJYi24AfXnKGZvJVigGHCA==
X-Received: by 2002:a05:6830:2692:b0:709:3daf:39a1 with SMTP id
 46e09a7af769-711094c03cemr7857292a34.27.1726409879483; 
 Sun, 15 Sep 2024 07:17:59 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com.
 [209.85.167.174]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71239e7fa31sm691753a34.5.2024.09.15.07.17.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 07:17:58 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3e037b80140so1504529b6e.3
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:17:58 -0700 (PDT)
X-Received: by 2002:a05:6871:790:b0:270:74f2:8e97 with SMTP id
 586e51a60fabf-27c3f26d34emr6463891fac.15.1726409877789; Sun, 15 Sep 2024
 07:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAEpB38NWKuFapnjbEofugLm-csmkwq1dUbvh0jRbcPRVO5K19Q@mail.gmail.com>
 <302021cc-1bc6-4ac1-b1e1-be63902f2a9a@mind.be>
In-Reply-To: <302021cc-1bc6-4ac1-b1e1-be63902f2a9a@mind.be>
Date: Sun, 15 Sep 2024 07:17:48 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qdFf+KrW6GT1J1ApPvVGoc56ZDAUOrJA_wpsm58k0G4A@mail.gmail.com>
Message-ID: <CA+h8R2qdFf+KrW6GT1J1ApPvVGoc56ZDAUOrJA_wpsm58k0G4A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1726409880; x=1727014680; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TikDOAVu5A8nLGATWAGvWGZ3FT+BhWPFnuea3WweGa8=;
 b=l8qE6lmAAiBosqt6BRJzoFYGNOCamwWfkbc9Brdtr+NqSyPYyjv4yRo6BB6sDjP3wZ
 v/E4RQdA+/UNh7c7QicxAqXu2q0kH+wZdxTbmzUc2okzGClrMT3cvXGG7m5O0EQdEsbv
 YQkyJi6eG/ehDzV2wZ7r7PTXgHAeAW2JSlv39hgSuLy55E+aIUpQOdnB0cgikboU//pw
 JTlfmnRoOItv4yuKIkqrYAVIg/inBp8Bvy+gzBF55YGPBID5j5HkcM1mwN1iq/pwT0zJ
 XphRGCM+09C/jBqK1AcTNQ48+zWtbgA54c6vHpPR3Cu2SU9KQifRGIwjhbeUFHwXeA+f
 xQ6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=l8qE6lmA
Subject: Re: [Buildroot] [PATCH v8 1/1] package/go: use host compiler when
 go-bootstrap unsupported
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4029752115050021741=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4029752115050021741==
Content-Type: multipart/alternative; boundary="00000000000080b4300622291fa8"

--00000000000080b4300622291fa8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arnout,

On Sun, Sep 15, 2024, 2:15=E2=80=AFAM Arnout Vandecappelle <arnout@mind.be>=
 wrote:

>   Hi Christian,
>
>
>   The solution is quite simple: make this approach an option, rather than
> automatically selecting depending on if go-bootstrap-stage1 is supported
> or not.
> Something like: when you select go-src, a new choice pops up to choose
> between
> full bootstrap or bootstrap from a downloaded binary.
>

I agree this is a good option and the new host-go-bin option accomplished
this.

But what if we want to bootstrap from source, not download and trust a pre
built binary?

> This patch adds a fallback to require a host Go compiler to build
> host-go-src
> > when BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS is not set.
>
>   We also discussed this one. Relying on the host Go compiler is tricky
> because
> then you also have to check its version (which this patch doesn't do
> AFAICS).
> And it's always tricky to rely on host tools when it comes to
> reproducibility.
>

You do not need to check that version. The go compiler bootstrap script
does these checks and also builds the compiler with itself multiple times
to eliminate any variance from the bootstrap toolchain.

  So we think it's better to instead download the Go compiler. In terms of
> build
> time, it shouldn't make much of a difference whether it's downloaded or
> the host
> Go is used. And with the download it always works (at least on supported
> platforms), even if there is no Go installed on the host.
>

See above for my reasoning on why, but I digress.

Best regards,
Christian Stewart

--00000000000080b4300622291fa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi=C2=A0Arnout,<br><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 15, 2024, 2:15=E2=80=AFAM A=
rnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0 Hi Christian,<b=
r><br>
<br>
=C2=A0 The solution is quite simple: make this approach an option, rather t=
han <br>
automatically selecting depending on if go-bootstrap-stage1 is supported or=
 not. <br>
Something like: when you select go-src, a new choice pops up to choose betw=
een <br>
full bootstrap or bootstrap from a downloaded binary.<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">I agree this is a good=
 option and the new host-go-bin option accomplished this.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">But what if we want to bootstrap from sou=
rce, not download and trust a pre built binary?</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
&gt; This patch adds a fallback to require a host Go compiler to build host=
-go-src<br>
&gt; when BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS is not set.<br=
>
<br>
=C2=A0 We also discussed this one. Relying on the host Go compiler is trick=
y because <br>
then you also have to check its version (which this patch doesn&#39;t do AF=
AICS). <br>
And it&#39;s always tricky to rely on host tools when it comes to reproduci=
bility.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">You do not need to check that version. The go compiler bootstrap scr=
ipt does these checks and also builds the compiler with itself multiple tim=
es to eliminate any variance from the bootstrap toolchain.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
=C2=A0 So we think it&#39;s better to instead download the Go compiler. In =
terms of build <br>
time, it shouldn&#39;t make much of a difference whether it&#39;s downloade=
d or the host <br>
Go is used. And with the download it always works (at least on supported <b=
r>
platforms), even if there is no Go installed on the host.<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">See above for my r=
easoning on why, but I digress.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Best regards,</div><div dir=3D"auto">Christian Stewart</div></div=
>

--00000000000080b4300622291fa8--

--===============4029752115050021741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4029752115050021741==--
