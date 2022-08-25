Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220E5C04AA5
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 08:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 495344182B;
	Thu, 25 Aug 2022 08:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 495344182B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQnhvY9laq9V; Thu, 25 Aug 2022 08:52:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD43E41831;
	Thu, 25 Aug 2022 08:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD43E41831
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E0F01BF37C
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 08:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA30A833CA
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 08:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA30A833CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObPtWrHicwer for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 08:52:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FFE4833C9
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FFE4833C9
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 08:52:24 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 c13-20020a17090a4d0d00b001fb6921b42aso4191840pjg.2
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 01:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=R2YXzaq74EsvGbA5tbg0EL6UGsX3ktpIWgP7knMNao0=;
 b=797CGxlcSRw/HIIy5AtRTGJJV1wCv9s3ySMHVPcuEjzlbtv5icyzczgUBhTiHU+oOc
 94usavAxbSPAEXbDGLv8V1w8aM4pUMJfXaEkGwLyxOA0awlbGDlKVSzQxYxTpvLag4i8
 3c7cZCyQgiC3B7IEAUACbjjKOUfavgL7Y2aS9yEHG60l4jLqcWOutDAPhcwTx7bIbya7
 ZO/QTDfK2Ii64+Xc2XpmVehezcDmEoecN0FlwCdIWMDxoIRbInbdGbXIX0AGiCfKii0G
 5JqH5X11mKQDhZMVBqNfTxLP77iicgAJ1AA7Asju75AC1+DmSG3CFuDSUbCJdDF5h66E
 nfPw==
X-Gm-Message-State: ACgBeo3OqnyOllDT5ArpomVJACIwLipLXV0B9Ew2Wsgtguf9jrD2jmXn
 PZcJ3CnWl5LIAREswuKJCmKTQAwapfb+CscJSCB4Glsh+us=
X-Google-Smtp-Source: AA6agR5SnhgBYAuobbpczU5B7akt/v/FhbDW7C0xW2JA20LwyKGY6t3Cd1F6laqfT8OihJz5l0vOAIMiBWsFxROpmUc=
X-Received: by 2002:a17:902:f382:b0:173:5eb:f67b with SMTP id
 f2-20020a170902f38200b0017305ebf67bmr3043895ple.53.1661417543933; Thu, 25 Aug
 2022 01:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220825073951.3920874-1-jesseevg@gmail.com>
 <20220825104342.61d691ac@windsurf>
In-Reply-To: <20220825104342.61d691ac@windsurf>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Thu, 25 Aug 2022 10:52:12 +0200
Message-ID: <CAMdwsN8p3nfWzyodhD_k6HWJRA_V4MopKUJ1_uJD4+hYqiYfxw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=R2YXzaq74EsvGbA5tbg0EL6UGsX3ktpIWgP7knMNao0=;
 b=mojiJq78mogEKgdtMYj6WKhx7VV/eteUfmnS/TMrFeXPv9TLXIlhhOq4CLwJyTGyeF
 izJihJXo+qispwCH4zx+Achcn9wiS6lTHbLx0w/iX1Q58glU9CgfIjolkHc0xapKpNui
 bvi9CIFkshn3s2NUtzkDleNx+B0xYu2lXaJ2uQI5qMDtqEOCcBCaFeOg3bl4FUTZ5s6s
 hf4r+3LYnMSW2WhcqqJeHRwp/AOGS/GtVRsooORpDLRAFaXxND9AuxrErOueqAKNVdKF
 pse2/JfRtqdzAis+dIS1fYCppaVkQVLxvHgVktLdfU4P8JqM777PK1zbST2U5y2VWY8o
 gOoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mojiJq78
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6base: extend qt6
 configuration
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
Cc: yann.morin.1998@free.fr, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1942646442228298087=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1942646442228298087==
Content-Type: multipart/alternative; boundary="00000000000087a41c05e70cea71"

--00000000000087a41c05e70cea71
Content-Type: text/plain; charset="UTF-8"

Hello Thomas,

Yann e. made a similar remark, I'll take both your comments into account to
try do a full patch series that splits it up nicely, along with the changes
you suggested, as for the dependencies, a review/test of such a patch
series would be greatly appreciated because I'm sure like you say there
might be redundancies/improvements to be made that I didn't catch with my
own testing.
This might take some time as I'm everything but a git expert so please bear
with me as I try to get this into a nice patch series :)
Thank you both for the feedback.

Best regards,
Jesse


Op do 25 aug. 2022 om 10:43 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello Jesse,
>
> On Thu, 25 Aug 2022 09:39:51 +0200
> Jesse Van Gavere <jesseevg@gmail.com> wrote:
>
> > This will bring the qt6base functionality mostly on par with the qt5base
> > package, building the package has been tested to the best of my ability
> > and went without error as far as I can test.
> > One bug to be noted is that for the GUI with fontconfig without harfbuzz
> > support, this will produce incorrectly rendered text for version 6.3.1,
> > see https://bugreports.qt.io/browse/QTBUG-101430
> > I have however already verified that 6.3.2 and 6.4.0 will fix this issue
> > so I've decided not to add harfbuzz as a fontconfig dependency as a
> > version bump (which should be soon) will fix it.
>
> Yes, let's bump to 6.4.0 then.
>
> > Also add the version hashes for qt6base.
> >
> > Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
>
> Overall, this needs to be split into a number of patches:
>
>  - One adding the hash file, with just the hash of the tarball
>
>  - One adding the license information (which is totally missing today,
>    and I noticed due to your addition of the hash file) together with
>    the hashes of the license files
>
>  - Several patches adding the different options. I'm not too keen on
>    copy/pasting directly the qt5 logic, as I'm not sure all the
>    dependencies are exactly the same, so let's do this one feature at a
>    time.
>
>
> > +ifeq ($(BR2_ENABLE_DEBUG),y)
> > +QT6BASE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Debug
> > +else
> > +QT6BASE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
> > +endif
>
> This is already handled by the cmake-package infrastructure, do no need
> to handle CMAKE_BUILD_TYPE.
>
> > +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> > +# Qt 5.8 needs atomics, which on various architectures are in -latomic
> > +QT6BASE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-latomic"
>
> Is this also needed with Qt6 ? (Most likely yes, but the comment is
> weird, another reason why I don't like the copy/pasting from Qt5).
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000087a41c05e70cea71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Thomas,</div><div><br></div><div>Yann e. made a=
 similar remark, I&#39;ll take both your comments into account to try do a =
full patch series that splits it up nicely, along with the changes you sugg=
ested, as for the dependencies,  a review/test of such a patch series would=
 be greatly appreciated because I&#39;m sure like you say there might be re=
dundancies/improvements to be made that I didn&#39;t catch with my own test=
ing.<br></div><div>This might take some time as I&#39;m everything but a gi=
t expert so please bear with me as I try to get this into a nice patch seri=
es :)<br></div><div>Thank you both for the feedback.<br></div><div><br></di=
v><div>Best regards,</div><div>Jesse<br></div><div><br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Op do 25 aug. =
2022 om 10:43 schreef Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzo=
ni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hello Jesse,<br>
<br>
On Thu, 25 Aug 2022 09:39:51 +0200<br>
Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com" target=3D"_blank=
">jesseevg@gmail.com</a>&gt; wrote:<br>
<br>
&gt; This will bring the qt6base functionality mostly on par with the qt5ba=
se<br>
&gt; package, building the package has been tested to the best of my abilit=
y<br>
&gt; and went without error as far as I can test.<br>
&gt; One bug to be noted is that for the GUI with fontconfig without harfbu=
zz<br>
&gt; support, this will produce incorrectly rendered text for version 6.3.1=
,<br>
&gt; see <a href=3D"https://bugreports.qt.io/browse/QTBUG-101430" rel=3D"no=
referrer" target=3D"_blank">https://bugreports.qt.io/browse/QTBUG-101430</a=
><br>
&gt; I have however already verified that 6.3.2 and 6.4.0 will fix this iss=
ue<br>
&gt; so I&#39;ve decided not to add harfbuzz as a fontconfig dependency as =
a<br>
&gt; version bump (which should be soon) will fix it.<br>
<br>
Yes, let&#39;s bump to 6.4.0 then.<br>
<br>
&gt; Also add the version hashes for qt6base.<br>
&gt; <br>
&gt; Signed-off-by: Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.c=
om" target=3D"_blank">jesseevg@gmail.com</a>&gt;<br>
<br>
Overall, this needs to be split into a number of patches:<br>
<br>
=C2=A0- One adding the hash file, with just the hash of the tarball<br>
<br>
=C2=A0- One adding the license information (which is totally missing today,=
<br>
=C2=A0 =C2=A0and I noticed due to your addition of the hash file) together =
with<br>
=C2=A0 =C2=A0the hashes of the license files<br>
<br>
=C2=A0- Several patches adding the different options. I&#39;m not too keen =
on<br>
=C2=A0 =C2=A0copy/pasting directly the qt5 logic, as I&#39;m not sure all t=
he<br>
=C2=A0 =C2=A0dependencies are exactly the same, so let&#39;s do this one fe=
ature at a<br>
=C2=A0 =C2=A0time.<br>
<br>
<br>
&gt; +ifeq ($(BR2_ENABLE_DEBUG),y)<br>
&gt; +QT6BASE_CONF_OPTS +=3D -DCMAKE_BUILD_TYPE=3DDebug<br>
&gt; +else<br>
&gt; +QT6BASE_CONF_OPTS +=3D -DCMAKE_BUILD_TYPE=3DRelease<br>
&gt; +endif<br>
<br>
This is already handled by the cmake-package infrastructure, do no need<br>
to handle CMAKE_BUILD_TYPE.<br>
<br>
&gt; +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)<br>
&gt; +# Qt 5.8 needs atomics, which on various architectures are in -latomi=
c<br>
&gt; +QT6BASE_CONF_OPTS +=3D -DCMAKE_SHARED_LINKER_FLAGS=3D&quot;-latomic&q=
uot;<br>
<br>
Is this also needed with Qt6 ? (Most likely yes, but the comment is<br>
weird, another reason why I don&#39;t like the copy/pasting from Qt5).<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000087a41c05e70cea71--

--===============1942646442228298087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1942646442228298087==--
