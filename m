Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A47DC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 17:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B66DA4088C;
	Sun,  7 Aug 2022 17:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B66DA4088C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mw_kiS7q6LOS; Sun,  7 Aug 2022 17:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8599D4054A;
	Sun,  7 Aug 2022 17:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8599D4054A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34DC01BF3D6
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F9BD60B2E
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 17:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F9BD60B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qR4pAZwA21oB for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 17:38:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C1B560B2B
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C1B560B2B
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 17:38:11 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id 7so10649196ybw.0
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 10:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=48uh5GR5f2HFGiwGi76Fs7KFG3OR52DIr+PfvrDlYi8=;
 b=cfTUWu7UCljbTQp4OdCGtgQqONm7uElSIObQc5mvmLNcQMWXkWUKmpmwRmmkO33EWP
 TQBVx79mqUdUFPGd32VHSktFX/J4XNzvLNgs8JK/PumsGg1SsPbXsUmdD9E+RZIJHbL1
 ODEh2cIj8iD08QVYrzabhZ1JkHmkC0iL3etUTCgEdoMFD2B0EhYbMzKOhJ7TGoRaKZWI
 MlEpHZ04zSmi6VgkYcSXUplBrHDSZvsyUbhr5VfFg22fwu2lAFv8KuoD4b8kk1DYVws3
 WO8q08T6ipQQD+KzJwNnjBXIa0cOC0+H9lEZ+GaORSVioTIQc4akPFg8CSo5SBeXa0UR
 65Eg==
X-Gm-Message-State: ACgBeo3WgNPCuFELa//AS8hOiRc2IYSaXUSr8chUzwlmI8r1UG18kpDG
 K/ljkqghZwRDjigxOLZWhRqOzd1DlMp1AAfhW94=
X-Google-Smtp-Source: AA6agR6d2Fwmc7gURsnxubSmqOZSMjHj2uVEVrQZun3sUBU5G1CBhCiyDwWqFfRtkN2NpDzdJso41HOXICYmnYF94dg=
X-Received: by 2002:a25:8b92:0:b0:66d:553a:f309 with SMTP id
 j18-20020a258b92000000b0066d553af309mr13079600ybl.322.1659893890209; Sun, 07
 Aug 2022 10:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-5-emile.cormier.jr@gmail.com>
 <20220807181220.7688111e@windsurf>
 <CAM70yxBzagJt5b-3_vKO=AaknpvLbKhyLMPhbs=VC5XO0RgbOQ@mail.gmail.com>
 <20220807191843.465aa42d@windsurf>
In-Reply-To: <20220807191843.465aa42d@windsurf>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Sun, 7 Aug 2022 14:37:59 -0300
Message-ID: <CAM70yxB7dHeOz-NQtVoot+8Q6E-OX7tCpCTLGD5S+mHz7V2wHg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=48uh5GR5f2HFGiwGi76Fs7KFG3OR52DIr+PfvrDlYi8=;
 b=XmiXp1feUUEvcTT1GqyBmzimeEWHAF2C6/72iE2Yow7j6uOqRSMy09ZGjr/buTBBN5
 b16h3o6rPjn572cp1SdFdBH/o95iKyOm8dODaj6r39PGHBmKajib0QRqCg1wvjy3Gylv
 xvTIxpza6CONrkeq/vyZwKJyfW1wHJT4uC7OYsdrirb812YMY4B7+yFilWRHfYSOAATw
 F1HouHv/R8lVn6yg1rDG3sZJmfF40dKL91E2xrFCe/phWMnSN9HtJqRYPwQen3PLsK4Z
 l6NfYFOGtQhY0iu7Hz0JxgFgCj4qiZlb2NkO+P7lcTFCVO0bYaH6d4iNBswqn/SDx56X
 L4qQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XmiXp1fe
Subject: Re: [Buildroot] [PATCH 5/6] package/python-autobahn: add missing
 subpackages
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4644849039844383069=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4644849039844383069==
Content-Type: multipart/alternative; boundary="000000000000b0ddc205e5aa294c"

--000000000000b0ddc205e5aa294c
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 7, 2022 at 2:18 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> > Are you sure you were checking in the 22.1.1  version of Autobahn?
>
> No, I'm checking in version 22.6.1, because that's the one we have in
> Buildroot now.
>

Oh I see. My patch request was for the Autobahn v22.1.1 that was included
in Buildroot at the time. If the Autobahn version was bumped up to 22.6.1
then you'll have to recheck all the dependencies if you haven't already.

If you're planning on bumping Crossbar to the latest, be warned that you'll
end up in dependency hell as it introduces a bunch of new dependencies for
the XBR and crypto features. Crossbar performs checks at runtime to bracket
the versions of these dependencies and you may have to patch some of the
dependency version ranges (or patch the runtime version checks).

--000000000000b0ddc205e5aa294c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, Aug 7, 2022 at 2:18 PM Thomas Petazzoni &lt;<a href=3D"mailt=
o:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Are you sure you were checking in the 22.1.1=C2=A0 version of Autobahn=
?<br>
<br>
No, I&#39;m checking in version 22.6.1, because that&#39;s the one we have =
in<br>
Buildroot now.<br></blockquote><div><br></div><div>Oh I see. My patch reque=
st was for the Autobahn v22.1.1 that was included in Buildroot at the time.=
 If the Autobahn version was bumped up to 22.6.1 then you&#39;ll have to re=
check all the dependencies if you haven&#39;t already.</div><div><br></div>=
<div>If you&#39;re planning on bumping Crossbar to the latest, be warned th=
at you&#39;ll end up in dependency hell as it introduces a bunch of new dep=
endencies for the XBR and crypto features. Crossbar performs checks at runt=
ime to bracket the versions of these dependencies and you may have to patch=
 some of the dependency version ranges (or patch the runtime version checks=
).<br></div></div></div>

--000000000000b0ddc205e5aa294c--

--===============4644849039844383069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4644849039844383069==--
