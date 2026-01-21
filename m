Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D396C44536
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 16:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CBC16F5D3;
	Wed, 21 Jan 2026 16:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 568TOC-sHzd5; Wed, 21 Jan 2026 16:24:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CAD56F5D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769012697;
	bh=HsSq45Jdl1CxdBDHdqA9ORmoEsAExjOvfxf+uKgiSMY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FOgMORK24/glD/hJ8Q3nBEVWPaS1gS/Aooeto8yWpmpOcXK0/CI8ix9zWDM6oC0JT
	 Ly/qgavu/a4i3O6imsdqLQz84xtrpjafoXJsFx9k3c/AlJghoq+GV4kAbLg7x4se7J
	 iTARDWFT3lPtj4UAHcvfqDLORQ6dOSeyPX28F7bxFwAfLd2LRXWnK5fI4wz5SkX+4E
	 l9pQ6hTAgaS1ASUUZ7ImD2zqnYWrcUIPgwmkqgxZVwNFKEP4ns1hIq++bp6wREeSyD
	 sQVdwQB+6kJXi6KXjqGnWjW17NxJPBuCZ4ZaB1vTo6mgqUrNLv2SaTDtBJuh8ElYcd
	 x+X/jxvi5fNXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CAD56F5D4;
	Wed, 21 Jan 2026 16:24:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04D29169
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 16:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEB956F5D3
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 16:24:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9D-l1CO8sul for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 16:24:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::935; helo=mail-ua1-x935.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B58AA6F5D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B58AA6F5D0
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B58AA6F5D0
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 16:24:53 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-93f573ba819so2425707241.1
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 08:24:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769012692; cv=none;
 d=google.com; s=arc-20240605;
 b=UmWMyOI9Sk2qP5qiUtFhbkWVirZvgAkcoVjdQpGY0jJLQ2KT5juPGEiPXCbc3d94tq
 FnQ0bGZxTgZ5G72xWJ8xrFeuHB+c6NrgiMclONNNm28iF6z27xsiyAi9AVFHfZRinq+V
 kqdKacEAWF0BFnowJuz1WKXaBTbJyNPt9TTmKpdETnu4IvYyCl/6xCnjGYJZj5nnwOSs
 HQlFKX3W2YIwgcCOIuaJ4XsCEHGdstFrjCMm+vEKSmwprJSQ0wgMB++g59XKBptNvf3h
 eynA2U5VUtSS3PrfzniTJHQSJOmnhQ/1zj/xqMX91sF99KAjv5z+UZg+gfTrb5ZnsNqn
 IjyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TdSrKitoJK8KKdn5ZxYFyQ1Dm2H0Ow7k9CUN/tEt6uI=;
 fh=lgRPIRPzXxxRS599zlHIbpt0lol323QK4/G5IjH/bI0=;
 b=gR1SOTkd4O6DbIuioD3jMD/HBgKwyrblvyU4cHuf1WiYlhl7U3tDWJMq+l/ndQ+equ
 tqVG9N9c9EfMxbUp1/Cr42RYUGzaQBZIyZwAcJeztGWcYIDi7T68/Gx7LAYscZ4P2hC1
 rjaGqDx2chm9nO+uza/l5A3p/BMmgIiwvGQmL6tsk/c9LcujEtCeybia/xcxw+NrKo0X
 vZGVz+ia7Q8FYaxE6LnOdbAnz2Pvsl4+I6g0xCHtsH+7gQzfFGO6N+CphEO66hdzCGEz
 lObbEk+ohJpoZJrwBw8LTMyJAfy/iov5170rkwOYZGKOovCMR28IvSc2p+U0ZcXXpTTm
 L7gA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769012692; x=1769617492;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TdSrKitoJK8KKdn5ZxYFyQ1Dm2H0Ow7k9CUN/tEt6uI=;
 b=tdMxrzk/BL5QcCVP8QdCzyzUqE3rdrX7qNm3EAzmVaclhk3U1XUOZjxp5O8bQdO5su
 2yqR+5LA0xuVm71CdCIzVBv/4RuPIdGBzcXz6H6Spw0vZZpoe8inJv7R30e2PEaUsFtx
 KFRVmFINjY1nW7awvdcikE6J/0N1sDbYJc60hXU+eelVq4HjO3/wjsBWWirIkYAb4Vth
 6a4KpkJrHpFQQGUWF1YY98oQsXczb1bUuyJ/Q2zfPXw4Naxiy+tRtBiTOGnQ/lGOAUC5
 A14cfaItw3WTA7aNdlxYgAho3CYz5JUY+97SuWByvUn1Xn10x5TqwrNdjbAUyQ7LAtw6
 kkeQ==
X-Gm-Message-State: AOJu0Yy3hPvLrU2Nr4cD69t9ilKPen7TeY8RYqdFujD2gcBbt4+1ThRt
 vzohS0AV/tiB1if2r47N/LAplD85RBOaDNhgCLs6E9qyqu0CtyGpjOgGOnSqsxHLKyqg7EU6pO8
 IPV2ycxxbL/RUp6z7YnFo/XqtjGvWFXN38Q+fG6A=
X-Gm-Gg: AZuq6aKM39Z/77TkGbSHl0HSAucCUYP2EtSR0qQCnxFsoorANBEXEKTnTQdwgNsC+pz
 hEceai0Kx+7ENZz2EP503+3Yl99//H19On/Ugy6FfjIuAoE1ved1xOWrCbAvLhYuJp9f6aKbDWs
 W/mKbHcR5gPMij6WVf7K49sXf+vf9jCcPvHeC1hfB3sZHb8wUkalFym/JwFfsNv8Xy747OGxCtA
 ZnEJuQmzNcspTo98DLSHxV5C7/7fYFC1F8PAfgaFndWuBDta4Ozif+8KXY7qsRaUhoU6k7nfnmH
 x1WxFsLhqm78I3jU3aBU7RIw+N4DevfQ8UVyOgDLQCmdwxzKrwFRGjixww==
X-Received: by 2002:a05:6102:950:b0:5f1:6f24:8554 with SMTP id
 ada2fe7eead31-5f1a55b22b0mr4858780137.37.1769012690398; Wed, 21 Jan 2026
 08:24:50 -0800 (PST)
MIME-Version: 1.0
References: <20260121011429.1442015-1-james.hilliard1@gmail.com>
 <70549457-9F2A-412B-9756-3E45D724B853@benettiengineering.com>
In-Reply-To: <70549457-9F2A-412B-9756-3E45D724B853@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Jan 2026 09:24:38 -0700
X-Gm-Features: AZwV_QjMUipMctova9EhucQu3Pit1OUeFUJxkKt79PepyNLfhbIlxXcANFU3VVk
Message-ID: <CADvTj4r0Q9AOjL3zaSj3LMRKpHcuMMUC1-uKi93YaPGThOUgMw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769012692; x=1769617492; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TdSrKitoJK8KKdn5ZxYFyQ1Dm2H0Ow7k9CUN/tEt6uI=;
 b=BBv5EyeVtTpSpsGz3eIgk40UZQIsEXIDVV7HLa3a6GQdVxRpupbW3T39x2GrvHBCef
 3HOaDCY1FFjbDEkHRgfXDaNunkPJ2ZVL0SVOTZdwTL24DK8quc+l82Yf/M+MDyoUBbW8
 y2pUXZpS4isJEyIlM6HeGF7R7o6GzDyvc8QoCWRPDBhxyyvcqqb8aEzvUY2yP0rk5vHu
 DxOV4hnx3gtlMHi6LZv3/zZ182JXrWOknXAnWpOG8j9ImZVtrggrEj1pTxbuCubpoF0K
 3nOibTkRZ4SyK7zKHbM4/RUUBKt7V2fVItw7j1jpJyT7rFVOOi8VGdTKJ1UpUH4CO8u7
 8wJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BBv5EyeV
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2025.12
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
Content-Type: multipart/mixed; boundary="===============3005717024097445661=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3005717024097445661==
Content-Type: multipart/alternative; boundary="00000000000003b1f30648e85d18"

--00000000000003b1f30648e85d18
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 12:42=E2=80=AFAM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi James,
>
> I was working on it too.
> As is the patch doesn=E2=80=99t work on my side.
> It seems like at least one crypto is needed with this version, so I was
> defaulting to OpenSSL and adding a choice between it, Wolfssl etc.
>

Yeah, I think one crypto provider might be required to be selected
or something in the swupdate menuconfig, but that's maybe more
of an issue to fix upstream? My builds have signature verification
enabled so I think I always enable that.

There was at least one runtime segfault I ran into before I fixed my
swupdate config but I think that's a slightly different issue(SIGALG):
https://patchwork.ozlabs.org/project/swupdate/patch/20260120220219.714304-1=
-james.hilliard1@gmail.com/


>
> Are you sure it builds as is?
> Otherwise can you please fix the patch?
>

I'm using this for my swupdate config which seems to build/run fine:
CONFIG_SYSTEMD=3Dy
CONFIG_HW_COMPATIBILITY=3Dy
CONFIG_SOCKET_CTRL_PATH=3D"/tmp/sockinstctrl"
CONFIG_SOCKET_PROGRESS_PATH=3D"/tmp/swupdateprog"
CONFIG_LUAPKG=3D"lua"
CONFIG_UBOOT=3Dy
CONFIG_BOOTLOADER_DEFAULT_NONE=3Dy
CONFIG_DOWNLOAD=3Dy
CONFIG_DOWNLOAD_SSL=3Dy
CONFIG_WEBSERVER=3Dy
CONFIG_MONGOOSESSL=3Dy
CONFIG_SIGNED_IMAGES=3Dy
CONFIG_SIGALG_RAWRSA=3Dy
CONFIG_ENCRYPTED_IMAGES=3Dy
CONFIG_LUAEXTERNAL=3Dy
CONFIG_ARCHIVE=3Dy
CONFIG_BOOTLOADERHANDLER=3Dy
CONFIG_CFI=3Dy
CONFIG_CFIHAMMING1=3Dy
CONFIG_COPY=3Dy
CONFIG_DISKPART=3Dy
CONFIG_DISKPART_FORMAT=3Dy
CONFIG_DISKFORMAT_HANDLER=3Dy
CONFIG_FAT_FILESYSTEM=3Dy
CONFIG_LUASCRIPTHANDLER=3Dy
CONFIG_EMMC_HANDLER=3Dy
CONFIG_RAW=3Dy
CONFIG_RDIFFHANDLER=3Dy
CONFIG_READBACKHANDLER=3Dy
CONFIG_SHELLSCRIPTHANDLER=3Dy
CONFIG_SWUFORWARDER_HANDLER=3Dy
CONFIG_SSBLSWITCH=3Dy
CONFIG_UBIVOL=3Dy
CONFIG_UBIBLACKLIST=3D"0 1 2 3 4 5"
CONFIG_UBIWHITELIST=3D"6"
CONFIG_UNIQUEUUID=3Dy


>
> Thank you
> Giulio
>
> > Il giorno 21 gen 2026, alle ore 02:14, James Hilliard <
> james.hilliard1@gmail.com> ha scritto:
> >
> > =EF=BB=BFSigned-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > package/swupdate/swupdate.hash | 2 +-
> > package/swupdate/swupdate.mk   | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/swupdate/swupdate.hash
> b/package/swupdate/swupdate.hash
> > index bc911d1820..b3f43648f8 100644
> > --- a/package/swupdate/swupdate.hash
> > +++ b/package/swupdate/swupdate.hash
> > @@ -1,5 +1,5 @@
> > # Locally calculated
> > -sha256
> 678b47fd2419727c4d0abf5c9f3bc0dc4b67e95951132bd1c8f5603e88947779
> swupdate-2025.05.tar.gz
> > +sha256
> 8517f3730eeb66e20e651b881dd4b9c10ca9ae05e3883db59b5df18ab1eaa533
> swupdate-2025.12.tar.gz
> > sha256
> 4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683
> LICENSES/BSD-1-Clause.txt
> > sha256
> e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6
> LICENSES/BSD-3-Clause.txt
> > sha256
> 0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192
> LICENSES/CC0-1.0.txt
> > diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.m=
k
> > index 05329d13b8..864c876e40 100644
> > --- a/package/swupdate/swupdate.mk
> > +++ b/package/swupdate/swupdate.mk
> > @@ -4,7 +4,7 @@
> > #
> >
> #########################################################################=
#######
> >
> > -SWUPDATE_VERSION =3D 2025.05
> > +SWUPDATE_VERSION =3D 2025.12
> > SWUPDATE_SITE =3D $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
> > SWUPDATE_LICENSE =3D GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clau=
se,
> BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
> > SWUPDATE_LICENSE_FILES =3D LICENSES/BSD-1-Clause.txt \
> > --
> > 2.43.0
> >
>
>

--00000000000003b1f30648e85d18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jan 21, 2026 at 12:42=E2=80=AFAM =
Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com"=
>giulio.benetti@benettiengineering.com</a>&gt; wrote:</div><div class=3D"gm=
ail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Hi James,<br>
<br>
I was working on it too.<br>
As is the patch doesn=E2=80=99t work on my side.<br>
It seems like at least one crypto is needed with this version, so I was def=
aulting to OpenSSL and adding a choice between it, Wolfssl etc.<br></blockq=
uote><div><br></div><div>Yeah, I think one crypto provider might be require=
d to be selected</div><div>or something in the swupdate menuconfig, but tha=
t&#39;s maybe more</div><div>of an issue to fix upstream? My builds have si=
gnature verification</div><div>enabled so I think I always enable that.=C2=
=A0</div><div><br></div><div>There was at least one runtime segfault I ran =
into before I fixed my</div><div>swupdate config but I think that&#39;s a s=
lightly different issue(SIGALG):<br><a href=3D"https://patchwork.ozlabs.org=
/project/swupdate/patch/20260120220219.714304-1-james.hilliard1@gmail.com/"=
>https://patchwork.ozlabs.org/project/swupdate/patch/20260120220219.714304-=
1-james.hilliard1@gmail.com/</a></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
Are you sure it builds as is?<br>
Otherwise can you please fix the patch?<br></blockquote><div><br></div><div=
>I&#39;m using this for my swupdate config which seems to build/run fine:<b=
r>CONFIG_SYSTEMD=3Dy<br>CONFIG_HW_COMPATIBILITY=3Dy<br>CONFIG_SOCKET_CTRL_P=
ATH=3D&quot;/tmp/sockinstctrl&quot;<br>CONFIG_SOCKET_PROGRESS_PATH=3D&quot;=
/tmp/swupdateprog&quot;<br>CONFIG_LUAPKG=3D&quot;lua&quot;<br>CONFIG_UBOOT=
=3Dy<br>CONFIG_BOOTLOADER_DEFAULT_NONE=3Dy<br>CONFIG_DOWNLOAD=3Dy<br>CONFIG=
_DOWNLOAD_SSL=3Dy<br>CONFIG_WEBSERVER=3Dy<br>CONFIG_MONGOOSESSL=3Dy<br>CONF=
IG_SIGNED_IMAGES=3Dy<br>CONFIG_SIGALG_RAWRSA=3Dy<br>CONFIG_ENCRYPTED_IMAGES=
=3Dy<br>CONFIG_LUAEXTERNAL=3Dy<br>CONFIG_ARCHIVE=3Dy<br>CONFIG_BOOTLOADERHA=
NDLER=3Dy<br>CONFIG_CFI=3Dy<br>CONFIG_CFIHAMMING1=3Dy<br>CONFIG_COPY=3Dy<br=
>CONFIG_DISKPART=3Dy<br>CONFIG_DISKPART_FORMAT=3Dy<br>CONFIG_DISKFORMAT_HAN=
DLER=3Dy<br>CONFIG_FAT_FILESYSTEM=3Dy<br>CONFIG_LUASCRIPTHANDLER=3Dy<br>CON=
FIG_EMMC_HANDLER=3Dy<br>CONFIG_RAW=3Dy<br>CONFIG_RDIFFHANDLER=3Dy<br>CONFIG=
_READBACKHANDLER=3Dy<br>CONFIG_SHELLSCRIPTHANDLER=3Dy<br>CONFIG_SWUFORWARDE=
R_HANDLER=3Dy<br>CONFIG_SSBLSWITCH=3Dy<br>CONFIG_UBIVOL=3Dy<br>CONFIG_UBIBL=
ACKLIST=3D&quot;0 1 2 3 4 5&quot;<br>CONFIG_UBIWHITELIST=3D&quot;6&quot;<br=
>CONFIG_UNIQUEUUID=3Dy</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Thank you<br>
Giulio<br>
<br>
&gt; Il giorno 21 gen 2026, alle ore 02:14, James Hilliard &lt;<a href=3D"m=
ailto:james.hilliard1@gmail.com" target=3D"_blank">james.hilliard1@gmail.co=
m</a>&gt; ha scritto:<br>
&gt; <br>
&gt; =EF=BB=BFSigned-off-by: James Hilliard &lt;<a href=3D"mailto:james.hil=
liard1@gmail.com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; package/swupdate/swupdate.hash | 2 +-<br>
&gt; package/swupdate/<a href=3D"http://swupdate.mk" rel=3D"noreferrer" tar=
get=3D"_blank">swupdate.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt; 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdat=
e.hash<br>
&gt; index bc911d1820..b3f43648f8 100644<br>
&gt; --- a/package/swupdate/swupdate.hash<br>
&gt; +++ b/package/swupdate/swupdate.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt; # Locally calculated<br>
&gt; -sha256=C2=A0 678b47fd2419727c4d0abf5c9f3bc0dc4b67e95951132bd1c8f5603e=
88947779=C2=A0 swupdate-2025.05.tar.gz<br>
&gt; +sha256=C2=A0 8517f3730eeb66e20e651b881dd4b9c10ca9ae05e3883db59b5df18a=
b1eaa533=C2=A0 swupdate-2025.12.tar.gz<br>
&gt; sha256=C2=A0 4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef=
3940683=C2=A0 LICENSES/BSD-1-Clause.txt<br>
&gt; sha256=C2=A0 e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000=
518a3a6=C2=A0 LICENSES/BSD-3-Clause.txt<br>
&gt; sha256=C2=A0 0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce=
7009192=C2=A0 LICENSES/CC0-1.0.txt<br>
&gt; diff --git a/package/swupdate/<a href=3D"http://swupdate.mk" rel=3D"no=
referrer" target=3D"_blank">swupdate.mk</a> b/package/swupdate/<a href=3D"h=
ttp://swupdate.mk" rel=3D"noreferrer" target=3D"_blank">swupdate.mk</a><br>
&gt; index 05329d13b8..864c876e40 100644<br>
&gt; --- a/package/swupdate/<a href=3D"http://swupdate.mk" rel=3D"noreferre=
r" target=3D"_blank">swupdate.mk</a><br>
&gt; +++ b/package/swupdate/<a href=3D"http://swupdate.mk" rel=3D"noreferre=
r" target=3D"_blank">swupdate.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt; #<br>
&gt; ######################################################################=
##########<br>
&gt; <br>
&gt; -SWUPDATE_VERSION =3D 2025.05<br>
&gt; +SWUPDATE_VERSION =3D 2025.12<br>
&gt; SWUPDATE_SITE =3D $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))<b=
r>
&gt; SWUPDATE_LICENSE =3D GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Cla=
use, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1<br>
&gt; SWUPDATE_LICENSE_FILES =3D LICENSES/BSD-1-Clause.txt \<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000003b1f30648e85d18--

--===============3005717024097445661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3005717024097445661==--
