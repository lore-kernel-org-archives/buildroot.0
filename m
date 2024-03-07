Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A998C54E4A
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 18:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01720418A9;
	Thu,  7 Mar 2024 18:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HtB3EmuvTCHQ; Thu,  7 Mar 2024 18:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1A904167F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A904167F;
	Thu,  7 Mar 2024 18:00:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13B6A1BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 18:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0279C409E6
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 18:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lhp5qzNiDW3A for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 18:00:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9327E401F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9327E401F1
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9327E401F1
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 18:00:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a44cdb2d3a6so183487066b.2
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 10:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709834400; x=1710439200;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+GHtefACP/It00QSXtiluO4sHf9b2EnDthwgLdTu1E8=;
 b=fzBcqnSPFr3GFK8RVJq1++vGgFR4Hkml713Ig4IINZb1GBolnXYpo8CicUC8SHS8Tv
 NEP4dyggvHyCvqvbL8L+mHmZEwEszqUUlz0GEjABQCm/AdspcrRUhDUFV3CWQ6T2BSeA
 1SJjVn6n/C9LEhw99liyR/Wqfz960qRPab4GvnCOzoLbC8Yuwkn2QYiPueP2i5VlSw78
 WFB1Ie3Tr00BdlbCAKavkMp2xbJp9dA02ODy2yQyym8BFPBKa4Rm+I8QvykOjZ/enH9q
 S/X0m6LcxMPXf5/FJdIUdugyWrmgfiAWBP91W+sQ26pcm6z8T0MFyIwJUMrBJCyYPdLx
 g+Yw==
X-Gm-Message-State: AOJu0YysYBszxoUt7WUCnPi37hi/b69mKz3M47xJuhZKzBahOByoqU6C
 IrCphzg1mHphCjTwH3/gtcts/wd8Odk3P8Fxa2BXD5sstfBi7Z+KciWO2oiIC0p3ewTctSrF4tX
 FldM=
X-Google-Smtp-Source: AGHT+IFaPaXOAH1EQIO591iY/Tg+VkNy6FSzezzZPKZTlQGwVHU4koe33eky/TH6pqA/f5RULy9f/Q==
X-Received: by 2002:a17:906:6845:b0:a45:b9b5:e13a with SMTP id
 a5-20020a170906684500b00a45b9b5e13amr4441869ejs.75.1709834399745; 
 Thu, 07 Mar 2024 09:59:59 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 lc12-20020a170906f90c00b00a45b944681dsm2037496ejb.217.2024.03.07.09.59.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 09:59:59 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a44cdb2d3a6so183477366b.2
 for <buildroot@buildroot.org>; Thu, 07 Mar 2024 09:59:59 -0800 (PST)
X-Received: by 2002:a17:906:5a9a:b0:a43:bf25:989 with SMTP id
 l26-20020a1709065a9a00b00a43bf250989mr13313758ejq.9.1709834398665; Thu, 07
 Mar 2024 09:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20240307014541.2900022-1-christian@aperture.us>
 <20240307014541.2900022-2-christian@aperture.us> <87o7bqw5pu.fsf@48ers.dk>
 <87h6hiw5j6.fsf@48ers.dk>
In-Reply-To: <87h6hiw5j6.fsf@48ers.dk>
Date: Thu, 7 Mar 2024 09:59:46 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pcg4zLGE0JMrctvS9HdYHPfJvuuf-S1YYjdpcsKvUXew@mail.gmail.com>
Message-ID: <CA+h8R2pcg4zLGE0JMrctvS9HdYHPfJvuuf-S1YYjdpcsKvUXew@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1709834400; x=1710439200; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+GHtefACP/It00QSXtiluO4sHf9b2EnDthwgLdTu1E8=;
 b=zPM0CLyvqRsi7cimE2Q4uvGxeecZaEnPrmMjPVa1KjtwKchAY5/+mkcU+Db/W7cD/g
 u/TYHAVHu8+at4HSeOIhH/g/LO9TljZggJm3QZe+P/tm++Jx/gYPUPL9xJPsIAu/70S/
 9pzVWiKQHrs9MRc1N+HpbXYK5/ifxfyS76T1v0qKEfnXFecAYmJZ3Kc+Tiy2U5ABoe1j
 59Jh1Hq/qeiFtppY+G7v/naZ2F1CWOg+rNbyBBDDdSVx9CXodjj7Y9cYOYSLYwYZX2F0
 bteadGWrhs3kta0zjmU9if9EWbvqei+hQMt0iaY3wOiy3CL8m1mT1cIr36Sk+V85pNP4
 Hegw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=zPM0CLyv
Subject: Re: [Buildroot] [PATCH v1 1/1] package/nerdctl: bump version to
 v1.7.3
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3360232483225347344=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3360232483225347344==
Content-Type: multipart/alternative; boundary="000000000000f51c20061315d7d8"

--000000000000f51c20061315d7d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024, 5:11=E2=80=AFAM Peter Korsgaard <peter@korsgaard.com> =
wrote:

> >>>>> "Peter" =3D=3D Peter Korsgaard <peter@korsgaard.com> writes:
>
> >>>>> "Christian" =3D=3D Christian Stewart <christian@aperture.us> writes=
:
>  >> https://github.com/containerd/nerdctl/releases/tag/v1.7.3
>  >> Signed-off-by: Christian Stewart <christian@aperture.us>
>
>  > Committed, thanks.
>
> Ehh, no - We already have nerdctl 1.7.3.
>

Apologies for the confusion, this was a duplicate send I had in my
outgoing/ directory. No action needed

--000000000000f51c20061315d7d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 7, 2024, 5:11=E2=80=AFAM Peter Korsgaard &=
lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Peter&=
quot; =3D=3D Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" tar=
get=3D"_blank" rel=3D"noreferrer">peter@korsgaard.com</a>&gt; writes:<br>
<br>
&gt;&gt;&gt;&gt;&gt; &quot;Christian&quot; =3D=3D Christian Stewart &lt;<a =
href=3D"mailto:christian@aperture.us" target=3D"_blank" rel=3D"noreferrer">=
christian@aperture.us</a>&gt; writes:<br>
=C2=A0&gt;&gt; <a href=3D"https://github.com/containerd/nerdctl/releases/ta=
g/v1.7.3" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/containerd/nerdctl/releases/tag/v1.7.3</a><br>
=C2=A0&gt;&gt; Signed-off-by: Christian Stewart &lt;<a href=3D"mailto:chris=
tian@aperture.us" target=3D"_blank" rel=3D"noreferrer">christian@aperture.u=
s</a>&gt;<br>
<br>
=C2=A0&gt; Committed, thanks.<br>
<br>
Ehh, no - We already have nerdctl 1.7.3.<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Apologies for the confusion, this w=
as a duplicate send I had in my outgoing/ directory. No action needed</div>=
</div>

--000000000000f51c20061315d7d8--

--===============3360232483225347344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3360232483225347344==--
