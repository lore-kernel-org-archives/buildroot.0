Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54176CA0FED
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 17:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08D286065F;
	Tue,  9 Sep 2025 17:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3kqD7qUT1IX; Tue,  9 Sep 2025 17:56:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27D2C60689
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D2C60689;
	Tue,  9 Sep 2025 17:56:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E3F9E1F
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 17:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3020060689
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 17:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFpF62lrMBNX for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 17:56:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 13FE86065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13FE86065F
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13FE86065F
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 17:56:32 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55f98e7782bso6743644e87.0
 for <buildroot@buildroot.org>; Tue, 09 Sep 2025 10:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757440590; x=1758045390;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ra8eKVgPDBgY8PLU4klsIhngMADNUec/QUbphgcQ5Q0=;
 b=g32FeNd5xK0pk+0YfPSlqRCESVjpLVbZC5uT4AY8Z3jcnayWrZjw1S5GpS4NRa1HYE
 VXvu7y67do3bu4Yb/RjffxpfHLEHwuSoxrhEzLvctF0pdNvioR/cxy29WreVOyebek70
 RyWm4rxXF6MjA1yWlNvB67RKUpq6nVDZCEMRgWPqwKHAkLkuUVM1JPqZBtaqrEzvYM60
 wFIFwafA5/qPz8DtLQpZk5ivGuTPje529Q+Q7RLW1h07bSWNzjBqfB9/D6NXuNdFPs3V
 2IzGmAFDdmh+BgHxa5iGVkdZPKjUat/sQ//cRgCx2qseZg7mfwWknDMIIkyeLVNGiY/i
 50Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUazUvGAvHGaj1ZCS6fHzuzV/99yWHbMxZKBLRklzazTI1z6rEYMkG7L7vEZiWcMri3Ca2tz7EjSOE=@buildroot.org
X-Gm-Message-State: AOJu0Yz97UrIjpDegxCMt0FBiN8DoQZaEvwahUQmnpe4ansX/4SnHVOZ
 dzFeAgMxulz75Qct+JU+QIwa1or7mx43LmYv+shk6aB3XI9JKpecXTlZ5eYbE5HEIBWF7C+97Tf
 wI11Sqes92A==
X-Gm-Gg: ASbGncucwRecES5zZ+c9ujordIQRCZ/wh+K/ZDFPN38vY4+RFOFrK0R2KlKPZ50DxKb
 MLDMpzzMAGc4+etWidfUmNiNNLSZUdt2kYbvkFbRY94S8nNGX5JE5Lt+KtlGzu/BWanYTHd5m4U
 grbnve8AzSy5On+ldA8MelcRbyJJQ3sgWlk+fZKV3lVvywBrPfLJVe3CfnSk1WBQTasV5TGgqou
 4PDbGj1aj8U1jz7H8D+t/z2XMtkLQZj8g2FbskaeJHs6Rt6pZszCITilK/H3pP2+wdDRP5vau+q
 2Wl9TuWm1q6mqqEXLR4VB3a1ZMz+NNkHCUo/grnNXyLkRI2DwnLgFp88HhsuJEUfkcl53fAnyg+
 hspzzTHBjtcNDtI1SE9ZUZ/Yp/z7CUn9vipRdrGt418l/J7wwxVRVkGhBaC50qX8f89LGxzQP
X-Google-Smtp-Source: AGHT+IE5Ra5ycrsERCChPJe6DBVIyqItfomDOgC2TrVqmcuSCu7SqU3o4ETyF1ho1u8hnbrbq/d3vA==
X-Received: by 2002:a05:6512:3c9a:b0:55f:563e:f16f with SMTP id
 2adb3069b0e04-56275bcbb47mr3905284e87.21.1757440589892; 
 Tue, 09 Sep 2025 10:56:29 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56818cfbdd7sm643230e87.136.2025.09.09.10.56.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 10:56:29 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-56a04f7691aso497961e87.1
 for <buildroot@buildroot.org>; Tue, 09 Sep 2025 10:56:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW0VfrWdRHEYhUJXs2HSHkQpUuqfaXI67LL2lG0/jAygtshk1olE/oW4o6cA7Ov0Q9spSK1DZk7hio=@buildroot.org
X-Received: by 2002:a05:6512:6d5:b0:55f:3ae4:fe57 with SMTP id
 2adb3069b0e04-562758dd55cmr3931826e87.20.1757440588675; Tue, 09 Sep 2025
 10:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
 <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr> <aL/bdHOwN/ENpcOl@yd-6wlzhs3>
In-Reply-To: <aL/bdHOwN/ENpcOl@yd-6wlzhs3>
Date: Tue, 9 Sep 2025 10:56:17 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rxQ6Na-hG=BLZrNvL=Wu5bwur_8YeC3wNdFkjrKfsP4Q@mail.gmail.com>
X-Gm-Features: Ac12FXw-2fQTS0o9UScl35LZwdpZ3BFj5NVq31n08VWoLROJTltSWr4njY6SSjY
Message-ID: <CA+h8R2rxQ6Na-hG=BLZrNvL=Wu5bwur_8YeC3wNdFkjrKfsP4Q@mail.gmail.com>
To: yann.morin@orange.com
Cc: Romain Naour <romain.naour@smile.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757440590; x=1758045390; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ra8eKVgPDBgY8PLU4klsIhngMADNUec/QUbphgcQ5Q0=;
 b=aHwhTg9h1V3DeqLjBmI6Gr6XsDcsbePCdJSBh24ZF9dCywlXbq5VDCFyxwJMbAnobY
 jbQtoTMi4D90pBrTi0ZwkDwqGPSnbdKy5ymJPJzzZs2ZBXHeEdrIzz7oNItGvi2PrsTt
 wPUovZUFN6VNMIZZW5uEZl+GTJlC/E7eyDCc05ZWUvUVoDdzZ2cwQrTd2hgh+AYZIUcQ
 PcZZgXc8kheBC/GRBrspajaVTTPRWAYfdzxrtDBD33momuDFdhpByCp/PJ9vWLlGAILk
 OK1IFV75j3fOxtWWi8vN7+6huF5mZl9Bn2P2DxV/j0kJ2rnA6mIcbxOyv20pGA8yAj2r
 dDng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=aHwhTg9h
Subject: Re: [Buildroot] [PATCH 1/4 v2] package/pkg-golang: simplify
 installing multiple binaries
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
Content-Type: multipart/mixed; boundary="===============4378004484361484807=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4378004484361484807==
Content-Type: multipart/alternative; boundary="0000000000000081e4063e6206a1"

--0000000000000081e4063e6206a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

On Tue, Sep 9, 2025, 12:47=E2=80=AFAM <yann.morin@orange.com> wrote:

> Romain, All,
>
> On 2025-07-05 22:51 +0200, Romain Naour spake thusly:
> > Le 01/07/2025 =C3=A0 15:45, yann.morin@orange.com a =C3=A9crit :
> > > From: "Yann E. MORIN" <yann.morin@orange.com>
> > > Currently, when a golang package defines multiple _BUILD_TARGETS, it
> has
> > > to basically repeat the same list in its _INSTALL_BINS.
> [--SNIP--]
> > > We now consider that _INSTALL_BINS is an internal implementation
> details
> > > that should no longer be exposed to the users, so we drop it from the
> > > documentation; we rephrase the corresponding part for _BUILD_TARGETS.
> > >
> > > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> > > Cc: Christian Stewart <christian@aperture.us>
> > Reviewed-by: Romain Naour <romain.naour@smile.fr>
> > Since it's about a package infrastucture change, I prefer wait for a
> second review.
>
> What about the status of this series? Christian has provided his
> Reviewed-by a while back...
>

It still looks good to me!

Best regards,
Christian

--0000000000000081e4063e6206a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Yann,<br><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 9, 2025, 12:=
47=E2=80=AFAM  &lt;<a href=3D"mailto:yann.morin@orange.com">yann.morin@oran=
ge.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Romain, All,<=
br>
<br>
On 2025-07-05 22:51 +0200, Romain Naour spake thusly:<br>
&gt; Le 01/07/2025 =C3=A0 15:45, <a href=3D"mailto:yann.morin@orange.com" t=
arget=3D"_blank" rel=3D"noreferrer">yann.morin@orange.com</a> a =C3=A9crit=
=C2=A0:<br>
&gt; &gt; From: &quot;Yann E. MORIN&quot; &lt;<a href=3D"mailto:yann.morin@=
orange.com" target=3D"_blank" rel=3D"noreferrer">yann.morin@orange.com</a>&=
gt;<br>
&gt; &gt; Currently, when a golang package defines multiple _BUILD_TARGETS,=
 it has<br>
&gt; &gt; to basically repeat the same list in its _INSTALL_BINS.<br>
[--SNIP--]<br>
&gt; &gt; We now consider that _INSTALL_BINS is an internal implementation =
details<br>
&gt; &gt; that should no longer be exposed to the users, so we drop it from=
 the<br>
&gt; &gt; documentation; we rephrase the corresponding part for _BUILD_TARG=
ETS.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Yann E. MORIN &lt;<a href=3D"mailto:yann.morin@ora=
nge.com" target=3D"_blank" rel=3D"noreferrer">yann.morin@orange.com</a>&gt;=
<br>
&gt; &gt; Cc: Christian Stewart &lt;<a href=3D"mailto:christian@aperture.us=
" target=3D"_blank" rel=3D"noreferrer">christian@aperture.us</a>&gt;<br>
&gt; Reviewed-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr"=
 target=3D"_blank" rel=3D"noreferrer">romain.naour@smile.fr</a>&gt;<br>
&gt; Since it&#39;s about a package infrastucture change, I prefer wait for=
 a second review.<br>
<br>
What about the status of this series? Christian has provided his<br>
Reviewed-by a while back...<br></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">It still looks good to me!</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Best regards,</div><div dir=3D"auto">Christia=
n</div></div>

--0000000000000081e4063e6206a1--

--===============4378004484361484807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4378004484361484807==--
