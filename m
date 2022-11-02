Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E059C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 22:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3BA681E84;
	Wed,  2 Nov 2022 22:14:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3BA681E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1p_uOcJWwXVJ; Wed,  2 Nov 2022 22:14:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0DF2817E4;
	Wed,  2 Nov 2022 22:14:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0DF2817E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77C7E1BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5183A416F2
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 22:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5183A416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtmcsAgKHAt8 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 22:14:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0E78416EE
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A0E78416EE
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 22:14:25 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bp15so30369881lfb.13
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 15:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oc++GipHj1DXcI/mSkCVvxXSaBDPrWL9tK1EgcOHWgs=;
 b=RA+F8jVLMbX0sCIuR1xs5aKE0qmSxDafgYYWDa3f8rUlXk3yHKQUjU2urHnEIzX7OR
 zH1zV4t/pl3ahn1LoFmC9Hq0P80MZwtYymJFiQt44URkfAEy4Asvn9UP2vxMLKymT00k
 I7RqMc4tzegCDDu69aHIHFk7VIfXemdck2clQ0EWxlcuqHJ0lB+NcG4UyV3ntPV+9BmA
 PpN1QAtwiKV8gsW+gMw+rKeUhPAN4K7MOv4MX1D7FC1hPFCQEyWu2msIZhSas3k03MlI
 fP9ytGobjzz/zR6W1rCQ017tiTuK81x3Aw4CusXIktr5TM3pyfKHLK8bucdz1zbw47up
 xQWQ==
X-Gm-Message-State: ACrzQf24KUY49I8WJcK/Pn7AQ0MHhDrq7VtVs4LSkCfYj1OrsscViCbe
 S9Ip36EbSbQkouyW2peyo8gqEJzxItLyZrBdVLj46oRXdNc=
X-Google-Smtp-Source: AMsMyM5XjsaCRjcpBQoxu1wyrVfmsBN3HwI5KrURNrM6wC2CRE0J2ENuimeojJbCrg05r6BAI/IX3ryLOWwDxMNaMDI=
X-Received: by 2002:a05:6512:39c2:b0:4a2:500f:aed5 with SMTP id
 k2-20020a05651239c200b004a2500faed5mr11118035lfu.111.1667427263382; Wed, 02
 Nov 2022 15:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20221102123500.311904-1-fontaine.fabrice@gmail.com>
 <20221102210216.4ae702df@windsurf>
In-Reply-To: <20221102210216.4ae702df@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 2 Nov 2022 23:14:12 +0100
Message-ID: <CAPi7W82QQef1ZhM+oB9GKQP8HiRF0ubMTrp2UCchOmLjVWTRmw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Oc++GipHj1DXcI/mSkCVvxXSaBDPrWL9tK1EgcOHWgs=;
 b=PdhESENHFO0ClandO5Ifqe14EiWwe9NZV3anPfrihsM0Ph95u3PVWZpbtpplgd77KJ
 5hD2xz7be6hI5LVOceoSM0S/v9Qkoia8FH1L6GOaACimDpILseASYMsWF5gDgnlCtVLD
 7/5JIJN/4UM9vQhzv5tBfh5YXpiqiYYt7YjQpR8zhRsdWT35kyL06a8E4Fqo75PLzRIh
 gS9kBzN4kzyu4L6Ztn8FDJ5g4jQ7axybuNt0qLeuvvFtpR9iL/lM1mGE1tJmq6xRiAdG
 6EwRtS9113r25VL3PtFIt0yGBrdztHOY46O/UuMei+Gn3CPqdA8qN9q/jrMXRQ6L/ziU
 Im7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PdhESENH
Subject: Re: [Buildroot] [PATCH 1/1] package/numactl: link with -latomic if
 needed
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1125058857080151664=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1125058857080151664==
Content-Type: multipart/alternative; boundary="000000000000b9086705ec84292c"

--000000000000b9086705ec84292c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 2 nov. 2022 =C3=A0 21:02, Thomas Petazzoni <thomas.petazzoni@bootli=
n.com>
a =C3=A9crit :

> On Wed,  2 Nov 2022 13:35:00 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fix the following build failure raised since bump to version 2.0.16 in
> > commit e9bc980d93a189a16e7320bd254b906c87ca9f87:
> >
> >
> /nvmedata/autobuild/instance-7/output-1/per-package/numactl/host/bin/../l=
ib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-linu=
x-uclibc/bin/ld:
> ./.libs/libnuma.a(libnuma.o): in function `numa_police_memory':
> > libnuma.c:(.text+0xe28): undefined reference to `__atomic_fetch_and_1'
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/a92c1c60518d3fe08f3f808f9cc812031e=
85a4e9
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  ...01-link-with-latomic-if-needed-again.patch | 41 +++++++++++++++++++
> >  package/numactl/numactl.mk                    |  2 +
> >  2 files changed, 43 insertions(+)
> >  create mode 100644
> package/numactl/0001-link-with-latomic-if-needed-again.patch
>
> Also related to numactl and libatomic, we also have this pending patch:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20221024174911.75444=
-1-abrodkin@synopsys.com/
> ,
> which still seems weird to me.
>

This weird patch tries to handle a very specific case where LD_LIBRARY_PATH
points to a self-build toolchain. I think this is out of scope of buildroot
but I'll let you confirm.
Otherwise, it should be noted that upstream merged my patch.


>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Best Regards,

Fabrice

--000000000000b9086705ec84292c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 2 nov. 2022 =C3=A0=C2=A0=
21:02, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com"=
>thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Wed,=C2=A0 2 Nov 2022 13:35:00=
 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Fix the following build failure raised since bump to version 2.0.16 in=
<br>
&gt; commit e9bc980d93a189a16e7320bd254b906c87ca9f87:<br>
&gt; <br>
&gt; /nvmedata/autobuild/instance-7/output-1/per-package/numactl/host/bin/.=
./lib/gcc/sparc-buildroot-linux-uclibc/10.4.0/../../../../sparc-buildroot-l=
inux-uclibc/bin/ld: ./.libs/libnuma.a(libnuma.o): in function `numa_police_=
memory&#39;:<br>
&gt; libnuma.c:(.text+0xe28): undefined reference to `__atomic_fetch_and_1&=
#39;<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/a92c1c60518d=
3fe08f3f808f9cc812031e85a4e9" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/a92c1c60518d3fe08f3f808f9cc812031e85a4e9</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...01-link-with-latomic-if-needed-again.patch | 41 +++++++++++++=
++++++<br>
&gt;=C2=A0 package/numactl/<a href=3D"http://numactl.mk" rel=3D"noreferrer"=
 target=3D"_blank">numactl.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
&gt;=C2=A0 2 files changed, 43 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/numactl/0001-link-with-latomic-if-nee=
ded-again.patch<br>
<br>
Also related to numactl and libatomic, we also have this pending patch:<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20221024174=
911.75444-1-abrodkin@synopsys.com/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://patchwork.ozlabs.org/project/buildroot/patch/20221024174911.75444-1-a=
brodkin@synopsys.com/</a>,<br>
which still seems weird to me.<br></blockquote><div><br></div><div>This wei=
rd patch tries to handle a very specific case where LD_LIBRARY_PATH points =
to a self-build toolchain. I think this is out of scope of buildroot but I&=
#39;ll let you confirm.</div><div>Otherwise, it should be noted that upstre=
am merged my patch.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice <br></div></div></div>

--000000000000b9086705ec84292c--

--===============1125058857080151664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1125058857080151664==--
