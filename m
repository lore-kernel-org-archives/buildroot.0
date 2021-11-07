Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0C4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 13:10:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A9D6103D
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 13:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07A9D6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gadz.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9156A60656;
	Sun,  7 Nov 2021 13:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bGP5tJB1QCj; Sun,  7 Nov 2021 13:10:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD7C60665;
	Sun,  7 Nov 2021 13:10:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8E31BF2CB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 13:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F246680EF1
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 13:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EZ3bYlU4JCdZ for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 13:10:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A22D180EE2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 13:10:23 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id d11so2811725ljg.8
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 05:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LwGLoDYCEo8oz1r4S8O0vM0m1Gg1/xgN27cJt/27ahI=;
 b=aicU/kZGJtWnhk/CDgHxblOiR1GUG0EiwaoWoSRTrAln97fD8OJibcjwloEkvMfqD/
 tgvU1Jb6lWW0VZXaunZ6e7shnumFEB7qgjElcyl2xfRgSEFANq86cmGBRELhcYqtMDdY
 2nOwalYNUKHKV/RgS48lGfIik4A9RdAFfAW2hkl1P/ioA5GHcsCjIb8XlkIQHPK10pvV
 c0uEziJdORFpOatv0VFWB3ZLUtejqGV35zyir97cuRV6WSUKSDRhHQtjz6rt1WQprj6c
 qN0TmU+0WPE+SDmQqMrjdXMNhysCV6H/1K5oB4q+H4zl4B1c/u5HeLOzLl/6HlYI1HI5
 nXKA==
X-Gm-Message-State: AOAM530eHFNVzW64RnZgRVwLALHpTovRCyWL68lyvvbh58T/+PJCuwcn
 qCD4RELPRuQXm+qi6WGE3dzGpT3IctXR18WNU/hm2aHaAtUkeg==
X-Google-Smtp-Source: ABdhPJxrHT7a0ydM1Hm0E+VmFez/bFkG5qu9nbxLI5J5gNPPiHAkk0L2qNjqKVoauhStURmOjGOCorLFOkmu7/3H9YQ=
X-Received: by 2002:a2e:9699:: with SMTP id q25mr1380561lji.6.1636290621492;
 Sun, 07 Nov 2021 05:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20211031210258.654193-1-romain.naour@gmail.com>
 <b37969629a8e4c8f1d44b818eb0470aa5975e0f4.camel@embedded.rocks>
In-Reply-To: <b37969629a8e4c8f1d44b818eb0470aa5975e0f4.camel@embedded.rocks>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 7 Nov 2021 14:10:09 +0100
Message-ID: <CAB0FRsuz3tV5HT1jL7JUdccane8EEM2BUJWxWSHgo1L3oQ2=Og@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [WIP 1/2] package/luvi: don't use LUAJIT_VERSION
 for the luajit installation path
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
 =?UTF-8?B?SsO2cmcgS3JhdXNl?= <joerg.krause@embedded.rocks>
Content-Type: multipart/mixed; boundary="===============1248907435855191153=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1248907435855191153==
Content-Type: multipart/alternative; boundary="0000000000003e5c9705d0329992"

--0000000000003e5c9705d0329992
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 7 nov. 2021 =C3=A0 11:47, J=C3=B6rg Krause <joerg.krause@embedded.r=
ocks> a
=C3=A9crit :

> Hi Romain,
>
> I can confirm that this fixes the following build error:
>
> ```
> PATH=3D"$BR/output/host/bin:$BR/output/host/sbin:/usr/local/bin:/usr/bin:=
/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor=
_perl:/usr/bin/core_perl"
> /usr/bin/make -j9  -C $BR/output/build/luvi-2.12.0/
> make[1]: Entering directory '$BR/output/build/luvi-2.12.0'
> make[2]: Entering directory '$BR/output/build/luvi-2.12.0'
> make[3]: Entering directory '$BR/output/build/luvi-2.12.0'
> [ 50%] Building Luajitted
> $BR/output/build/luvi-2.12.0/src/lua/luvibundle.lua:
> $BR/output/build/luvi-2.12.0/jitted_tmp/src/lua/luvibundle.lua_luvi_gener=
ated.o
> [ 50%] Building Luajitted
> $BR/output/build/luvi-2.12.0/src/lua/luvipath.lua:
> $BR/output/build/luvi-2.12.0/jitted_tmp/src/lua/luvipath.lua_luvi_generat=
ed.o
> [ 50%] Building Luajitted $BR/output/build/luvi-2.12.0/src/lua/init.lua:
> $BR/output/build/luvi-2.12.0/jitted_tmp/src/lua/init.lua_luvi_generated.o
> luajit: unknown luaJIT command or jit.* modules not installed
> luajit: unknown luaJIT command or jit.* modules not installed
> make[3]: *** [CMakeFiles/luvi.dir/build.make:78:
> jitted_tmp/src/lua/luvipath.lua_luvi_generated.o] Error 1
> ```
>
> The issue is, that LUA_PATH is set to
> `$BR/output/host/share/luajit-05f1984e1a862e4b3d3c3b370c773492e2edf84a/?.=
lua`,
> which is wrong, as the installation path of luajit is
> `$BR/output/host/share/luajit-2.1.0-beta3/`.
>
> So, the fix proposed by Romain is correct.
>
> Tested-by: J=C3=B6rg Krause <joerg.krause@embedded.rocks>
>
>
I agree.

Acked-by: Francois Perrad <francois.perrad@gadz.org>

Fran=C3=A7ois


> Best regards
> J=C3=B6rg Krause
>
> On Sun, 2021-10-31 at 22:02 +0100, Romain Naour wrote:
> > Luajit package has been recently updated to the latest commit in the
> > master branch [1]. Since then LUAJIT_VERSION doesn't contain the luajit
> > version anymore but a commit hash:
> >
> > LUAJIT_VERSION =3D 05f1984e1a862e4b3d3c3b370c773492e2edf84a
> >
> > Use pkg-config --variable=3Dversion luajit in luvi package to set
> > LUA_PATH correctly.
> >
> > Fixes:
> > luajit: unknown luaJIT command or jit.* modules not installed
> >
> > https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552605
> >
> > [1] 9450b53c8e06f1b5a75840b82c0f4663a5d75c45
> >
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > Cc: J=C3=B6rg Krause <joerg.krause@embedded.rocks>
> > ---
> > The TestLuvi doesn't work yet due to missing rng support on Qemu armv7
> target
> > used to run the test. luvi -v is stuck due to getrandom().
> > ---
> >  package/luvi/luvi.mk | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
> > index 386daafc31..ef5777cac8 100644
> > --- a/package/luvi/luvi.mk
> > +++ b/package/luvi/luvi.mk
> > @@ -9,7 +9,7 @@ LUVI_SOURCE =3D luvi-src-v$(LUVI_VERSION).tar.gz
> >  LUVI_SITE =3D
> https://github.com/luvit/luvi/releases/download/v$(LUVI_VERSION)
> >  LUVI_LICENSE =3D Apache-2.0
> >  LUVI_LICENSE_FILES =3D LICENSE.txt
> > -LUVI_DEPENDENCIES =3D libuv luajit luv host-luajit
> > +LUVI_DEPENDENCIES =3D libuv luajit luv host-luajit host-pkgconf
> >
> >  # Dispatch all architectures of LuaJIT
> >  ifeq ($(BR2_i386),y)
> > @@ -30,12 +30,16 @@ else
> >  LUVI_TARGET_ARCH =3D $(BR2_ARCH)
> >  endif
> >
> > +# LUAJIT_VERSION and the luajit installation path may not use the
> > +# same value. Use the value from luajit.pc file.
> > +LUVI_LUAJIT_VERSION =3D $(shell $(PKG_CONFIG_HOST_BINARY)
> --variable=3Dversion luajit)
> > +
> >  # Bundled lua bindings have to be linked statically into the luvi
> executable
> >  LUVI_CONF_OPTS =3D \
> >       -DBUILD_SHARED_LIBS=3DOFF \
> >       -DWithSharedLibluv=3DON \
> >       -DTARGET_ARCH=3D$(LUVI_TARGET_ARCH) \
> > -     -DLUA_PATH=3D$(HOST_DIR)/share/luajit-$(LUAJIT_VERSION)/?.lua
> > +     -DLUA_PATH=3D$(HOST_DIR)/share/luajit-$(LUVI_LUAJIT_VERSION)/?.lu=
a
> >
> >  # Add "rex" module (PCRE via bundled lrexlib)
> >  ifeq ($(BR2_PACKAGE_PCRE),y)
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000003e5c9705d0329992
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 7 nov. 2021 =C3=A0=C2=A0=
11:47, J=C3=B6rg Krause &lt;joerg.krause@embedded.rocks&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Romain,<=
br>
<br>
I can confirm that this fixes the following build error:<br>
<br>
```<br>
PATH=3D&quot;$BR/output/host/bin:$BR/output/host/sbin:/usr/local/bin:/usr/b=
in:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/ven=
dor_perl:/usr/bin/core_perl&quot;=C2=A0 /usr/bin/make -j9=C2=A0 -C $BR/outp=
ut/build/luvi-2.12.0/<br>
make[1]: Entering directory &#39;$BR/output/build/luvi-2.12.0&#39;<br>
make[2]: Entering directory &#39;$BR/output/build/luvi-2.12.0&#39;<br>
make[3]: Entering directory &#39;$BR/output/build/luvi-2.12.0&#39;<br>
[ 50%] Building Luajitted $BR/output/build/luvi-2.12.0/src/lua/luvibundle.l=
ua: $BR/output/build/luvi-2.12.0/jitted_tmp/src/lua/luvibundle.lua_luvi_gen=
erated.o<br>
[ 50%] Building Luajitted $BR/output/build/luvi-2.12.0/src/lua/luvipath.lua=
: $BR/output/build/luvi-2.12.0/jitted_tmp/src/lua/luvipath.lua_luvi_generat=
ed.o<br>
[ 50%] Building Luajitted $BR/output/build/luvi-2.12.0/src/lua/init.lua: $B=
R/output/build/luvi-2.12.0/jitted_tmp/src/lua/init.lua_luvi_generated.o<br>
luajit: unknown luaJIT command or jit.* modules not installed<br>
luajit: unknown luaJIT command or jit.* modules not installed<br>
make[3]: *** [CMakeFiles/luvi.dir/build.make:78: jitted_tmp/src/lua/luvipat=
h.lua_luvi_generated.o] Error 1<br>
```<br>
<br>
The issue is, that LUA_PATH is set to `$BR/output/host/share/luajit-05f1984=
e1a862e4b3d3c3b370c773492e2edf84a/?.lua`, which is wrong, as the installati=
on path of luajit is `$BR/output/host/share/luajit-2.1.0-beta3/`.<br>
<br>
So, the fix proposed by Romain is correct.<br>
<br>
Tested-by: J=C3=B6rg Krause &lt;joerg.krause@embedded.rocks&gt;<br>
<br></blockquote><div><br></div><div>I agree.<br></div><div><br></div><div>=
Acked-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org">f=
rancois.perrad@gadz.org</a>&gt;</div><div><br></div><div>Fran=C3=A7ois<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Best regards<br>
J=C3=B6rg Krause<br>
<br>
On Sun, 2021-10-31 at 22:02 +0100, Romain Naour wrote:<br>
&gt; Luajit package has been recently updated to the latest commit in the<b=
r>
&gt; master branch [1]. Since then LUAJIT_VERSION doesn&#39;t contain the l=
uajit<br>
&gt; version anymore but a commit hash:<br>
&gt; <br>
&gt; LUAJIT_VERSION =3D 05f1984e1a862e4b3d3c3b370c773492e2edf84a<br>
&gt; <br>
&gt; Use pkg-config --variable=3Dversion luajit in luvi package to set<br>
&gt; LUA_PATH correctly.<br>
&gt; <br>
&gt; Fixes:<br>
&gt; luajit: unknown luaJIT command or jit.* modules not installed<br>
&gt; <br>
&gt; <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/171055260=
5" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/bu=
ildroot/-/jobs/1710552605</a><br>
&gt; <br>
&gt; [1] 9450b53c8e06f1b5a75840b82c0f4663a5d75c45<br>
&gt; <br>
&gt; Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.c=
om" target=3D"_blank">romain.naour@gmail.com</a>&gt;<br>
&gt; Cc: J=C3=B6rg Krause &lt;joerg.krause@embedded.rocks&gt;<br>
&gt; ---<br>
&gt; The TestLuvi doesn&#39;t work yet due to missing rng support on Qemu a=
rmv7 target<br>
&gt; used to run the test. luvi -v is stuck due to getrandom().<br>
&gt; ---<br>
&gt;=C2=A0 package/luvi/<a href=3D"http://luvi.mk" rel=3D"noreferrer" targe=
t=3D"_blank">luvi.mk</a> | 8 ++++++--<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/luvi/<a href=3D"http://luvi.mk" rel=3D"noreferrer=
" target=3D"_blank">luvi.mk</a> b/package/luvi/<a href=3D"http://luvi.mk" r=
el=3D"noreferrer" target=3D"_blank">luvi.mk</a><br>
&gt; index 386daafc31..ef5777cac8 100644<br>
&gt; --- a/package/luvi/<a href=3D"http://luvi.mk" rel=3D"noreferrer" targe=
t=3D"_blank">luvi.mk</a><br>
&gt; +++ b/package/luvi/<a href=3D"http://luvi.mk" rel=3D"noreferrer" targe=
t=3D"_blank">luvi.mk</a><br>
&gt; @@ -9,7 +9,7 @@ LUVI_SOURCE =3D luvi-src-v$(LUVI_VERSION).tar.gz<br>
&gt;=C2=A0 LUVI_SITE =3D <a href=3D"https://github.com/luvit/luvi/releases/=
download/v$(LUVI_VERSION)" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/luvit/luvi/releases/download/v$(LUVI_VERSION)</a><br>
&gt;=C2=A0 LUVI_LICENSE =3D Apache-2.0<br>
&gt;=C2=A0 LUVI_LICENSE_FILES =3D LICENSE.txt<br>
&gt; -LUVI_DEPENDENCIES =3D libuv luajit luv host-luajit<br>
&gt; +LUVI_DEPENDENCIES =3D libuv luajit luv host-luajit host-pkgconf<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Dispatch all architectures of LuaJIT<br>
&gt;=C2=A0 ifeq ($(BR2_i386),y)<br>
&gt; @@ -30,12 +30,16 @@ else<br>
&gt;=C2=A0 LUVI_TARGET_ARCH =3D $(BR2_ARCH)<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +# LUAJIT_VERSION and the luajit installation path may not use the<br>
&gt; +# same value. Use the value from luajit.pc file.<br>
&gt; +LUVI_LUAJIT_VERSION =3D $(shell $(PKG_CONFIG_HOST_BINARY) --variable=
=3Dversion luajit)<br>
&gt; +<br>
&gt;=C2=A0 # Bundled lua bindings have to be linked statically into the luv=
i executable<br>
&gt;=C2=A0 LUVI_CONF_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_SHARED_LIBS=3DOFF \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DWithSharedLibluv=3DON \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DTARGET_ARCH=3D$(LUVI_TARGET_ARCH) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0-DLUA_PATH=3D$(HOST_DIR)/share/luajit-$(LUAJIT_VE=
RSION)/?.lua<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DLUA_PATH=3D$(HOST_DIR)/share/luajit-$(LUVI_LUAJ=
IT_VERSION)/?.lua<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Add &quot;rex&quot; module (PCRE via bundled lrexlib)<br>
&gt;=C2=A0 ifeq ($(BR2_PACKAGE_PCRE),y)<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--0000000000003e5c9705d0329992--

--===============1248907435855191153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1248907435855191153==--
