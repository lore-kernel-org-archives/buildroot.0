Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A1AC369B8
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 21:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAD6B60E68;
	Mon, 14 Apr 2025 21:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7r99omxTedJ; Mon, 14 Apr 2025 21:37:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFB2860AF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFB2860AF2;
	Mon, 14 Apr 2025 21:37:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F87200
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC69460AF2
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0wguN9y_zFg for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 21:37:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.167.50;
 helo=mail-lf1-f50.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A383F60880
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A383F60880
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A383F60880
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 21:37:17 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5499c5d9691so5170655e87.2
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 14:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744666635; x=1745271435;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LkvPnb6HzCXmnh0lCv9jEmyPNmWMDJB81hSWeoLg0PY=;
 b=k/Z+a3PqiZusOB0nBKT992W1ntFOAE+0ib48kvPZ0VKJnz2x0pDSZ1WZJcx1NLbvxK
 k0nuSp6x5KsEEtcc1b0X9KVO4dQfm8WAUtB/Fqjm0UXp+dkjmqbXnG5E/ezTz4hw/L4Z
 8LKlvUwOLaEd4F3tn6DnRXwvbLyrCdPAMM2Ww4rNctWl9OrwWaZSlv0O3ko8CgM+/sya
 e2YpXvcV6DLKs4xg+GBcBcIH13t8aH3J6PweX1KQnt5Am/t7HL7uXd8PXrcujkGI0Ei6
 2dEJxVdDqAEChgW1eR2gUp396Y8iXeP4KHViZQK+B2RkPTTqpLnflxEA0T2yAs2ISg4/
 YitQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHC+e5HhAjqkPL4MCjknMvo/DCIhpIv7/2259SADbTvGrhAST2Ok3dNkjOK97qeBw4fW5uxmt6dr8=@buildroot.org
X-Gm-Message-State: AOJu0YxTk+6s7dgMmIh8G0lEyG5VP1ESSa+B7FAiZIFkPhElaVpfWRm0
 qfMzl+CnchTsP061aXFAc3yOp0gxKYlh56za/X9tleXJjXaVrd3bl77hYAvs
X-Gm-Gg: ASbGncvRKKGc/Ig7p3OOPyUMfSwkVvVJS6cV4obQv56a8wUnjwfFmliNouRfkQyC7M6
 7m1Ibh/fIbEbfh/mUre3crzkn7G7baQVHCtX1L3m+/TdKvNXyWxDZFfwRVrzTpSYmkRa475GZT8
 otoZfQ9y9PtsLv9OOhZF70oJNNNIAx84YjEJlDOeCuDSY92+TFGyE6TWE6BsiCpAnQIc8CPntHY
 Gx7aX3TgZRpKUzAiSjZjWgG0yO9UJJkHNeN+fBYQDtG9UASBgynOGUxM3tvem405bnPt+Mk124e
 0DGDCtfeKpI3oM6EYv0uQXL56DSAaq8jROA067s7/fTkIRQlIzoLBg6P89Pnm+3NQimYalduTbt
 JlQ==
X-Google-Smtp-Source: AGHT+IEzXE3t5GVYXCyogaCIbIjVRH2btDdzxka+2nHPx0SGNx8Xw85CFsmO96myXcylYyuTRK5/GQ==
X-Received: by 2002:a05:6512:15a2:b0:54b:117b:dbef with SMTP id
 2adb3069b0e04-54d452d99femr3857198e87.54.1744666634295; 
 Mon, 14 Apr 2025 14:37:14 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d12320esm1218365e87.26.2025.04.14.14.37.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 14:37:14 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5499c5d9691so5170632e87.2
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 14:37:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWVcIrWoBsGGrQa9yyKcMUJjH/c3/IUd4Eo7EBPMuX1Rr+m/qKiAYMKHG/nnaNklRnSeqZptg3VvQA=@buildroot.org
X-Received: by 2002:a05:6512:12c6:b0:545:ee3:f3be with SMTP id
 2adb3069b0e04-54d4528ea2amr4221733e87.10.1744666634006; Mon, 14 Apr 2025
 14:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250414090347.1895205-1-thomas@devoogdt.com>
 <20250414092213.1901858-1-thomas@devoogdt.com>
 <a9718aab474861897862ff7f198d5465@free.fr>
In-Reply-To: <a9718aab474861897862ff7f198d5465@free.fr>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 14 Apr 2025 23:37:02 +0200
X-Gmail-Original-Message-ID: <CACXRmJhxqO54vZTZLgxy7KEvw5uvRuZphh2pA_rLKBnthZjpQw@mail.gmail.com>
X-Gm-Features: ATxdqUGhwgekyvuAlBzCDqbC0ptgjsHkOLzvwzmN_g5GRjDtA1D4PUiT5no0Xm4
Message-ID: <CACXRmJhxqO54vZTZLgxy7KEvw5uvRuZphh2pA_rLKBnthZjpQw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, 
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v3] package/libfcgi: update to 2.4.4
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
Content-Type: multipart/mixed; boundary="===============8008561341706035406=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8008561341706035406==
Content-Type: multipart/alternative; boundary="000000000000f8baf70632c3da8f"

--000000000000f8baf70632c3da8f
Content-Type: text/plain; charset="UTF-8"

Hi Julian,


Ah yes, I forgot to drop those two patches in the .checkpackageignore file.
Btw, there was almost at the same time a new release out, fixing a major
cve. I added a new patch here:
https://patchwork.ozlabs.org/project/buildroot/patch/20250414212453.2903952-1-thomas@devoogdt.com/
.


Kr,

Thomas

Op ma 14 apr 2025, 20:23 schreef Julien Olivain <ju.o@free.fr>:

> On 14/04/2025 11:22, Thomas Devoogdt wrote:
> > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> >
> > Announcement:
> > - https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.3
> > - https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.4.4
> >
> > Notes:
> > - drop 0001-link-against-math.patch as it is upstream [1] (by
> > @ffontaine)
> > - drop 0002-disable-examples.patch as it is upstream [2] (by
> > @ffontaine), add --disable-examples now
> > - update LICENSE as the name has been changed [3]
> >
> > [1]
> >
> https://github.com/FastCGI-Archives/fcgi2/commit/214a7bc4da57ccbb0e8840a2f595cd99701b19f6
> > [2]
> >
> https://github.com/FastCGI-Archives/fcgi2/commit/aa74aa7dcec5905de3bdee7f8f5a0a6d62c86cad
> > [3]
> >
> https://github.com/FastCGI-Archives/fcgi2/commit/65571daaa538e9193fab5935e3ae69ff123da19d
> >
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
>
> Applied to master, thanks.
> For info, I fixed a check-package error. See:
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/76b4fd159bcdba97eefdbc4299a7ae9b0a4cd423
>
> Best regards,
>
> Julien.
>
>

--000000000000f8baf70632c3da8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><p dir=3D"ltr">Hi Julian,</p><p dir=3D"ltr"><br></p>
<p dir=3D"ltr">Ah yes, I forgot to drop those two patches in the .checkpack=
ageignore file. Btw, there was almost at the same time a new release out, f=
ixing a major cve. I added a new patch here:=C2=A0<a href=3D"https://patchw=
ork.ozlabs.org/project/buildroot/patch/20250414212453.2903952-1-thomas@devo=
ogdt.com/">https://patchwork.ozlabs.org/project/buildroot/patch/20250414212=
453.2903952-1-thomas@devoogdt.com/</a>.</p><p dir=3D"ltr"><br></p><p dir=3D=
"ltr">Kr,=C2=A0</p><p dir=3D"ltr">Thomas=C2=A0</p></div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Op =
ma 14 apr 2025, 20:23 schreef Julien Olivain &lt;<a href=3D"mailto:ju.o@fre=
e.fr">ju.o@free.fr</a>&gt;:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 14/0=
4/2025 11:22, Thomas Devoogdt wrote:<br>
&gt; From: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@barco.com"=
 target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.com</a>&gt;<br>
&gt; <br>
&gt; Announcement:<br>
&gt; - <a href=3D"https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.=
4.3" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/Fas=
tCGI-Archives/fcgi2/releases/tag/2.4.3</a><br>
&gt; - <a href=3D"https://github.com/FastCGI-Archives/fcgi2/releases/tag/2.=
4.4" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/Fas=
tCGI-Archives/fcgi2/releases/tag/2.4.4</a><br>
&gt; <br>
&gt; Notes:<br>
&gt; - drop 0001-link-against-math.patch as it is upstream [1] (by <br>
&gt; @ffontaine)<br>
&gt; - drop 0002-disable-examples.patch as it is upstream [2] (by <br>
&gt; @ffontaine), add --disable-examples now<br>
&gt; - update LICENSE as the name has been changed [3]<br>
&gt; <br>
&gt; [1] <br>
&gt; <a href=3D"https://github.com/FastCGI-Archives/fcgi2/commit/214a7bc4da=
57ccbb0e8840a2f595cd99701b19f6" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://github.com/FastCGI-Archives/fcgi2/commit/214a7bc4da57ccbb0e884=
0a2f595cd99701b19f6</a><br>
&gt; [2] <br>
&gt; <a href=3D"https://github.com/FastCGI-Archives/fcgi2/commit/aa74aa7dce=
c5905de3bdee7f8f5a0a6d62c86cad" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://github.com/FastCGI-Archives/fcgi2/commit/aa74aa7dcec5905de3bde=
e7f8f5a0a6d62c86cad</a><br>
&gt; [3] <br>
&gt; <a href=3D"https://github.com/FastCGI-Archives/fcgi2/commit/65571daaa5=
38e9193fab5935e3ae69ff123da19d" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://github.com/FastCGI-Archives/fcgi2/commit/65571daaa538e9193fab5=
935e3ae69ff123da19d</a><br>
&gt; <br>
&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@b=
arco.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.com</a=
>&gt;<br>
<br>
Applied to master, thanks.<br>
For info, I fixed a check-package error. See:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/76b4fd159bcd=
ba97eefdbc4299a7ae9b0a4cd423" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://gitlab.com/buildroot.org/buildroot/-/commit/76b4fd159bcdba97eefd=
bc4299a7ae9b0a4cd423</a><br>
<br>
Best regards,<br>
<br>
Julien.<br>
<br>
</blockquote></div>

--000000000000f8baf70632c3da8f--

--===============8008561341706035406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8008561341706035406==--
