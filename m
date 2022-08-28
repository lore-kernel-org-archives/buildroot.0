Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1454CECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 14:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 808CF60C30;
	Sun, 28 Aug 2022 14:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 808CF60C30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbtN_LmqBAFb; Sun, 28 Aug 2022 14:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4615B60C18;
	Sun, 28 Aug 2022 14:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4615B60C18
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 644C91BF414
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 14:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49E7F40951
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 14:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E7F40951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEbdEOInXWjR for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 14:37:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C811340932
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C811340932
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 14:37:07 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-33dc345ad78so141862407b3.3
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 07:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=pRqo9P5Hx1nfmKbVRdHCwOsrdAWtjLqaR7g9ls2+SvM=;
 b=QfBKvaAfRkSn7vjl0cPP+3SsY1HsFnKYOG7PIRCS5Yc+seDr+bnd4J93GiDhzScQNg
 ou+Qf8Ax+DXR7cIeyi9U8YU+IHfK//p5m/0rWTDyEA+O5gtX+Y68exJcWFKNQvoKUHha
 s4nB1fuYauh0uNFAGYpgdA9E+dwPlBh93R2I8Lwp93j/cP7IVbniPQd+Idj7f/Gj8Ne5
 9xLx2REdy5x1YTzx3ZQl3A74Caw0YOSxSKZyvEnhzSAg52jXkw3Ve2q6i5X0riImXbYP
 I5pNVxAF40/gw6QMyev7XDWtGpHfaOk6XkJAIq83PAcvCgzPraZclJwL8w3PNcEZAs2J
 MxfA==
X-Gm-Message-State: ACgBeo1yjR0B/0rgymvovX5dl1Jt77dBvprE5hJzqAjklzYrt4xqMLwR
 oRA2zr0jS+fzjaXAEfDrrezxjwalZyKVfc3SBOeSystomqk4Uw==
X-Google-Smtp-Source: AA6agR7FzJ7tfX26Ytm/eJVc7Tx/5gllIY+y2z3cYpbyQ4ZZ5QnGtUFmUnbRr3HNG5ndcm0qryIbVtWymwd7sPffgZo=
X-Received: by 2002:a81:1e81:0:b0:341:245c:5c82 with SMTP id
 e123-20020a811e81000000b00341245c5c82mr447856ywe.8.1661697426626; Sun, 28 Aug
 2022 07:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220828130520.26945-1-dima@doty.ru>
 <20220828140150.GP37358@scaer>
In-Reply-To: <20220828140150.GP37358@scaer>
From: Dmitry Ilyin <dima@doty.ru>
Date: Sun, 28 Aug 2022 17:36:55 +0300
Message-ID: <CAF_pguJgm7y+zZ3apxL5p+njipC7vmT8X8x4XwM_w8G_inNrvQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=doty-ru.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=pRqo9P5Hx1nfmKbVRdHCwOsrdAWtjLqaR7g9ls2+SvM=;
 b=uNYHXEeUnXVoEoeiZsnrt2igvVf46EocB6WjZ64zf5DJJ3V/a1+UzYmAFgrTMVb+97
 Bd8L6SjqUEffRv5FoNOgV/4AIF5LAoaHrUYZaqKoptmPsDc8OSL8L/ec5R5bGBKKsExK
 IwWxMpO5PMqjSEg1sObSS+IXcyswqHNXGdDnboTXIrp01aWpzwSdma+1uYpZ/cFgGb3t
 vVgIIMqOWgf/c6dB6yBsq9NzlY5tsLjF7bLuSiJHC8Quo3QAMBYewCTAO9fD6m4c6Q6R
 w1mfR+GCkquO/pSSdvi+86/BFmXe8OOdZEmRkc/8OIMJLSyKndUo9+eY/FH2hmZFfGDt
 8sWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=doty-ru.20210112.gappssmtp.com
 header.i=@doty-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=uNYHXEeU
Subject: Re: [Buildroot] [PATCH] package/mbedtls: add configurable SRTP
 support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5218645976785786808=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5218645976785786808==
Content-Type: multipart/alternative; boundary="000000000000d6b8f905e74e1486"

--000000000000d6b8f905e74e1486
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I used git send-email origin/master command to submit the patch using
http://underpop.online.fr/b/buildroot/en/submitting-patches.htm.gz manual.

The original
outgoing/0001-package-mbedtls-add-configurable-SRTP-support.patch file
has Signed-off-by: line, but I have no idea how to use this old-school
machinery to work properly to appear the line in the mail-list.

About mentioned WebRTC library, this is
https://github.com/awslabs/amazon-kinesis-video-streams-webrtc-sdk-c/ that
I plan to add on final step when its all dependencies will be resolved.

=D0=B2=D1=81, 28 =D0=B0=D0=B2=D0=B3. 2022 =D0=B3. =D0=B2 17:01, Yann E. MOR=
IN <yann.morin.1998@free.fr>:

> Dmitry, All,
>
> On 2022-08-28 16:05 +0300, Dmitry Ilyin spake thusly:
> > This adds new BR2_PACKAGE_MBEDTLS_SRTP_SUPPORT option to have MbedTLS
> > builds that support SRTP (required option for AWS WebRTC library)
>
> You need to sign-off your change:
>     https://buildroot.org/downloads/manual/manual.html#submitting-patches
>
> Also, what do you mean by "required option for AWS WebRTC library"?
>
> If you are referring to a package that is present in Buildroot, then
> that package should also be fixed to select that option. The only
> package I could find in Buildroot, that is both websocket-related and
> uses mbedtls, is package/libwebsockets/. If that's what you were
> refering to, then the conditin to use mbedtls should be changed (in a
> separate, follow-up patch):
>
>     -else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
>     +else ifeq ($(BR2_PACKAGE_MBEDTLS_SRTP),y)
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/mbedtls/Config.in  | 6 ++++++
> >  package/mbedtls/mbedtls.mk | 8 ++++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
> > index a39ba65d98..f06a27fc5c 100644
> > --- a/package/mbedtls/Config.in
> > +++ b/package/mbedtls/Config.in
> > @@ -29,4 +29,10 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION
> >         sure CRIME and similar attacks are not applicable to your
> >         particular situation.
> >
> > +config BR2_PACKAGE_MBEDTLS_SRTP
> > +     bool "enable SRTP support"
> > +     help
> > +       Enable support for negotiation of DTLS-SRTP (RFC 5764)
> > +       through the use_srtp extension.
> > +
> >  endif
> > diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
> > index af87d62b30..9f9aee1fec 100644
> > --- a/package/mbedtls/mbedtls.mk
> > +++ b/package/mbedtls/mbedtls.mk
> > @@ -72,4 +72,12 @@ else ifeq
> ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
> >  MBEDTLS_POST_CONFIGURE_HOOKS +=3D MBEDTLS_DISABLE_ASM
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_MBEDTLS_SRTP_SUPPORT),y)
> > +define MBEDTLS_ENABLE_SRTP
> > +     $(SED) "s://#define MBEDTLS_SSL_DTLS_SRTP:#define
> MBEDTLS_SSL_DTLS_SRTP:" \
> > +             $(@D)/include/mbedtls/config.h
> > +endef
> > +MBEDTLS_POST_PATCH_HOOKS +=3D MBEDTLS_ENABLE_SRTP
> > +endif
> > +
> >  $(eval $(cmake-package))
> > --
> > 2.37.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>


--=20
Best regards,
Dmitry Ilyin

--000000000000d6b8f905e74e1486
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I used=C2=A0<span style=3D"font-size:0.875em">git send-ema=
il origin/master=C2=A0</span>command to submit=C2=A0the patch=C2=A0using=C2=
=A0<a href=3D"http://underpop.online.fr/b/buildroot/en/submitting-patches.h=
tm.gz">http://underpop.online.fr/b/buildroot/en/submitting-patches.htm.gz</=
a> manual.=C2=A0<br><div><br></div><div>The original outgoing/0001-package-=
mbedtls-add-configurable-SRTP-support.patch file has=C2=A0Signed-off-by: li=
ne, but I have no idea how to use this old-school machinery to=C2=A0work pr=
operly to appear the line in the mail-list.<br></div><div><br></div><div>Ab=
out mentioned WebRTC library, this is=C2=A0<a href=3D"https://github.com/aw=
slabs/amazon-kinesis-video-streams-webrtc-sdk-c/">https://github.com/awslab=
s/amazon-kinesis-video-streams-webrtc-sdk-c/</a> that I plan to add on fina=
l step when its all dependencies will be resolved.</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=81, 28 =
=D0=B0=D0=B2=D0=B3. 2022 =D0=B3. =D0=B2 17:01, Yann E. MORIN &lt;<a href=3D=
"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt;:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Dmitry, All,<br>
<br>
On 2022-08-28 16:05 +0300, Dmitry Ilyin spake thusly:<br>
&gt; This adds new BR2_PACKAGE_MBEDTLS_SRTP_SUPPORT option to have MbedTLS<=
br>
&gt; builds that support SRTP (required option for AWS WebRTC library)<br>
<br>
You need to sign-off your change:<br>
=C2=A0 =C2=A0 <a href=3D"https://buildroot.org/downloads/manual/manual.html=
#submitting-patches" rel=3D"noreferrer" target=3D"_blank">https://buildroot=
.org/downloads/manual/manual.html#submitting-patches</a><br>
<br>
Also, what do you mean by &quot;required option for AWS WebRTC library&quot=
;?<br>
<br>
If you are referring to a package that is present in Buildroot, then<br>
that package should also be fixed to select that option. The only<br>
package I could find in Buildroot, that is both websocket-related and<br>
uses mbedtls, is package/libwebsockets/. If that&#39;s what you were<br>
refering to, then the conditin to use mbedtls should be changed (in a<br>
separate, follow-up patch):<br>
<br>
=C2=A0 =C2=A0 -else ifeq ($(BR2_PACKAGE_MBEDTLS),y)<br>
=C2=A0 =C2=A0 +else ifeq ($(BR2_PACKAGE_MBEDTLS_SRTP),y)<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 package/mbedtls/Config.in=C2=A0 | 6 ++++++<br>
&gt;=C2=A0 package/mbedtls/<a href=3D"http://mbedtls.mk" rel=3D"noreferrer"=
 target=3D"_blank">mbedtls.mk</a> | 8 ++++++++<br>
&gt;=C2=A0 2 files changed, 14 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in<br>
&gt; index a39ba65d98..f06a27fc5c 100644<br>
&gt; --- a/package/mbedtls/Config.in<br>
&gt; +++ b/package/mbedtls/Config.in<br>
&gt; @@ -29,4 +29,10 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sure CRIME and similar attacks are no=
t applicable to your<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0particular situation.<br>
&gt;=C2=A0 <br>
&gt; +config BR2_PACKAGE_MBEDTLS_SRTP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;enable SRTP support&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable support for negotiation of DTLS-SRT=
P (RFC 5764)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0through the use_srtp extension.<br>
&gt; +<br>
&gt;=C2=A0 endif<br>
&gt; diff --git a/package/mbedtls/<a href=3D"http://mbedtls.mk" rel=3D"nore=
ferrer" target=3D"_blank">mbedtls.mk</a> b/package/mbedtls/<a href=3D"http:=
//mbedtls.mk" rel=3D"noreferrer" target=3D"_blank">mbedtls.mk</a><br>
&gt; index af87d62b30..9f9aee1fec 100644<br>
&gt; --- a/package/mbedtls/<a href=3D"http://mbedtls.mk" rel=3D"noreferrer"=
 target=3D"_blank">mbedtls.mk</a><br>
&gt; +++ b/package/mbedtls/<a href=3D"http://mbedtls.mk" rel=3D"noreferrer"=
 target=3D"_blank">mbedtls.mk</a><br>
&gt; @@ -72,4 +72,12 @@ else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6=
)$(BR2_MIPS_CPU_MIPS64R6),y)<br>
&gt;=C2=A0 MBEDTLS_POST_CONFIGURE_HOOKS +=3D MBEDTLS_DISABLE_ASM<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +ifeq ($(BR2_PACKAGE_MBEDTLS_SRTP_SUPPORT),y)<br>
&gt; +define MBEDTLS_ENABLE_SRTP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(SED) &quot;s://#define MBEDTLS_SSL_DTLS_SRTP:#d=
efine MBEDTLS_SSL_DTLS_SRTP:&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(@D)/include/mbedtls=
/config.h<br>
&gt; +endef<br>
&gt; +MBEDTLS_POST_PATCH_HOOKS +=3D MBEDTLS_ENABLE_SRTP<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 $(eval $(cmake-package))<br>
&gt; -- <br>
&gt; 2.37.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div><span style=3D"color:=
rgb(13,13,13);font-family:arial,sans-serif;font-size:12px">Best regards,</s=
pan></div><span style=3D"color:rgb(13,13,13);font-family:arial,sans-serif;f=
ont-size:12px">Dmitry Ilyin</span></div></div></div>

--000000000000d6b8f905e74e1486--

--===============5218645976785786808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5218645976785786808==--
