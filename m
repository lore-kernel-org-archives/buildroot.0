Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3A7C021AA
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 18:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8444740BBD;
	Tue, 18 Feb 2025 18:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifRj7Y_sUr8X; Tue, 18 Feb 2025 18:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 389FA40628
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 389FA40628;
	Tue, 18 Feb 2025 18:24:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CA5BDC8
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 18:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9A0B40628
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 18:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvHRcd7jc9F1 for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 18:24:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=peter.macleod.thompson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9203F40BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9203F40BBD
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9203F40BBD
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 18:24:39 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38f29a1a93bso3805359f8f.1
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 10:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739903077; x=1740507877;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EH3Uir8H8PePJMir6YQbPAGARaw592YmYgW4McmYTU0=;
 b=mNLvw9uxvXKY6uFc+NktDJ/l6sIyBDPezLOFaSqJnbR2S9iqnp3kaiiutQF24nEUw9
 Fi21bZrs9x+h41A8TyFGm+8KOCsnQfGo6jzlOFFSKc0WYDLr/b2mycqxikSpbKp4dPWz
 qaPGRj9l++v5wQwMpbQO+FgzGS8uEppxQrhWPFqlE0H265WRV94YYiw7CedpQBHyknmA
 ftMjpVbd8wCTK2HsPcb6GeSp3WVHREsYMCJ7mk/JYGEoo4vEH+7CamrFb3+d+DiZXQbB
 x4yYDqTR5iJ/FFYgM91/uxhz6vvwHzgBDIpMfwrkni7S3dRNqAykCx8HS8ZBvpM0RJ2G
 Jh/g==
X-Gm-Message-State: AOJu0YyvwYG1+70FhzBgR0gnxA9hJsTIFXkpdvZ2QdDSwly+GOlIjMrf
 fBqusRcd3DXI4rnGEHrS83qpheS5ajLT2jig5K5DYp7p6mcYUIniKw5j2DqYM+NsvKbhHmDP5bY
 MgNo3TM7OBuD3Ed6L6Ux1o2Y/RtReTw==
X-Gm-Gg: ASbGncs3owJyEzM7kML6CBQub136PFEGrn+vvUsKitCWKCvcZJVqYQTPwIkis2U8e/3
 h3PRk6FWd/zcnTVEcxrYFtOSTzkWTvJcmBYzKnTglVBZ1W+7hGt6l/6hUEyhkrMiRrTydnabjnm
 I=
X-Google-Smtp-Source: AGHT+IEOIfBTbYaJhfm/AFZ+pIkgHt0lbhFTi63TbszNQQIX+ouUcRhioUXcI+rx+Q0ahxhMMIhlWwJWxhTtKpDZmQ8=
X-Received: by 2002:a5d:6c66:0:b0:38f:3139:f57f with SMTP id
 ffacd0b85a97d-38f5878c7a3mr609015f8f.16.1739903077111; Tue, 18 Feb 2025
 10:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20250213081956.24293-1-peter.macleod.thompson@gmail.com>
 <9a63c2adfccc87e6c0b427b21ac7934e@free.fr>
In-Reply-To: <9a63c2adfccc87e6c0b427b21ac7934e@free.fr>
From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Tue, 18 Feb 2025 11:24:25 -0700
X-Gm-Features: AWEUYZmF64rgvwC1BHcn67qtIVcJLRLIs-_1FVrZkFX3zPQhy5Kp8xmXr91SDek
Message-ID: <CAGrGpJBTTbbd1suzSJ5x5iLwgxRXLGjoDxGJVd1GpN9MVXKqHQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739903077; x=1740507877; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EH3Uir8H8PePJMir6YQbPAGARaw592YmYgW4McmYTU0=;
 b=LMNWeZBVbEmRY0+3UMECCaZ5gv60oMa43p6e/GO62nrseZfYr1qCBbYtjXtvuOWCSw
 kMwqUlxqfHS7U28or6lGsFcHlEIPGpswFsh3eJXpxylnmKV9bOXrXDB2p0P1/cikb5yY
 F7SqfG/wC4rC9dMLXNS0u3ID0TIymKJH5jJikfQcac0iAtNgw6PaciwnzRCFt/TcsA2/
 fyiZnYo5wyYf3AvDY8dB1/LEonFB7a30PtDczsAfFDi+A81LUzfePeX653htRSNgVd6y
 PnXGJYouCQhRZOUB33HG8rEE6zXfPCBluIvz+Efl+c7VXUGCIUIF7BB3XesixQ8RmtrD
 YCsQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LMNWeZBV
Subject: Re: [Buildroot] [PATCH 1/2] package/sdl2_ttf: bump version to 2.24.0
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
Content-Type: multipart/mixed; boundary="===============4682024110433135524=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4682024110433135524==
Content-Type: multipart/alternative; boundary="000000000000dadf2c062e6ec0ce"

--000000000000dadf2c062e6ec0ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks very much Julien!

Peter



On Sun, Feb 16, 2025 at 7:13=E2=80=AFAM Julien Olivain <ju.o@free.fr> wrote=
:

> On 13/02/2025 09:19, Peter Thompson wrote:
> > From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> >
> > Signed-off-by: Peter Macleod Thompson
> > <peter.macleod.thompson@gmail.com>
>
> Series applied to master, thanks.
>
> I added links to release notes in commit logs. See:
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/9f5ef2d8727499b9b92bf=
d24735e6d6b5a07bd18
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/678ad7d69d1b9757433d2=
235e8d2856961d904d1
>
> Best regards,
>
> Julien.
>

--000000000000dadf2c062e6ec0ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks very much Julien!=C2=A0=C2=A0 <br></div><div><=
br></div><div>Peter</div><div><br></div><div><br></div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sun, Feb 16, 2025 at 7:13=E2=80=AFAM Julien Olivain &lt;<a href=3D"mai=
lto:ju.o@free.fr">ju.o@free.fr</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On 13/02/2025 09:19, Peter Thompson wrote:<br=
>
&gt; From: Peter Macleod Thompson &lt;<a href=3D"mailto:peter.macleod.thomp=
son@gmail.com" target=3D"_blank">peter.macleod.thompson@gmail.com</a>&gt;<b=
r>
&gt; <br>
&gt; Signed-off-by: Peter Macleod Thompson <br>
&gt; &lt;<a href=3D"mailto:peter.macleod.thompson@gmail.com" target=3D"_bla=
nk">peter.macleod.thompson@gmail.com</a>&gt;<br>
<br>
Series applied to master, thanks.<br>
<br>
I added links to release notes in commit logs. See:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/9f5ef2d87274=
99b9b92bfd24735e6d6b5a07bd18" rel=3D"noreferrer" target=3D"_blank">https://=
gitlab.com/buildroot.org/buildroot/-/commit/9f5ef2d8727499b9b92bfd24735e6d6=
b5a07bd18</a><br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/678ad7d69d1b=
9757433d2235e8d2856961d904d1" rel=3D"noreferrer" target=3D"_blank">https://=
gitlab.com/buildroot.org/buildroot/-/commit/678ad7d69d1b9757433d2235e8d2856=
961d904d1</a><br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--000000000000dadf2c062e6ec0ce--

--===============4682024110433135524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4682024110433135524==--
