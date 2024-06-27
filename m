Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5EFC2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 21:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DA6B4170A;
	Thu, 27 Jun 2024 21:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxlzZbkzXPp9; Thu, 27 Jun 2024 21:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B83241706
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B83241706;
	Thu, 27 Jun 2024 21:40:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAFC01BF3CA
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A74CB403B3
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 21:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5n8ffo04klm for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 21:40:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EFB68400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFB68400B9
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFB68400B9
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 21:40:24 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-dfef5980a69so8346029276.3
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 14:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719524423; x=1720129223;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lp8v7LPIgetWuhDTRKVflqHqyhSxi/7U+2UuRrW3UQI=;
 b=eqsbeHWd4cp3DeOcjn8jhXMZ0Tjd7YwHEpGX8oVSqQntY/jwJmxJle97mNQgiY2Uyg
 qF2Eu8uRSZOgRat6Ad+7PbgsHfqdvGdfxWdBZZIeWUUt2i1MJMmfG81s4/lJmyL9i095
 qknA11/LYA9KHYMJqCK1+x2lP9weURbXjC4YWzllzvURzduqFkbnw9+/a1tOhhKquO1V
 6rsbWfaqQ69QJw0WEkYxSS+b2vFCaHtJ33sZYCziaNZufElvnMP2zbFY6sEj2dHTYCUw
 w+Iybue9PssI1q5cjSy6feG6b/muViucnHtxYfKQ/7MqLmcqficlfMEm37Xsng0rqy58
 rS3A==
X-Gm-Message-State: AOJu0YwajihGTbtWRjt9Y9jAlbm1M/viZCdU1/WHrkT4vWcA+NQD+m5c
 BudiTWk+CIeRVDWmSmM3Je627FQ1mzBmrwzO7IRQBlXBAIfVM8XNlpNMz68Mea+6/h+n98F1FXF
 H4jEXh0FOScWNhEs8nScKT49l4cCevOyu70IFig==
X-Google-Smtp-Source: AGHT+IFUVP9tlrbQg+uQMAJR0Xc+PsaGDrztnyEkP8MRcsQri0eX2fe/ibFl+x0QBTjaLdXg+sY7QhBQRXuY2tNpAz4=
X-Received: by 2002:a25:c7cf:0:b0:e03:48bc:e2ff with SMTP id
 3f1490d57ef6-e0348bcef82mr2956325276.24.1719524423555; Thu, 27 Jun 2024
 14:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <e2b3835bcee63a27b24a757a2db3e9103faebc63.1719316003.git.yann.morin@orange.com>
 <CABGWkvobc38thMwekt0fsHefa6QSADKdemyZ9Mj84EgYB6UbXQ@mail.gmail.com>
 <Zn3FHQXZ6atQbeeZ@landeda>
In-Reply-To: <Zn3FHQXZ6atQbeeZ@landeda>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 27 Jun 2024 23:40:12 +0200
Message-ID: <CABGWkvqUAue5V0WxEe8_3g0pO-8hXossc_yPDTwuiWMEbJO_og@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719524423; x=1720129223;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lp8v7LPIgetWuhDTRKVflqHqyhSxi/7U+2UuRrW3UQI=;
 b=Q2nf8Pf9Z1pk1OEtpmUQ5N4Nd5hsDZ2P0Sy14yxbMmQQC437doIPGNt+ICssa2MWWv
 UrcNkgwj8UQlHA+Crg46TUSnMQMNOOkJW3ot3Pam70ukaie6d5Dh2vl87zjoPQH5aJge
 hNu0zr15xnLTF5Z86phkx8luMpuC2s4rMr1fY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Q2nf8Pf9
Subject: Re: [Buildroot] [PATCH] package/slang: fix patch fuzz
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
Cc: yann.morin@orange.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2915365614956057028=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2915365614956057028==
Content-Type: multipart/alternative; boundary="00000000000072f102061be5fae9"

--00000000000072f102061be5fae9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

*Dario Binacchi*

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


*Amarula Solutions SRL*

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

Hi Yann,

Il giorno gio 27 giu 2024 alle 22:01 Yann E. MORIN <yann.morin.1998@free.fr=
>
ha scritto:

> Dario, All,
>
> On 2024-06-25 13:56 +0200, Dario Binacchi spake thusly:
> > From: "Yann E. MORIN" <[5]yann.morin@orange.com>
> > > Since commit 8f88a644ed7d (support/scripts/apply-patches.sh: set the
> > > maximum fuzz factor to 0), we no longer accept fuzz in patches. Befor=
e
> > > 8f88a644ed7d was applied, alot of patches were fixed in preparatory
> > > commits, but slang was missed (although the patch has been present
> since
> > > 2017.
> > what configuration does contain this package?
>
> I've devised a little script that finds almost all packages that have
> patches, and test they can be downloaded and patched:
>
>     #!/usr/bin/env bash
>     export BR2_DL_DIR=3D$(pwd)/meh-dl
>     make defconfig
>     ./utils/config --set-str BR2_BACKUP_SITE ""
>     # Ignore boot/ and linux/ as they are too special...
>     find package/ -type f -name '*.mk' -printf '%h\n' \
>     |sort -u \
>     |while read dir; do
>         [ -e "${dir}/Config.in" ] || continue
>         ( find "${dir}" -type f -name '*.patch' -print -quit |grep -q . )
> || continue
>         pkg=3D"$( basename "${dir}" )"
>         [ -e "${dir}/${pkg}.mk" ] || continue
>         sed -r -e '/^\$\(eval \$\((host-)?[^-]+-package\)\)$/!d;
> s//\1'"${pkg}"'/' "${dir}/${pkg}.mk"
>     done \
>     |while read pkg; do
>         if ! make "${pkg}-patch"; then
>             echo "${pkg}" >> fuzz.lst
>         fi
>     done
>
> Them we've a bit of hand-guessing and the build log, here's what I could
> conclude:
>
> Fuzz errors:
>   - cpulimit                    - crda                        - dahdi-too=
ls
>   - eigen                       - empty                       - exim
>   - ficl                        - flite                       -
> freeradius-server
>   - freerdp                     - imx-kobs                    -
> imx-vpu-hantro
>   - gpm                         - grpc                        - haserl
>   - janus-gateway               - leveldb                     - libblockd=
ev
>   - libfcgi                     - libcrypt                    - libgdiplu=
s
>   - libglfw                     - libhid                      - liblinear
>   - libmad                      - libnfs                      - libsoup
>   - libssh2                     - libsvg                      - libsvgtin=
y
>   - libtheora                   - libtorrent                  - libyuv
>   - clang                       - lxc                         -
> mediastreamer
>   - memstat                     - mongrel                     - monit
>   - ncmpc                       - nmap                        - nushell
>   - nvidia-driver               - oatpp                       - openvmtoo=
ls
>   - paxtest                     - poke                        - pulseview
>   - python-pybind               - qt5webkit                   - rdesktop
>   - redis                       - rrdtool                     - rt-tests
>   - rygel                       - sane-backends               - sdl_mixer
>   - shairport-sync              - snort                       - sox
>   - sunxi-mali-utgard-driver    - sylpheed                    - udpcast
>   - vtun                        - wlroots                     -
> xdriver_xf86-video-mach64
>   - xdriver_xf86-video-tdfx     - xfsprogs                    - yajl
>   - ympd
>
> Hash errors:
>   - am335x-pru-package          - cgic                        - daq
>   - dvb-apps                    - latencytop                  - linknx
>   - linux-fusion                - lite                        - mimic
>   - resiprocate                 - w_scan


>
I didn=E2=80=99t expect this kind of result.
I think the test I did had some shortcomings.
I=E2=80=99m sorry I didn=E2=80=99t find so many patches to fix.
I will try to fix them as soon as I can.
Many thanks Yann for your tests.

Thanks and regards,
Dario

>
> Download errors:
>   - aumix: 403 forbidden        - bsdiff: 403 forbidden       - dillo: 40=
4
>   - fbset: 410 Gone             - gamin: 404                  - giblib: 4=
04
>   - httping: 404                - libtorrent: 404             - live5: 40=
4
>   - lugaru: 404                 - matchbox-lib: 400 ???       - mpir:
> upstream DNS gone
>   - qt5enginio: 404             - quagga: 404                 - racehound=
:
> 404
>   - rp-pppoe: 404               - rtorrent: 404               - sysprof:
> 404
>   - taskd: 404                  - trinity: TCP timeout        - zabbix: 4=
04
>   - xenomai: 404
>
> Config issues:
>   - aufs-util: needs a kernel
>
> Of course, the hash, download, and config issues are not caused by the
> fuzz restriction, which I still believe was a very good thing to do! :-)
> Still, they may hide a few fuzz issues.
>
> Anyway, the list is up for all to pick a package and help fix that as a
> collective effort.
>
> Bonus points for anyone that confirms the corner cases: binutils, gcc,
> gdb, and a few others, which have a version choice... Or linux, which
> has a conditional patch (Aha!) and a version with a patch... Of any of
> the bootloaders, some of whioch have a version coice as well...
>
> I think I'll be having a look at all the hash errors, but anyone is free
> to look at them and post a patch that fixes the hash and explains the
> issue...
>
> Thanks!
>
> Regards,
> Yann E. MORIN.
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

--00000000000072f102061be5fae9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br clear=3D"all"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span><p =
dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;vertical-align:base=
line;white-space:pre-wrap;background-color:transparent;color:rgb(0,0,0)"><b=
 style=3D"font-family:Ubuntu,sans-serif">Dario Binacchi</b></span></p><p di=
r=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;verti=
cal-align:baseline;white-space:pre-wrap;background-color:transparent;color:=
rgb(0,0,0)">Senior Embedded Linux Developer</span></p><p dir=3D"ltr" style=
=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-s=
ize:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;vertical-align:basel=
ine;white-space:pre-wrap;background-color:transparent;color:rgb(0,0,0)"><a =
href=3D"mailto:dario.binacchi@amarulasolutions.com" target=3D"_blank" style=
=3D"font-family:&quot;Ubuntu Mono&quot;,monospace">dario.binacchi@amarulaso=
lutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ub=
untu Mono&quot;,monospace;vertical-align:baseline;white-space:pre-wrap;back=
ground-color:transparent;color:rgb(0,0,0)">________________________________=
__</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quo=
t;,monospace;vertical-align:baseline;white-space:pre-wrap;background-color:=
transparent;color:rgb(0,0,0)"><br></span><span style=3D"font-size:10pt;font=
-family:Ubuntu,sans-serif;vertical-align:baseline;white-space:pre-wrap;back=
ground-color:transparent;color:rgb(0,0,0)"><b style=3D"font-family:Ubuntu,s=
ans-serif">Amarula Solutions SRL</b></span></p><p dir=3D"ltr" style=3D"line=
-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt=
;font-family:&quot;Ubuntu Mono&quot;,monospace;vertical-align:baseline;whit=
e-space:pre-wrap;background-color:transparent;color:rgb(0,0,0)">Via Le Cane=
vare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"ltr" style=3D"line-h=
eight:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;f=
ont-family:&quot;Ubuntu Mono&quot;,monospace;vertical-align:baseline;white-=
space:pre-wrap;background-color:transparent;color:rgb(0,0,0)">T. +39 042 24=
3 5310</span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&qu=
ot;,monospace;vertical-align:baseline;white-space:pre-wrap;background-color=
:transparent;color:rgb(0,0,0)"><br></span><span style=3D"font-size:10pt;fon=
t-family:&quot;Ubuntu Mono&quot;,monospace;vertical-align:baseline;white-sp=
ace:pre-wrap;background-color:transparent;color:rgb(0,0,0)"><a href=3D"mail=
to:info@amarulasolutions.com" target=3D"_blank" style=3D"font-family:&quot;=
Ubuntu Mono&quot;,monospace">info@amarulasolutions.com</a></span></p><p dir=
=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><a href=
=3D"http://www.amarulasolutions.com/" target=3D"_blank"><span style=3D"font=
-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;vertical-align:bas=
eline;white-space:pre-wrap;background-color:transparent;color:rgb(0,0,0)">w=
ww.amarulasolutions.com</span></a></p></span></div></div></div></div><div><=
br></div><div dir=3D"auto">Hi Yann,</div><div dir=3D"auto"><br><div class=
=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">Il gior=
no gio 27 giu 2024 alle 22:01 Yann E. MORIN &lt;<a href=3D"mailto:yann.mori=
n.1998@free.fr">yann.morin.1998@free.fr</a>&gt; ha scritto:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">Dario, All,<br>
<br>
On 2024-06-25 13:56 +0200, Dario Binacchi spake thusly:<br>
&gt; From: &quot;Yann E. MORIN&quot; &lt;[5]<a href=3D"mailto:yann.morin@or=
ange.com" target=3D"_blank">yann.morin@orange.com</a>&gt;<br>
&gt; &gt; Since commit 8f88a644ed7d (support/scripts/apply-patches.sh: set =
the<br>
&gt; &gt; maximum fuzz factor to 0), we no longer accept fuzz in patches. B=
efore<br>
&gt; &gt; 8f88a644ed7d was applied, alot of patches were fixed in preparato=
ry<br>
&gt; &gt; commits, but slang was missed (although the patch has been presen=
t since<br>
&gt; &gt; 2017.<br>
&gt; what configuration does contain this package?<br>
<br>
I&#39;ve devised a little script that finds almost all packages that have<b=
r>
patches, and test they can be downloaded and patched:<br>
<br>
=C2=A0 =C2=A0 #!/usr/bin/env bash<br>
=C2=A0 =C2=A0 export BR2_DL_DIR=3D$(pwd)/meh-dl<br>
=C2=A0 =C2=A0 make defconfig<br>
=C2=A0 =C2=A0 ./utils/config --set-str BR2_BACKUP_SITE &quot;&quot;<br>
=C2=A0 =C2=A0 # Ignore boot/ and linux/ as they are too special...<br>
=C2=A0 =C2=A0 find package/ -type f -name &#39;*.mk&#39; -printf &#39;%h\n&=
#39; \<br>
=C2=A0 =C2=A0 |sort -u \<br>
=C2=A0 =C2=A0 |while read dir; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -e &quot;${dir}/Config.in&quot; ] || continue=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ( find &quot;${dir}&quot; -type f -name &#39;*.=
patch&#39; -print -quit |grep -q . ) || continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg=3D&quot;$( basename &quot;${dir}&quot; )&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -e &quot;${dir}/${pkg}.mk&quot; ] || continue=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -r -e &#39;/^\$\(eval \$\((host-)?[^-]+-pac=
kage\)\)$/!d; s//\1&#39;&quot;${pkg}&quot;&#39;/&#39; &quot;${dir}/${pkg}.m=
k&quot;<br>
=C2=A0 =C2=A0 done \<br>
=C2=A0 =C2=A0 |while read pkg; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! make &quot;${pkg}-patch&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;${pkg}&quot; &gt;&gt; =
fuzz.lst<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 done<br>
<br>
Them we&#39;ve a bit of hand-guessing and the build log, here&#39;s what I =
could<br>
conclude:<br>
<br>
Fuzz errors:<br>
=C2=A0 - cpulimit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 - crda=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - dahdi-tools<br>
=C2=A0 - eigen=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- empty=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- exim<br>
=C2=A0 - ficl=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 - flite=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- freeradius-server<br>
=C2=A0 - freerdp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- imx-kobs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 - imx-vpu-hantro<br>
=C2=A0 - gpm=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0- grpc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - haserl<br>
=C2=A0 - janus-gateway=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- leveldb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- libblockdev<br>
=C2=A0 - libfcgi=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- libcrypt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 - libgdiplus<br>
=C2=A0 - libglfw=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- libhid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - liblinear<br>
=C2=A0 - libmad=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - libnfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - libsoup<br>
=C2=A0 - libssh2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- libsvg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - libsvgtiny<br>
=C2=A0 - libtheora=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- libtorrent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 - libyuv<br>
=C2=A0 - clang=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- lxc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- mediastreamer<br>
=C2=A0 - memstat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- mongrel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0- monit<br>
=C2=A0 - ncmpc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- nmap=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - nushell<br>
=C2=A0 - nvidia-driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- oatpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0- openvmtools<br>
=C2=A0 - paxtest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0- poke=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - pulseview<br>
=C2=A0 - python-pybind=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- qt5webkit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0- rdesktop<br>
=C2=A0 - redis=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- rrdtool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- rt-tests<br>
=C2=A0 - rygel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- sane-backends=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0- sdl_mixer<br>
=C2=A0 - shairport-sync=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - s=
nort=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0- sox<br>
=C2=A0 - sunxi-mali-utgard-driver=C2=A0 =C2=A0 - sylpheed=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - udpcast<br>
=C2=A0 - vtun=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 - wlroots=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- xdriver_xf86-video-mach64<br>
=C2=A0 - xdriver_xf86-video-tdfx=C2=A0 =C2=A0 =C2=A0- xfsprogs=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - yajl<br>
=C2=A0 - ympd<br>
<br>
Hash errors:<br>
=C2=A0 - am335x-pru-package=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - cgic=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - daq<br>
=C2=A0 - dvb-apps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 - latencytop=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 - linknx<br>
=C2=A0 - linux-fusion=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - lite=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 - mimic<br>
=C2=A0 - resiprocate=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0- w_scan</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I didn=E2=80=99t=
 expect this kind of result.</div><div dir=3D"auto">I think the test I did =
had some shortcomings.</div><div dir=3D"auto">I=E2=80=99m sorry I didn=E2=
=80=99t find so many patches to fix.</div><div dir=3D"auto">I will try to f=
ix them as soon as I can.</div><div dir=3D"auto">Many thanks Yann for your =
tests.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks and regard=
s,</div><div dir=3D"auto">Dario</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
Download errors:<br>
=C2=A0 - aumix: 403 forbidden=C2=A0 =C2=A0 =C2=A0 =C2=A0 - bsdiff: 403 forb=
idden=C2=A0 =C2=A0 =C2=A0 =C2=A0- dillo: 404<br>
=C2=A0 - fbset: 410 Gone=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- g=
amin: 404=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - g=
iblib: 404<br>
=C2=A0 - httping: 404=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - libtorrent: 404=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- live=
5: 404<br>
=C2=A0 - lugaru: 404=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0- matchbox-lib: 400 ???=C2=A0 =C2=A0 =C2=A0 =C2=A0- mpir: upstream D=
NS gone<br>
=C2=A0 - qt5enginio: 404=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- q=
uagga: 404=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- r=
acehound: 404<br>
=C2=A0 - rp-pppoe: 404=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0- rtorrent: 404=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- =
sysprof: 404<br>
=C2=A0 - taskd: 404=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 - trinity: TCP timeout=C2=A0 =C2=A0 =C2=A0 =C2=A0 - zabbix: 404<br>
=C2=A0 - xenomai: 404<br>
<br>
Config issues:<br>
=C2=A0 - aufs-util: needs a kernel<br>
<br>
Of course, the hash, download, and config issues are not caused by the<br>
fuzz restriction, which I still believe was a very good thing to do! :-)<br=
>
Still, they may hide a few fuzz issues.<br>
<br>
Anyway, the list is up for all to pick a package and help fix that as a<br>
collective effort.<br>
<br>
Bonus points for anyone that confirms the corner cases: binutils, gcc,<br>
gdb, and a few others, which have a version choice... Or linux, which<br>
has a conditional patch (Aha!) and a version with a patch... Of any of<br>
the bootloaders, some of whioch have a version coice as well...<br>
<br>
I think I&#39;ll be having a look at all the hash errors, but anyone is fre=
e<br>
to look at them and post a patch that fixes the hash and explains the<br>
issue...<br>
<br>
Thanks!<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
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
</blockquote></div></div>

--00000000000072f102061be5fae9--

--===============2915365614956057028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2915365614956057028==--
