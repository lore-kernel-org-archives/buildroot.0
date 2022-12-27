Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0117C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B3960C30;
	Tue, 27 Dec 2022 21:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B3960C30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAtf0WqaPqid; Tue, 27 Dec 2022 21:53:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD63760C26;
	Tue, 27 Dec 2022 21:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD63760C26
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 356A81BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CFD84031E
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CFD84031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HWmGq9qPUsFi for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:53:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E6774018F
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E6774018F
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:53:24 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id r18so9494932pgr.12
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 13:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qG4JjH0fb8coCQTvTi9fVAYt1rHa2RFPYwDGyzSCFLY=;
 b=ct/Jhu9FCVJxxhL43h/3vGHwDK6MJoIvzSkxy7kbGiG9qmJrvoNhwrHuVii/YWrZ3j
 I2D0rpgoN/NCu2mpI2wSfoHXV6cd2SD1ep9Lezc5ayXNgjgwBOX4uFWk5JIEaC4fV7hM
 DjR3lpGagvK7p4TPMrvquVm9Gj+/MfTrgqCU2PzUt2iI6tt25Sqo9SW/JmDv2LqXY5eE
 I2nvabGHHxBZPro/LLEiLKl1+B3BJkTDRDKVTbuzGIIH6oKoRsABfn9HB0hc7Qvqpsnx
 A2AFngbDHHGftcBI4o/rVcBr032aDgCuzx0O6SDxeBbXEaH2zlhIez4qECykuQ7czqDA
 VNOQ==
X-Gm-Message-State: AFqh2kqQMdrdJLRpuqaC0t6ogflGiaIZxUI22lLMSBlS25UcvXyZWfiT
 lHm81Xa8/BqILMt2KjGbSpcYlIPzCRzEEVeCnvg=
X-Google-Smtp-Source: AMrXdXtmjc/L1O0MXGefO3TVNkC+9IdK4Q2VoZ97U0ok8Dj8MB2c0BUYcsFMD+aD/7AIy5/LeEuZHTJAD6M3G5kf9vo=
X-Received: by 2002:a63:e056:0:b0:497:edf8:d4f9 with SMTP id
 n22-20020a63e056000000b00497edf8d4f9mr541961pgj.513.1672178004436; Tue, 27
 Dec 2022 13:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20221222165117.62002-1-fontaine.fabrice@gmail.com>
 <20221227223514.503ad1c2@windsurf>
 <CAPi7W82v_acXo1qva_7No-_0+zm-k79PyZ2k28tfi8sFP=EbrA@mail.gmail.com>
 <20221227224447.67dea6f0@windsurf>
In-Reply-To: <20221227224447.67dea6f0@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 27 Dec 2022 22:53:13 +0100
Message-ID: <CAPi7W809JKHTZrtCQL-xgBtKkz5v4uukGOET3A9cpRALxoJMRw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qG4JjH0fb8coCQTvTi9fVAYt1rHa2RFPYwDGyzSCFLY=;
 b=IK3rz8Kij0uye+RlVlLNusXivqxGUfmkG2RtqH69m00unkcm5PuaNRTLEVUX47jAJv
 bhepc2GYpQnUH6UhGoDFIxtApuIeaKBPN4aFa9xuIlZdFDAa0Vj8B3XI9hWZomjC6C1R
 AlQ2ePBanIwFDWI76bOR0mkeMat3WO5GnJ5/gk8okLpHfapRxWqKnfY3GkVCUPqs+GdA
 Lwgh2QY6a6PicPyFqz3OBD2CbAK65idnphdL7VnCY8Y0hYTRAxWCdc6BhMU7xPLJLNu1
 jAly6fR/z50qZ6UN+G1s66LoLQjnJ2AQHg2Las/a4uxHSCD7jQQ62zwRMGK6OPWhlorw
 Q/Zw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IK3rz8Ki
Subject: Re: [Buildroot] [PATCH 1/1] package/tiff: add libdeflate optional
 dependency
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
Content-Type: multipart/mixed; boundary="===============8517906169260696018=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8517906169260696018==
Content-Type: multipart/alternative; boundary="000000000000f4abe105f0d647e3"

--000000000000f4abe105f0d647e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 27 d=C3=A9c. 2022 =C3=A0 22:44, Thomas Petazzoni <thomas.petazzoni@=
bootlin.com>
a =C3=A9crit :

> On Tue, 27 Dec 2022 22:40:52 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > > I see it's a policy that has not been really applied to the tiff
> > > package, but I'm wondering if there's a particular reason to not appl=
y
> > > our normal policy to this new option?
> >
> > I decided to enable it by default for backward compatibility and becaus=
e
> > (for an unknown reason) most tiff options are enabled by default but I
> can
> > send a v2 if needed.
>
> Could you expand a bit on the backward compatibility reason? Is that
> feature today enabled by default?
>

Yes, as I wrote in the commit message, libdeflate is enabled by default
since its addition in version 4.2.0.
However, obviously, libdeflate has to be built before tiff and libdeflate
has only been added to buildroot in August so I assume that most of the
time tiff is built without libdeflate support.
So, disabling it by default as you suggested is probably better.


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com


Best Regards,

Fabrice

--000000000000f4abe105f0d647e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 27 d=C3=A9c. 2022 =C3=A0=
=C2=A022:44, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootli=
n.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 27 Dec 2022 22:40:5=
2 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; &gt; I see it&#39;s a policy that has not been really applied to the t=
iff<br>
&gt; &gt; package, but I&#39;m wondering if there&#39;s a particular reason=
 to not apply<br>
&gt; &gt; our normal policy to this new option?<br>
&gt; <br>
&gt; I decided to enable it by default for backward compatibility and becau=
se<br>
&gt; (for an unknown reason) most tiff options are enabled by default but I=
 can<br>
&gt; send a v2 if needed.<br>
<br>
Could you expand a bit on the backward compatibility reason? Is that<br>
feature today enabled by default?<br></blockquote><div><br></div><div>Yes, =
as I wrote in the commit message, libdeflate is enabled by default since it=
s addition in version 4.2.0.</div><div>However, obviously, libdeflate has t=
o be built before tiff and libdeflate has only been added to buildroot in A=
ugust so I assume that most of the time tiff is built without libdeflate su=
pport.</div><div>So, disabling it by default as you suggested is probably b=
etter.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div><br></div><div>Best Regards,</div><div><=
br></div><div>Fabrice <br></div></div></div>

--000000000000f4abe105f0d647e3--

--===============8517906169260696018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8517906169260696018==--
