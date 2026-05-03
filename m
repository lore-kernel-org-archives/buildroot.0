Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3278FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 18:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77FFD600CB;
	Sun,  3 May 2026 18:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F88Owq-1ajTD; Sun,  3 May 2026 18:24:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94B4060FE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777832698;
	bh=AMZh2RoUEPRheIWvjAVaUyie+rDaqMCbIXf6k79/dX8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xpbt3za6At6hHjEX+d82xddouexv8wY+6VISh7KxcxqS6n/vIapT1KEDJ0b2GsZmA
	 W6SduDrT794VBctTWWJ9zhj3IGxYSb3SMmCQzPt0Rkzsirl5q707os3cmbh33Kq32E
	 E0/6wMgLa49c+mvxyo3wEsXfyhvYbS60XsC8gzc7wT1lZoSA+q5cNa7EIVBJxrwvSh
	 zmJYirH1t3sbmscr8YHvJ2R2GQb9yFxt7/MU/cAgqFt7fjZ8vVq1yJMerovCFJezIy
	 lnHlRQnD8EDN88e/xt+yco1jRzw4nXY56O/sdkEV3MCiskUPWcEpUnV6VYXWQGT4qE
	 pggwR5rqunyCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94B4060FE2;
	Sun,  3 May 2026 18:24:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74176204
 for <buildroot@buildroot.org>; Sun,  3 May 2026 18:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4591861252
 for <buildroot@buildroot.org>; Sun,  3 May 2026 18:24:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqBplCbclGg1 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 18:24:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E569A60FE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E569A60FE2
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E569A60FE2
 for <buildroot@buildroot.org>; Sun,  3 May 2026 18:24:54 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-67929ff6dbfso5121023a12.2
 for <buildroot@buildroot.org>; Sun, 03 May 2026 11:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777832693; cv=none;
 d=google.com; s=arc-20240605;
 b=JGHGaVuLywOTvv7Y3GuX5iD9UYOMWRGmGaw9BzXaXOKfPti89dV7Xry2OscooA/oN5
 sDJyP4Sbds0AuTva0kgGpScqcRMnEGrfJpsTgUwXjkkYK5SmqyvoIK0K0gXXiJBJqMa9
 afQzifQYvXr5+0B6D+6xwRPSyx0UVgO67ea0iYHWTdJ3Rhy9WPJ8KannBv/NRVy0E22h
 CB+Q/lythIFkzialB2NAo3IqVsBtK/76/oqAy6q2RWNAfsyhzWJke6LPar3E/mB12dGe
 +7Bv+OEtBvr/4E0E7BCR3zhasg0Hrg2tq4Qx+gQ2MEpVq4x236iS0/KjFbYIK9JjAs8t
 tTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TejUbU3qSxddduJf5oDw+BNmm+re839b15TrrGWwLv8=;
 fh=siEEGlK4OxgQsxxDJxK74FwhxxtTUd9xjx4ss01wdDI=;
 b=Ey2W6/046iApPGueLfkX0Nd/tkHnE/z8iaNzkS5qr+kvQotGrbl6m92JzC6FzEntbp
 BQTOOuSBde7TBpCr/AGnrRtwXf1IlQj+/dsF7yR8qZWZHjZiToI5jeyjgi9r+6oTyi1h
 8tivTiWOiJA8uyvVFJDYj5HAreX39ENrE46b1P9eNMx3iCW9lIwbKyBLkWbBvYBTJig2
 iK4e+hc2W3MQD9xUg+txhZRfUx7NGlsTfhjkrzfalp0agaXvR1M/T4zDVvRHl+kJvh8l
 RInXuZUmy5+r8I8lrgrI8VGi7MXpbxg0ISVLrfM7oto8tYxB3YzxgWf1bFMN/c/vwNTt
 YI9g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777832693; x=1778437493;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TejUbU3qSxddduJf5oDw+BNmm+re839b15TrrGWwLv8=;
 b=Y8irU3CfK41aCIPw5E2RMxVzXspypEYOZJh4mS97Hyyo7c/U9B+YIAvg9IBMKctrkX
 yOuo/8TU/n2i1pJzXF39indtqo2hF5wkZMVH+i2sajx/O6lpSbcUL3EESfTCyuecshqg
 TaGZHoi+6reip3YXZeRJnCW96Jr/oa/4tIlHnerp495eNZ0UoEqRlC/ZrpPftrfxoqZ6
 b60JQi3qwN7fc+8DjNAn+xvVjYy674f9eO9NpGkEOK1mmYi+GmVzOt0Nhp+gujUoSsL+
 xkzXYNwuTLGL6wqYEDuLs3cIy3A+Ow8AxOHqp+UcvOZFnhlppT4cdFo7sCj8zzCezAqm
 l3cg==
X-Gm-Message-State: AOJu0YzvfJ0LFyfAyfu6aZHR4iAecXvxh+quERZ7s8Ofg85VL33gNQV2
 7ZKpXLEet2KsjaUqWTnBHAowHP6/TeL1Od9wBhoJS1HVOR5rFfhH0oRuQ4MnICgrTS/rbNOKB0o
 uisML8I2+j13dnIoQ9ixcFxcpVvDoP3QI+7Ii
X-Gm-Gg: AeBDiesJ1ne1fZws1WsoqB7Y3iu6mHJXfcLDkX+fkvVl6fQNXkLUKkHdNkV7/KB/FTh
 RJqazu2EpHKBHIlwptWQVIAjPgr8qYbE3EuZgW+Zd3ENuXA7UT0pcmXgH7sf9/GujXFZgm1zceA
 BETr5y3UHBnV5htVWvQDGj4Of1etCoJ1RK8AqkdyMKmonSYbmPyFqzpugn2oOdPJ4BNUSC1PPd7
 ntruCT7a/lQYsDMzaKNRlpkDhWT4jCkP825SPasOgc9UvfFQ6KGVKvQwbe5AchMBi+KeD6oJuVS
 VaMS0by7fPFTULOgPzkH/AyI3M50ob79galrDlXj4juDoUVgUoHq
X-Received: by 2002:aa7:c344:0:b0:676:989f:ec4b with SMTP id
 4fb4d7f45d1cf-67c17e26c8bmr2052618a12.5.1777832692593; Sun, 03 May 2026
 11:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260503100130.1637945-1-chakrabortyshubham66@gmail.com>
 <c693ab59871b572dc9a717cb5e6dbc8c@free.fr>
In-Reply-To: <c693ab59871b572dc9a717cb5e6dbc8c@free.fr>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 3 May 2026 23:54:40 +0530
X-Gm-Features: AVHnY4KvLSzu5yeEsopvBSeod_fFhtYDy54A7McYiK5n4glnXD4ULSbAgbGBaZQ
Message-ID: <CABvxksw0DXMXYe4rZcLpwcKkwX_siMNq63GfcVmhcCAqPh8BPA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777832693; x=1778437493; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TejUbU3qSxddduJf5oDw+BNmm+re839b15TrrGWwLv8=;
 b=eNm3//0tbhOfhqpyO0yZXTm8aqCi7KfbmYVn5fwd5By/c+M1arLD6t8WDMhNr0xD9D
 vNbFPR6IdFOjt0dSQLoPiTuMPEF1vbp2C+X6MtNZ97RygoVsQKB1rkPmbDXNqNihRN4g
 MKKlXzNwPAjNAA7QvImS0HGoKT+U5FHa0neEOWFCCkscJ6/Ctzfel1qPGPORTJCgsmhU
 qPHUzKW54ZqJ2dSL1GY6OYqySUwsHNvp9tpYRD2ofMutegsHLdtoe20oDZa4vYanhIFs
 yIWFsP5rdA0kJdKdni2577XUVzKGpnjg6ujyw53MWPBFAA/mkjpcHCWeUdKb7i2hykIe
 OFAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=eNm3//0t
Subject: Re: [Buildroot] [PATCH 1/2] package/dos2unix: bump to version 7.5.5
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
Content-Type: multipart/mixed; boundary="===============3558940589520729382=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3558940589520729382==
Content-Type: multipart/alternative; boundary="0000000000001cb9010650edeea4"

--0000000000001cb9010650edeea4
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

Got it. I will prepare and send the follow-up patch updating Config.in,
DOS2UNIX_SITE, and the hash file URL to the new address.

Best regards,
Shubham

On Sun, 3 May 2026, 22:28 Julien Olivain, <ju.o@free.fr> wrote:

> On 03/05/2026 12:01, Shubham Chakraborty wrote:
> > - Fix dos2unix error on empty input
> > - Add new option --error-binary to return an error if a binary
> >   file is skipped
> >
> > https://dos2unix.sourceforge.io/
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
>
> Series applied to master, thanks.
>
> In Buildroot, the current dos2unix home page is set to:
> http://waterlan.home.xs4all.nl/dos2unix.html
>
> This pages now says:
> "This page will go offline on 1 July 2026. Go to the
> new page at https://waterlander.net/dos2unix/"
>
> Could you send a followup patch updating Config.in
> home page,  DOS2UNIX_SITE and URL in the hash file
> to this new URL, please?
>
> Best regards,
>
> Julien.
>

--0000000000001cb9010650edeea4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span class=3D"smart_draft_text">Hi Julien,<br><br>Got it=
. I will prepare and send the follow-up patch updating Config.in, DOS2UNIX_=
SITE, and the hash file URL to the new address.<br><br>Best regards,<br>Shu=
bham</span></div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sun, 3 May 2026, 22:28 Julien Olivain, =
&lt;<a href=3D"mailto:ju.o@free.fr">ju.o@free.fr</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On 03/05/2026 12:01, Shubham Chakraborty wrote=
:<br>
&gt; - Fix dos2unix error on empty input<br>
&gt; - Add new option --error-binary to return an error if a binary<br>
&gt;=C2=A0 =C2=A0file is skipped<br>
&gt; <br>
&gt; <a href=3D"https://dos2unix.sourceforge.io/" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://dos2unix.sourceforge.io/</a><br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham6=
6@gmail.com</a>&gt;<br>
<br>
Series applied to master, thanks.<br>
<br>
In Buildroot, the current dos2unix home page is set to:<br>
<a href=3D"http://waterlan.home.xs4all.nl/dos2unix.html" rel=3D"noreferrer =
noreferrer" target=3D"_blank">http://waterlan.home.xs4all.nl/dos2unix.html<=
/a><br>
<br>
This pages now says:<br>
&quot;This page will go offline on 1 July 2026. Go to the<br>
new page at <a href=3D"https://waterlander.net/dos2unix/" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">https://waterlander.net/dos2unix/</a>&quot;<=
br>
<br>
Could you send a followup patch updating Config.in<br>
home page,=C2=A0 DOS2UNIX_SITE and URL in the hash file<br>
to this new URL, please?<br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--0000000000001cb9010650edeea4--

--===============3558940589520729382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3558940589520729382==--
