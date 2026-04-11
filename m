Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58429F36BA5
	for <buildroot@archiver.kernel.org>; Sat, 11 Apr 2026 08:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17998607F5;
	Sat, 11 Apr 2026 08:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I83_855oZmQS; Sat, 11 Apr 2026 08:11:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22DB46081D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775895070;
	bh=rNtHQgayFtCWS4s8k0OSq34fzjk6aTbGwg/sFlkiS1Y=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PVmzaifYOcNT7za5SjgbBfTLKOLT3XheweeLhBX+iSPNObSmB+tytMplSvbXKB5cv
	 tepX41YiKTDOxxknK5iWauAMoEXA8Fy3X51hRCvLfaRcHr9dqu0/482Z/+f40PAkO8
	 DKu2BW60T6V60Vd3UPb11sCYxzg0zSz7xXaHAhrfuJRTOoRztNGalPNM83VuRmy8Fv
	 Ash+ZVF6UOma/0jC/zGdjstZThDiAorBODlt4GXQdXFJxf5zDBozQcOxUny8XYanzP
	 w+nJ+RIWKSwdVa0k0IRbBjeKVkiu34m2EDRS6X/uGyZ06JTo/y9JWnj496xrPH2UOA
	 ZcijzKMAXoeiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22DB46081D;
	Sat, 11 Apr 2026 08:11:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5F26EC
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 08:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B42383C14
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 08:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jy4CdfxuVrze for <buildroot@buildroot.org>;
 Sat, 11 Apr 2026 08:11:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67CC683C16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67CC683C16
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67CC683C16
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 08:11:07 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5a2a70bb66aso2955705e87.0
 for <buildroot@buildroot.org>; Sat, 11 Apr 2026 01:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775895065; cv=none;
 d=google.com; s=arc-20240605;
 b=O09F8zVIgOtb1ZrqZuvxPWzXQICNm8XWlD1P/seL1Q448lyhBGZdUFtYzQ5DIjVq5c
 Rb6aOuyE4Y8Nd+MBNF/aKrq0dpJpADjh0BmZarvQReTblyjUUJsuUMgs3pa6VV8BgBP6
 N09V7FX/+tlV/ovpoXbDaBD6Ue3ruLol9tkEe1KNpvVw0Ufhg9ULlpa50PYP0hfsWpEY
 aGSYZMC5j6bG3wcxVpO0CbruXPHET9UxhVSmTyuGppkALldVteH1ncWP+GqLLe6nPMlG
 DwMTuPhO6f+Zg0LTDGKdWtkfevgZG02mkGL4VC7yThpxGy8Rk8X0g5qTK5m5N9fjJDJ/
 dZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=uZkMWXG4EaKg+jqm/qLC2AyivWDf2a7hTHhUButiETA=;
 fh=YXlJgoLKEnCADfyXy5Vg602C/hMV2xEUhGbDiCyx/io=;
 b=DeXwdYmuBet358r6SC0BRCYOMTmAzMoszL+6GWBdRFbbBMXXi55DjlYXmcheYkx1nQ
 z+UUzEN/Ap2q0UhKvZMqVIJ98jaGcpK0ep06s8SBiuktii2raKi0aOkKW8tmXapwNkNj
 IGAw98/6RawYYKZy8Ggr7VYWOsz97XxJS0CHUyySjRmFh6WYjaZuDxe2kd4ehBryiki2
 BLKL09uHXjWG+oM+Llhgovvlae9jtxjV/v+0KPvma8R0pbRZFsLbbM2rYzm3iVvDxsaf
 SAknFTMIRry62fKkOoaFIa2l5aUYBGNcKs4Nmy/aVPMJPPkselFeCc9BjijLfk3eLC7D
 P/qQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775895065; x=1776499865;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZkMWXG4EaKg+jqm/qLC2AyivWDf2a7hTHhUButiETA=;
 b=kmzShgiflDlZq1/wa+Hb5AOt4WYx0Mnu/QkazS/+WGV14o0WtJzM+OvTc5BeFdXLCW
 TfkXoqaYSANuTtgg6xRyuRQt8DHP6Djy4LGYU9Qj0gK2V9GsziD/8r25yKN2pc5l7GGV
 vzDELyo02uGqrUiMgL5VbaZ2UbUPN37aleOSSqG1ns55wbPzlicXIsUc3sCy0wXY0yRk
 uNm56JUdpgivDGnglwAmQaktZhkUvpeaOMjdEKNpn331pRxLMWEvU4aRYHiqp8mtv9E/
 agJ5Hl4rC33pU+6rW9lw1+yj/hxm9HwI3ryVcSFmRGwIVhbZZHPJrSN9xzAeCnwAJHIv
 21XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkZq6aXQqGaXXnAhSGmg6kHegXsShKKnUzR4VOiR1GpkbFusYaRAekgD8ysdw4aMlbI2bz0hDlz3s=@buildroot.org
X-Gm-Message-State: AOJu0YxyhOIwvkb5i3n/lD0xVk1VmoFOvA2cFsAJPMFpyYMNXXj/BucU
 LeGOnYGqeQANLJxe2M2rPPZmheP4phP0lDYKjO2wNUqCx5kWhMRNR+f+PjkT8seNbwyP/5hCbhf
 /kYY+7GwTRrmggDa3UksEKTE7DrjrAfoB1cvxO6Fo
X-Gm-Gg: AeBDietW0YgbBu9nCqQJr0c3l3mG2iduLTV8FfwK5I6ENEbjK9wjO7Tssta9gZO1PVG
 dfbj8ra71wQtUufSn0nhYRXz/7W9Qf9DFEzkxwKKTsTTdBxAZNXCdl3jKDXkwBsNLNEJeB1Vqes
 sjnw492HuWfFSeSIE8TIeoTeRtHs2MQ8IJleSUvur3SMInBcfgH/G5Eo3s/4+5uwoOEKMJ6lACi
 V0nfoV7nFWZHQHbaZi9yD3GZgzlwPq1zGQCMYvsfyoMX+3Skggt5Za47p7Em+NtsYWqTzDTp/pk
 KveMH3z3TaKKVPRiAqR5G5otaUcdSuzTokREA2baww==
X-Received: by 2002:a05:6512:3b90:b0:5a2:c766:13bb with SMTP id
 2adb3069b0e04-5a3ef914a7amr2271805e87.18.1775895063956; Sat, 11 Apr 2026
 01:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260410014309.18115-2-sen@hastings.org>
In-Reply-To: <20260410014309.18115-2-sen@hastings.org>
Date: Sat, 11 Apr 2026 10:10:52 +0200
X-Gm-Features: AQROBzBkumJfRirfP1BKqyT8BpcJwYzKN0WHVMNVdKNFGcIT5rxkKbIQst2Z-5s
Message-ID: <CAAE6iEUnu_iPoTyb=p62LBpOpMc0qSM84ipN-x-8QAy41-Rh+A@mail.gmail.com>
To: Sen Hastings <sen@hastings.org>, buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1775895065; x=1776499865; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uZkMWXG4EaKg+jqm/qLC2AyivWDf2a7hTHhUButiETA=;
 b=MLji7H6DtMcBCqdZBEfl7RkyQukBAMVW45kEc1dT3UdZrZj5TCMFwnGqKR3hQ4xvD0
 DLeK7131cftuBWRWZ7OLQw4mPhPUNLtM5D9SDRi4oReeE64TCB1On2Qy2gP175L38n82
 Z4NGYmdeD4/L+JbALfHJ1Odr+MAEDtiJwJrShcbNxM2o2mFiLmC6DYO5J8aBo5wzpdRd
 tipHAiUVzA5ea/EjpVAO1tevQJpdLdH0niH2Lu/jmkicnBtIatkYd9MtuftbtN6LZ6cW
 g2+4jmjzyZnNB7UP9FmbBlcI78W7VJ9+H2FSRUHoOaqkZPhkqdXF0+fqgFiEiVb4LTJD
 ut7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=MLji7H6D
Subject: Re: [Buildroot] [PATCH 0/1] [RFC] re-add lua 5.2.4
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
From: =?utf-8?q?Fran=C3=A7ois_Perrad_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Content-Type: multipart/mixed; boundary="===============0846567295412011629=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0846567295412011629==
Content-Type: multipart/alternative; boundary="0000000000007272dc064f2acae6"

--0000000000007272dc064f2acae6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 10 avr. 2026 =C3=A0 03:44, Sen Hastings <sen@hastings.org> a =C3=A9=
crit :

> I'm caught a bit between a rock and a hard place,
> I want to use the simplefb (https://codeberg.org/gnarz/simplefb) library
> with mpv, however simplefb needs lua 5.2 (or later with slight
> modification)
> and cannot be easily backported to 5.1.
>


There are few incompatibility between C/API Lua versions.
It is easy to write a compatible code for simplefb.
The following patch does the job, compatible from Lua 5.1 to Lua 5.5.

So, Lua 5.2 is not needed.

Fran=C3=A7ois

---
 lsimplefb.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lsimplefb.c b/lsimplefb.c
index 5efcf11..9e19d4e 100644
--- a/lsimplefb.c
+++ b/lsimplefb.c
@@ -11,6 +11,16 @@
 #include "lua.h"
 #include "lauxlib.h"

+#if LUA_VERSION_NUM < 502
+#define luaL_setfuncs(L,l,n) luaL_register(L, NULL, (l))
+#endif
+
+#if LUA_VERSION_NUM !=3D 502
+#define luaL_checkunsigned luaL_checkinteger
+#define luaL_optunsigned luaL_optinteger
+#define lua_pushunsigned lua_pushinteger
+#endif
+
 #include "simplefb.h"

 #define VERSION 0.1
@@ -533,7 +543,11 @@ static const struct luaL_Reg fbL_functions [] =3D{
  */
 int luaopen_simplefb(lua_State *L)
 {
+#if LUA_VERSION_NUM >=3D 502
  luaL_newlib(L, fbL_functions);
+#else
+ luaL_register(L, "simplefb", fbL_functions);
+#endif

  lua_pushliteral(L, "_VERSION");
  lua_pushnumber(L, VERSION);
--=20
2.48.1



> mpv of course only supports 5.2, 5.1 or luajit.
> Porting mpv to lua 5.3 or newer would be pretty unwise, the mpv maintaine=
rs
> have made it very clear it would break stuff (internally & externally)
> and they are very uninterested in changing it, see:
>
> https://github.com/mpv-player/mpv/wiki/FAQ#why-does-mpv-not-support-lua-5=
3-or-newer
> https://github.com/mpv-player/mpv/issues/9225
>
> The least painful solution to my problem I can think of is re-adding lua
> 5.2
> support to buildroot, basically entirely for the benefit of mpv.
> It's very unlikely mpv will *ever* support a newer version of lua.
>
> Any objections? It seems like we are still supporting lua 5.1 for legacy
> reasons,
> and I am happy to maintain this.
>
> Sen Hastings (1):
>   package/lua: re-add lua 5.2.4
>
>  Config.in.legacy                              | 10 +--
>  package/lua/5.2.4/0001-root-path.patch        | 17 ++++
>  .../lua/5.2.4/0002-shared-libs-for-lua.patch  | 78 +++++++++++++++++++
>  package/lua/5.2.4/0011-linenoise.patch        | 26 +++++++
>  package/lua/5.2.4/lua.hash                    |  2 +
>  package/lua/Config.in                         |  7 +-
>  package/lua/lua.mk                            |  6 +-
>  package/luainterpreter/Config.in              |  4 +
>  package/mpv/mpv.mk                            |  2 +-
>  9 files changed, 144 insertions(+), 8 deletions(-)
>  create mode 100644 package/lua/5.2.4/0001-root-path.patch
>  create mode 100644 package/lua/5.2.4/0002-shared-libs-for-lua.patch
>  create mode 100644 package/lua/5.2.4/0011-linenoise.patch
>  create mode 100644 package/lua/5.2.4/lua.hash
>
> --
> 2.43.0
>
>

--0000000000007272dc064f2acae6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 10=
 avr. 2026 =C3=A0=C2=A003:44, Sen Hastings &lt;<a href=3D"mailto:sen@hastin=
gs.org">sen@hastings.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">I&#39;m caught a bit between a rock an=
d a hard place,<br>
I want to use the simplefb (<a href=3D"https://codeberg.org/gnarz/simplefb"=
 rel=3D"noreferrer" target=3D"_blank">https://codeberg.org/gnarz/simplefb</=
a>) library<br>
with mpv, however simplefb needs lua 5.2 (or later with slight modification=
)<br>
and cannot be easily backported to 5.1.<br></blockquote><div><br></div><div=
><br>There are few incompatibility between C/API Lua versions.<br>It is eas=
y to write a compatible code for simplefb.<br>The following patch does the =
job, compatible from Lua 5.1 to Lua 5.5.<br><br>So, Lua 5.2 is not needed.<=
br><br>Fran=C3=A7ois<br><br>---<br>=C2=A0lsimplefb.c | 14 ++++++++++++++<br=
>=C2=A01 file changed, 14 insertions(+)<br><br>diff --git a/lsimplefb.c b/l=
simplefb.c<br>index 5efcf11..9e19d4e 100644<br>--- a/lsimplefb.c<br>+++ b/l=
simplefb.c<br>@@ -11,6 +11,16 @@<br>=C2=A0#include &quot;lua.h&quot;<br>=C2=
=A0#include &quot;lauxlib.h&quot;<br>=C2=A0<br>+#if LUA_VERSION_NUM &lt; 50=
2<br>+#define luaL_setfuncs(L,l,n)		luaL_register(L, NULL, (l))<br>+#endif<=
br>+<br>+#if LUA_VERSION_NUM !=3D 502<br>+#define luaL_checkunsigned		luaL_=
checkinteger<br>+#define luaL_optunsigned		luaL_optinteger<br>+#define lua_=
pushunsigned		lua_pushinteger<br>+#endif<br>+<br>=C2=A0#include &quot;simpl=
efb.h&quot;<br>=C2=A0<br>=C2=A0#define VERSION 0.1<br>@@ -533,7 +543,11 @@ =
static const struct luaL_Reg fbL_functions [] =3D{<br>=C2=A0 */<br>=C2=A0in=
t luaopen_simplefb(lua_State *L)<br>=C2=A0{<br>+#if LUA_VERSION_NUM &gt;=3D=
 502<br>=C2=A0	luaL_newlib(L, fbL_functions);<br>+#else<br>+	luaL_register(=
L, &quot;simplefb&quot;, fbL_functions);<br>+#endif<br>=C2=A0<br>=C2=A0	lua=
_pushliteral(L, &quot;_VERSION&quot;);<br>=C2=A0	lua_pushnumber(L, VERSION)=
;<br>-- <br>2.48.1<br><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
mpv of course only supports 5.2, 5.1 or luajit.<br>
Porting mpv to lua 5.3 or newer would be pretty unwise, the mpv maintainers=
<br>
have made it very clear it would break stuff (internally &amp; externally)<=
br>
and they are very uninterested in changing it, see:<br>
<a href=3D"https://github.com/mpv-player/mpv/wiki/FAQ#why-does-mpv-not-supp=
ort-lua-53-or-newer" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/mpv-player/mpv/wiki/FAQ#why-does-mpv-not-support-lua-53-or-newer</a><br>
<a href=3D"https://github.com/mpv-player/mpv/issues/9225" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/mpv-player/mpv/issues/9225</a><br>
<br>
The least painful solution to my problem I can think of is re-adding lua 5.=
2<br>
support to buildroot, basically entirely for the benefit of mpv.<br>
It&#39;s very unlikely mpv will *ever* support a newer version of lua.<br>
<br>
Any objections? It seems like we are still supporting lua 5.1 for legacy re=
asons,<br>
and I am happy to maintain this.<br>
<br>
Sen Hastings (1):<br>
=C2=A0 package/lua: re-add lua 5.2.4<br>
<br>
=C2=A0Config.in.legacy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +--<br>
=C2=A0package/lua/5.2.4/0001-root-path.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
7 ++++<br>
=C2=A0.../lua/5.2.4/0002-shared-libs-for-lua.patch=C2=A0 | 78 +++++++++++++=
++++++<br>
=C2=A0package/lua/5.2.4/0011-linenoise.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
6 +++++++<br>
=C2=A0package/lua/5.2.4/lua.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A0package/lua/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +-<br>
=C2=A0package/lua/<a href=3D"http://lua.mk" rel=3D"noreferrer" target=3D"_b=
lank">lua.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
=C2=A0package/luainterpreter/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 4 +<br>
=C2=A0package/mpv/<a href=3D"http://mpv.mk" rel=3D"noreferrer" target=3D"_b=
lank">mpv.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A09 files changed, 144 insertions(+), 8 deletions(-)<br>
=C2=A0create mode 100644 package/lua/5.2.4/0001-root-path.patch<br>
=C2=A0create mode 100644 package/lua/5.2.4/0002-shared-libs-for-lua.patch<b=
r>
=C2=A0create mode 100644 package/lua/5.2.4/0011-linenoise.patch<br>
=C2=A0create mode 100644 package/lua/5.2.4/lua.hash<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--0000000000007272dc064f2acae6--

--===============0846567295412011629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0846567295412011629==--
