Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90C5C46467
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F70D4035E;
	Mon, 16 Jan 2023 20:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F70D4035E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WgOV7CkzSwQ6; Mon, 16 Jan 2023 20:38:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 114F040322;
	Mon, 16 Jan 2023 20:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 114F040322
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA0081BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9428440322
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9428440322
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86UUTfCoDmcf for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:38:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 220BB4031F
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 220BB4031F
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:38:42 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id m21so42256372edc.3
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 12:38:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Du+2UYtqvSlpa/Y5ceJspTy29PtuCqwcz45hCQKdVuE=;
 b=BbI6HT8qnwAhItyqt06GWjSvypMkTHciUWq/b9vZLq8n+nlnFcU7WOGJcemHKGyjCI
 KA1MUoDBvw4RR2k9fGYnyA6NNURLoNYDDZdisYztU7SiZGePtIaaUqRyBlFdUw9TeueQ
 F8c4S1+Q3JKOru9GIivkfqEwz5P/G6Yzks+f6me4f4d7tXpTOzf30S49QfH9Rb7JSvSt
 pzXlTpqOgXVkueBgRRFzr9bG6dhsXMJRa5wppR1XgzN30hKUbDuazVqBDkSQ6VGN7eER
 uK0kAMnMIeuzCqzEYQQFb6MgAURXTdHBPXDmpt90mMO6lk2E6SRmj+IJ6yHNN1+I94bA
 Dolw==
X-Gm-Message-State: AFqh2koXqaZDMODfWmO1n/JTH7f5Ut5oQO+WcCVkdQ8pQSE+mCK77iAj
 nlk6qEy1hUFhSuQ38hFOgZiE+swvtfk+zOO5Dfg=
X-Google-Smtp-Source: AMrXdXvzhBdf5BqvraSXxbXfrKKed0Fx6YFvkRL5HRatUoM9Dv3VK4F+IfmacrgJlb4O1geyEa/98w==
X-Received: by 2002:aa7:cc98:0:b0:486:ecd3:15f8 with SMTP id
 p24-20020aa7cc98000000b00486ecd315f8mr584341edt.6.1673901519796; 
 Mon, 16 Jan 2023 12:38:39 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 w2-20020aa7cb42000000b0046a0096bfdfsm11960735edt.52.2023.01.16.12.38.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 12:38:39 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id v6so27680314ejg.6
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 12:38:39 -0800 (PST)
X-Received: by 2002:a17:906:1946:b0:870:e329:5f3b with SMTP id
 b6-20020a170906194600b00870e3295f3bmr19071eje.255.1673901519019; Mon, 16 Jan
 2023 12:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20230116105032.1890904-1-peter@korsgaard.com>
 <20230116105032.1890904-2-peter@korsgaard.com>
In-Reply-To: <20230116105032.1890904-2-peter@korsgaard.com>
Date: Mon, 16 Jan 2023 12:38:27 -0800
X-Gmail-Original-Message-ID: <CA+h8R2rcBWzvf8bEZt0awr1bfc=5E5uq+LEC7B=h4=g8eU3Adg@mail.gmail.com>
Message-ID: <CA+h8R2rcBWzvf8bEZt0awr1bfc=5E5uq+LEC7B=h4=g8eU3Adg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Du+2UYtqvSlpa/Y5ceJspTy29PtuCqwcz45hCQKdVuE=;
 b=DqrR5AEcdI82RTAQgkMzKtjX4MxiAmCvXSPBbbrKxLHulDwHLZiqmgl04WyQgcdsUL
 VRYlVi+wmVZGCsJ11LJ4jbxZVZH+EZmhmR1CLphBfNigX+d1CmcHkd/esDXHp2v21IbT
 4I02fWPOu+0QujW54fzPawsAhTUh4dAIimVyKDydQFLEKvqaoluVhtfs5DmX2ZFm5p1r
 TYMs58kmKCApW0H9CvldVE8DdWordjAxJ/eNn/8l1wH5YSW+OWVLO4T3p1Mp3j1UqOW2
 hJM5YAVwJo8WUOpRukqL+snvU6WFW6oM1vxze/CBCYYv7HyCtdzOp4qSAE7RgydPw6vJ
 HzMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=DqrR5AEc
Subject: Re: [Buildroot] [PATCH 2/2] package/go: explicitly set GOMODCACHE
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
Content-Type: multipart/mixed; boundary="===============3323601639572278920=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3323601639572278920==
Content-Type: multipart/alternative; boundary="0000000000006e291505f26791bd"

--0000000000006e291505f26791bd
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

This reminds me of when GO111MODULE was leaking from the host environment
as well. I wonder if there's any merit to wiping the host environment
variables if br2 reproducible is enabled?



On Mon, Jan 16, 2023, 2:52 AM Peter Korsgaard <peter@korsgaard.com> wrote:

> go mod vendor caches downloaded modules to the Go module cache, which
> defaults to $GOPATH/pkg/mod - But can be overridden with the GOMODCACHE
> environment variable:
>
> https://go.dev/ref/mod#module-cache
>
> So explicitly set GOMODCACHE= for reproducibility.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/go/go.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/go/go.mk b/package/go/go.mk
> index c4f72d403c..c38ae0b99c 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -26,6 +26,7 @@ HOST_GO_COMMON_ENV = \
>         GOROOT="$(HOST_GO_ROOT)" \
>         GOPATH="$(HOST_GO_GOPATH)" \
>         GOCACHE="$(HOST_GO_TARGET_CACHE)" \
> +       GOMODCACHE="$(HOST_GO_GOPATH)/pkg/mod" \
>         GOPROXY=off \
>         PATH=$(BR_PATH) \
>         GOBIN= \
> --
> 2.30.2
>


Reviewed-by: Christian Stewart <christian@paral.in>

>
>

--0000000000006e291505f26791bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Peter,<div dir=3D"auto"><br></div><div dir=3D"aut=
o">This reminds me of when GO111MODULE was leaking from the host environmen=
t as well. I wonder if there&#39;s any merit to wiping the host environment=
 variables if br2 reproducible is enabled?</div><div dir=3D"auto"><br></div=
><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Jan 16, 2023, 2:52 AM Peter Korsgaard &lt;<a href=3D"mailto:peter@ko=
rsgaard.com">peter@korsgaard.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">go mod vendor caches downloaded modules to the Go module cach=
e, which<br>
defaults to $GOPATH/pkg/mod - But can be overridden with the GOMODCACHE<br>
environment variable:<br>
<br>
<a href=3D"https://go.dev/ref/mod#module-cache" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://go.dev/ref/mod#module-cache</a><br>
<br>
So explicitly set GOMODCACHE=3D for reproducibility.<br>
<br>
Signed-off-by: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" t=
arget=3D"_blank" rel=3D"noreferrer">peter@korsgaard.com</a>&gt;<br>
---<br>
=C2=A0package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferr=
er" target=3D"_blank">go.mk</a> b/package/go/<a href=3D"http://go.mk" rel=
=3D"noreferrer noreferrer" target=3D"_blank">go.mk</a><br>
index c4f72d403c..c38ae0b99c 100644<br>
--- a/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a><br>
+++ b/package/go/<a href=3D"http://go.mk" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">go.mk</a><br>
@@ -26,6 +26,7 @@ HOST_GO_COMMON_ENV =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOROOT=3D&quot;$(HOST_GO_ROOT)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOPATH=3D&quot;$(HOST_GO_GOPATH)&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOCACHE=3D&quot;$(HOST_GO_TARGET_CACHE)&quot; \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0GOMODCACHE=3D&quot;$(HOST_GO_GOPATH)/pkg/mod&qu=
ot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOPROXY=3Doff \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PATH=3D$(BR_PATH) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GOBIN=3D \<br>
-- <br>
2.30.2<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Reviewed-by: Christian Stewart &lt;<a hre=
f=3D"mailto:christian@paral.in">christian@paral.in</a>&gt;</div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--0000000000006e291505f26791bd--

--===============3323601639572278920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3323601639572278920==--
