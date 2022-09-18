Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4292C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 14:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1021A84089;
	Sun, 18 Sep 2022 14:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1021A84089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cW_CfMNzTaFa; Sun, 18 Sep 2022 14:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21DF983F3D;
	Sun, 18 Sep 2022 14:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21DF983F3D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3191BF34A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 14:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58C6983F1D
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 14:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58C6983F1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sX66S4TgD9l for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 14:36:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56BE28407A
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56BE28407A
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 14:36:33 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 q35-20020a17090a752600b002038d8a68fbso448869pjk.0
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 07:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=RpTIuFTE9zi5dkMA6vrOD+QrixQiqXQyQGYLzRjQ4UQ=;
 b=n4clWG4B6PCaxSwdMx3TdRgIBbD+xWEw4EmHrhe5w6lGH+0yS+4YiuV5GEX31dt0Ja
 M0Lgy4a5o3kd6p37mACr0wCuMz+kYc0ED0w8hfqSesBoVmybLOh/PSTcmfOvcF8UX4Yw
 im30Hmx4gsQjdlSZMxtkxEii6KcSorJru2CJBmyPPkSCYOvvfk8Z2gnb/1wcWFH2pSDK
 d8yWCDj/x+XN2XEwawwktbxSZ635iiOYu9DzBrjI1VO9znQtyQSKL3PNWe6mKlMLDYzf
 Q1hTkFPTn464pnJg5WAdz4udEgbi+FykROB+Y+rvmQtv6k8nWSA/Wpkg4Q6ZWCb34JaO
 EEQg==
X-Gm-Message-State: ACrzQf2ZghVlfzDS+4pbFvspiYqvqRhp2YIx4/qgwCfJ6BeO+jWWbWSn
 QGGD2aAQgPiNGNowbDCh6tUsMVS+JVdF4QnO/XtO3f850+Y=
X-Google-Smtp-Source: AMsMyM7dcDiZCfgp3SRnEQuVvGyZ/BvJBh7N6K9n+Jh9LqlF4W2VUXzDYtC7yLIjPzd0izAvNkjqvIKRtttu8AW8cVo=
X-Received: by 2002:a17:90b:388e:b0:202:c42a:d360 with SMTP id
 mu14-20020a17090b388e00b00202c42ad360mr26305754pjb.158.1663511792787; Sun, 18
 Sep 2022 07:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220826135503.20612-1-jesseevg@gmail.com>
 <20220826135503.20612-18-jesseevg@gmail.com>
 <20220918124138.25b112d2@windsurf>
In-Reply-To: <20220918124138.25b112d2@windsurf>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Sun, 18 Sep 2022 16:36:22 +0200
Message-ID: <CAMdwsN_N1MnhS=aoPst4QnLmOSHFWdTPVd13f+vND10h5i560w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=RpTIuFTE9zi5dkMA6vrOD+QrixQiqXQyQGYLzRjQ4UQ=;
 b=kICsm3mc+2lIpD1zTZWgsqGIpqIUlxBxn8IdZl7GpsjKeBeDZUzFAnBmU6WkFv0b4r
 VIpycWOLPDc7eQPx46fT/ki/tRkux5aWkRyK3Vu4QqQMyoW1kWuub5Iv90SNwz59q5py
 B3t+1LMwnCaVm1dHS4pQsowQxOG4RkHjqjDNEgol9SZVwgUpkapgi+YWWjB2pCuIynv5
 fBn/32KCoeP/nwEalXdCoNn1GkmlYkGjhvUf1LJA5T6+2TD3DClgEgGE47EbD7m6I+yN
 OCcpbCOjU4sTx5TFmX+oCWrw9lsxp+JVc6AqzBLj6EbzAvCiqsAt8kOG6JfwYkkNrW7Z
 mB0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kICsm3mc
Subject: Re: [Buildroot] [PATCH v4 17/29] package/qt6/qt6base: add support
 for passing custom options
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3691926316187686658=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3691926316187686658==
Content-Type: multipart/alternative; boundary="0000000000007d256a05e8f4857f"

--0000000000007d256a05e8f4857f
Content-Type: text/plain; charset="UTF-8"

Op zo 18 sep. 2022 om 12:41 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:
>
> On Fri, 26 Aug 2022 15:54:51 +0200
> Jesse Van Gavere <jesseevg@gmail.com> wrote:
>
> > Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> > ---
> >  package/qt6/qt6base/Config.in  | 10 ++++++++++
> >  package/qt6/qt6base/qt6base.mk |  3 +++
> >  2 files changed, 13 insertions(+)
>
> In Qt5, there were indeed zillions of options to fine-tune a lot of
> things. Is that still the same in Qt6? I'd like to see some
> evidence/facts, and not just copy/pasting what was done in qt5base just
> because it was done in qt5base.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Hey Thomas,

In true Qt fashion there is still indeed many dozens of configuration
options, some of them are listed here
https://github.com/qt/qtbase/blob/dev/cmake/configure-cmake-mapping.md and
as you can see there some of those options are not covered by us but might
want to be turned off, but if you dig deeper into what can be configured
(using ccmake on the qt6 build folder with the main modules turned on is
useful to get a good overview) you can see a lot of other options that
aren't very obvious or easily found but I still found are very useful to
have the ability to turn them off to reduce the library size, an example of
this would be calendar features such as jalalicalendar/islamiccivilcalendar.
And there are a bunch of little configuration options that can make for
some easy space savings, which I did think about adding to create some
visibility on what's out there to reduce the library size, though decided
against for now until this patch series is processed, but even then it's
unlikely we'll ever cover every single configuration option so I do think
there's value in keeping this for those that want to push it to the limit
space wise.

Regards,
Jesse

--0000000000007d256a05e8f4857f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>Op zo 18 sep. 2022 om 12:41 schreef Thomas Petazzo=
ni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@boo=
tlin.com</a>&gt;:<br>&gt;<br>&gt; On Fri, 26 Aug 2022 15:54:51 +0200<br>&gt=
; Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com">jesseevg@gmail=
.com</a>&gt; wrote:<br>&gt;<br>&gt; &gt; Signed-off-by: Jesse Van Gavere &l=
t;<a href=3D"mailto:jesseevg@gmail.com">jesseevg@gmail.com</a>&gt;<br>&gt; =
&gt; ---<br>&gt; &gt; =C2=A0package/qt6/qt6base/Config.in =C2=A0| 10 ++++++=
++++<br>&gt; &gt; =C2=A0package/qt6/qt6base/<a href=3D"http://qt6base.mk">q=
t6base.mk</a> | =C2=A03 +++<br>&gt; &gt; =C2=A02 files changed, 13 insertio=
ns(+)<br>&gt;<br>&gt; In Qt5, there were indeed zillions of options to fine=
-tune a lot of<br>&gt; things. Is that still the same in Qt6? I&#39;d like =
to see some<br>&gt; evidence/facts, and not just copy/pasting what was done=
 in qt5base just<br>&gt; because it was done in qt5base.<br>&gt;<br>&gt; Th=
omas<br>&gt; --<br>&gt; Thomas Petazzoni, CTO, Bootlin<br>&gt; Embedded Lin=
ux and Kernel engineering<br>&gt; <a href=3D"https://bootlin.com">https://b=
ootlin.com</a><br>Hey Thomas,<br><br><div>In true Qt fashion there is still=
 indeed many dozens of configuration options, some of them are listed here =
<a href=3D"https://github.com/qt/qtbase/blob/dev/cmake/configure-cmake-mapp=
ing.md">https://github.com/qt/qtbase/blob/dev/cmake/configure-cmake-mapping=
.md</a> and as you can see there some of those options are not covered by u=
s but might want to be turned off, but if you dig deeper into what can be c=
onfigured (using ccmake on the qt6 build folder with the main modules turne=
d on is useful to get a good overview) you can see a lot of other options t=
hat aren&#39;t very obvious or easily found but I still found are very usef=
ul to have the ability to turn them off to reduce the library size, an exam=
ple of this would be calendar features such as jalalicalendar/islamiccivilc=
alendar.</div><div>And there are a bunch of little configuration options th=
at can make for some easy space savings, which I did think about adding to =
create some visibility on what&#39;s out there to reduce the library size, =
though decided against for now until this patch series is processed, but ev=
en then it&#39;s unlikely we&#39;ll ever cover every single configuration o=
ption so I do think there&#39;s value in keeping this for those that want t=
o push it to the limit space wise.</div><div><br></div><div>Regards,</div><=
div>Jesse<br></div></div>

--0000000000007d256a05e8f4857f--

--===============3691926316187686658==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3691926316187686658==--
