Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B71C46467
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C5E181DCA;
	Mon, 16 Jan 2023 20:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C5E181DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pwLWj1FkT5cq; Mon, 16 Jan 2023 20:37:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD3881E49;
	Mon, 16 Jan 2023 20:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BD3881E49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A27D1BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12C1860E4A
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12C1860E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9r8ZOOJ7exQ for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:37:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCDF860E22
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCDF860E22
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:37:04 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id tz11so6285039ejc.0
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 12:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MfEIXfNIgRmk99FUphDn1Ji0x57qxXYunIqlN7/T+yA=;
 b=wcxAaiw0Br4HWQb71soEiFWBTJjvNVLRbSx3RaOhI3OnlbGG4yEGAPRk3TwV/lmCsH
 kiry7KU3KXAihrFxfN6RG+pH72cr8H58eafMZJfVb2w5MKh4sky9PUxJ9RcDrJ8P+3VZ
 kXVKbrN3sziudTqS6JNWn88uCCwciZnwdo+oex6TzX8KWmwvghKrTZeO3BXb6igsC351
 0EWvNSzJtnBHWF/pBE4Ivjvm0yPSlVadjW7wbBBG0ldpgt+2cXUDWZOOdmmfz6BdmM9E
 XLHQeyRO8k96qNSBkHmb+iZ0IW2sF6ogfCsn77wqWQ5YDHp846/MU4qA14wyJGnS1pAe
 zDcA==
X-Gm-Message-State: AFqh2krd9C4Uh8ph+Ujd6j0j7c/T3x6kNosGa3ZO/fFjzNMW/Sj90Seu
 ed6f2p+agguWqhGjVQFiaOwTKmv/wbTZK8K2
X-Google-Smtp-Source: AMrXdXuPztUGypL8nLklT06J3LzAY2yedvOAO1JQJTrd94jDZ4/bPZSLaA6Ljx3//ZzIngQiGCKQnQ==
X-Received: by 2002:a17:907:cbc5:b0:7ad:9455:d57d with SMTP id
 vk5-20020a170907cbc500b007ad9455d57dmr292871ejc.74.1673901422575; 
 Mon, 16 Jan 2023 12:37:02 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 et21-20020a170907295500b00871f66bf354sm597882ejc.204.2023.01.16.12.37.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 12:37:02 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id ss4so63397496ejb.11
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 12:37:01 -0800 (PST)
X-Received: by 2002:a17:906:4ed8:b0:871:ed54:609f with SMTP id
 i24-20020a1709064ed800b00871ed54609fmr45070ejv.180.1673901421351; Mon, 16 Jan
 2023 12:37:01 -0800 (PST)
MIME-Version: 1.0
References: <20230116105032.1890904-1-peter@korsgaard.com>
In-Reply-To: <20230116105032.1890904-1-peter@korsgaard.com>
Date: Mon, 16 Jan 2023 12:36:50 -0800
X-Gmail-Original-Message-ID: <CA+h8R2q16vjmAME02D5rSLyEqRN7BSG=shb6f78z4tNKPJRD5g@mail.gmail.com>
Message-ID: <CA+h8R2q16vjmAME02D5rSLyEqRN7BSG=shb6f78z4tNKPJRD5g@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MfEIXfNIgRmk99FUphDn1Ji0x57qxXYunIqlN7/T+yA=;
 b=LGCOTIVsxUIhgHIfO+ohy2EtQENVDA2cptLrhTHz+J8WVeuDvw32kNnLP/jtkYRILF
 VaXSWA5i0FYNKLyXwv3cR91lhfoUI+L1hP8aAd+Tj1bYmURzYPNIR3nPNUqmdF+8tbCt
 Ootq7BzSYRJTDA1Jl446+49jG1Uu1zD1MekeE4ZpwbgiMpgmrXaAn4Rj3wUkYEqcTpAo
 W6LWi0X7LxrGKOrIC8Y3PhPkO98wo/jvL3ybKuE28cutUVzVUtBvJ2B2bakRSgO8Lj1R
 d8+WUIcXwnQSVssv6juk0yo5TvPQlrNe8T5jolNtQln3a0dfITMhRDXuMANkNDV0Zstq
 Uqbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=LGCOTIVs
Subject: Re: [Buildroot] [PATCH 1/2] package/go: set GOCACHE for download
 post-process
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7350171389868220557=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7350171389868220557==
Content-Type: multipart/alternative; boundary="0000000000009bda0f05f2678b64"

--0000000000009bda0f05f2678b64
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Thought this was set already!


On Mon, Jan 16, 2023, 2:52 AM Peter Korsgaard <peter@korsgaard.com> wrote:

> The go mod vendor call in support/download/go-post-process accesses the go
> cache, so pass GOCACHE= in the environment to ensure our cache directory is
> used.
>
> The go cache defaults to ~/.cache/go-build if not set, so this fixes builds
> where that location (or GOCACHE if set in the environment) is not writable:
>
> rm -rf ~/.cache/go-build
> chmod -w ~/.cache
> make docker-compose-source
> ..
> failed to initialize build cache at /home/peko/.cache/go-build: mkdir
> /home/peko/.cache/go-build: permission denied
> make[1]: *** [package/pkg-generic.mk:189:
> /home/peko/source/buildroot/output/build/docker-compose-2.14.0/.stamp_downloaded]
> Error 1
>
> We use two different cache directories for target and host builds, but the
> download/vendoring should be independent of the architecture, so use the
> target variant even for host-only packages for simplicity.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/go/go.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/go/go.mk b/package/go/go.mk
> index d3ed07f03b..c4f72d403c 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -25,6 +25,7 @@ HOST_GO_COMMON_ENV = \
>         GOFLAGS=-mod=vendor \
>         GOROOT="$(HOST_GO_ROOT)" \
>         GOPATH="$(HOST_GO_GOPATH)" \
> +       GOCACHE="$(HOST_GO_TARGET_CACHE)" \
>         GOPROXY=off \
>         PATH=$(BR_PATH) \
>         GOBIN= \
> @@ -75,7 +76,6 @@ HOST_GO_TARGET_ENV = \
>         $(HOST_GO_COMMON_ENV) \
>         GOOS="linux" \
>         GOARCH=$(GO_GOARCH) \
> -       GOCACHE="$(HOST_GO_TARGET_CACHE)" \
>         CC="$(TARGET_CC)" \
>         CXX="$(TARGET_CXX)" \
>         CGO_CFLAGS="$(TARGET_CFLAGS)" \
> --
> 2.30.2
>


Reviewed-by: Christian Stewart <christian@paral.in>

>
>

--0000000000009bda0f05f2678b64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Peter,<div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thought this was set already!</div><br><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 16, 2023, 2:52 AM Peter Kor=
sgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">The go mod vendor call in=
 support/download/go-post-process accesses the go<br>
cache, so pass GOCACHE=3D in the environment to ensure our cache directory =
is<br>
used.<br>
<br>
The go cache defaults to ~/.cache/go-build if not set, so this fixes builds=
<br>
where that location (or GOCACHE if set in the environment) is not writable:=
<br>
<br>
rm -rf ~/.cache/go-build<br>
chmod -w ~/.cache<br>
make docker-compose-source<br>
..<br>
failed to initialize build cache at /home/peko/.cache/go-build: mkdir /home=
/peko/.cache/go-build: permission denied<br>
make[1]: *** [package/<a href=3D"http://pkg-generic.mk:189" rel=3D"noreferr=
er noreferrer" target=3D"_blank">pkg-generic.mk:189</a>: /home/peko/source/=
buildroot/output/build/docker-compose-2.14.0/.stamp_downloaded] Error 1<br>
<br>
We use two different cache directories for target and host builds, but the<=
br>
download/vendoring should be independent of the architecture, so use the<br=
>
target variant even for host-only packages for simplicity.<br>
<br>
Signed-off-by: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" t=
arget=3D"_blank" rel=3D"noreferrer">peter@korsgaard.com</a>&gt;<br>
---<br>
=C2=A0package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferr=
er" target=3D"_blank">go.mk</a> b/package/go/<a href=3D"http://go.mk" rel=
=3D"noreferrer noreferrer" target=3D"_blank">go.mk</a><br>
index d3ed07f03b..c4f72d403c 100644<br>
--- a/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a><br>
+++ b/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a><br>
@@ -25,6 +25,7 @@ HOST_GO_COMMON_ENV =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOFLAGS=3D-mod=3Dvendor \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOROOT=3D&quot;$(HOST_GO_ROOT)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOPATH=3D&quot;$(HOST_GO_GOPATH)&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GOCACHE=3D&quot;$(HOST_GO_TARGET_CACHE)&quot; \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOPROXY=3Doff \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PATH=3D$(BR_PATH) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOBIN=3D \<br>
@@ -75,7 +76,6 @@ HOST_GO_TARGET_ENV =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(HOST_GO_COMMON_ENV) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOOS=3D&quot;linux&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOARCH=3D$(GO_GOARCH) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0GOCACHE=3D&quot;$(HOST_GO_TARGET_CACHE)&quot; \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D&quot;$(TARGET_CC)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CXX=3D&quot;$(TARGET_CXX)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CGO_CFLAGS=3D&quot;$(TARGET_CFLAGS)&quot; \<br>
-- <br>
2.30.2<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Reviewed-by: Christian Stewart &lt;<a hre=
f=3D"mailto:christian@paral.in">christian@paral.in</a>&gt;</div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--0000000000009bda0f05f2678b64--

--===============7350171389868220557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7350171389868220557==--
