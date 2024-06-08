Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49649C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF1D480E87;
	Sat,  8 Jun 2024 13:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgGeC6NrxCsg; Sat,  8 Jun 2024 13:28:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C336280E9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C336280E9B;
	Sat,  8 Jun 2024 13:28:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E55E21BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DEDDB402EA
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGQmXRRXs5Rl for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F75B402CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F75B402CD
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F75B402CD
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:28:47 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-627efad69b4so29848057b3.3
 for <buildroot@buildroot.org>; Sat, 08 Jun 2024 06:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717853326; x=1718458126;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wOBuk/Z+V8USFuRcGleSDugBhLKhCqGt5sQu5OG9Vw8=;
 b=Kx7JmJLGajzM6aUIaQTLi/sG4o7V+FcC+457JftNJ8Wjivzx6K9DIC6LZc5pqbwVjM
 WpSpE1jszkehX2KRDCWKHukyUf47Cj9X9ogvAf3yoWpYnXIhksmmrqgiclxgpm2MDpof
 ovbhuezusM4xGZCon4KFTNJHutoQ2M4DRb4nSHl8XSh49UXujfhOIGBC3mFhBG1syE5T
 0P6KBDSanNe/lX7emWtcFWswSi6mUqFxs/rkZw0xCsr7QTn/wvqLsH3aEB96zMDd5nwG
 upfCbkt+N9KvGJH3aMWZXOYxsrmij4tpxBPkGe6JaCWCAP9tI492fnj+m7lFbBgZT5Kf
 qSIA==
X-Gm-Message-State: AOJu0Yy+Ctz6JImA8hecTp+90mUm33vwmrjlEEh7Lgg3ueOvbtE+flDy
 tX7sHpccOY2V6Gmr3VHTgfCLEzUNx4Spa4+PJ8jCeZhVHcPq+YRYhlR4xU4bEeLUmyAZPNfw+Sv
 eeDMGU+CiS0NV+L27CHzJcFGQ4Ps=
X-Google-Smtp-Source: AGHT+IEKxRlch0/MqBoZ6JHH53BsOkFO2irvlPAalkwBdqB9qBUKMRqpGnONMR1VoJ9N/kCmi3lsfS4ztfIa9mzCt5Y=
X-Received: by 2002:a81:d444:0:b0:617:fbaa:1d91 with SMTP id
 00721157ae682-62cd55f3a1fmr52454537b3.11.1717853326566; Sat, 08 Jun 2024
 06:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ6EmCeAFeqGEy5Hq=UhFo8b6twQKD3++6Et9+jKH1U8d=vDEw@mail.gmail.com>
In-Reply-To: <CAJ6EmCeAFeqGEy5Hq=UhFo8b6twQKD3++6Et9+jKH1U8d=vDEw@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sat, 8 Jun 2024 15:28:30 +0200
Message-ID: <CA+R_derekqmyfwc=4Z00bpaC8USyY3909-PKU5Q4=HeBnE1vWw@mail.gmail.com>
To: Patricia Holden <pholden@nklabs.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717853326; x=1718458126; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wOBuk/Z+V8USFuRcGleSDugBhLKhCqGt5sQu5OG9Vw8=;
 b=DJ9mM+yC07TUvSZB8DOpxFFdWLKVI/QHGqdH0wlFVX/pWbAtXnklj5XBAtI5NwwzJ+
 DISBJeh+HQtJaVQfZIvGAW8MDzZL7le1w0ba1AQf9YEsVvlJEr2DxIVV8tl07XdA+PgN
 F//Ww1a9ZmltaYK2yUWdjW1Mf8l0LFsbAHQC0xinBNLcr4aKYA27BTrK10qAx4azZQI0
 L7R0QD4cIFVsP+wP9TPChW7ScvYb+YhPn1FrX4wFqpCMq4RxefBUYBzWULWekkI70j/7
 DEYAJ5TI0b6eDWjgfJzHbfG9wtfiPKqQ8Z4aNbpPw2YVxfxYvwN2vWA+Y6K58wraBb1R
 PDng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DJ9mM+yC
Subject: Re: [Buildroot] QT5webkit build error
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
Content-Type: multipart/mixed; boundary="===============6336084905081333483=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6336084905081333483==
Content-Type: multipart/alternative; boundary="0000000000004e6ff9061a60e506"

--0000000000004e6ff9061a60e506
Content-Type: text/plain; charset="UTF-8"

Hi Patricia,

I got the same error message when I tried to build qtwebkit recently.

It probably broke after the latest ruby bump.

Regards,
Roy



fre. 7. jun. 2024, 20:17 skrev Patricia Holden <pholden@nklabs.com>:

> I just downloaded and started using Buildroot 2024.02.2 for a Beagleplay
> project I am working on for a client.  I am getting the following error
> when QT5webkit is being built.  I found a couple patches in an online
> search, but  they don't seem to be related to the problem I'm seeing.
> Output of build below.  Has anyone seen this and is there a patch available
> for this problem?
>
>  from
> /media/Projects/Edvotek/edvotek-edvocycler3/buildroot-2024.02.2/output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/generate_offset_extractor.rb:68:in
> `<main>'
> make[4]: ***
> [Source/JavaScriptCore/CMakeFiles/LLIntOffsetsExtractor.dir/build.make:96:
> DerivedSources/JavaScriptCore/LLIntDesiredOffsets.h] Error 1
> make[3]: *** [CMakeFiles/Makefile2:1430:
> Source/JavaScriptCore/CMakeFiles/LLIntOffsetsExtractor.dir/all] Error 2
> make[3]: *** Waiting for unfinished jobs....
> [  4%] Linking CXX shared library ../../../lib/libgtest.so
> [  4%] Built target gtest
> make[2]: *** [Makefile:166: all] Error 2
> make[1]: *** [package/pkg-generic.mk:283:
> /media/Projects/Edvotek/edvotek-edvocycler3/buildroot-2024.02.2/output/build/qt5webkit-5.212.0-alpha4/.stamp_built]
> Error 2
> make: *** [Makefile:82: _all] Error 2
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000004e6ff9061a60e506
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Patricia,<div dir=3D"auto"><br></div><div dir=3D"auto"=
>I got the same error message when I tried to build qtwebkit recently.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">It probably broke after the =
latest ruby bump.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regard=
s,</div><div dir=3D"auto">Roy</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">fre. 7. jun. 2024, 20:17 skrev Patricia Holden &lt;<a href=
=3D"mailto:pholden@nklabs.com">pholden@nklabs.com</a>&gt;:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr">I just=C2=A0downloaded and started=
 using Buildroot 2024.02.2 for a Beagleplay project I am=C2=A0working on fo=
r=C2=A0a client.=C2=A0 I am getting the following error when QT5webkit is b=
eing built.=C2=A0 I found a couple patches in an online search, but=C2=A0 t=
hey don&#39;t seem to be related to the problem I&#39;m seeing.=C2=A0 Outpu=
t of build below.=C2=A0 Has anyone seen this and is there a patch available=
 for this problem?<div><br></div><div>=C2=A0from /media/Projects/Edvotek/ed=
votek-edvocycler3/buildroot-2024.02.2/output/build/qt5webkit-5.212.0-alpha4=
/Source/JavaScriptCore/offlineasm/generate_offset_extractor.rb:68:in `&lt;m=
ain&gt;&#39;<br>make[4]: *** [Source/JavaScriptCore/CMakeFiles/LLIntOffsets=
Extractor.dir/build.make:96: DerivedSources/JavaScriptCore/LLIntDesiredOffs=
ets.h] Error 1<br>make[3]: *** [CMakeFiles/Makefile2:1430: Source/JavaScrip=
tCore/CMakeFiles/LLIntOffsetsExtractor.dir/all] Error 2<br>make[3]: *** Wai=
ting for unfinished jobs....<br>[ =C2=A04%] Linking CXX shared library ../.=
./../lib/libgtest.so<br>[ =C2=A04%] Built target gtest<br>make[2]: *** [Mak=
efile:166: all] Error 2<br>make[1]: *** [package/<a href=3D"http://pkg-gene=
ric.mk:283" target=3D"_blank" rel=3D"noreferrer">pkg-generic.mk:283</a>: /m=
edia/Projects/Edvotek/edvotek-edvocycler3/buildroot-2024.02.2/output/build/=
qt5webkit-5.212.0-alpha4/.stamp_built] Error 2<br>make: *** [Makefile:82: _=
all] Error 2<br></div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"norefer=
rer">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
</blockquote></div>

--0000000000004e6ff9061a60e506--

--===============6336084905081333483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6336084905081333483==--
