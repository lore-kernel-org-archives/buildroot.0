Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D818FC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 16:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30E6F81460;
	Tue,  1 Nov 2022 16:37:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30E6F81460
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AdIuRONlA33; Tue,  1 Nov 2022 16:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F6D881419;
	Tue,  1 Nov 2022 16:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F6D881419
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E24181BF292
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 16:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA46B60E1E
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 16:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA46B60E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQZ_OaGpKqdW for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 16:37:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5927F60E19
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5927F60E19
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 16:37:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id f37so24202194lfv.8
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 09:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vilPD8lXJqjNhJuepT81i3vjy281tsGl2eXUm83S1hQ=;
 b=aYca+OwTn0Qr0Q+mIV+Mf9l5S1HzROq0bFYtxhDAkZ1Sn+JQM9U927USBBXdT2UiRI
 i2mQV4QWG2vLEuVsgNY+ndcon787Az0/ygF/Q08EZL7w2pCCiKG4RRfrf9JqaRJEYadt
 rrYNqvjeakxoYcymLGyyNvNWvqug/ZP18F18aBMtLczYMuVf7rFlLOvLRnu2bJxhSYXD
 PY3nBY5kk9UVuhpLGvRbN3qqGVbcDRFgEiapDnRhhL2tTZm+sxyqtGJjLCyu8T2LDXMd
 8XG9ztO0snarFFn+HyehhGEehzDVqmat5561YfaI3d4R0RnRGk/qF+d1SDmSgFhGF5fI
 WLqA==
X-Gm-Message-State: ACrzQf1APjq99Qw+FQN2NH8YKnTboRAellXncx85AoxSc8U6PFY9KYBZ
 biljrBTdywptubrb/L66k3+MYuW6eJssCM2jLZw=
X-Google-Smtp-Source: AMsMyM6bKjFrxCgYtXZ9TDB09JiUU6QfPo1Lft7hu6BhIdAPzmZerfKNwMfzsyZ0FZOhYfa32acB/tZB1dCPhfmcu/g=
X-Received: by 2002:a05:6512:3415:b0:4a2:9a52:bc3b with SMTP id
 i21-20020a056512341500b004a29a52bc3bmr7520470lfr.294.1667320626002; Tue, 01
 Nov 2022 09:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221029110943.155259-1-glex.spb@gmail.com>
 <20221030164825.GV1058960@scaer>
In-Reply-To: <20221030164825.GV1058960@scaer>
From: Gleb Mazovetskiy <glex.spb@gmail.com>
Date: Tue, 1 Nov 2022 16:36:54 +0000
Message-ID: <CADjhFRASGKb1feOAk5vwod+TW-bkzGxh__ehGguEh81ZV27Rpw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vilPD8lXJqjNhJuepT81i3vjy281tsGl2eXUm83S1hQ=;
 b=prYbl/Z6eStW3wQ66MtJ+VcU1VEsdvXAsJHMpisDhkYTxls6+D7cdKvttgwFIXUsam
 WKQgNtw2tpUwECmNIKdNV8MzVqNguH5y+AUDhH68x9q5oCf2CaCKQjxz/pwuTJ+XpWye
 7veAm/ukN9TPgsWO6kJWT+rHgRYqGtOW8YPUOUyPXR8hyjyY9C9e3tFv8myXSbrYupOv
 kDeo0MBUg1/tCFfEETQEHneZCWkCnGwbCegTF09H34u4uJJfG2jQkY5aWXCJfOqrRWjn
 +DzNWNWn2LUbuOOpNElq3zta9Hy5Fo4bm1OmzNaUA35v3Sp+BYRaZaXKfIOJCtLydxR4
 JnIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=prYbl/Z6
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: unset
 CMAKE_GENERATOR vars
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4922919343402497520=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4922919343402497520==
Content-Type: multipart/alternative; boundary="000000000000a3be0a05ec6b555b"

--000000000000a3be0a05ec6b555b
Content-Type: text/plain; charset="UTF-8"

Thanks!
Can we do something similar for `PERL_MM_OPT`?

Buildroot currently requires the user to unset it manually but ideally it'd
just unset it itself
https://github.com/buildroot/buildroot/blob/ba2659401feb5cc97cad501ab8b38268de578d3f/support/dependencies/dependencies.sh#L49-L56

On Sun, Oct 30, 2022 at 4:48 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Gleb, All,
>
> On 2022-10-29 12:09 +0100, Gleb Mazovetskiy spake thusly:
> > If the user environment defines `CMAKE_GENERATOR` (e.g.
> > `CMAKE_GENERATOR=Ninja`), buildroot would previously fail to build cmake
> > packages because buildroot uses `make` explicitly (as opposed to
> > `cmake --build`).
> >
> > Unsets all the `CMAKE_GENERATOR*` variables before configuring a cmake
> > package.
> >
> > Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
> > ---
> >  package/pkg-cmake.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 081960b5bf..96b2579cc5 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -86,6 +86,7 @@ define $(2)_CONFIGURE_CMDS
> >       (mkdir -p $$($$(PKG)_BUILDDIR) && \
> >       cd $$($$(PKG)_BUILDDIR) && \
> >       rm -f CMakeCache.txt && \
> > +     unset CMAKE_GENERATOR CMAKE_GENERATOR_PLATFORM
> CMAKE_GENERATOR_TOOLSET CMAKE_GENERATOR_INSTANCE && \
>
> I've instead applied the patch from Woody:
>
> https://patchwork.ozlabs.org/project/buildroot/patch/94745932ea2dfa030e3d438d7cf6b84f1ef2f69c.camel@carnegierobotics.com/
>
> So I dropped your patch.
>
> In the future, we should be able to replace the hard-coded "Unix
> Makefiles" with a per-package setting, where package can elect building
> built with nother backend (or better yet, switch netirely to another
> backend globally), and the patch from Woody felt like slightly preparing
> for that future.
>
> Regards,
> Yann E. MORIN.
>
> >       PATH=$$(BR_PATH) \
> >       $$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG)_SRCDIR) \
> >
>  -DCMAKE_TOOLCHAIN_FILE="$$(HOST_DIR)/share/buildroot/toolchainfile.cmake" \
> > @@ -111,6 +112,7 @@ define $(2)_CONFIGURE_CMDS
> >       (mkdir -p $$($$(PKG)_BUILDDIR) && \
> >       cd $$($$(PKG)_BUILDDIR) && \
> >       rm -f CMakeCache.txt && \
> > +     unset CMAKE_GENERATOR CMAKE_GENERATOR_PLATFORM
> CMAKE_GENERATOR_TOOLSET CMAKE_GENERATOR_INSTANCE && \
> >       PATH=$$(BR_PATH) \
> >       PKG_CONFIG="$$(PKG_CONFIG_HOST_BINARY)" \
> >       PKG_CONFIG_SYSROOT_DIR="/" \
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>

--000000000000a3be0a05ec6b555b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks!</div><div>Can we do something similar for `PE=
RL_MM_OPT`?</div><div><br></div><div>Buildroot currently requires the user =
to unset it manually but ideally it&#39;d just unset it itself</div><div><a=
 href=3D"https://github.com/buildroot/buildroot/blob/ba2659401feb5cc97cad50=
1ab8b38268de578d3f/support/dependencies/dependencies.sh#L49-L56">https://gi=
thub.com/buildroot/buildroot/blob/ba2659401feb5cc97cad501ab8b38268de578d3f/=
support/dependencies/dependencies.sh#L49-L56</a></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 30, 2022=
 at 4:48 PM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">ya=
nn.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Gleb, All,<br>
<br>
On 2022-10-29 12:09 +0100, Gleb Mazovetskiy spake thusly:<br>
&gt; If the user environment defines `CMAKE_GENERATOR` (e.g.<br>
&gt; `CMAKE_GENERATOR=3DNinja`), buildroot would previously fail to build c=
make<br>
&gt; packages because buildroot uses `make` explicitly (as opposed to<br>
&gt; `cmake --build`).<br>
&gt; <br>
&gt; Unsets all the `CMAKE_GENERATOR*` variables before configuring a cmake=
<br>
&gt; package.<br>
&gt; <br>
&gt; Signed-off-by: Gleb Mazovetskiy &lt;<a href=3D"mailto:glex.spb@gmail.c=
om" target=3D"_blank">glex.spb@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/<a href=3D"http://pkg-cmake.mk" rel=3D"noreferrer" targe=
t=3D"_blank">pkg-cmake.mk</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/<a href=3D"http://pkg-cmake.mk" rel=3D"noreferrer=
" target=3D"_blank">pkg-cmake.mk</a> b/package/<a href=3D"http://pkg-cmake.=
mk" rel=3D"noreferrer" target=3D"_blank">pkg-cmake.mk</a><br>
&gt; index 081960b5bf..96b2579cc5 100644<br>
&gt; --- a/package/<a href=3D"http://pkg-cmake.mk" rel=3D"noreferrer" targe=
t=3D"_blank">pkg-cmake.mk</a><br>
&gt; +++ b/package/<a href=3D"http://pkg-cmake.mk" rel=3D"noreferrer" targe=
t=3D"_blank">pkg-cmake.mk</a><br>
&gt; @@ -86,6 +86,7 @@ define $(2)_CONFIGURE_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(mkdir -p $$($$(PKG)_BUILDDIR) &amp;&amp; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cd $$($$(PKG)_BUILDDIR) &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f CMakeCache.txt &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unset CMAKE_GENERATOR CMAKE_GENERATOR_PLATFORM CM=
AKE_GENERATOR_TOOLSET CMAKE_GENERATOR_INSTANCE &amp;&amp; \<br>
<br>
I&#39;ve instead applied the patch from Woody:<br>
=C2=A0 =C2=A0 <a href=3D"https://patchwork.ozlabs.org/project/buildroot/pat=
ch/94745932ea2dfa030e3d438d7cf6b84f1ef2f69c.camel@carnegierobotics.com/" re=
l=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/project/bui=
ldroot/patch/94745932ea2dfa030e3d438d7cf6b84f1ef2f69c.camel@carnegierobotic=
s.com/</a><br>
<br>
So I dropped your patch.<br>
<br>
In the future, we should be able to replace the hard-coded &quot;Unix<br>
Makefiles&quot; with a per-package setting, where package can elect buildin=
g<br>
built with nother backend (or better yet, switch netirely to another<br>
backend globally), and the patch from Woody felt like slightly preparing<br=
>
for that future.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PATH=3D$$(BR_PATH) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$$($$(PKG)_CONF_ENV) $$(BR2_CMAKE) $$($$(PKG=
)_SRCDIR) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_TOOLCHAI=
N_FILE=3D&quot;$$(HOST_DIR)/share/buildroot/toolchainfile.cmake&quot; \<br>
&gt; @@ -111,6 +112,7 @@ define $(2)_CONFIGURE_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(mkdir -p $$($$(PKG)_BUILDDIR) &amp;&amp; \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cd $$($$(PKG)_BUILDDIR) &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f CMakeCache.txt &amp;&amp; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unset CMAKE_GENERATOR CMAKE_GENERATOR_PLATFORM CM=
AKE_GENERATOR_TOOLSET CMAKE_GENERATOR_INSTANCE &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PATH=3D$$(BR_PATH) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG=3D&quot;$$(PKG_CONFIG_HOST_BINARY=
)&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_SYSROOT_DIR=3D&quot;/&quot; \<br>
&gt; -- <br>
&gt; 2.34.1<br>
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
</blockquote></div>

--000000000000a3be0a05ec6b555b--

--===============4922919343402497520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4922919343402497520==--
