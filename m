Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB8CCCD194
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 05:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1367241B8D;
	Thu, 16 Oct 2025 05:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taMCT_ufcofF; Thu, 16 Oct 2025 05:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B31341B92
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B31341B92;
	Thu, 16 Oct 2025 05:52:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AEEF968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 05:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CA66416D1
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 05:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTsXfUacz-Z0 for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 05:52:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=pierre.ficheux@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DEBA1403AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEBA1403AD
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEBA1403AD
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 05:52:11 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-36453927ffaso2704201fa.2
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 22:52:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760593929; x=1761198729;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lrpwShz8t01LAtkeDuj0/FvtMEbxo1nNzb9hCrMC9j0=;
 b=su3lv4xHBqy7geE4J7pC5zcKdy7oChCfJ5z/607BAWqk7VPGKlUVVTs1lRlz0ony7M
 Lk2Aq6NCf29YprzdmShEx13CG1vuqsO0kXt3Lff2SNM+ElkOATgXg02DMIRgHS5IZNh/
 yaH9i7VO3la3N86IEarOIUXNOOFyX2ZFjWnRTwiZ6MqmqbCxL3BMcWe3XcfwtbAMu+pi
 MSwfBmFZcWeOSF56jUvG0njfY4I4yULfUr+FJH17PNS+4Ls4xiK52zbQylhxa8RZliI3
 F3DS6p96plokPl1nOzLVSIo6EPsZiVibYVnnPbgnUeo8IUHgcKSZNQN8k9zVlDvPRKEt
 jfhA==
X-Gm-Message-State: AOJu0YyEwA/JP2UjwjFk/oTICJ50We2+6FFHMpWz2mUhVCRFu7l1NR4n
 kKGh1uzvr0udXrAJ/LGh4SNF+jnHRxdcbdF1YvnS5q1OMJIswES7UiWiWzEbEYPL9gsrT/ET1eY
 r6lSAVVP1F9xxEZlh+dPN8K8d5sNneeNn3AoowXSq/w==
X-Gm-Gg: ASbGncuB3j7k9sRQwzbvbz2AMG11Flu3dmZCe+TDoYu98nI5f1b0ZKXQ5c8Csl+FH2d
 TlcE4WAUf3wBopfO0nfnCKW89vxZfTwVPGH8zmsiobxkV34SaXKKWTs9eRBM3oY/KbYxzz6UXUK
 dYgKSIuN6o1ajDeNxhKgntITdHLSZFDKcDHgSqxv92YNCA103Egm6JodTmzRUPg0Jhp743NEE70
 FvLxH7FwlAdSSEpuOvbkow/SEuEdpilP0UJSdd4Jv+CLgZi++lerR37jVa+NXi+6s3wYOcOtXrR
 DK9OsPajmopwfcHv
X-Google-Smtp-Source: AGHT+IGfnuVVmPXfMb5VbTjhd1IEy2vEXJZrqq2jeeosCFOPIBNH0r12CnJvtg0EzdrVoO4Kho617yOIUCf83wB0z1o=
X-Received: by 2002:a05:651c:19a0:b0:336:9232:fb9a with SMTP id
 38308e7fff4ca-37609e93234mr84592111fa.29.1760593929445; Wed, 15 Oct 2025
 22:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAFc1U0tQYsSWe1=EtduNZogzNTtJHGr4eX3pjnYro5zJeArniA@mail.gmail.com>
 <81b9aa9b-4904-4296-96a8-81de83f8575c@rnout.be>
 <CAFc1U0tCdwSN1AMQsV41e1j=TqPhFQLZ40e4peUZ46O_MD-7xQ@mail.gmail.com>
In-Reply-To: <CAFc1U0tCdwSN1AMQsV41e1j=TqPhFQLZ40e4peUZ46O_MD-7xQ@mail.gmail.com>
Date: Thu, 16 Oct 2025 07:51:49 +0200
X-Gm-Features: AS18NWA8XpH0u8CZg7cF7Ya19f9N5i1Hh6a2Ha8DEXd7sHe-EwL6mz-_vCJz2ZQ
Message-ID: <CAFc1U0sQMsnrc2oXYFwWptdEevpKDf6z5iCdPBG0tVR8qsmhnw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1760593929; x=1761198729; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lrpwShz8t01LAtkeDuj0/FvtMEbxo1nNzb9hCrMC9j0=;
 b=Ik1WaLLhCcMW0qeu5AdNQIl7T+ivbAsHTR10X4Lajz9KeLvjuSlG8B0cGqIcwWM+5x
 jPJNeze5SBFJKn5oYBG3cyKR6GRX8NiRJlZaBeHfVwEa+L5jzKCzAq3IXicf4Xssbo9z
 eC34pNOFg+DpXzF8JdwcDBYb+ZMq852J/HrTU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Ik1WaLLh
Subject: Re: [Buildroot] PocketBeagle2 support
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
From: Pierre FICHEUX via buildroot <buildroot@buildroot.org>
Reply-To: Pierre FICHEUX <pierre.ficheux@smile.fr>
Content-Type: multipart/mixed; boundary="===============0756766197128235933=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0756766197128235933==
Content-Type: multipart/alternative; boundary="000000000000c236b206414037a2"

--000000000000c236b206414037a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So it's ARM64 not ARM...

Le jeu. 16 oct. 2025 =C3=A0 07:37, Pierre FICHEUX <pierre.ficheux@smile.fr>=
 a
=C3=A9crit :

> Hi,
>
> The PB2 uses an AM6254 SoC, different from the AM335x.
>
> Do you think it could work ?
>
>
>
> Le mer. 15 oct. 2025 =C3=A0 21:50, Arnout Vandecappelle <arnout@rnout.be>=
 a
> =C3=A9crit :
>
>>
>>
>> On 13/10/2025 08:07, Pierre FICHEUX via buildroot wrote:
>> > Hi all,
>> >
>> > Are you considering any BR support for PB2 ? I saw the following link
>> but it's old:
>> >
>> > https://github.com/mixaz/buildroot-pocketbeagle
>>   I expect that the pocketbeagle can use the same config as the
>> beaglebone_defconfig, just add ti/omap/am335x-pocketbeagle.dts to
>> BR2_LINUX_KERNEL_INTREE_DTS_NAME.
>>
>>   If that works, we'd welcome a patch. Make sure you also update
>> board/beagleboard/beaglebone/readme.txt
>>
>>   Regards,
>>   Arnout
>>
>
>
> --
>
> Pierre FICHEUX -/- CTO Smile ECS, France -\- pierre.ficheux@smile.fr
>                              http://www.smile.fr
>                              https://smile.eu/fr/offres/embarque-iot
> I would love to change the world, but they won't give me the source code
>
>

--=20

Pierre FICHEUX -/- CTO Smile ECS, France -\- pierre.ficheux@smile.fr
                             http://www.smile.fr
                             https://smile.eu/fr/offres/embarque-iot
I would love to change the world, but they won't give me the source code

--000000000000c236b206414037a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif">So it&#39;s ARM64 not ARM...</div></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0j=
eu. 16 oct. 2025 =C3=A0=C2=A007:37, Pierre FICHEUX &lt;<a href=3D"mailto:pi=
erre.ficheux@smile.fr">pierre.ficheux@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif">Hi,</d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif"><br>=
</div><div class=3D"gmail_default"><span style=3D"font-family:arial,sans-se=
rif">The PB2 uses an AM6254=C2=A0SoC</span><font color=3D"#474747" face=3D"=
Arial, sans-serif"><span style=3D"font-size:14px">, different=C2=A0from the=
 AM335x.=C2=A0</span></font></div><div class=3D"gmail_default"><font color=
=3D"#474747" face=3D"Arial, sans-serif"><span style=3D"font-size:14px"><br>=
</span></font></div><div class=3D"gmail_default"><font color=3D"#474747" fa=
ce=3D"Arial, sans-serif"><span style=3D"font-size:14px">Do you think it cou=
ld work ?</span></font></div><div class=3D"gmail_default"><font color=3D"#4=
74747" face=3D"Arial, sans-serif"><span style=3D"font-size:14px"><br></span=
></font></div><div class=3D"gmail_default"><font color=3D"#474747" face=3D"=
Arial, sans-serif"><span style=3D"font-size:14px"><br></span></font></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">L=
e=C2=A0mer. 15 oct. 2025 =C3=A0=C2=A021:50, Arnout Vandecappelle &lt;<a hre=
f=3D"mailto:arnout@rnout.be" target=3D"_blank">arnout@rnout.be</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
On 13/10/2025 08:07, Pierre FICHEUX via buildroot wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; Are you considering any BR support for PB2 ? I saw the following link =
but it&#39;s old:<br>
&gt; <br>
&gt; <a href=3D"https://github.com/mixaz/buildroot-pocketbeagle" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/mixaz/buildroot-pocketbeagle<=
/a><br>
=C2=A0 I expect that the pocketbeagle can use the same config as the <br>
beaglebone_defconfig, just add ti/omap/am335x-pocketbeagle.dts to <br>
BR2_LINUX_KERNEL_INTREE_DTS_NAME.<br>
<br>
=C2=A0 If that works, we&#39;d welcome a patch. Make sure you also update <=
br>
board/beagleboard/beaglebone/readme.txt<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><pre style=3D"margin-top:0px;margin-bottom:0px;p=
adding:0px;font-size:12px;color:rgb(51,51,51);white-space:pre-wrap">Pierre =
FICHEUX -/- CTO Smile ECS, France -\- <a href=3D"mailto:pierre.ficheux@smil=
e.fr" style=3D"color:rgb(1,134,186)" target=3D"_blank">pierre.ficheux@smile=
.fr</a>
                             <a href=3D"http://www.smile.fr/" style=3D"colo=
r:rgb(1,134,186)" target=3D"_blank">http://www.smile.fr</a>
                             <a href=3D"https://smile.eu/fr/offres/embarque=
-iot" style=3D"color:rgb(1,134,186)" target=3D"_blank">https://smile.eu/fr/=
offres/embarque-iot</a>
I would love to change the world, but they won&#39;t give me the source cod=
e</pre></div></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><pre style=3D"margin-top:0px;margin-bottom:0px;p=
adding:0px;font-size:12px;color:rgb(51,51,51);white-space:pre-wrap">Pierre =
FICHEUX -/- CTO Smile ECS, France -\- <a href=3D"mailto:pierre.ficheux@smil=
e.fr" style=3D"color:rgb(1,134,186)" target=3D"_blank">pierre.ficheux@smile=
.fr</a>
                             <a href=3D"http://www.smile.fr/" style=3D"colo=
r:rgb(1,134,186)" target=3D"_blank">http://www.smile.fr</a>
                             <a href=3D"https://smile.eu/fr/offres/embarque=
-iot" style=3D"color:rgb(1,134,186)" target=3D"_blank">https://smile.eu/fr/=
offres/embarque-iot</a>
I would love to change the world, but they won&#39;t give me the source cod=
e</pre></div></div>

--000000000000c236b206414037a2--

--===============0756766197128235933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0756766197128235933==--
