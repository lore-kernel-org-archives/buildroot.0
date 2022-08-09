Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43D5C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 12:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E79181A6F;
	Tue,  9 Aug 2022 12:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E79181A6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTdIIMZq2hQk; Tue,  9 Aug 2022 12:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54E2F81A47;
	Tue,  9 Aug 2022 12:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54E2F81A47
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 188221BF38A
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 12:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E47BE60E35
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 12:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E47BE60E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UYmyN1F7q3Lr for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 12:13:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0E9F60C12
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0E9F60C12
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 12:13:05 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id u14so5430899oie.2
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 05:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=En6psTr5W6zqWod6n68FC5ZMfeQ121v1ptrUPDQQ634=;
 b=Kwin/rHheZ2w7XZffgKJFM6Xa9v/+WlKbyMH4rLU7z0hDqLeH69aCjAx2Gk0HcUEUx
 Xv6PwT5Q1tRcDW7WTQuK2AG3FdDHmi9HsPUEbRsKXgrWaFW7TkHYQ8HtB0rDzqlFr4gn
 0llRffJdfcuXaUPlyJKwnC67r3DPCii0BZ3h8oI7I+veTv1cW3feQKoS2ifzC8LgAK4S
 BBoaSZMMLQRk4VHyk7NruBfI/VF2f/IFK6fDEN1/WzjQBCUeqhCDy+A2lIoABSaKdCPy
 LsE22J34xe5OTRKYA7ycmkHx//HhcZdEBmHyW6uQpKU33JKY0Qqcj+Al6TASJGKtdaVR
 ljRQ==
X-Gm-Message-State: ACgBeo0WGUVj0Qo204515ak+4TKw8b2hgM3nKh99rDb3xvGXCGq+lNvr
 BHiPDEEGQT738l2lJywIc8iC53Ywh740kJhnAGc=
X-Google-Smtp-Source: AA6agR7tKNC8sL1toygtWqmlSRw/CIQ/vFtSC+/6TKy0cui+DJhtGRYO4wXdf2pycS55W0jGWmriMy74dvsoWmNGrbc=
X-Received: by 2002:a05:6808:1584:b0:343:2404:6b9f with SMTP id
 t4-20020a056808158400b0034324046b9fmr304293oiw.148.1660047184558; Tue, 09 Aug
 2022 05:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220808215404.1804219-1-fontaine.fabrice@gmail.com>
 <20220809133932.721b8cd8@windsurf>
In-Reply-To: <20220809133932.721b8cd8@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 9 Aug 2022 14:12:53 +0200
Message-ID: <CAPi7W831MWDk=uBqFzebZ9FmsZiVNxDfDfNMYfa5rqW6cgxOuA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=En6psTr5W6zqWod6n68FC5ZMfeQ121v1ptrUPDQQ634=;
 b=EbsnEDOXNrn6wf2qY/PABWAKItLJrNw7uvS0WGzVz3/V1tMqjwpEPjIqsjrt2wsKlk
 2SpWi0EQlfOWWiNxI8rKI8fBUvdE2g/i3DGzitPDXYljZUvadekCjG/S9rYvl5Gg9ixo
 tKfw8Ia7PHfjTPWBQJBF07e14hZt2uSXQtMsFCQLoFT8/xA0NDipEEJBJIq2mxqsqbsb
 2ayAPUpMb4Niblj/XX+uQgvUHG0wpbCgLRPz+aPtT6cui3ovUSdlLOk8JbOHtM9WxVZ7
 R6O8w5VILwedjEgJNMDzHXQXcZOkR1fMgeIetbcoAh953wAxTVdLJ7kqggeWEA2MWclR
 /kGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EbsnEDOX
Subject: Re: [Buildroot] [PATCH 1/1] package/xenomai: always set default
 version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1488829616790277188=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1488829616790277188==
Content-Type: multipart/alternative; boundary="000000000000beffb305e5cdda13"

--000000000000beffb305e5cdda13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 9 ao=C3=BBt 2022 =C3=A0 13:39, Thomas Petazzoni <thomas.petazzoni@b=
ootlin.com>
a =C3=A9crit :

> On Mon,  8 Aug 2022 23:54:04 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Always set a default value for BR2_PACKAGE_XENOMAI_VERSION to avoid a
> > build failure when BR2_PACKAGE_XENOMAI_VERSION is empty with
> > BR2_PACKAGE_XENOMAI_CUSTOM_{GIT,VERSION}
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/d80c295a848b5be69324f5dfbd269b046d=
c68e8c
> >  -
> http://autobuild.buildroot.org/results/4e57a499b43208e546dd962ca04b43408c=
0c082c
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/xenomai/Config.in | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
> > index ec6d9e5d29..5c179eec72 100644
> > --- a/package/xenomai/Config.in
> > +++ b/package/xenomai/Config.in
> > @@ -73,8 +73,8 @@ config BR2_PACKAGE_XENOMAI_VERSION
> >       string "Custom Xenomai version" if \
> >               !BR2_PACKAGE_XENOMAI_LATEST_VERSION && \
> >               !BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
> > -     default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
> >       default "custom" if BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
> > +     default "3.0.10"
>
> Meh, I don't like how Xenomai handles things differently than all other
> packages that have a configurable version.
>

> IMO, we should make Xenomai look like the other packages, which means:
>
>  - Dropping default "https://gitlab.denx.de/Xenomai/xenomai.git"
>
Indeed, other packages don't set any values for git repository.

>
>  - Not have any default value for BR2_PACKAGE_XENOMAI_VERSION
>

This will not be really consistent with other packages.
arm-trusted-firmware, barebox, optee-os, opensbi and uboot all have default
values for
BR2_TARGET_{ARM_TRUSTED_FIRMWARE,BAREBOX,OPENSBI,OPTEE_OS,UBOOT}_VERSION

We really want consistency on how this "custom version" thing is
> handled.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

Best Regards,

Fabrice

--000000000000beffb305e5cdda13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 9 ao=C3=BBt 2022 =C3=A0=
=C2=A013:39, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootli=
n.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Mon,=C2=A0 8 Aug 2022 23=
:54:04 +0200<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Always set a default value for BR2_PACKAGE_XENOMAI_VERSION to avoid a<=
br>
&gt; build failure when BR2_PACKAGE_XENOMAI_VERSION is empty with<br>
&gt; BR2_PACKAGE_XENOMAI_CUSTOM_{GIT,VERSION}<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/d80c295a848b=
5be69324f5dfbd269b046dc68e8c" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/d80c295a848b5be69324f5dfbd269b046dc68e8c</a>=
<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/4e57a499b432=
08e546dd962ca04b43408c0c082c" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/4e57a499b43208e546dd962ca04b43408c0c082c</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/xenomai/Config.in | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in<br>
&gt; index ec6d9e5d29..5c179eec72 100644<br>
&gt; --- a/package/xenomai/Config.in<br>
&gt; +++ b/package/xenomai/Config.in<br>
&gt; @@ -73,8 +73,8 @@ config BR2_PACKAGE_XENOMAI_VERSION<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;Custom Xenomai version&quot; if=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_PACKAGE_XEN=
OMAI_LATEST_VERSION &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_PACKAGE_XEN=
OMAI_CUSTOM_TARBALL<br>
&gt; -=C2=A0 =C2=A0 =C2=A0default &quot;3.0.10&quot; if BR2_PACKAGE_XENOMAI=
_LATEST_VERSION<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;custom&quot; if BR2_PACKAGE_XE=
NOMAI_CUSTOM_TARBALL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default &quot;3.0.10&quot;<br>
<br>
Meh, I don&#39;t like how Xenomai handles things differently than all other=
<br>
packages that have a configurable version.<br></blockquote><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
IMO, we should make Xenomai look like the other packages, which means:<br>
<br>
=C2=A0- Dropping default &quot;<a href=3D"https://gitlab.denx.de/Xenomai/xe=
nomai.git" rel=3D"noreferrer" target=3D"_blank">https://gitlab.denx.de/Xeno=
mai/xenomai.git</a>&quot; <br></blockquote><div>Indeed, other packages don&=
#39;t set any values for git repository. <br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
=C2=A0- Not have any default value for BR2_PACKAGE_XENOMAI_VERSION<br></blo=
ckquote><div><br></div><div><div>This will not be really consistent with ot=
her packages.</div>arm-trusted-firmware, barebox, optee-os, opensbi and ubo=
ot all have default values for BR2_TARGET_{ARM_TRUSTED_FIRMWARE,BAREBOX,OPE=
NSBI,OPTEE_OS,UBOOT}_VERSION</div><br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
We really want consistency on how this &quot;custom version&quot; thing is<=
br>
handled.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice<br></div></div></div>

--000000000000beffb305e5cdda13--

--===============1488829616790277188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1488829616790277188==--
