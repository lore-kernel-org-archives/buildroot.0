Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258BBCF9C71
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 08:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3EE3404C8;
	Tue, 24 Sep 2024 08:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvetC2XFPtKK; Tue, 24 Sep 2024 08:02:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CD2F4014E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CD2F4014E;
	Tue, 24 Sep 2024 08:02:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 115BF1BF37B
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 08:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CA51404E2
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 08:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zj7hs3PUvwxs for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 08:02:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 891E7403B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891E7403B7
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 891E7403B7
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 08:02:41 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6db836c6bd7so50297837b3.3
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 01:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727164960; x=1727769760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IMbMsfDKYsype78AH4M3IEnNUHJzdlXKGYv05sqDt7c=;
 b=p90vWiYr6OzBkJS6rvaLBOTLvWSkUvd1kU1HPJiztZPn1Lu6X2QnyM5OKK2BpxvQEM
 aIapIi/LzNM3D3Tc/2QDcL16hR2H9mx7AE9HxassDEilwRiaoaTXF6l4AEMks3d7QaPu
 E1RqkKRedfv3AxnTrVXHu3kHyMt81aOhsG1QMuUTon9cnyzdognkV/2wA0ChdC8WeSf1
 grbIkEjU2TAhf3Rnlu6GG0212t+WMSHMzBnGvwdMJ+prtZc9qQwpevvzHUkuDeuv5Kve
 X7Xhq1xrA4WzLMmqKuD/lCKOC5B18Q6VjNSoq4Ctt0FD54cq/qb6jW1f6FCxX2ojv+PG
 z+ng==
X-Gm-Message-State: AOJu0YxeMIvjKjd7Q1ULcWWg7h2F20OtOGlzY95T0Z8xhQsyqoVSUw7A
 PGNbWRoV9HwTz8/rwnHHdeKWHp374rVTnsSLONK/zAD0jq6IgSoguGGXxShpd46dZFvKKTIO85K
 cfmwn7G2yFz6u5Utyn7P0it1HXPOfvHrG
X-Google-Smtp-Source: AGHT+IFxvCt93wm6E17074jZojdBPN84SehbcNlmjfSpsoBWIsgGy01vezXV5g62c7jcJR+PS7ytv0A2eMfbNwvYViE=
X-Received: by 2002:a05:690c:f95:b0:6e2:bcc:bcd6 with SMTP id
 00721157ae682-6e20bccc134mr17166787b3.40.1727164960314; Tue, 24 Sep 2024
 01:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240920160500.18551-1-baxiche@gmail.com>
 <CA+R_derRe3Pf0BdL3Y8ykcWjAZewrFJ2KjihXQ3C1axbAwvi2A@mail.gmail.com>
 <CAE3sgKjDQaG1R4L-FPQ3e0FVbcxNBir_DZQfeOu-FcxUPKJWMQ@mail.gmail.com>
In-Reply-To: <CAE3sgKjDQaG1R4L-FPQ3e0FVbcxNBir_DZQfeOu-FcxUPKJWMQ@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Tue, 24 Sep 2024 10:02:28 +0200
Message-ID: <CA+R_deoPLEMn=M++DehZ8WJo1TexWk8AEty13X9ctKUZ96551w@mail.gmail.com>
To: baxiche su <baxiche@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727164960; x=1727769760; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IMbMsfDKYsype78AH4M3IEnNUHJzdlXKGYv05sqDt7c=;
 b=hNsJUHCvpguXibxeFdrFyd4OxS7BI+Axim1hLfFoeWDEEIwYhLHU4CF64Jzw8SZ0Ff
 jmJN2cRSAdj4WJQi2w0X4UzjAUCK8jJx7TWz7LDtvRleWa3FZ6OUC8Jmi35I+GH2Xxed
 eVglozJasAJoKrnc0hErHJUlF7Z+gQv/w9qZRWxFNV3gjwXSPzXvvPiQQJeEF6BOTtqE
 hEHVOAmY2IxRkXM4GIgWglYMieIph99tSbOR6f39N+VtwWRoRL+/54NU6R8awFP0IcvI
 anTqW9v2mpNwP/Jb3TqJI22YYee+XRovolcnolYIRGXRjhHQQyQSDRoZBqp6p1E5cHDw
 3h6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hNsJUHCv
Subject: Re: [Buildroot] [PATCH v3 1/1] package/qt6: add qt6 multimedia
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8861368921220305855=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8861368921220305855==
Content-Type: multipart/alternative; boundary="000000000000eda2360622d8ed00"

--000000000000eda2360622d8ed00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi baxiche,

s=C3=B8n. 22. sep. 2024 kl. 16:30 skrev baxiche su <baxiche@gmail.com>:

> Hi Roy,
>
> I'm sorry for the formatting issue with DEVELOPERS and the Config.in file=
.
> I will fix them in the next commit.
>
> Regarding the qt6multimedia.mk file:
>
> 1. The reason I don't make FFmpeg/GStreamer a choice, is because
> qt6-multimedia can be built with these two packages, and the media
> backend can be chosen at runtime, or even built without these packages.
>
> 2. The reason I don't make ALSA/PulseAudio a choice is that qt6-multimedi=
a
> can be built without these packages.
>
>
Ok, makes sense.


> 3. I personally prefer to set all qt6-multimedia FEATURE to OFF at the
> beginning of the .mk file and set it to ON if the option is chosen. I hav=
e
> seen other qt6 packages do this. If you prefer to gather all the code
> related to one option in one place, I will make that change in the next
> commit as well.
>

I don't think this is enforced but it seems very common according to this
search in the package directory:

grep -rzoP '(?s)ifeq.*?endif' . | sed 's/\x0/\n\n/g'

Thanks for reviewing my work.
>
> Baxiche
>

Regards,
Roy

--000000000000eda2360622d8ed00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi baxiche,<br></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">s=C3=B8n. 22. sep. 2024 kl. 16:30 skre=
v baxiche su &lt;<a href=3D"mailto:baxiche@gmail.com">baxiche@gmail.com</a>=
&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><p>Hi Roy,</p><p>I&#39;m sorry for the formatting issue with DEVEL=
OPERS and the Config.in file. I will fix them in the next commit. <br><br>R=
egarding the <code><font face=3D"arial, sans-serif"><a href=3D"http://qt6mu=
ltimedia.mk" target=3D"_blank">qt6multimedia.mk</a></font></code> file:</p>=
<p>1. The reason I don&#39;t make FFmpeg/GStreamer a choice, is because <co=
de><font face=3D"arial, sans-serif">qt6-multimedia</font></code> can be bui=
lt with these two packages, and the media backend can be chosen at runtime,=
 or even built without these packages.</p><p>2. The reason I don&#39;t make=
 ALSA/PulseAudio a choice is that <code><font face=3D"arial, sans-serif">qt=
6-multimedia</font></code> can be built without these packages.</p><p></p><=
/div></blockquote><div><br></div><div>Ok, makes sense.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><p>3. =
I personally prefer to set all <code><font face=3D"arial, sans-serif">qt6-m=
ultimedia=C2=A0</font><font face=3D"arial, sans-serif">FEATURE</font></code=
><font face=3D"arial, sans-serif">=C2=A0to OFF at the beginning=C2=A0of the=
 .mk file=C2=A0and set it to ON if the option is chosen. I have seen other =
<code><font face=3D"arial, sans-serif">qt6</font></code> packages</font> do=
 this. If you prefer to gather all the code related to one option in one pl=
ace, I will make that change in the next commit as well.</p></div></blockqu=
ote><div><br></div><div>I don&#39;t think this is enforced but it seems ver=
y common according to this search in the package directory:<br></div><div><=
br></div><div>grep -rzoP &#39;(?s)ifeq.*?endif&#39; . | sed &#39;s/\x0/\n\n=
/g&#39;<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div>Thanks for reviewing my work.</div><div><br></=
div><div>Baxiche</div></div></blockquote><div><br></div><div>Regards,</div>=
<div>Roy <br></div></div></div>

--000000000000eda2360622d8ed00--

--===============8861368921220305855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8861368921220305855==--
