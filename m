Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7154D3E2A2
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 18:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6476E4057F;
	Mon, 28 Oct 2024 18:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QWCeIcu0j2b; Mon, 28 Oct 2024 18:54:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D35A34056D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35A34056D;
	Mon, 28 Oct 2024 18:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C66674EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 18:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7FF78104C
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 18:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEqttKrgrMiI for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 18:54:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8055B8104B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8055B8104B
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8055B8104B
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 18:54:43 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-288d70788d6so2229332fac.1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 11:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730141682; x=1730746482;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qiv81eV2hX6KGQKygfV5XdpJaDqGgTXm16qz2YFY4YY=;
 b=JNZAysi1hyraJMyzO3PtTLZIpuTASmlIG+abOb3C76KvKFkxM9n0mUbcvv7d+zSx+s
 rf9uQzcuf6SHpFq4WwYXbf1MzF+v8xJK3X4dt8g4Xip6CxzKSjHDk7nfE5aOkK2Syfhj
 1mumj8CXvrvgnefMB/5JouyuGadJ+49t7Zjw+FJO4t6S0Wwzx9UIsGLsDzcYXReWS73R
 /Lj0jmKW6b5nsfcLefG/zI/wsDNjSSXMGekkwwXo77O5/sRsPkdLyTCZ6QZ67WrX7/iW
 Y/PjkHY9gjMRarxrHFifZdtedd/PGiXPWi8AlVVxJyh4eiLrQDQ1qqaA8gtl14UHVWwG
 HJXw==
X-Gm-Message-State: AOJu0YzIQ6LoJFGe/0oLJIY9+9HLpltGc7/KCFj2xO+/LSqRssJvygKq
 NzxDY7YhMOSb74ifrb4VzuD/wfYhTWRk7wsumENknAQMkcWQyp5hCw8zpcRrN+G/6CrDukIEjLb
 O
X-Google-Smtp-Source: AGHT+IEBFIswmIbsMzlOwVLqPz2jq8h/0F2IOm177hpPbYjUtsut/Vr4FwbjBjSCFtKg9VxGvg0gNg==
X-Received: by 2002:a05:6870:b61f:b0:270:27e6:6f1a with SMTP id
 586e51a60fabf-29051de7094mr7667993fac.41.1730141682145; 
 Mon, 28 Oct 2024 11:54:42 -0700 (PDT)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com.
 [209.85.160.42]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-290380f5fdesm2172141fac.42.2024.10.28.11.54.41
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 11:54:41 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-2890f273296so2054995fac.2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 11:54:41 -0700 (PDT)
X-Received: by 2002:a05:6870:80d1:b0:28c:64e8:ae1a with SMTP id
 586e51a60fabf-29051de7450mr7493603fac.42.1730141681332; Mon, 28 Oct 2024
 11:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241028161507.186161-1-james.hilliard1@gmail.com>
In-Reply-To: <20241028161507.186161-1-james.hilliard1@gmail.com>
Date: Mon, 28 Oct 2024 11:54:32 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qYNcoSOe7-ZwcR3m9A7n+kPGHtFUVWaYCDRyy=WvMvzQ@mail.gmail.com>
Message-ID: <CA+h8R2qYNcoSOe7-ZwcR3m9A7n+kPGHtFUVWaYCDRyy=WvMvzQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1730141682; x=1730746482; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qiv81eV2hX6KGQKygfV5XdpJaDqGgTXm16qz2YFY4YY=;
 b=gwx6jgyEgSGzm5w6gDmQ5Lzip04jmG/q+b2o9nzLjgnltnHfu5jupRbBTR92xqkvTj
 DdE8jHtIxC2fCEIjsQUl0e4W7qECkgmxvLWS01Beg05Itr/AwZp1LYHfWB7hKDBJZ1hj
 h/Vu/UlX/LVROGiMa9ZBGc81K+zHisLbtFo+5Yy3r79fxxDtus8dLyCQ9yjFYck3K9QV
 yaDBtvxoCA/o6CvZ0qdelwJACyO2VqV1HqSewkc1T3CvqJowADN2cccEKfag0V9Kyuh4
 2Xx5oER9e3qp4UQT/P6gekkfYBdXgGnhyiMWPnH3ecamKdEqPIu6NPlFje4s49rsfIAQ
 mYeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=gwx6jgyE
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-golang.mk: make GOPROXY
 configurable
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: multipart/mixed; boundary="===============3506386965411440199=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3506386965411440199==
Content-Type: multipart/alternative; boundary="00000000000053c3f706258e0028"

--00000000000053c3f706258e0028
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James,

On Mon, Oct 28, 2024, 9:15=E2=80=AFAM James Hilliard <james.hilliard1@gmail=
.com>
wrote:

> Some packages like the upcoming netbird package don't work
> correctly with GOPROXY=3Ddirect which is not the default setting
> for the go toolchain.
>

https://github.com/netbirdio/netbird/pull/2789

While it is a good idea to add this option, I don't think mentioning
netbird is necessary since the intent of this option is not to make
packages that won't work with GOPROXY direct work. It's just for the
performance improvement.

When merging packages I'd still expect us to test it with GOPROXY direct as
well.

Lets make the GOPROXY setting configurable and use the default
> toolchain setting which is most likely to be what packages end
> up typically being tested against.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  Config.in             | 11 +++++++++++
>  package/pkg-golang.mk |  2 +-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/Config.in b/Config.in
> index df43db7eff..ad6ac38656 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -258,6 +258,17 @@ config BR2_PRIMARY_SITE_ONLY
>           the project can be built even if the upstream tarball
>           locations disappear.
>
> +config BR2_GOPROXY_LIST
> +       string "GOPROXY list"
> +       default "https://proxy.golang.org,direct"
> +       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +       help
> +         List of module proxy URLs. The go command will attempt to
> +         download modules from each server in sequence. The keyword
> +         direct instructs the go command to download modules from
> +         version control repositories where they=E2=80=99re developed in=
stead
> +         of using a proxy.
>

Why do we put this here as opposed to

BR2_PACKAGE_GO_GOPROXY

I'm not against it, but it's a question that comes to mind.

Also, why GOPROXY_LIST instead of just GOPROXY?

Otherwise looks good.

Best regards,
Christian Stewart

--00000000000053c3f706258e0028
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi James,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Oct 28, 2024, 9:15=E2=80=AFAM James H=
illiard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard1@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Some package=
s like the upcoming netbird package don&#39;t work<br>
correctly with GOPROXY=3Ddirect which is not the default setting<br>
for the go toolchain.<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><a href=3D"https://github.com/netbirdio/netbird/pull/2=
789">https://github.com/netbirdio/netbird/pull/2789</a></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">While it is a good idea to add this option,=
 I don&#39;t think mentioning netbird is necessary since the intent of this=
 option is not to make packages that won&#39;t work with GOPROXY direct wor=
k. It&#39;s just for the performance improvement.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">When merging packages I&#39;d still expect us to =
test it with GOPROXY direct as well.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Lets make the GOPROXY setting configurable and use the default<br>
toolchain setting which is most likely to be what packages end<br>
up typically being tested against.<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank" rel=3D"noreferrer">james.hilliard1@gmail.com</a>&gt;<=
br>
---<br>
=C2=A0Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++++=
++++<br>
=C2=A0package/<a href=3D"http://pkg-golang.mk" rel=3D"noreferrer noreferrer=
" target=3D"_blank">pkg-golang.mk</a> |=C2=A0 2 +-<br>
=C2=A02 files changed, 12 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/Config.in b/Config.in<br>
index df43db7eff..ad6ac38656 100644<br>
--- a/Config.in<br>
+++ b/Config.in<br>
@@ -258,6 +258,17 @@ config BR2_PRIMARY_SITE_ONLY<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the project can be built even if the ups=
tream tarball<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 locations disappear.<br>
<br>
+config BR2_GOPROXY_LIST<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;GOPROXY list&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;<a href=3D"https://proxy.golang.o=
rg" rel=3D"noreferrer noreferrer" target=3D"_blank">https://proxy.golang.or=
g</a>,direct&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPP=
ORTS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0List of module proxy URLs. The go comman=
d will attempt to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0download modules from each server in seq=
uence. The keyword<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0direct instructs the go command to downl=
oad modules from<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version control repositories where they=
=E2=80=99re developed instead<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of using a proxy.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Why do we put this here=
 as opposed to</div><div dir=3D"auto"><br></div><div dir=3D"auto">BR2_PACKA=
GE_GO_GOPROXY</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m no=
t against it, but it&#39;s a question that comes to mind.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Also, why GOPROXY_LIST instead of just GO=
PROXY?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Otherwise looks g=
ood.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</div>=
<div dir=3D"auto">Christian Stewart=C2=A0</div></div>

--00000000000053c3f706258e0028--

--===============3506386965411440199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3506386965411440199==--
