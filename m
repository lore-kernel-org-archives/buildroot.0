Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210C1C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 09:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C454179D;
	Sat, 31 May 2025 09:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GedOSps64W0R; Sat, 31 May 2025 09:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B317641957
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B317641957;
	Sat, 31 May 2025 09:28:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F19E235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 09:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4525640111
 for <buildroot@buildroot.org>; Sat, 31 May 2025 09:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5j3g1zO9YSom for <buildroot@buildroot.org>;
 Sat, 31 May 2025 09:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4889F40018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4889F40018
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4889F40018
 for <buildroot@buildroot.org>; Sat, 31 May 2025 09:28:42 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e7dc5f8148bso3722559276.0
 for <buildroot@buildroot.org>; Sat, 31 May 2025 02:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748683721; x=1749288521;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9T6fqvT8G7AGslu9jsnLxJFCJlvYyQUbbPzs1gBpTwo=;
 b=Oa3psvzR1kr5WdFrv5gFGNiLnjK03/9PckaX5oi5UwDNFUAjDrcFqxLgnad2WE8sbL
 GTlUfLFLWy/1AgtWslAJyP5t6kEPRBgOt+L8ruL5J7464v02tzKonZEHO9aT2omSbJRA
 BNJYlXA/8G/jFWa7sWesTkt4nKnDfWxmCgbr9eaf4w0oaYP4sa84HB3VBuhYb7yfmpk8
 nGij6oqCPgwSGlqEGdTAo1UKP2Lbr08vvCEnoMTCz3f7pxVL3w1MZYgl6075Ls74FIzG
 CnuFDzUXvB0xBM72Ke/J48vOB16L14dKMZ9kjflG7u17md0c7boR77YVJ1KzYZTiPXIA
 Brdw==
X-Gm-Message-State: AOJu0YzNVwqxnqpaeMJm7ENhDxVvpPvmkXv7/XjJNFrfQZwVSqV1p6DT
 yHgbxLd9E3J09sObYpctqKSR8oyE7+Lr2B7/wgPaAT+Of0jhgnDC6GqoypQuidiZboarT8zMAEq
 3rMp8H6zU1o/VQr9Kyv7tawqAverWxUqGMA5I
X-Gm-Gg: ASbGnctOANR+Urx6sy2PCJGuu+gMQhwDArAfdgtClGvHwvBlwCNVbpebzZ14QjRmOMq
 cxmzM2Ac0B3hDuCMSEdx2ReoF1j445iGBE/c4V+Pw8ELiOlqa81TPEiWVSuFn8DR5Aj1cH/73O+
 q5Ui1DFQSQUFOCxpJNkfX/q2sIxCe/U1T4N0S14jcap++sfbUxMmfTbFHCk1OvYwNyMurzbiy3b
 baQ
X-Google-Smtp-Source: AGHT+IFFSJWaQ6wnyP005VBotBA48ffXf+/QbexeyEf6qMxvXuHXZn/9z2v8MJAfxWph9DndHe+k39oVu9do5N84y+E=
X-Received: by 2002:a05:690c:4f8a:b0:70e:4b30:c207 with SMTP id
 00721157ae682-70f876551a3mr102065367b3.4.1748683721020; Sat, 31 May 2025
 02:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250520113339.2525537-1-roykollensvendsen@gmail.com>
 <20250530221038.28479ac8@windsurf>
In-Reply-To: <20250530221038.28479ac8@windsurf>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sat, 31 May 2025 11:28:29 +0200
X-Gm-Features: AX0GCFsukNJw3G_X8-xeV7hPSRQccSuSjKCuxOzOvYk_F7cZvT9S4bbcct2GHAw
Message-ID: <CA+R_dep=8ZTBjLC0ARZ9=+duk9=btNpmf6O-oJnnP9PvKfoeFw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Hitz <christian@klarinett.li>, 
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748683721; x=1749288521; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9T6fqvT8G7AGslu9jsnLxJFCJlvYyQUbbPzs1gBpTwo=;
 b=G8wAptYzXLdJFQ9KVfrECEgXTHiyAN8Gc9WKF8S8LFSM1L5wwXbC0AzHTs+CSTDZdn
 DBXZJu5kB0jxv1TFBs8y5CPAafqt0OeXES7j/lJe2z2ZeN8x5IZsfevniIRMd+soBAbW
 qMCf++hK3jQ3r4axgch77WFAfQ7lGXEO9duV0/1BjaqxZDyLOnuJ4N82CMYoIyTawI96
 BoA8NmN3wo3u1toom6nnZXo/Ouc2fmVMd98z01DeOcL5I9ux3LVMcwJGznVpDHO4VHPa
 Q2REdLQwEFHyUymZDYPSScssc/sU9FcmvE5BenKc2vDo6FAJQj1jKuzu08cJj2FDGhBv
 f6sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=G8wAptYz
Subject: Re: [Buildroot] [PATCH v3 00/12] Bump Qt6 to 6.9.0,
 add and fix packages
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
Content-Type: multipart/mixed; boundary="===============5507051177065544032=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5507051177065544032==
Content-Type: multipart/alternative; boundary="000000000000041b3406366b2895"

--000000000000041b3406366b2895
Content-Type: text/plain; charset="UTF-8"

fre. 30. mai 2025 kl. 22:10 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Roy,
>
> Thanks a lot for this new iteration and this great work on Qt6
> packaging!
>
> On Tue, 20 May 2025 13:33:19 +0200
> Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:
>
> > Roy Kollen Svendsen (9):
> >   package/qt6: bump version to 6.9.0
> >   package/qt6/qt6sensors: new package
> >   package/qt6/qt6speech: new package
> >   package/qt6/qt6base: add hidden options needed by qt6tools
> >   package/qt6/qt6tools: fix assistant build failure
> >   package/qt6/qt6tools: fix designer build failure
> >   package/qt6/qt6tools: fix linguist build failure
> >   package/qt6/qt6tools: fix assistant build failure
> >   package/qt6/qt6tools: build without clang support
>
> Could you clarify whether the fixes are needed *due* to the 6.9.0 bump,
> or are already valid for the current version of Qt6 in Buildroot?
>
> I first discovered some of these problems when I was bumping the version
to 6.8.2. Everything probably
also applies to 6.8.1.


> Indeed your fixes appear *after* the version bump in your series, and
> the commit logs of the fixes refer to 6.9.0, but my understanding is
> that they are applicable to the Qt6 version currently in Buildroot.
>
> Could you clarify this? In generally, fixes should come before
> bumps/improvements in patch series, if said fixes are applicable to
> version of software packages already in Buildroot.
>
> I'll change the order, and run the test defconfigs before and after the
individual changes.

I wont be able to do this today. But tomorrow or monday.


> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000041b3406366b2895
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">fre. 30. mai 20=
25 kl. 22:10 skrev Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@=
bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hello Roy,<br>
<br>
Thanks a lot for this new iteration and this great work on Qt6<br>
packaging!<br>
<br>
On Tue, 20 May 2025 13:33:19 +0200<br>
Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com" targ=
et=3D"_blank">roykollensvendsen@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Roy Kollen Svendsen (9):<br>
&gt;=C2=A0 =C2=A0package/qt6: bump version to 6.9.0<br>
&gt;=C2=A0 =C2=A0package/qt6/qt6sensors: new package<br>
&gt;=C2=A0 =C2=A0package/qt6/qt6speech: new package<br>
&gt;=C2=A0 =C2=A0package/qt6/qt6base: add hidden options needed by qt6tools=
<br>
&gt;=C2=A0 =C2=A0package/qt6/qt6tools: fix assistant build failure<br>
&gt;=C2=A0 =C2=A0package/qt6/qt6tools: fix designer build failure<br>
&gt;=C2=A0 =C2=A0package/qt6/qt6tools: fix linguist build failure<br>
&gt;=C2=A0 =C2=A0package/qt6/qt6tools: fix assistant build failure<br>
&gt;=C2=A0 =C2=A0package/qt6/qt6tools: build without clang support<br>
<br>
Could you clarify whether the fixes are needed *due* to the 6.9.0 bump,<br>
or are already valid for the current version of Qt6 in Buildroot?<br>
<br></blockquote><div>I first discovered some of these problems when I was =
bumping the version to 6.8.2. Everything probably</div><div>also applies to=
 6.8.1.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
Indeed your fixes appear *after* the version bump in your series, and<br>
the commit logs of the fixes refer to 6.9.0, but my understanding is<br>
that they are applicable to the Qt6 version currently in Buildroot.<br>
<br>
Could you clarify this? In generally, fixes should come before<br>
bumps/improvements in patch series, if said fixes are applicable to<br>
version of software packages already in Buildroot.<br>
<br></blockquote><div><div>I&#39;ll change the order, and run the test defc=
onfigs before and after the individual changes.=C2=A0</div><div><br></div><=
div>I wont be able to do this today. But tomorrow or monday.</div><div>=C2=
=A0</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000041b3406366b2895--

--===============5507051177065544032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5507051177065544032==--
