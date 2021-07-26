Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDAEC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:06:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD6960F02
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 05:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFD6960F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91F00828F7;
	Mon, 26 Jul 2021 05:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SYl5s7vrIQfv; Mon, 26 Jul 2021 05:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C145082893;
	Mon, 26 Jul 2021 05:06:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE80D1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE5B882893
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 05:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0oJYzE-dwjE for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 05:06:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB1378284B
 for <buildroot@busybox.net>; Mon, 26 Jul 2021 05:06:53 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id y12so859981edo.6
 for <buildroot@busybox.net>; Sun, 25 Jul 2021 22:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rfqsQ6z8GyDfdrjAiMEGHQaacdEM4W06xNNfBbmQECg=;
 b=QqOtB3eyfT2Tk6vaLIPLsj1xTGvlpBJ9MOSz0fN8XPLLvYr2PYBfV98MmTTeMOBARo
 BXjUyc+CT0vOMWO0+o7dIGus4EqBGavoUkXKKpmAzwsfGrxUrySfn23VYtLtyhexTUxp
 5FfUHKLpDA2OiyJhhXkGn/auuoWbwah4FdqXO22GgU05kM1UjserSMXAYnid9Zhly7k/
 vpJ/O6aaSSsi/KFClutU4nQs8dRUhUyqQm+3VbF4gMPLYasfH8dQgYNDXArVGU5OfnnY
 Ww1xIsGz5ATkyd1OcynTRnwy2VdgTqj9MA44+lyXK2n4//MQGekNhXcSmZX3l2gQaR2F
 qixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rfqsQ6z8GyDfdrjAiMEGHQaacdEM4W06xNNfBbmQECg=;
 b=nlZc2u/JKl3BY6fm3Qg2T1uiaqOZF98arCb0SF39LfSrNcTGjmqN05WjgDqXqhz8Bv
 Uc3J/SZa/bhNE7MCWkpIEemhZSKCltHM2WYAl5jZ8q6NzRAbl3RA2Nz5G9TWijsdxrIH
 r6+1JLwaF5ehP8EZFX0mmagRmIew/kdxGppQe1CzEuGb9zh9teSc0aez4RNs/17YvgTb
 nFlvXcQS9qWaxRF7tvwGyMI8jRFTSM9bGqLNpD+3uxFMwdRnuVb9sA70Hk/sFXqv74wV
 WI2uQvLOdo73wIgN3Na5lhZBMYu/H7FdW6eQtYAq4rQBgGHj0+SSe1c1wQSu8s7C9uCH
 W25Q==
X-Gm-Message-State: AOAM531CfRTdBGPPHATOtC4/8Fe5Z5rJ8RIMsIc8W6A1Ye11JKLFxC/j
 RuaMroamZI9g6zpLan7vy2NQ/5MmOHG/jgZniT6P5w==
X-Google-Smtp-Source: ABdhPJxhVkTlr1GO3TIQVG67whRz2IOWDXiIVo8eZ8M6Len2LcrhKl/RzkGbpE3sI0wxRTkXbIT74c0wEtn0hFlhoLk=
X-Received: by 2002:aa7:d344:: with SMTP id m4mr19409050edr.184.1627276011630; 
 Sun, 25 Jul 2021 22:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210723124754.46568-1-jose.pekkarinen@unikie.com>
 <874kclytuj.fsf@tarshish>
In-Reply-To: <874kclytuj.fsf@tarshish>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 26 Jul 2021 08:06:41 +0300
Message-ID: <CAJPV9MqSRLFpG2WO4+8pg3WJtW8m0TLKYRxd4uQbXAp59jHu7w@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Buildroot] [PATCH] Fix restorecond startup for sysvinit builds
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============3311081770942925996=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3311081770942925996==
Content-Type: multipart/alternative; boundary="000000000000a002b005c7ffb865"

--000000000000a002b005c7ffb865
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2021 at 5:42 PM Baruch Siach <baruch@tkos.co.il> wrote:

> [...]
>
> > diff --git a/package/restorecond/restorecond.mk b/package/restorecond/
> restorecond.mk
> > index 7ab7e978dd..1546661baf 100644
> > --- a/package/restorecond/restorecond.mk
> > +++ b/package/restorecond/restorecond.mk
> > @@ -9,7 +9,7 @@ RESTORECOND_SITE =3D
> https://github.com/SELinuxProject/selinux/releases/download/2
> >  RESTORECOND_LICENSE =3D GPL-2.0
> >  RESTORECOND_LICENSE_FILES =3D COPYING
> >
> > -RESTORECOND_DEPENDENCIES =3D libglib2 libsepol libselinux dbus-glib
> > +RESTORECOND_DEPENDENCIES =3D libglib2 libsepol libselinux dbus-glib da=
emon
>
> This is a run-time dependency, right? If so there is no need for daemon
> to build before restorecond. But add a "runtime" comment next to
> select BR2_PACKAGE_DAEMON.
>

Hi,

Yes, this is a runtime dependency as it comes from the

original source code, the init script provided from upstream calls
it in. If we want it to work out-of-the-box we have to automatically
select it at least.

Thanks for the comments!


Jos=C3=A9.

--000000000000a002b005c7ffb865
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 23, 2021 at 5:42 PM Baruc=
h Siach &lt;<a href=3D"mailto:baruch@tkos.co.il">baruch@tkos.co.il</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">[...]<br>
<br>
&gt; diff --git a/package/restorecond/<a href=3D"http://restorecond.mk" rel=
=3D"noreferrer" target=3D"_blank">restorecond.mk</a> b/package/restorecond/=
<a href=3D"http://restorecond.mk" rel=3D"noreferrer" target=3D"_blank">rest=
orecond.mk</a><br>
&gt; index 7ab7e978dd..1546661baf 100644<br>
&gt; --- a/package/restorecond/<a href=3D"http://restorecond.mk" rel=3D"nor=
eferrer" target=3D"_blank">restorecond.mk</a><br>
&gt; +++ b/package/restorecond/<a href=3D"http://restorecond.mk" rel=3D"nor=
eferrer" target=3D"_blank">restorecond.mk</a><br>
&gt; @@ -9,7 +9,7 @@ RESTORECOND_SITE =3D <a href=3D"https://github.com/SEL=
inuxProject/selinux/releases/download/2" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/SELinuxProject/selinux/releases/download/2</a><br>
&gt;=C2=A0 RESTORECOND_LICENSE =3D GPL-2.0<br>
&gt;=C2=A0 RESTORECOND_LICENSE_FILES =3D COPYING<br>
&gt;=C2=A0 <br>
&gt; -RESTORECOND_DEPENDENCIES =3D libglib2 libsepol libselinux dbus-glib<b=
r>
&gt; +RESTORECOND_DEPENDENCIES =3D libglib2 libsepol libselinux dbus-glib d=
aemon<br>
<br>
This is a run-time dependency, right? If so there is no need for daemon<br>
to build before restorecond. But add a &quot;runtime&quot; comment next to<=
br>
select BR2_PACKAGE_DAEMON.<br></blockquote><div><br></div></div><blockquote=
 style=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_qu=
ote"><div>Hi,</div><div><br></div></div></blockquote><blockquote style=3D"m=
argin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>Y=
es, this is a runtime dependency as it comes from the</div></div></blockquo=
te>original source code, the init script provided from upstream calls<div>i=
t in. If we want it to work out-of-the-box we have to automatically</div><d=
iv>select it at least.</div><div><br></div><blockquote style=3D"margin:0 0 =
0 40px;border:none;padding:0px"><div>Thanks for the comments!=C2=A0</div></=
blockquote><div><div><br></div><div dir=3D"ltr" class=3D"gmail_signature"><=
div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;border:none;pa=
dding:0px">Jos=C3=A9.</blockquote></div></div></div></div>

--000000000000a002b005c7ffb865--

--===============3311081770942925996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3311081770942925996==--
