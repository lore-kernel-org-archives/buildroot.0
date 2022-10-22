Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBE5C04A95
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 21:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 882B0819D6;
	Sat, 22 Oct 2022 21:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 882B0819D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jr81mQsOV7DG; Sat, 22 Oct 2022 21:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6649081992;
	Sat, 22 Oct 2022 21:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6649081992
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7F6D1BF3BC
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 21:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE83D414C5
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 21:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE83D414C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXS4vxO47w7u for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 21:24:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4319410C1
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4319410C1
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 21:24:17 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id g7so10864776lfv.5
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 14:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sE8oH84WjPxRNAZxZzMgpG2AEW/VOiK7wExClAFfU4I=;
 b=BY/5mnbFumP12ewaTnY1WAVgys98+vm4LUOd6Vhi5QbYc2Ht3l7heMM36nV+FslWZl
 BNUCXoJp1vOcKYdPAUo7tlRVTaOxn/1A81GFOHJJk7N5W+duNaOvEnoJ1yO1yGv3b7Yp
 fx8gHpj1e1jz1ese97rLTUK9AzsKPal625cHMxBisYZs8N4F2aUXWw4grInHfYq3KS0w
 xmA7PIcZ4jHloqKZXJBQUtmI/2FrhSjb8pbc20ECMFmf2nSB2s83F3z6Q03GNP2jkZlD
 PzdQHjbeb6NG9tZqjylffIHlnLtPMt+eULw8p3d/thMaCXcpqybPxhgp4Tow+1KTxT51
 cmhw==
X-Gm-Message-State: ACrzQf09tlUea+aan9c4aeJStfLY4iDuRoRNzRl5XANmtmHP1uHOh9t2
 RBT/CNdzc2h7vrZJLIO+2VKWP2hrn2Jny+QCo24=
X-Google-Smtp-Source: AMsMyM5bFHt/o/Q6OETi/Edwh+DNan9ejDTlPP4qE+B8pYXoXx8V6qkDez8a03HxM7e4GGU0UOvzeHTuQuUfYa0QgAU=
X-Received: by 2002:a05:6512:3d9f:b0:4a2:429b:8df4 with SMTP id
 k31-20020a0565123d9f00b004a2429b8df4mr8824307lfv.63.1666473855489; Sat, 22
 Oct 2022 14:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221022201052.28903-1-fontaine.fabrice@gmail.com>
 <20221022231522.1d63bec4@gmx.net>
In-Reply-To: <20221022231522.1d63bec4@gmx.net>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Oct 2022 23:24:04 +0200
Message-ID: <CAPi7W807xhxTULv29GWhv0BKp+hY8CfBm5ecRMLRhADMV+2TWg@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sE8oH84WjPxRNAZxZzMgpG2AEW/VOiK7wExClAFfU4I=;
 b=DyaCMAn+eeG+HhlUPsJQKU0B0/scYYvbdC2/YQrWGRZJkVduq0Affn75zXx1Akj5Hv
 VXcax0X0odL6Q0ICog31hGE8L80Ca2nnJ4D41xc4bkMH4oc6I0d1PW0rErnqBawXgRdM
 KBpqfG1GUnST0XcOVNpxS0hOLiRjj/pjwNwkxo7BnzI7RZBgPBsXFtuWDZnP+Z9DSgkm
 f8P6VJHAdY2PIPBQdJcwSA6zbQMwUT0C8irreawYCqYfyXPZuW0/3f36P4IEoJ+xJ3g5
 WwqbXfrnc+ChVUOkmBqv+kNK19/XkniLsFCNpb0jPFeBldAJ/BQHOVZDmXLV3dvi9bS5
 f0SA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DyaCMAn+
Subject: Re: [Buildroot] [PATCH 1/1] package/usbredir: bump to version 0.13.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2183123307940421975=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2183123307940421975==
Content-Type: multipart/alternative; boundary="0000000000002f194505eba62e28"

--0000000000002f194505eba62e28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Peter,

Le sam. 22 oct. 2022 =C3=A0 23:15, Peter Seiderer <ps.report@gmx.net> a =C3=
=A9crit :

> Hello Fabrice,
>
> On Sat, 22 Oct 2022 22:10:52 +0200, Fabrice Fontaine <
> fontaine.fabrice@gmail.com> wrote:
>
> > usbredirserver was dropped by
> >
> https://gitlab.freedesktop.org/spice/usbredir/-/commit/f4ffdce329305da280=
3684776f7659083a530819
>
> Time to enable tools/usbredirect as it seems to be the replacement for
> usbredirserver
> (according to [1])?
>

Indeed, I'll send a v2.


>
> Regards,
> Peter
>
> [1] https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/2
>
>
> >
> >
> https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbredir-0.13.0/Chan=
geLog.md
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  Config.in.legacy               |  7 +++++++
> >  package/usbredir/Config.in     | 12 ------------
> >  package/usbredir/usbredir.hash |  4 ++--
> >  package/usbredir/usbredir.mk   | 16 +---------------
> >  4 files changed, 10 insertions(+), 29 deletions(-)
> >
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index 0e63d59a98..39b00547c8 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -146,6 +146,13 @@ endif
> >
> >  comment "Legacy options removed in 2022.11"
> >
> > +config BR2_PACKAGE_USBREDIR_SERVER
> > +     bool "usbredirserver removed"
> > +     select BR2_LEGACY
> > +     help
> > +       usbredirserver has been dropped by upstream since version
> > +       0.13.0
> > +
> >  config BR2_KERNEL_HEADERS_5_17
> >       bool "kernel headers version 5.17.x are no longer supported"
> >       select BR2_LEGACY
> > diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in
> > index 8ce180a884..2190cb88ac 100644
> > --- a/package/usbredir/Config.in
> > +++ b/package/usbredir/Config.in
> > @@ -18,15 +18,3 @@ config BR2_PACKAGE_USBREDIR
> >         'y' below if you want the server too.
> >
> >         http://www.spice-space.org/page/UsbRedir
> > -
> > -if BR2_PACKAGE_USBREDIR
> > -
> > -config BR2_PACKAGE_USBREDIR_SERVER
> > -     bool "usbredirserver on target"
> > -     help
> > -       If you want to serve usbredir requests on your target, say
> > -       'y' here to have the usbredir server on the target.
> > -
> > -       Note: the server is not required to use the library.
> > -
> > -endif
> > diff --git a/package/usbredir/usbredir.hash
> b/package/usbredir/usbredir.hash
> > index f738c36690..577e08efba 100644
> > --- a/package/usbredir/usbredir.hash
> > +++ b/package/usbredir/usbredir.hash
> > @@ -1,5 +1,5 @@
> > -#
> https://spice-space.org/download/usbredir/usbredir-0.12.0.tar.xz.sha256su=
m
> > -sha256
> fbb44025bf55e1ce8d84afc7596bfa47c8a36cd603c6fa440f9102c1c9761e6d
> usbredir-0.12.0.tar.xz
> > +#
> https://spice-space.org/download/usbredir/usbredir-0.13.0.tar.xz.sha256su=
m
> > +sha256
> 4ba6faa02c0ae6deeb4c53883d66ab54b3a5899bead42ce4ded9568b9a7dc46e
> usbredir-0.13.0.tar.xz
> >
> >  # Hash for license files
> >  sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> > diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.m=
k
> > index 6792a3e758..6d5a80cbf9 100644
> > --- a/package/usbredir/usbredir.mk
> > +++ b/package/usbredir/usbredir.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -USBREDIR_VERSION =3D 0.12.0
> > +USBREDIR_VERSION =3D 0.13.0
> >  USBREDIR_SOURCE =3D usbredir-$(USBREDIR_VERSION).tar.xz
> >  USBREDIR_SITE =3D http://spice-space.org/download/usbredir
> >  USBREDIR_LICENSE =3D LGPL-2.1+ (libraries)
> > @@ -17,18 +17,4 @@ USBREDIR_CONF_OPTS =3D \
> >       -Dtests=3Ddisabled \
> >       -Dtools=3Ddisabled
> >
> > -ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)
> > -
> > -USBREDIR_LICENSE +=3D , GPL-2.0+ (program)
> > -USBREDIR_LICENSE_FILES +=3D COPYING
> > -
> > -else # BR2_PACKAGE_USBREDIR_SERVER !=3D y
> > -
> > -define USBREDIR_POST_INSTALL_TARGET_RM_SERVER
> > -     rm -f $(TARGET_DIR)/usr/sbin/usbredirserver
> > -endef
> > -USBREDIR_POST_INSTALL_TARGET_HOOKS +=3D
> USBREDIR_POST_INSTALL_TARGET_RM_SERVER
> > -
> > -endif # BR2_PACKAGE_USBREDIR_SERVER
> > -
> >  $(eval $(meson-package))
>
Best Regards,

Fabrice

--0000000000002f194505eba62e28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Peter,<br></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 22 oct. 2022=
 =C3=A0=C2=A023:15, Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net"=
>ps.report@gmx.net</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello Fabrice,<br>
<br>
On Sat, 22 Oct 2022 22:10:52 +0200, Fabrice Fontaine &lt;<a href=3D"mailto:=
fontaine.fabrice@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a=
>&gt; wrote:<br>
<br>
&gt; usbredirserver was dropped by<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/spice/usbredir/-/commit/f4ff=
dce329305da2803684776f7659083a530819" rel=3D"noreferrer" target=3D"_blank">=
https://gitlab.freedesktop.org/spice/usbredir/-/commit/f4ffdce329305da28036=
84776f7659083a530819</a><br>
<br>
Time to enable tools/usbredirect as it seems to be the replacement for usbr=
edirserver<br>
(according to [1])?<br></blockquote><div><br></div><div>Indeed, I&#39;ll se=
nd a v2.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Regards,<br>
Peter<br>
<br>
[1] <a href=3D"https://gitlab.freedesktop.org/spice/usbredir/-/merge_reques=
ts/2" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/s=
pice/usbredir/-/merge_requests/2</a><br>
<br>
<br>
&gt;<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/spice/usbredir/-/blob/usbred=
ir-0.13.0/ChangeLog.md" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.freedesktop.org/spice/usbredir/-/blob/usbredir-0.13.0/ChangeLog.md</a><br>
&gt;<br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Config.in.legacy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 7 +++++++<br>
&gt;=C2=A0 package/usbredir/Config.in=C2=A0 =C2=A0 =C2=A0| 12 ------------<=
br>
&gt;=C2=A0 package/usbredir/usbredir.hash |=C2=A0 4 ++--<br>
&gt;=C2=A0 package/usbredir/<a href=3D"http://usbredir.mk" rel=3D"noreferre=
r" target=3D"_blank">usbredir.mk</a>=C2=A0 =C2=A0| 16 +---------------<br>
&gt;=C2=A0 4 files changed, 10 insertions(+), 29 deletions(-)<br>
&gt;<br>
&gt; diff --git a/Config.in.legacy b/Config.in.legacy<br>
&gt; index 0e63d59a98..39b00547c8 100644<br>
&gt; --- a/Config.in.legacy<br>
&gt; +++ b/Config.in.legacy<br>
&gt; @@ -146,6 +146,13 @@ endif<br>
&gt;<br>
&gt;=C2=A0 comment &quot;Legacy options removed in 2022.11&quot;<br>
&gt;<br>
&gt; +config BR2_PACKAGE_USBREDIR_SERVER<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;usbredirserver removed&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_LEGACY<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0usbredirserver has been dropped by upstrea=
m since version<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00.13.0<br>
&gt; +<br>
&gt;=C2=A0 config BR2_KERNEL_HEADERS_5_17<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;kernel headers version 5.17.x are=
 no longer supported&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_LEGACY<br>
&gt; diff --git a/package/usbredir/Config.in b/package/usbredir/Config.in<b=
r>
&gt; index 8ce180a884..2190cb88ac 100644<br>
&gt; --- a/package/usbredir/Config.in<br>
&gt; +++ b/package/usbredir/Config.in<br>
&gt; @@ -18,15 +18,3 @@ config BR2_PACKAGE_USBREDIR<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;y&#39; below if you want the ser=
ver too.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.spice-space.org=
/page/UsbRedir" rel=3D"noreferrer" target=3D"_blank">http://www.spice-space=
.org/page/UsbRedir</a><br>
&gt; -<br>
&gt; -if BR2_PACKAGE_USBREDIR<br>
&gt; -<br>
&gt; -config BR2_PACKAGE_USBREDIR_SERVER<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bool &quot;usbredirserver on target&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0If you want to serve usbredir requests on =
your target, say<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;y&#39; here to have the usbredir serv=
er on the target.<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Note: the server is not required to use th=
e library.<br>
&gt; -<br>
&gt; -endif<br>
&gt; diff --git a/package/usbredir/usbredir.hash b/package/usbredir/usbredi=
r.hash<br>
&gt; index f738c36690..577e08efba 100644<br>
&gt; --- a/package/usbredir/usbredir.hash<br>
&gt; +++ b/package/usbredir/usbredir.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt; -# <a href=3D"https://spice-space.org/download/usbredir/usbredir-0.12.=
0.tar.xz.sha256sum" rel=3D"noreferrer" target=3D"_blank">https://spice-spac=
e.org/download/usbredir/usbredir-0.12.0.tar.xz.sha256sum</a><br>
&gt; -sha256=C2=A0 fbb44025bf55e1ce8d84afc7596bfa47c8a36cd603c6fa440f9102c1=
c9761e6d=C2=A0 usbredir-0.12.0.tar.xz<br>
&gt; +# <a href=3D"https://spice-space.org/download/usbredir/usbredir-0.13.=
0.tar.xz.sha256sum" rel=3D"noreferrer" target=3D"_blank">https://spice-spac=
e.org/download/usbredir/usbredir-0.13.0.tar.xz.sha256sum</a><br>
&gt; +sha256=C2=A0 4ba6faa02c0ae6deeb4c53883d66ab54b3a5899bead42ce4ded9568b=
9a7dc46e=C2=A0 usbredir-0.13.0.tar.xz<br>
&gt;<br>
&gt;=C2=A0 # Hash for license files<br>
&gt;=C2=A0 sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404=
010521b880643=C2=A0 COPYING<br>
&gt; diff --git a/package/usbredir/<a href=3D"http://usbredir.mk" rel=3D"no=
referrer" target=3D"_blank">usbredir.mk</a> b/package/usbredir/<a href=3D"h=
ttp://usbredir.mk" rel=3D"noreferrer" target=3D"_blank">usbredir.mk</a><br>
&gt; index 6792a3e758..6d5a80cbf9 100644<br>
&gt; --- a/package/usbredir/<a href=3D"http://usbredir.mk" rel=3D"noreferre=
r" target=3D"_blank">usbredir.mk</a><br>
&gt; +++ b/package/usbredir/<a href=3D"http://usbredir.mk" rel=3D"noreferre=
r" target=3D"_blank">usbredir.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;<br>
&gt; -USBREDIR_VERSION =3D 0.12.0<br>
&gt; +USBREDIR_VERSION =3D 0.13.0<br>
&gt;=C2=A0 USBREDIR_SOURCE =3D usbredir-$(USBREDIR_VERSION).tar.xz<br>
&gt;=C2=A0 USBREDIR_SITE =3D <a href=3D"http://spice-space.org/download/usb=
redir" rel=3D"noreferrer" target=3D"_blank">http://spice-space.org/download=
/usbredir</a><br>
&gt;=C2=A0 USBREDIR_LICENSE =3D LGPL-2.1+ (libraries)<br>
&gt; @@ -17,18 +17,4 @@ USBREDIR_CONF_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dtests=3Ddisabled \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dtools=3Ddisabled<br>
&gt;<br>
&gt; -ifeq ($(BR2_PACKAGE_USBREDIR_SERVER),y)<br>
&gt; -<br>
&gt; -USBREDIR_LICENSE +=3D , GPL-2.0+ (program)<br>
&gt; -USBREDIR_LICENSE_FILES +=3D COPYING<br>
&gt; -<br>
&gt; -else # BR2_PACKAGE_USBREDIR_SERVER !=3D y<br>
&gt; -<br>
&gt; -define USBREDIR_POST_INSTALL_TARGET_RM_SERVER<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -f $(TARGET_DIR)/usr/sbin/usbredirserver<br>
&gt; -endef<br>
&gt; -USBREDIR_POST_INSTALL_TARGET_HOOKS +=3D USBREDIR_POST_INSTALL_TARGET_=
RM_SERVER<br>
&gt; -<br>
&gt; -endif # BR2_PACKAGE_USBREDIR_SERVER<br>
&gt; -<br>
&gt;=C2=A0 $(eval $(meson-package))<br></blockquote><div>Best Regards,</div=
><div><br></div><div>Fabrice <br></div></div></div>

--0000000000002f194505eba62e28--

--===============2183123307940421975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2183123307940421975==--
