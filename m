Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07CFCD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 07:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D3A7847BF;
	Sun, 31 May 2026 07:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoerPyASbNAn; Sun, 31 May 2026 07:03:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1E8684C55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780210989;
	bh=OLD4FziwbUh6vdmHB0xofPlEvt49jDca6laY2iahNZs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hySTbfugWPyinG6vh/8vyZ9odKnEVFPcF+p3ESBmG+wE2/FMSLV7aKuz7pSrKhgA6
	 8TxyQdhAngmTI9oRjKW1Q/IJD4Mtb/rtuvDh7BZqXJoGGdcWguKFR9+lG7hjTLorfV
	 l/yoWpcKCftO94sjT4jNqYQ3CXvtQDqZfENxudO44z7zsbhgBWmB4D51kNfEurSPto
	 WqQ43gmVgNUI3Fjpv+0DoyCXo2THwT+1eP9ZzkQMIhjuDddeKkwxIJ5JB4xm+kE2X2
	 ttq37//ua+vpqHU43lp4ibFiWAVESf2vDw5AvJaiQqdolH6QlY4OycPbqptJj0dHru
	 35B24fQSmq6xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1E8684C55;
	Sun, 31 May 2026 07:03:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6023CF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5169D40422
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zjHquechu1r for <buildroot@buildroot.org>;
 Sun, 31 May 2026 07:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 05A0A403DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05A0A403DA
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05A0A403DA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 07:03:06 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-68bac6e24fdso3691580a12.1
 for <buildroot@buildroot.org>; Sun, 31 May 2026 00:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780210985; cv=none;
 d=google.com; s=arc-20240605;
 b=WO7D38x6E2IkrcUvVtpXZIX2nkldCUuftli16cxUwPmUnqNPwI4YDnUESnIOphbslU
 xqZ3gvRo3geo2+GuOtX9aaD+A8o0LrxOXIG4hTOlmXkKXG5AmIzE4Ldf1aw9uK3PkBlU
 2K57AaHDEy+6BZUID57R6xs4aOqNI79bFj+A/tie1k5Py3CPH+wOz9ApX9Ead+p6Ckgk
 ve+u2ppLMWYBM3LytOHXVot5uV4lSHPKDb0dn6O7DClbqf+kaFf3mizFMiCYtm3C1dTp
 hp3/8wvPxAOdBD+vwTKVDsVbN4lFm4shgIsCNWqnAclDgZoxY5KyiiT2xbiHALKzTTAG
 TW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=C/IctX5MDpJw/VFTd5FE5cbxYR/DsPCpTM9JkO1e7no=;
 fh=yd5wM2qwHOIEGqaKbZmcSyTzhOo1yXvpGyFwvzGLJ/w=;
 b=GOBsGokONN4iWkFdMY3cjJDozOkdLIXvJiwBh0MsdU+2tDiYOqXO4Bttu3FFezyCEc
 Z6u9ni2au3EWsNh2gIW7UfhLGH/x4VC31R7gnt0MOlVyeww9wM9yKFXGMYOFSOBukFfn
 lpCeGHx4BJEG2ly+m5smWtAzEu9VrqMqemHJVFrwHKTdUo6vmB7JD34Zceiq33E6YvjW
 6EdGwJV4wz4P7AvL2N+cdLuYVUbIYTbra4alPB4U9a7D+6FYJbsx+oSy3TbWCrYURyiM
 AehJrHeVVNj3cgu+2XzV+xI447LPGJao7iKtrTpuuLP6yHvd4oiAcWbpHSCQKF5gEOye
 ry0g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780210985; x=1780815785;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/IctX5MDpJw/VFTd5FE5cbxYR/DsPCpTM9JkO1e7no=;
 b=NUUS9Lfky/IEHi8Kf1+RMb4HL16rtuFyE2bpX7h5mdfaE2zByE85Xiad+DNFXIInnQ
 iwxRYx4QPKhCeLy6qcD4NqYEuaANLT3d96GjRIGatZn9ldQ51OmMTna2kvqrUUVS7ulD
 6dTA68mvcQKXfGE/PgatVRH+XEUESysf6qcFvqfsxGXLbjQvJGGsPazjh++sh7J5nvNe
 /KXVAAfTKJ48Q/PPLOUuS8qc+7oN9KlNqMKD1or974eE9Tmje9fk/uhoPiuFa0Tk6HA6
 d49AmN61JsbfTB6SILQpi6GOFY+c/Ddjit59tBfsBWvhR6ALfBHKkNfBbAGS3vtFpgX8
 3A6g==
X-Gm-Message-State: AOJu0YxPJ6bBuyuSOhBhKYHrrC6cMcmU00rnhGn5vChaU9cM9+cyt1IB
 3wMAdE9IzYI/dU7mWsGXDJbks78pJ5OQ8OKKYPY2vfXSNiOHWz1LVR5UQbg1DpaxuPCBj4dCW6N
 /++/oWbPR9/w4BuUYtTgzIvd/G38aCTHdg9v2YSw=
X-Gm-Gg: Acq92OF1Nu8vcp6fEAQ58+LwlhmyYHbmdikBB34pCiiOhqXgli4lZ7ERdo2fSZVAQ6e
 x1uoND4ezUukRJjsmSfRsLKT0bE660fkEm1rIsyh0wlNzWN3zXadxWUoAvD7tAolSuy2VnsR/2i
 aniqKTOLSIZKh1m10uwo3L72iWH1M/qdBlecFuTnZKlorSIJHmnA58qd1e66vZ/lFROmz8szBtY
 L6oM2i6+7ulDwpz67Mh5MTFjqCScnse7U2qqedK1TkYTN/xsGemQTd+nOSu/9+BEWiIft4gpGGg
 HmZbygCdyzYxNFi6nk94q+bPoiZ0NUEFt4Lzq8tQtN9tQb76ArT4
X-Received: by 2002:a05:6402:5487:b0:689:6c2e:6cce with SMTP id
 4fb4d7f45d1cf-68c8a18594emr2807895a12.2.1780210984498; Sun, 31 May 2026
 00:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260412182023.96383-1-chakrabortyshubham66@gmail.com>
 <ahtflblRB-XoMzK1@windsurf>
In-Reply-To: <ahtflblRB-XoMzK1@windsurf>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun, 31 May 2026 12:32:53 +0530
X-Gm-Features: AVHnY4JCCAnHQO3Tr-Do8xR2QCedZg_Da_Os7ZRGfrdjhVjVhoFFgq3JHvvCaoI
Message-ID: <CABvxksxS_jbkTBK=u6iFNoVTS=CqHmPt5dOBJUKUfoJcZgajjQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780210985; x=1780815785; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=C/IctX5MDpJw/VFTd5FE5cbxYR/DsPCpTM9JkO1e7no=;
 b=DtftEDsHftl9ipMsub6Rcc2jNh3npN4CqpvkqVlUoXgZ5MYU+5IGlruISFLImX1laF
 P2Wtsr37JcGTOQ2oC2B4PmBl4xXAIU0TER0aga6KHqzHQdDcM0YfQSPzEqnsMloFnGAA
 k5j5cxtzVtlNktIDPSm8N0Tf6tdm5TqtIY9F2l93cF4cWjpC/pT7KJhXF/mdkHotDUtB
 IyTBohNg2RWkDykVNZY1yPTcr1vO9LvS+MVEqkRts5PbP/6L5m8YHvkKTiFkRL8PCyvH
 oPMeF++0+z2vRitGVDHyN2Xf1ZwDqZAFR0eKSKysOp4mJGRe8sCmbIzsY3rKv0pN82Wu
 1Lcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DtftEDsH
Subject: Re: [Buildroot] [PATCH] package/bash-completion: bump to version
 2.17.0
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
Content-Type: multipart/mixed; boundary="===============1521599613635912861=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1521599613635912861==
Content-Type: multipart/alternative; boundary="0000000000005b3943065317abb7"

--0000000000005b3943065317abb7
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

The changelog summary in the commit message was AI-generated and did not
accurately reflect the upstream changes. I understand that this makes
review more difficult and wastes maintainer time.

I also missed the incorrect alphabetical ordering in DEVELOPERS and did
not explain the license file hash change in the commit message.

I will send a corrected version and will not use AI for drafting commit
messages.

Best regards,

Shubham Chakraborty

On Sun, 31 May, 2026, 3:40 am Thomas Petazzoni, <
thomas.petazzoni@bootlin.com> wrote:

> On Sun, Apr 12, 2026 at 11:50:22PM +0530, Shubham Chakraborty wrote:
> > - Enhanced smartctl completion support
> > - Added recursive directory handling improvements
> > - Fixed rsync/scp/ssh file type handling
> > - Improved BSD compatibility for rsync
> > - Fixed chgrp completion typo
>
> Where does this invented changelog comes from? Seems like a vague
> summary generated by AI. Stop using AI to generate Buildroot
> patches. We will reject all your patches if you continue to spam us
> with contributions generated by AI.
>
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 9e9c8a5a0f..9b123af415 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -3062,6 +3062,7 @@ F:      package/wolfssl/
> >  N:   Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> >  F:   package/ccache/
> >  F:   package/hyperfine/
> > +F:   package/bash-completion/
>
> Alphabetic ordering is not correct.
>
> > diff --git a/package/bash-completion/bash-completion.hash
> b/package/bash-completion/bash-completion.hash
> > index 7e952e5b02..294ab65a2b 100644
> > --- a/package/bash-completion/bash-completion.hash
> > +++ b/package/bash-completion/bash-completion.hash
> > @@ -1,3 +1,3 @@
> >  # Locally calculated
> > -sha256
> 73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac
> bash-completion-2.11.tar.xz
> > -sha256
> ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> > +sha256
> dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c570b9e58
> bash-completion-2.17.0.tar.xz
> > +sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>
> Changes to license files must be explained in the commit message.
>
> But again: stop using AI. Focus on quality instead of quantity. You
> are burning limited and precious maintainer review time.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000005b3943065317abb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><p class=3D"gmail-isSelectedEnd">Hi Thom=
as,</p><p class=3D"gmail-isSelectedEnd">The changelog summary in the commit=
 message was AI-generated and did not<br>accurately reflect the upstream ch=
anges. I understand that this makes<br>review more difficult and wastes mai=
ntainer time.</p><p class=3D"gmail-isSelectedEnd">I also missed the incorre=
ct alphabetical ordering in DEVELOPERS and did<br>not explain the license f=
ile hash change in the commit message.</p><p class=3D"gmail-isSelectedEnd">=
I will send a corrected version and will not use AI for drafting commit<br>=
messages.</p><p class=3D"gmail-isSelectedEnd">Best regards,</p><p>Shubham C=
hakraborty</p></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Sun, 31 May, 2026, 3:40 am Thomas Petazzoni, &lt;<a =
href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.petaz=
zoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Sun, Apr 12, 2026 at 11:50:22PM +0530, Shubham Chakrabor=
ty wrote:<br>
&gt; - Enhanced smartctl completion support<br>
&gt; - Added recursive directory handling improvements<br>
&gt; - Fixed rsync/scp/ssh file type handling<br>
&gt; - Improved BSD compatibility for rsync<br>
&gt; - Fixed chgrp completion typo<br>
<br>
Where does this invented changelog comes from? Seems like a vague<br>
summary generated by AI. Stop using AI to generate Buildroot<br>
patches. We will reject all your patches if you continue to spam us<br>
with contributions generated by AI.<br>
<br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; index 9e9c8a5a0f..9b123af415 100644<br>
&gt; --- a/DEVELOPERS<br>
&gt; +++ b/DEVELOPERS<br>
&gt; @@ -3062,6 +3062,7 @@ F:=C2=A0 =C2=A0 =C2=A0 package/wolfssl/<br>
&gt;=C2=A0 N:=C2=A0 =C2=A0Shubham Chakraborty &lt;<a href=3D"mailto:chakrab=
ortyshubham66@gmail.com" rel=3D"noreferrer" target=3D"_blank">chakrabortysh=
ubham66@gmail.com</a>&gt;<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/ccache/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/hyperfine/<br>
&gt; +F:=C2=A0 =C2=A0package/bash-completion/<br>
<br>
Alphabetic ordering is not correct.<br>
<br>
&gt; diff --git a/package/bash-completion/bash-completion.hash b/package/ba=
sh-completion/bash-completion.hash<br>
&gt; index 7e952e5b02..294ab65a2b 100644<br>
&gt; --- a/package/bash-completion/bash-completion.hash<br>
&gt; +++ b/package/bash-completion/bash-completion.hash<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 # Locally calculated<br>
&gt; -sha256=C2=A0 73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0=
daf911ac=C2=A0 bash-completion-2.11.tar.xz<br>
&gt; -sha256=C2=A0 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b=
9b8666c6=C2=A0 COPYING<br>
&gt; +sha256=C2=A0 dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c=
570b9e58=C2=A0 bash-completion-2.17.0.tar.xz<br>
&gt; +sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a40401052=
1b880643=C2=A0 COPYING<br>
<br>
Changes to license files must be explained in the commit message.<br>
<br>
But again: stop using AI. Focus on quality instead of quantity. You<br>
are burning limited and precious maintainer review time.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--0000000000005b3943065317abb7--

--===============1521599613635912861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1521599613635912861==--
