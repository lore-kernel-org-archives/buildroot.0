Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0FCC27C55
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 16:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5B9F60893;
	Mon, 10 Jun 2024 16:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dl-JTb54B22o; Mon, 10 Jun 2024 16:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE297608D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE297608D2;
	Mon, 10 Jun 2024 16:25:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA8571BF4E4
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 16:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B79C98225C
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 16:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRoRmTIbYkvw for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 16:25:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5913082259
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5913082259
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5913082259
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 16:25:10 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-628c1f09f5cso2245547b3.1
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 09:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718036709; x=1718641509;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zRFpVo95FNdCANMRxtZx5GltIiU0hUzHux/fSLag0sM=;
 b=F9GJW9oJyzjpabdgObzOeKHIaZ8qEeZ3Vg0swdjhkF+GZGTJc14uaj96Txz2DHn6Bx
 3WEAZdBmEMgBVlWl3Q+xd1wyNRvQe5Nf/4DC4Y5IqxG0rSf5kpJ+YsdUAwZzFM36Ko4/
 AZhfAMNZtl1febzNKTMRqhOOsqSDM350BLz8ZPvhM9XpMrJ90teCGxaCZeBBRiH/tqCG
 DXfFQF7fwyhZ+IgyQqNjv2JvwpPFNrmYWanEYKc90282X+UYlIiaxI+uMei7ZEOLrHYg
 HZcfGA5KhKgeRKoLDupWWY1Bmh2BRhfhuMm/C93GPLZml049aWrRSCndMEv3VQo1i+uM
 fKZA==
X-Gm-Message-State: AOJu0Yxj9sN0I+tjoyIJssJgAwP291hd0XmIBOxPzLewOKkCDO+Eesgi
 vvjU6LqFtOCvhSFB2mm4u/zYDRsJWemhwO5ley3ceFcvwtwivnKBhFel+qqUjs+YUZjqAfh805y
 vYeuxW23Yig6pMpSYx6JZioOCk7QgOAvZ6sXfs72y8Ah+NcEP
X-Google-Smtp-Source: AGHT+IFBaSszEjQ2KepNAYm9Vtnbo3UD1rzhwPp5xXOtFTXThE5bR/Q1SU8x79lm82LofE41R/pD5p+Tq3aev801sT8=
X-Received: by 2002:a0d:d543:0:b0:615:22ff:b57d with SMTP id
 00721157ae682-62cd565f194mr114257167b3.42.1718036708146; Mon, 10 Jun 2024
 09:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ6EmCeAFeqGEy5Hq=UhFo8b6twQKD3++6Et9+jKH1U8d=vDEw@mail.gmail.com>
 <CA+R_derekqmyfwc=4Z00bpaC8USyY3909-PKU5Q4=HeBnE1vWw@mail.gmail.com>
In-Reply-To: <CA+R_derekqmyfwc=4Z00bpaC8USyY3909-PKU5Q4=HeBnE1vWw@mail.gmail.com>
From: Patricia Holden <pholden@nklabs.com>
Date: Mon, 10 Jun 2024 12:24:57 -0400
Message-ID: <CAJ6EmCcMKgxdKJ_dJmeKgtmivarZoS-ApUTbobS9UEdEeGE=Hw@mail.gmail.com>
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1718036709; x=1718641509; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zRFpVo95FNdCANMRxtZx5GltIiU0hUzHux/fSLag0sM=;
 b=Sc3P5y90309JOlHfbRKI3Um1nGB798zbWTD8mpURull+/vN6Xs20wvTUSYezB2LBPn
 2ZQ3J4c9Fjjg2C2T7RWBQzGA0HCPPa9VCKdEnDeGa2Sl3qVKZl9i+G1zKwtR7eGL4hh2
 Ng381xjeZ9RrIBF21BML66yeuxPiFo90WolXX7dKBdGdg8wnbzyKLrBOY6vADpwygcpQ
 RItShkR+FkJEl8/UQFTN7K9nVrAHud9QjohLcuTXyLPIj37t635rz7TMQQD26DnRWbE/
 C9mU5vv4RhVFAI1CUhLAHnxGaYnMDGSykrX4qx7FabnVabVvVSjUbC3jLM+VKrgGs4cZ
 9GHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=Sc3P5y90
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
Content-Type: multipart/mixed; boundary="===============6139794184602680479=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6139794184602680479==
Content-Type: multipart/alternative; boundary="000000000000b35785061a8b979e"

--000000000000b35785061a8b979e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for letting me know this.  I'll wait for the next bump.

On Sat, Jun 8, 2024 at 9:28=E2=80=AFAM Roy Kollen Svendsen <
roykollensvendsen@gmail.com> wrote:

> Hi Patricia,
>
> I got the same error message when I tried to build qtwebkit recently.
>
> It probably broke after the latest ruby bump.
>
> Regards,
> Roy
>
>
>
> fre. 7. jun. 2024, 20:17 skrev Patricia Holden <pholden@nklabs.com>:
>
>> I just downloaded and started using Buildroot 2024.02.2 for a Beagleplay
>> project I am working on for a client.  I am getting the following error
>> when QT5webkit is being built.  I found a couple patches in an online
>> search, but  they don't seem to be related to the problem I'm seeing.
>> Output of build below.  Has anyone seen this and is there a patch availa=
ble
>> for this problem?
>>
>>  from
>> /media/Projects/Edvotek/edvotek-edvocycler3/buildroot-2024.02.2/output/b=
uild/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/generate_off=
set_extractor.rb:68:in
>> `<main>'
>> make[4]: ***
>> [Source/JavaScriptCore/CMakeFiles/LLIntOffsetsExtractor.dir/build.make:9=
6:
>> DerivedSources/JavaScriptCore/LLIntDesiredOffsets.h] Error 1
>> make[3]: *** [CMakeFiles/Makefile2:1430:
>> Source/JavaScriptCore/CMakeFiles/LLIntOffsetsExtractor.dir/all] Error 2
>> make[3]: *** Waiting for unfinished jobs....
>> [  4%] Linking CXX shared library ../../../lib/libgtest.so
>> [  4%] Built target gtest
>> make[2]: *** [Makefile:166: all] Error 2
>> make[1]: *** [package/pkg-generic.mk:283:
>> /media/Projects/Edvotek/edvotek-edvocycler3/buildroot-2024.02.2/output/b=
uild/qt5webkit-5.212.0-alpha4/.stamp_built]
>> Error 2
>> make: *** [Makefile:82: _all] Error 2
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>

--000000000000b35785061a8b979e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for letting me know this.=C2=A0 I&#39;ll wait for t=
he next bump.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat, Jun 8, 2024 at 9:28=E2=80=AFAM Roy Kollen Svendsen &lt=
;<a href=3D"mailto:roykollensvendsen@gmail.com">roykollensvendsen@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"auto">Hi Patricia,<div dir=3D"auto"><br></div><div dir=3D"auto"=
>I got the same error message when I tried to build qtwebkit recently.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">It probably broke after the =
latest ruby bump.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regard=
s,</div><div dir=3D"auto">Roy</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">fre. 7. jun. 2024, 20:17 skrev Patricia Holden &lt;<a href=
=3D"mailto:pholden@nklabs.com" target=3D"_blank">pholden@nklabs.com</a>&gt;=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r">I just=C2=A0downloaded and started using Buildroot 2024.02.2 for a Beagl=
eplay project I am=C2=A0working on for=C2=A0a client.=C2=A0 I am getting th=
e following error when QT5webkit is being built.=C2=A0 I found a couple pat=
ches in an online search, but=C2=A0 they don&#39;t seem to be related to th=
e problem I&#39;m seeing.=C2=A0 Output of build below.=C2=A0 Has anyone see=
n this and is there a patch available for this problem?<div><br></div><div>=
=C2=A0from /media/Projects/Edvotek/edvotek-edvocycler3/buildroot-2024.02.2/=
output/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/offlineasm/gene=
rate_offset_extractor.rb:68:in `&lt;main&gt;&#39;<br>make[4]: *** [Source/J=
avaScriptCore/CMakeFiles/LLIntOffsetsExtractor.dir/build.make:96: DerivedSo=
urces/JavaScriptCore/LLIntDesiredOffsets.h] Error 1<br>make[3]: *** [CMakeF=
iles/Makefile2:1430: Source/JavaScriptCore/CMakeFiles/LLIntOffsetsExtractor=
.dir/all] Error 2<br>make[3]: *** Waiting for unfinished jobs....<br>[ =C2=
=A04%] Linking CXX shared library ../../../lib/libgtest.so<br>[ =C2=A04%] B=
uilt target gtest<br>make[2]: *** [Makefile:166: all] Error 2<br>make[1]: *=
** [package/<a href=3D"http://pkg-generic.mk:283" rel=3D"noreferrer" target=
=3D"_blank">pkg-generic.mk:283</a>: /media/Projects/Edvotek/edvotek-edvocyc=
ler3/buildroot-2024.02.2/output/build/qt5webkit-5.212.0-alpha4/.stamp_built=
] Error 2<br>make: *** [Makefile:82: _all] Error 2<br></div></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" rel=3D"noreferrer" target=3D"_bl=
ank">buildroot@buildroot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman=
/listinfo/buildroot</a><br>
</blockquote></div>
</blockquote></div>

--000000000000b35785061a8b979e--

--===============6139794184602680479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6139794184602680479==--
