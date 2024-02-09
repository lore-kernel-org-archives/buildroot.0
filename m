Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F529C48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 05:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 968494056E;
	Fri,  9 Feb 2024 05:14:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fyVpunnHbLhj; Fri,  9 Feb 2024 05:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80E0841B22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80E0841B22;
	Fri,  9 Feb 2024 05:14:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B92521BF3E8
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 05:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A63796168D
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 05:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGUwRMF30GAy for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 05:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A82D61682
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A82D61682
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A82D61682
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 05:14:38 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6e1214ae9d4so189881a34.3
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 21:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707455677; x=1708060477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IgFxPtH1VY5TuclF4Eaz5DOw97HxHoNoSHEhUuk4//o=;
 b=PqEbeH8sNCj6xYaw/vvTn57JY+TjC8E1suv354CUoPcQemB2YEcjBpGSf5Vo2SrotC
 3mbknU/xUQ9lW6xSjEIoUXDHr/eq94kYKlZY9IF6rvlNd2memDbwOZuL8+IqG45soe4h
 N00KMYRPO69S1zwl/yzKLiPnne589L8uj9pliLtRIanYMupKkSzaHmZWbS39t3eT/kQl
 37EoxUMTbLn3ipCMOndavy91FshpSf5cnC8/LKrm25rmmup/fy84eODUDbc1GateRDrm
 4t1rOcCUZuZ5muDvk0T3dVqqgc4EniMucW6YGh+OTeir7lakMfpljoSDXUV+OVGy0HZn
 jj0g==
X-Gm-Message-State: AOJu0YwTbGt6UObbwAwM3L9inQuOBpBv04u8EOEIs2pybSmEuk4Rq6nf
 uSj9/njfJjTBVJ9zj7Q9lKe/gmkmoq+YbhgsKPFCsxo2Ovpnqvg7odah68qzqmYAHHIiwrIVFqa
 9M4kYaegrqEpVO9HMCkilohIftJU=
X-Google-Smtp-Source: AGHT+IFQ1/zrVO/kjjivEFHtmzQrbz+8O8CpLVodNHOxbjEir2jzXcH2wDW9B1K66I9jxgnBcKPnNQRtpFPjU2i1bVU=
X-Received: by 2002:a9d:7b4c:0:b0:6e2:bb7d:b132 with SMTP id
 f12-20020a9d7b4c000000b006e2bb7db132mr524069oto.12.1707455676946; Thu, 08 Feb
 2024 21:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20231211181504.3035423-1-roy.kollen.svendsen@akersolutions.com>
 <d5054160-5ac7-4328-b2e5-546deb007eff@mind.be>
In-Reply-To: <d5054160-5ac7-4328-b2e5-546deb007eff@mind.be>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Fri, 9 Feb 2024 06:14:26 +0100
Message-ID: <CA+R_depUs0Ey1UgjugiEvL83RUfsfC84_T9YfJXcKPzU1tEHrw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707455677; x=1708060477; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IgFxPtH1VY5TuclF4Eaz5DOw97HxHoNoSHEhUuk4//o=;
 b=ODes1TkrnTEzS8ZiEOxqi3Os0EI0s5oEWLrJAuPoOj02yg1zrsgVK8DvY71Zv1CVAL
 amJTvpP2YKFq5Oaj6g0/VyE4ZJlveYwBb3DqE+EMGgGZJWHVYxdBD1U979kBkG/UFjei
 D7glWYt6nDU78bAnJriQ3+4QAGxrwTiYOj8B9imkSopDdAwQ9ReJ+tvc8ve0Ib4dnJHJ
 +NLlaRK/rL3mCy9KutNPZtXjCmPHNub/WEe4/cgbWVWyQl9+69vDdREmkdXsXSOGxygJ
 wuprqEjBirLe94zneeWnn9pOGRoaCbT/keoVebExjPExFdTk8y+Q031Xg7AHoKSMEXlF
 9swQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ODes1Tkr
Subject: Re: [Buildroot] [PATCH] package/qt5: bump packages to latest kde
 submodule versions
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
Cc: Sebastian WEYER <sebastian.weyer@smile.fr>,
 Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: multipart/mixed; boundary="===============3438016663979264048=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3438016663979264048==
Content-Type: multipart/alternative; boundary="000000000000181f410610ec01ff"

--000000000000181f410610ec01ff
Content-Type: text/plain; charset="UTF-8"

Hi Arnout,

This patch broke the build for me too, after  activating all the modules in
menuconfig. I tried to change the state in patchwork to indicate this, but
i should probably have pointed it out on the mailinglist. I believe i fixed
the build at a later point though, but then I ran into problems again
related to qt5webengine...I will trace my steps today

Regards,
Roy

tor. 8. feb. 2024, 22:43 skrev Arnout Vandecappelle <arnout@mind.be>:

>   Hi Roy,
>
> On 11/12/2023 19:15, Roy Kollen Svendsen wrote:
> > Bump qt5 packages to latest submodule versions from:
> > https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15
> >
> > Signed-off-by: Roy Kollen Svendsen <
> roy.kollen.svendsen@akersolutions.com>
> > ---
> >   package/qt5/qt5.mk                                           | 2 +-
> >   package/qt5/qt53d/qt53d.hash                                 | 2 +-
> >   package/qt5/qt53d/qt53d.mk                                   | 2 +-
>
>   Sebastien Weyer submitted the same version bump earlier [1], but he left
> out
> qt53d because it doesn't build. Was it working for you or did you just not
> test
> qt53d?
>
> >   package/qt5/qt5base/qt5base.hash                             | 2 +-
> >   package/qt5/qt5base/qt5base.mk                               | 2 +-
> >   package/qt5/qt5charts/qt5charts.hash                         | 2 +-
> >   package/qt5/qt5charts/qt5charts.mk                           | 2 +-
> >   package/qt5/qt5connectivity/qt5connectivity.hash             | 2 +-
> >   package/qt5/qt5connectivity/qt5connectivity.mk               | 2 +-
> >   package/qt5/qt5declarative/qt5declarative.hash               | 2 +-
> >   package/qt5/qt5declarative/qt5declarative.mk                 | 2 +-
> >   package/qt5/qt5doc/qt5doc.hash                               | 2 +-
> >   package/qt5/qt5doc/qt5doc.mk                                 | 2 +-
>
>   I don't know why, but Sebastian didn't update qt5doc either...
>
>
>   Regards,
>   Arnout
>
> [1]
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20231012132616.2180337-1-sebastian.weyer@smile.fr/
>
>
> >   package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash     | 2 +-
> >   package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk       | 2 +-
> >   package/qt5/qt5imageformats/qt5imageformats.hash             | 2 +-
> >   package/qt5/qt5imageformats/qt5imageformats.mk               | 2 +-
> >   package/qt5/qt5location/qt5location.mk                       | 2 +-
> >   package/qt5/qt5lottie/qt5lottie.hash                         | 2 +-
> >   package/qt5/qt5lottie/qt5lottie.mk                           | 2 +-
> >   package/qt5/qt5multimedia/qt5multimedia.hash                 | 2 +-
> >   package/qt5/qt5multimedia/qt5multimedia.mk                   | 2 +-
> >   package/qt5/qt5quickcontrols/qt5quickcontrols.hash           | 2 +-
> >   package/qt5/qt5quickcontrols/qt5quickcontrols.mk             | 2 +-
> >   package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash         | 2 +-
> >   package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk           | 2 +-
> >   package/qt5/qt5quicktimeline/qt5quicktimeline.hash           | 2 +-
> >   package/qt5/qt5quicktimeline/qt5quicktimeline.mk             | 2 +-
> >   package/qt5/qt5remoteobjects/qt5remoteobjects.hash           | 2 +-
> >   package/qt5/qt5remoteobjects/qt5remoteobjects.mk             | 2 +-
> >   package/qt5/qt5script/qt5script.hash                         | 2 +-
> >   package/qt5/qt5script/qt5script.mk                           | 2 +-
> >   package/qt5/qt5scxml/qt5scxml.hash                           | 2 +-
> >   package/qt5/qt5scxml/qt5scxml.mk                             | 2 +-
> >   package/qt5/qt5sensors/qt5sensors.hash                       | 2 +-
> >   package/qt5/qt5sensors/qt5sensors.mk                         | 2 +-
> >   package/qt5/qt5serialbus/qt5serialbus.hash                   | 2 +-
> >   package/qt5/qt5serialbus/qt5serialbus.mk                     | 2 +-
> >   package/qt5/qt5serialport/qt5serialport.hash                 | 2 +-
> >   package/qt5/qt5serialport/qt5serialport.mk                   | 2 +-
> >   package/qt5/qt5speech/qt5speech.hash                         | 2 +-
> >   package/qt5/qt5speech/qt5speech.mk                           | 2 +-
> >   package/qt5/qt5svg/qt5svg.hash                               | 2 +-
> >   package/qt5/qt5svg/qt5svg.mk                                 | 2 +-
> >   package/qt5/qt5tools/qt5tools.hash                           | 2 +-
> >   package/qt5/qt5tools/qt5tools.mk                             | 2 +-
> >   package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash       | 2 +-
> >   package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk         | 2 +-
> >   package/qt5/qt5wayland/qt5wayland.hash                       | 2 +-
> >   package/qt5/qt5wayland/qt5wayland.mk                         | 2 +-
> >   package/qt5/qt5webchannel/qt5webchannel.hash                 | 2 +-
> >   package/qt5/qt5webchannel/qt5webchannel.mk                   | 2 +-
> >   package/qt5/qt5webengine-chromium/qt5webengine-chromium.hash | 4 ++--
> >   package/qt5/qt5webengine-chromium/qt5webengine-chromium.mk   | 2 +-
> >   package/qt5/qt5websockets/qt5websockets.hash                 | 2 +-
> >   package/qt5/qt5websockets/qt5websockets.mk                   | 2 +-
> >   package/qt5/qt5webview/qt5webview.hash                       | 2 +-
> >   package/qt5/qt5webview/qt5webview.mk                         | 2 +-
> >   package/qt5/qt5x11extras/qt5x11extras.hash                   | 2 +-
> >   package/qt5/qt5x11extras/qt5x11extras.mk                     | 2 +-
> >   package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash               | 2 +-
> >   package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk                 | 2 +-
> >   62 files changed, 63 insertions(+), 63 deletions(-)
> [snip]
>

--000000000000181f410610ec01ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Arnout,<div dir=3D"auto"><br></div><div dir=3D"auto">T=
his patch broke the build for me too, after=C2=A0 activating all the module=
s in menuconfig. I tried to change the state in patchwork to indicate this,=
 but i should probably have pointed it out on the mailinglist. I believe i =
fixed the build at a later point though, but then I ran into problems again=
 related to qt5webengine...I will trace my steps today</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto">Roy</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">tor=
. 8. feb. 2024, 22:43 skrev Arnout Vandecappelle &lt;<a href=3D"mailto:arno=
ut@mind.be" target=3D"_blank" rel=3D"noreferrer">arnout@mind.be</a>&gt;:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">=C2=A0 Hi Roy,<br>
<br>
On 11/12/2023 19:15, Roy Kollen Svendsen wrote:<br>
&gt; Bump qt5 packages to latest submodule versions from:<br>
&gt; <a href=3D"https://invent.kde.org/qt/qt/qt5/-/tree/kde/5.15" rel=3D"no=
referrer noreferrer noreferrer" target=3D"_blank">https://invent.kde.org/qt=
/qt/qt5/-/tree/kde/5.15</a><br>
&gt; <br>
&gt; Signed-off-by: Roy Kollen Svendsen &lt;<a href=3D"mailto:roy.kollen.sv=
endsen@akersolutions.com" rel=3D"noreferrer noreferrer" target=3D"_blank">r=
oy.kollen.svendsen@akersolutions.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/qt5/<a href=3D"http://qt5.mk" rel=3D"noreferrer no=
referrer noreferrer" target=3D"_blank">qt5.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt53d/qt53d.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt53d/<a href=3D"http://qt53d.mk" rel=3D"noref=
errer noreferrer noreferrer" target=3D"_blank">qt53d.mk</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
<br>
=C2=A0 Sebastien Weyer submitted the same version bump earlier [1], but he =
left out <br>
qt53d because it doesn&#39;t build. Was it working for you or did you just =
not test <br>
qt53d?<br>
<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5base/qt5base.hash=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5base/<a href=3D"http://qt5base.mk" rel=3D"n=
oreferrer noreferrer noreferrer" target=3D"_blank">qt5base.mk</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5charts/qt5charts.hash=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5charts/<a href=3D"http://qt5charts.mk" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5charts.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5connectivity/qt5connectivity.hash=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5connectivity/<a href=3D"http://qt5connectiv=
ity.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5conne=
ctivity.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5declarative/qt5declarative.hash=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5declarative/<a href=3D"http://qt5declarativ=
e.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5declara=
tive.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5doc/qt5doc.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5doc/<a href=3D"http://qt5doc.mk" rel=3D"nor=
eferrer noreferrer noreferrer" target=3D"_blank">qt5doc.mk</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
<br>
=C2=A0 I don&#39;t know why, but Sebastian didn&#39;t update qt5doc either.=
..<br>
<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
[1] <br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20231012132=
616.2180337-1-sebastian.weyer@smile.fr/" rel=3D"noreferrer noreferrer noref=
errer" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/pat=
ch/20231012132616.2180337-1-sebastian.weyer@smile.fr/</a><br>
<br>
<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5graphicaleffects/qt5graphicaleffects.hash=
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5graphicaleffects/<a href=3D"http://qt5graph=
icaleffects.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">=
qt5graphicaleffects.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5imageformats/qt5imageformats.hash=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5imageformats/<a href=3D"http://qt5imageform=
ats.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5image=
formats.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5location/<a href=3D"http://qt5location.mk" =
rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5location.mk</=
a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5lottie/qt5lottie.hash=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5lottie/<a href=3D"http://qt5lottie.mk" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5lottie.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5multimedia/qt5multimedia.hash=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5multimedia/<a href=3D"http://qt5multimedia.=
mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5multimedi=
a.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5quickcontrols/qt5quickcontrols.hash=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5quickcontrols/<a href=3D"http://qt5quickcon=
trols.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5qui=
ckcontrols.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5quickcontrols2/<a href=3D"http://qt5quickco=
ntrols2.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5q=
uickcontrols2.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5quicktimeline/qt5quicktimeline.hash=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5quicktimeline/<a href=3D"http://qt5quicktim=
eline.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5qui=
cktimeline.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5remoteobjects/qt5remoteobjects.hash=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5remoteobjects/<a href=3D"http://qt5remoteob=
jects.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5rem=
oteobjects.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5script/qt5script.hash=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5script/<a href=3D"http://qt5script.mk" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5script.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5scxml/qt5scxml.hash=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5scxml/<a href=3D"http://qt5scxml.mk" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">qt5scxml.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5sensors/qt5sensors.hash=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5sensors/<a href=3D"http://qt5sensors.mk" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5sensors.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5serialbus/qt5serialbus.hash=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5serialbus/<a href=3D"http://qt5serialbus.mk=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5serialbus.m=
k</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5serialport/qt5serialport.hash=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5serialport/<a href=3D"http://qt5serialport.=
mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5serialpor=
t.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5speech/qt5speech.hash=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5speech/<a href=3D"http://qt5speech.mk" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5speech.mk</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5svg/qt5svg.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5svg/<a href=3D"http://qt5svg.mk" rel=3D"nor=
eferrer noreferrer noreferrer" target=3D"_blank">qt5svg.mk</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5tools/qt5tools.hash=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5tools/<a href=3D"http://qt5tools.mk" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">qt5tools.mk</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5virtualkeyboard/<a href=3D"http://qt5virtua=
lkeyboard.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt=
5virtualkeyboard.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5wayland/qt5wayland.hash=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5wayland/<a href=3D"http://qt5wayland.mk" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5wayland.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5webchannel/qt5webchannel.hash=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5webchannel/<a href=3D"http://qt5webchannel.=
mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5webchanne=
l.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5webengine-chromium/qt5webengine-chromium.ha=
sh | 4 ++--<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5webengine-chromium/<a href=3D"http://qt5web=
engine-chromium.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bla=
nk">qt5webengine-chromium.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5websockets/qt5websockets.hash=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5websockets/<a href=3D"http://qt5websockets.=
mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5websocket=
s.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5webview/qt5webview.hash=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5webview/<a href=3D"http://qt5webview.mk" re=
l=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5webview.mk</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5x11extras/qt5x11extras.hash=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5x11extras/<a href=3D"http://qt5x11extras.mk=
" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5x11extras.m=
k</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0package/qt5/qt5xmlpatterns/<a href=3D"http://qt5xmlpattern=
s.mk" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">qt5xmlpatt=
erns.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-<br>
&gt;=C2=A0 =C2=A062 files changed, 63 insertions(+), 63 deletions(-)<br>
[snip]<br>
</blockquote></div>

--000000000000181f410610ec01ff--

--===============3438016663979264048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3438016663979264048==--
