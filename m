Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24909C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 21:20:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3488A61139
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 21:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3488A61139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gadz.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8829400ED;
	Sat,  6 Nov 2021 21:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9oSL0y4x5_jd; Sat,  6 Nov 2021 21:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96362400F6;
	Sat,  6 Nov 2021 21:19:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D3351BF319
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 21:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED7A6400F6
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 21:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dB-7s0Cf5112 for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 21:19:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6542C400ED
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 21:19:56 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id d21so26422854lfg.7
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 14:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qgaG8HSKqMIi3NzA7Yt29IkMbgcPgLCwuJkOgN40zhs=;
 b=jCz3zd9f8nQzPXImIdvPpX8joWbVth1c6FgPUe3VLoHQJ9B5f8Ipvn6wogJ8VFVNLz
 tBEUJYWtBpI1FMu1JhGK6ABTlOP3/mhyYM/iZFisLFD2ezgDUsSV8cG4K9OWH7aHVzji
 fe2qHEi4SBB2uqyusl6KpXNJ3ySkZpJOiOvEYLX8QJTUxEJxegQU+pEWsp0t0HwNbi7a
 iB7ePis21UfqhSinB7elxh2cPdUZof7V6idu5cFf2M2JIJnTEO2jFnF7k5iA0uOF4i2k
 3CdnZlbVaSvgt7SVUFNG+4cOTtQmZulP0tMpSnpYdnr2tC1dbNPmOsVWM/3eKsuTZ4m9
 bBWg==
X-Gm-Message-State: AOAM530h1ZqO20eFboI/xyk5pte8EXIfGHgCuv3jpry4JS3GCXhGj2sh
 xfc8fyfYc+B0Venx0DGPKZqHpambJMay+8ZLFirsmg==
X-Google-Smtp-Source: ABdhPJyl5H5y3czPv+q5pQYJt+jvagnyOoXL5Gum1hrH6dFICPApUxXGZcBnxxUF5lKCrmkAaakvYMKCQlM4VZzUJN0=
X-Received: by 2002:a05:6512:3b9a:: with SMTP id
 g26mr2483916lfv.144.1636233594040; 
 Sat, 06 Nov 2021 14:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211106190057.2487641-1-romain.naour@gmail.com>
In-Reply-To: <20211106190057.2487641-1-romain.naour@gmail.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 6 Nov 2021 22:19:42 +0100
Message-ID: <CAB0FRsschq6bcfjimC1FCce+TrRx2_sJYBpwP+ZtgJNNWuFbfQ@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] Revert "package/luajit: back to mainline
 and bump to 05f1984e"
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
Cc: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <joerg.krause@embedded.rocks>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6296616105893641553=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6296616105893641553==
Content-Type: multipart/alternative; boundary="00000000000024853405d0255263"

--00000000000024853405d0255263
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 6 nov. 2021 =C3=A0 20:01, Romain Naour <romain.naour@gmail.com> a =
=C3=A9crit :

> This reverts commit 9450b53c8e06f1b5a75840b82c0f4663a5d75c45 since it
> introcude a regretion to luvi package [1].
>
> luvi doesn't work since the luv static linking doesn't seems to
> work anymore.
> (see
> https://github.com/luvit/luvi/commit/a9dc8dae2eb69d4a754a0cf5c08622d70f6b=
7067
> )
>
>  # luvi -v
>
> [string "return require('init')(...)"]:1: module 'init' not found:
>
>         no field package.preload['init']
>         no file './init.lua'
>         no file '/usr/share/luajit-2.1.0-beta3/init.lua'
>         no file '/usr/local/share/lua/5.1/init.lua'
>         no file '/usr/local/share/lua/5.1/init/init.lua'
>         no file '/usr/share/lua/5.1/init.lua'
>         no file '/usr/share/lua/5.1/init/init.lua'
>         no file './init.so'
>         no file '/usr/local/lib/lua/5.1/init.so'
>         no file '/usr/lib/lua/5.1/init.so'
>         no file '/usr/local/lib/lua/5.1/loadall.so'
>
> stack traceback:
>         [C]: in function 'require'
>         [string "return require('init')(...)"]:1: in main chunk
>
> luvi now try to load init.lua script:
> https://github.com/luvit/luvi/blob/v2.12.0/src/main.c#L176
>
> Luvi seems to rely on some moonjit extentions [2] not available yet in
> luajit.
>
> [1] http://lists.busybox.net/pipermail/buildroot/2021-October/627134.html
> [2] https://github.com/moonjit/moonjit/blob/master/doc/extensions.md
>
>
the module `init.lua` is supplied by luvi (see
https://github.com/luvit/luvi/blob/master/src/lua/init.lua)
and installed somewhere or not (I cannot find it).

moonjit 2.1.2 try to load a Lua module from these locations :
    './init.lua'
    '/usr/share/luajit-2.1.2/init.lua' (usually reserved to luajit itself)
    '/usr/local/share/lua/5.1/init.lua'
    '/usr/local/share/lua/5.1/init/init.lua'
    '/usr/share/lua/5.1/init.lua'
    '/usr/share/lua/5.1/init/init.lua'

luajit try to load a Lua module from these locations :
    './init.lua'
    '/usr/share/luajit-2.1.0-beta3/init.lua' (usually reserved to luajit
itself)
    '/usr/local/share/lua/5.1/init.lua'
    '/usr/local/share/lua/5.1/init/init.lua'
    '/usr/share/lua/5.1/init.lua'
    '/usr/share/lua/5.1/init/init.lua'

this issue is not about moonjit vs luajit,
it is about `init.lua` is not installed by luvi package.

Fran=C3=A7ois


> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> Cc: J=C3=B6rg Krause <joerg.krause@embedded.rocks>
>
>

--00000000000024853405d0255263
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 6 nov. 2021 =C3=A0=C2=A0=
20:01, Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com">romain.na=
our@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">This reverts commit 9450b53c8e06f1b5a75840b82c0f4=
663a5d75c45 since it<br>
introcude a regretion to luvi package [1].<br>
<br>
luvi doesn&#39;t work since the luv static linking doesn&#39;t seems to<br>
work anymore.<br>
(see <a href=3D"https://github.com/luvit/luvi/commit/a9dc8dae2eb69d4a754a0c=
f5c08622d70f6b7067" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/luvit/luvi/commit/a9dc8dae2eb69d4a754a0cf5c08622d70f6b7067</a>)<br>
<br>
=C2=A0# luvi -v<br>
<br>
[string &quot;return require(&#39;init&#39;)(...)&quot;]:1: module &#39;ini=
t&#39; not found:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no field package.preload[&#39;init&#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;./init.lua&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/share/luajit-2.1.0-beta3/init=
.lua&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/local/share/lua/5.1/init.lua&=
#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/local/share/lua/5.1/init/init=
.lua&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/share/lua/5.1/init.lua&#39;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/share/lua/5.1/init/init.lua&#=
39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;./init.so&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/local/lib/lua/5.1/init.so&#39=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/lib/lua/5.1/init.so&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 no file &#39;/usr/local/lib/lua/5.1/loadall.so&=
#39;<br>
<br>
stack traceback:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [C]: in function &#39;require&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [string &quot;return require(&#39;init&#39;)(..=
.)&quot;]:1: in main chunk<br>
<br>
luvi now try to load init.lua script:<br>
<a href=3D"https://github.com/luvit/luvi/blob/v2.12.0/src/main.c#L176" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/luvit/luvi/blob/v2.12.=
0/src/main.c#L176</a><br>
<br>
Luvi seems to rely on some moonjit extentions [2] not available yet in<br>
luajit.<br>
<br>
[1] <a href=3D"http://lists.busybox.net/pipermail/buildroot/2021-October/62=
7134.html" rel=3D"noreferrer" target=3D"_blank">http://lists.busybox.net/pi=
permail/buildroot/2021-October/627134.html</a><br>
[2] <a href=3D"https://github.com/moonjit/moonjit/blob/master/doc/extension=
s.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/moonjit/moonj=
it/blob/master/doc/extensions.md</a><br>
<br></blockquote><div><br></div><div>the module `init.lua` is supplied by l=
uvi (see <a href=3D"https://github.com/luvit/luvi/blob/master/src/lua/init.=
lua">https://github.com/luvit/luvi/blob/master/src/lua/init.lua</a>)<br>and=
 installed somewhere or not (I cannot find it).<br><br>moonjit 2.1.2 try to=
 load a Lua module from these locations :<br>=C2=A0 =C2=A0 &#39;./init.lua&=
#39;<br>=C2=A0 =C2=A0 &#39;/usr/share/luajit-2.1.2/init.lua&#39; (usually r=
eserved to luajit itself)<br>=C2=A0 =C2=A0 &#39;/usr/local/share/lua/5.1/in=
it.lua&#39;<br>=C2=A0 =C2=A0 &#39;/usr/local/share/lua/5.1/init/init.lua&#3=
9;<br>=C2=A0 =C2=A0 &#39;/usr/share/lua/5.1/init.lua&#39;<br>=C2=A0 =C2=A0 =
&#39;/usr/share/lua/5.1/init/init.lua&#39;<br><br>luajit try to load a Lua =
module from these locations :<br>=C2=A0 =C2=A0 &#39;./init.lua&#39;<br>=C2=
=A0 =C2=A0 &#39;/usr/share/luajit-2.1.0-beta3/init.lua&#39; (usually reserv=
ed to luajit itself)<br>=C2=A0 =C2=A0 &#39;/usr/local/share/lua/5.1/init.lu=
a&#39;<br>=C2=A0 =C2=A0 &#39;/usr/local/share/lua/5.1/init/init.lua&#39;<br=
>=C2=A0 =C2=A0 &#39;/usr/share/lua/5.1/init.lua&#39;<br>=C2=A0 =C2=A0 &#39;=
/usr/share/lua/5.1/init/init.lua&#39;<br><br>this issue is not about moonji=
t vs luajit,<br>it is about `init.lua` is not installed by luvi package.<br=
><br>Fran=C3=A7ois<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" t=
arget=3D"_blank">romain.naour@gmail.com</a>&gt;<br>
Cc: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org" target=
=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
Cc: J=C3=B6rg Krause &lt;joerg.krause@embedded.rocks&gt;<br><br>
</blockquote></div></div>

--00000000000024853405d0255263--

--===============6296616105893641553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6296616105893641553==--
