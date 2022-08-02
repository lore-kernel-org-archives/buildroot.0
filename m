Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65A5C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 05:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AF5681344;
	Tue,  2 Aug 2022 05:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AF5681344
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id esKVizyYk_Nr; Tue,  2 Aug 2022 05:33:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1957A81281;
	Tue,  2 Aug 2022 05:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1957A81281
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 74D921BF296
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 05:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D99440879
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 05:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D99440879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tPRSuufi6GE for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 05:33:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D311C40017
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D311C40017
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 05:33:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id i14so5307859ejg.6
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 22:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t6EwWJ9eoMN0NrIBIHzigPGYqHBA67j7tNRqzNKWAy4=;
 b=7nBd6NAQ4+P3XbL/XxKLs37sm0Wyivz5Xt2lFPFUS5f3nrj8dHS3sLv4Ki5A1FzTBq
 VruCoydtowQQpAkr4sDYcXCXQWZxYxXnJaI2Zwfdu8ONT0HCNP0Tfh5RDDdqeo2920Qu
 ML/HXKYG4qpVpjw891NsVFE0DxfmakRPuiSJvBThpfBRDIVaYdF/YG9K9hUVPa/q6jKZ
 Q7GNDhhDSSR1raPoTrLkHNlLVQNtIArLUOLxk8jFN1zuMJHDLvMvyd4b+WXwYjkIYDvN
 71YG+pR/76/e4GitC8ygmz0KG/s9S+Km5LQCcaq7n+gZoZRm+lSmykpt44O00aWnMgDs
 cdzw==
X-Gm-Message-State: AJIora9uH9fXHRPy7FkhourvG5vX4T8ngK99alACSVTDly33sHp1Qh5y
 /nfF4nTHDhD8Wy5uU5AnZA0SPVvr9x8ZiGsx3gbJCKHp980=
X-Google-Smtp-Source: AGRyM1unN6IKCga5rTpW/6MbYySXwJ8fOYDJbsMJV6+SzELa4VNJJj1EmqOOxukMPGrwSR4VC+AjChG1S3ePlGyxoB4=
X-Received: by 2002:a17:906:3f51:b0:712:3945:8c0d with SMTP id
 f17-20020a1709063f5100b0071239458c0dmr14427684ejj.302.1659418411888; Mon, 01
 Aug 2022 22:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
 <20220727192948.18653-4-guillaume.bressaix@gmail.com>
 <20220801194254.118219ec@windsurf>
 <CAJe0E3e4wE+v16v9JQE-NDaXH+_9icVtHfPbTBW=ng5rr2EEYg@mail.gmail.com>
 <20220801205907.545f6693@windsurf>
In-Reply-To: <20220801205907.545f6693@windsurf>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Tue, 2 Aug 2022 07:33:05 +0200
Message-ID: <CAJe0E3dc1YGh_-369RjWkyHdN-WkcQW1d8PqDvr5i9h-pPqoqw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=t6EwWJ9eoMN0NrIBIHzigPGYqHBA67j7tNRqzNKWAy4=;
 b=fbiJs44BL/QsKydX8OgEN+RzgnfqSeU915bMxeKzXA9dqEEX225IWUezTs1/iEITHv
 83JvYdiWhW0xPVmfsGlPhg6bOge0x4IVj0tGTSQCJYwwKIDFrr6vDEzhfWvx/AEtzvZ9
 wPwl729fv1ZJFRQO3BTdzFUH2m1nD8n374BSIu12cm2/2Qr7Cvy9q/gRUD7TmRrjBXh/
 wvUko14vucfpXsKk7fjmVQCTWGhGBJxBGTJB+K29UTFjSXxU03Qw8Cb8t+RnlqNd9o/y
 cXjGtl5nioR0Snm3oNysm5Hz3meuIZbgmZ0EPJZC5SDSm0yEq7DIx2h8eTpPwcgoBx2z
 3wpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fbiJs44B
Subject: Re: [Buildroot] [PATCH v5 4/4] package/python-scipy: new package
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
Cc: jmfriedt <jmfriedt@femto-st.fr>, "gwenhael.goavec" <gwen@trabucayre.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2413688818304402597=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2413688818304402597==
Content-Type: multipart/alternative; boundary="000000000000f9739005e53b74ba"

--000000000000f9739005e53b74ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas

>Could you give some details on what didn't work? Our runtime test
>infrastructure is (I believe?) reasonably simple and straightforward to
>use, with tons of existing examples
I was trying to get the runtime test (the emulator) to execute the scipy
fulltest ("python -c import scipy; scipy.test()"), as I was thinking it
would be the best thing to do.
But it's not a straightforward scenario and it's super heavy, you need the
repo sources and the pytest suite.

Running small but several portions of the lib is probably the best thing to
do.

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le lun. 1 ao=C3=BBt 2022 =C3=A0 20:59, Thomas Petazzoni <thomas.petazzoni@b=
ootlin.com>
a =C3=A9crit :

> On Mon, 1 Aug 2022 19:58:23 +0200
> Guillaume Bres <guillaume.bressaix@gmail.com> wrote:
>
> > thank you Thomas for merging this serie and also for adding the runtime
> > test, I did try to provide it but could not get it to work.
>
> Could you give some details on what didn't work? Our runtime test
> infrastructure is (I believe?) reasonably simple and straightforward to
> use, with tons of existing examples.
>
> The one thing that was tricky here is that most Python test cases use a
> CPIO filesystem loaded as an initrd, but that doesn't work for SciPy as
> the filesystem is too large for an initrd. Which is why my test case
> uses an ext2 filesystem on a hard drive.
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000f9739005e53b74ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Thomas<br><br></div>&gt;Could you give some det=
ails on what didn&#39;t work? Our runtime test<br>
&gt;infrastructure is (I believe?) reasonably simple and straightforward to=
<br>
&gt;use, with tons of existing examples<div>I was trying to get the runtime=
 test (the emulator) to execute the scipy fulltest (&quot;python -c import =
scipy; scipy.test()&quot;), as I was thinking it would be the best thing to=
 do.<br></div><div>But it&#39;s not a straightforward scenario and it&#39;s=
 super heavy, you need the repo sources and the pytest suite.<br><br></div>=
<div>Running small but several portions of the lib is probably the best thi=
ng to do.<br><br clear=3D"all"><div><div><div dir=3D"ltr" class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><font face=3D"arial,hel=
vetica,sans-serif">Guillaume W. Bres<br></font></div><font face=3D"arial,he=
lvetica,sans-serif">Software engineer</font><br></div><font face=3D"arial,h=
elvetica,sans-serif"></font></div><font face=3D"arial,helvetica,sans-serif"=
>&lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blank">guil=
laume.bressaix@gmail.com</a>&gt;<br></font></div></div></div></div></div></=
div><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Le=C2=A0lun. 1 ao=C3=BBt 2022 =C3=A0=C2=A020:59, Thomas=
 Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petaz=
zoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Mon, 1 Aug 2022 19:58:23 +0200<br>
Guillaume Bres &lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" target=
=3D"_blank">guillaume.bressaix@gmail.com</a>&gt; wrote:<br>
<br>
&gt; thank you Thomas for merging this serie and also for adding the runtim=
e<br>
&gt; test, I did try to provide it but could not get it to work.<br>
<br>
Could you give some details on what didn&#39;t work? Our runtime test<br>
infrastructure is (I believe?) reasonably simple and straightforward to<br>
use, with tons of existing examples.<br>
<br>
The one thing that was tricky here is that most Python test cases use a<br>
CPIO filesystem loaded as an initrd, but that doesn&#39;t work for SciPy as=
<br>
the filesystem is too large for an initrd. Which is why my test case<br>
uses an ext2 filesystem on a hard drive.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000f9739005e53b74ba--

--===============2413688818304402597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2413688818304402597==--
