Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C24C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 23 Jun 2024 20:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6352A401CA;
	Sun, 23 Jun 2024 20:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kgr8vRDv-n_G; Sun, 23 Jun 2024 20:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14EE6402F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14EE6402F2;
	Sun, 23 Jun 2024 20:29:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 972051BF3E1
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9084B403D7
 for <buildroot@lists.busybox.net>; Sun, 23 Jun 2024 20:29:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wo7NvyUuzD9Q for <buildroot@lists.busybox.net>;
 Sun, 23 Jun 2024 20:29:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a31; helo=mail-vk1-xa31.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCE14403C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCE14403C9
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCE14403C9
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 20:29:24 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-4ef5c772f7bso498197e0c.3
 for <buildroot@buildroot.org>; Sun, 23 Jun 2024 13:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719174563; x=1719779363;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w04y+5Qk/Cm38fSavqDA8SvMuWykCiQnhkfXb6PL/+A=;
 b=vga4de7L834SqYMw49k+adXF3TQStPXU880WU96KKQ8etEXUtLuHPWnOKNxNi6+6/L
 H0vO3xVAfXIexcDDmcM1y4SKoqG5CPt+x/tBXjVc5MKrVBwepbrqbgHTxY/LyWNP63rI
 8ELughAnOVt1Sz3278YOOfC8/+blKOsjFqR+f8lJB4ZigorMQIz8qIz8ljyZxaxzFOWj
 WXQ2gh9qim3CIxUm89tXhx8xou34r2DwOT4g1lwMJ9N3vqQGeua+wsomBkhUipleM+js
 RE2esz0G3JYaACNKMnEWdMkI04LAJX8mVrgcLjQ+zQRXiL9cz1sg/gF1TibRMoGZuh2C
 gyDw==
X-Gm-Message-State: AOJu0YxqxO6DpGFr7zi+EgY5pqVHzvA6T8bmPpfigXW3KFqBCeK9RQn5
 /CBEeR1BLenYs+STRZHN5hTSjASl5aeTtvVAnz1o5aIh2qBC8474NFpJ3BqKocFWeVfW3vmwOl6
 YqZZanSuNKfDt5f0AaVVB9SYaYwAJQGUXYO+y5kfselnJXNI7zbA=
X-Google-Smtp-Source: AGHT+IHCmJBoBAKJW5MtRvFLdoeoUV/LIvEOPW/aiRkmWN9RJm/IrWVEq/ZQIsIww0+EHAl43FeDo/VRLnAqeXvjDRo=
X-Received: by 2002:a05:6122:21a0:b0:4ec:f52b:e4db with SMTP id
 71dfb90a1353d-4ef6d90860cmr1838459e0c.16.1719174563158; Sun, 23 Jun 2024
 13:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ6EmCeX=u4vfeueqyZWUh9wRWuEbq5on41QavM6NhYtR6PpeQ@mail.gmail.com>
 <be43edf3-70bf-4669-a4f5-18058dd5c7f9@mind.be>
In-Reply-To: <be43edf3-70bf-4669-a4f5-18058dd5c7f9@mind.be>
From: Patricia Holden <pholden@nklabs.com>
Date: Sun, 23 Jun 2024 16:29:12 -0400
Message-ID: <CAJ6EmCcpzt6ihffQnWfBj+k+hKUeKQ6uvfZ4pUNC8a2xSnb9aQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1719174563; x=1719779363; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w04y+5Qk/Cm38fSavqDA8SvMuWykCiQnhkfXb6PL/+A=;
 b=GErQC5NVS9Mj5YRKjOU8WiMW7egFZSHbxVe3XrUGxJTqPWSdJ22Cxzicu7dPWym75Q
 N/ZBhskvwwa1x2dSONlwAiI42rOl69onEQYpus/Iz2/ELCwlnfFQPUt9QBC6ePl+FXEx
 u/zhoKwTT4ilJGt3w70QysHfkXQGY+DXvZaQP4H51EkfPeafuvMqBKHEOby6TU8lN08d
 mr313omoJWwF1kDwZ7gwbyajOTRGxxYTULy4SXzzxPthUqKQaASvDT9x7yZvrVUKr0x6
 CDAHwkA7yRIwIlscoFWqAUlp0G7Z24hcTLP9W13Im0DCwZHqc3JwCS8Aioq9MzBFWrqJ
 Qecw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=GErQC5NV
Subject: Re: [Buildroot] general questions
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7434475584511005173=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7434475584511005173==
Content-Type: multipart/alternative; boundary="00000000000024f0d2061b9485c5"

--00000000000024f0d2061b9485c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes and yes.  Thanks so much for the quick response.

On Fri, Jun 21, 2024 at 4:44=E2=80=AFPM Arnout Vandecappelle <arnout@mind.b=
e> wrote:

>
>
> On 21/06/2024 00:10, Patricia Holden wrote:
> > Where are all buildroot patches that are available for inclusion locate=
d
> on the
> > buildroot download site?
>
>   Are you referring to patchwork [1] which is mentioned on the Contribute
> web
> page [2] and in the manual [3]?
>
> > On reporting issues, what is the "new" reporting system site?
>
>   Are you referring to the issue tracker on gitlab [4] which is referred
> to on
> the Contribute web page [2] and in the manual [3]?
>
>
>   Regards,
>   Arnout
>
> [1] https://patchwork.ozlabs.org/project/buildroot/list/
> [2] https://buildroot.org/contribute.html
> [3] https://nightly.buildroot.org/manual.html#community-resources
> [4] https://gitlab.com/buildroot.org/buildroot/-/issues
>
> >
> > Thanks!
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000024f0d2061b9485c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes and yes.=C2=A0 Thanks so much for the quick response.<=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Jun 21, 2024 at 4:44=E2=80=AFPM Arnout Vandecappelle &lt;<a href=3D"=
mailto:arnout@mind.be">arnout@mind.be</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
<br>
On 21/06/2024 00:10, Patricia Holden wrote:<br>
&gt; Where are all buildroot patches that are available=C2=A0for inclusion =
located on the <br>
&gt; buildroot download site?<br>
<br>
=C2=A0 Are you referring to patchwork [1] which is mentioned on the Contrib=
ute web <br>
page [2] and in the manual [3]?<br>
<br>
&gt; On reporting issues, what is the &quot;new&quot; reporting system site=
?<br>
<br>
=C2=A0 Are you referring to the issue tracker on gitlab [4] which is referr=
ed to on <br>
the Contribute web page [2] and in the manual [3]?<br>
<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
[1] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/" rel=3D=
"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/project/buildro=
ot/list/</a><br>
[2] <a href=3D"https://buildroot.org/contribute.html" rel=3D"noreferrer" ta=
rget=3D"_blank">https://buildroot.org/contribute.html</a><br>
[3] <a href=3D"https://nightly.buildroot.org/manual.html#community-resource=
s" rel=3D"noreferrer" target=3D"_blank">https://nightly.buildroot.org/manua=
l.html#community-resources</a><br>
[4] <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/issues" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/buildroot/-/=
issues</a><br>
<br>
&gt; <br>
&gt; Thanks!<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
</blockquote></div>

--00000000000024f0d2061b9485c5--

--===============7434475584511005173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7434475584511005173==--
