Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935A0C369DC
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 03:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0A2081ED6;
	Wed,  7 May 2025 03:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcTAvUqEUxlX; Wed,  7 May 2025 03:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF86F8203A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF86F8203A;
	Wed,  7 May 2025 03:45:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A5A9EDF
 for <buildroot@buildroot.org>; Wed,  7 May 2025 03:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2066440B65
 for <buildroot@buildroot.org>; Wed,  7 May 2025 03:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUrOJp1HkErD for <buildroot@buildroot.org>;
 Wed,  7 May 2025 03:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12A5D406C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12A5D406C8
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12A5D406C8
 for <buildroot@buildroot.org>; Wed,  7 May 2025 03:45:11 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so11302665a12.0
 for <buildroot@buildroot.org>; Tue, 06 May 2025 20:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746589509; x=1747194309;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1JO9fTxBfn8KEBAvyB3IyLG5TiH4+A0bQcczBle4VWQ=;
 b=q79QqutWpKxqQqo99MH2T/zEwJFNoj6aI6w0XpSNXKmuA+hGZUG5jmk63AinI4AZyI
 g7RPFR19m58izzG6g1bWaISFNZtUOt/SrSlmIuMoaawaMknyY8IDx9JA/TKMn72cpliv
 4hd3zyyeheV4ZNesbBt3zrdg9/Mcy2ydDS6K42CB8ozCxpx639GCQm0g374uypw7LFUi
 cwYlnR+abtVlZXELIATtADBf7sKKAbEbAwxqc6NCsdpDnsb8vXatgtSZXhcBruoawL4q
 xgh+z06v7IhucTxsmFCFwsvZSQIkCSudK2CM40M/SGQbW052l0CzXyFbkxVB44g5euSV
 ZajA==
X-Gm-Message-State: AOJu0YyIpvei0Tv7dxXu2wdLghTr7evoPLpK6NRqTHSncg9EjkrgODTG
 9SFsbBjJhNNJhSv385DJSD5pGS9i/E0T1532/yB1zVFcJ/7wf9Iy0WqFNxydohj/B7hpjKFC1KN
 mBvkG8DykWQc2vYhd23U7/t25LtjiND4CeXZRKU7RT9RbstMtBDNgoA==
X-Gm-Gg: ASbGncuxuw/UbjTysi1uK37R4GvEAaGf/c81Y4L4qv4Xbyx2F8mqB81sP+azmauQUBv
 nrBNtgtZ3RMM1M3JT5AmL9sa8UzQnFHVDGDfmsWt2VJrDrNEU6MxHiNDHqDaZLvzBynyPo6G4Dy
 tA+eu3HqXRqEhpvBReqh/4rWI=
X-Google-Smtp-Source: AGHT+IHWBdNb9AM1cXzBE4v7p3yOmWJq+yYnlMlt2EjY8BRNPhXK/uJ3QRcZ9jh/hok+BwasugyBJws+ftAzuG2LX0w=
X-Received: by 2002:a05:6402:510b:b0:5ee:497:d4f3 with SMTP id
 4fb4d7f45d1cf-5fbe9fa80ffmr1426471a12.33.1746589508862; Tue, 06 May 2025
 20:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
 <20250331233726.3730509-4-daniel.crowe@maxmine.com.au>
 <20250420231547.32603f96@windsurf>
In-Reply-To: <20250420231547.32603f96@windsurf>
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
Date: Wed, 7 May 2025 13:14:57 +0930
X-Gm-Features: ATxdqUFtHXYrcq0HVP6eFYRkFiNMhiOicSIB-DKSD9jkKTLMwvWohiq9_--uMGA
Message-ID: <CA+dVm3P=13SOr_o+51T1yM9drCaRqNuQjvauVvR6gvntE07pew@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1746589509; x=1747194309;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1JO9fTxBfn8KEBAvyB3IyLG5TiH4+A0bQcczBle4VWQ=;
 b=QHfZ03rOLeL9FwpV912f71Z4djzdK4/TLnLeIBcOW6uSa8rutNjgg2ayrsbDfkvIob
 +vw6oeL5RPzNh9KWjOOI1s35TpEY1uGcub1uq+D3B1TW2RuX7EAbLzeG9uvpgaoLoZ+Y
 ZYTP0emWAeuGCIhQ8Kw+niN+8sBaLlOIYKAzPaMARP8BTex0+6O89MolUVzJrbYgIn52
 eXrty7PVOQ11VpvEQSSt8+fCGOZ6y8gxDxDHZ5zfo8+z0gpg4vAEn9MCYKqJkA9k2LqA
 BY6UIBf/9CNo8+0+tEqDnihTx75Qh4VUd6gblhXATD3DIC/jb3mlR4RsLj1u+8xHzNHf
 VXBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=QHfZ03rO
Subject: Re: [Buildroot] [PATCH 4/5] package/python-flask-restx: add version
 1.3.0
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
Content-Type: multipart/mixed; boundary="===============5161624003248002165=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5161624003248002165==
Content-Type: multipart/alternative; boundary="0000000000003e952d0634838ff9"

--0000000000003e952d0634838ff9
Content-Type: text/plain; charset="UTF-8"

Thanks for the feedback Thomas.

I'll remove the dependency and send it again.

The `importlib-resources` package is a public package used to provide
backwards compatibility with older python versions; definitely not needed
with the python version used by buildroot. It was automatically added by
the import tool and I didn't notice it.

Cheers,
Daniel Crowe

On Mon, 21 Apr 2025 at 06:45, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Daniel,
>
> On Tue,  1 Apr 2025 10:07:25 +1030
> Daniel Crowe <daniel.crowe@maxmine.com.au> wrote:
>
> >  package/Config.in                                  |  1 +
> >  package/python-flask-restx/Config.in               | 13 +++++++++++++
> >  package/python-flask-restx/python-flask-restx.hash |  5 +++++
> >  package/python-flask-restx/python-flask-restx.mk   | 14 ++++++++++++++
> >  4 files changed, 33 insertions(+)
>
> The entry in the DEVELOPERS file is missing.
>
>
> > diff --git a/package/python-flask-restx/Config.in
> b/package/python-flask-restx/Config.in
> > new file mode 100644
> > index 0000000000..cdbe509891
> > --- /dev/null
> > +++ b/package/python-flask-restx/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_PYTHON_FLASK_RESTX
> > +     bool "python-flask-restx"
> > +     select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
> > +     select BR2_PACKAGE_PYTHON_FLASK # runtime
> > +     select BR2_PACKAGE_PYTHON_IMPORTLIB_RESOURCES # runtime
>
> Unless I'm missing something, this particular option doesn't exist in
> Buildroot. What did you want to achieve here? Is this a package you
> have in your private branch, and that you forgot to submit, or?
>
> Thanks a lot in advance for your clarification!
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000003e952d0634838ff9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the feedback Thomas.<div><br></div><div>I&#39;l=
l remove the=C2=A0dependency and send it again.<div><br></div><div><div>The=
 `importlib-resources` package is a public package used to provide backward=
s compatibility with older python versions; definitely not needed with the =
python version used by buildroot. It was automatically added by the import =
tool and I didn&#39;t notice it.</div></div></div><div><br></div><div>Cheer=
s,</div><div>Daniel Crowe</div></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 21 Apr 2025 at=
 06:45, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com=
">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hello Daniel,<br>
<br>
On Tue,=C2=A0 1 Apr 2025 10:07:25 +1030<br>
Daniel Crowe &lt;<a href=3D"mailto:daniel.crowe@maxmine.com.au" target=3D"_=
blank">daniel.crowe@maxmine.com.au</a>&gt; wrote:<br>
<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 package/python-flask-restx/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++++++++++++<br>
&gt;=C2=A0 package/python-flask-restx/python-flask-restx.hash |=C2=A0 5 +++=
++<br>
&gt;=C2=A0 package/python-flask-restx/<a href=3D"http://python-flask-restx.=
mk" rel=3D"noreferrer" target=3D"_blank">python-flask-restx.mk</a>=C2=A0 =
=C2=A0| 14 ++++++++++++++<br>
&gt;=C2=A0 4 files changed, 33 insertions(+)<br>
<br>
The entry in the DEVELOPERS file is missing.<br>
<br>
<br>
&gt; diff --git a/package/python-flask-restx/Config.in b/package/python-fla=
sk-restx/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..cdbe509891<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/python-flask-restx/Config.in<br>
&gt; @@ -0,0 +1,13 @@<br>
&gt; +config BR2_PACKAGE_PYTHON_FLASK_RESTX<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;python-flask-restx&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_ANISO8601 # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_FLASK # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_IMPORTLIB_RESOURCES # r=
untime<br>
<br>
Unless I&#39;m missing something, this particular option doesn&#39;t exist =
in<br>
Buildroot. What did you want to achieve here? Is this a package you<br>
have in your private branch, and that you forgot to submit, or?<br>
<br>
Thanks a lot in advance for your clarification!<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000003e952d0634838ff9--

--===============5161624003248002165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5161624003248002165==--
