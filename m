Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7DFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 11:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5C0E85264;
	Fri, 10 Dec 2021 11:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aGSzIf2r3TsS; Fri, 10 Dec 2021 11:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 622BB85265;
	Fri, 10 Dec 2021 11:02:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AC0C1BF3ED
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 11:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 081B1613D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 11:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebYxzp53E9Uh for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 11:02:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5B9E613D3
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 11:02:46 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id v1so29032410edx.2
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 03:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YPc71a/JEX7KqwxZc9QCDwnCUNf7b8VVsIUy3RQlN58=;
 b=mRQ1OfVWC3Yk0RLFvgdI8tMbkYcxOnFqKFsYujH2ECekbP70460ki37qHLQcLsbQH+
 DFPt/+fK8nxTrcmBLkSwBxtU7vnJE5AMal3erB4xPmNDmzs5SUthIF3cu25LvK3Pqy2Y
 HSFWUVsptZNSBKpJtmPJfgYuVkDShKFEgxiYh7fm0OBRuTXeIQUDIV8pMRjdgNnJPATa
 N7panR2wVoO58NgjvP4y/5S56X5xMqSFmxwef/GheVs0BJv1YinZq7psQDjN4uCYG1x0
 wII1AOsM7t8o25vWAAEwWT0gYehyKim3c/sHNk5b06703YrG/yn9Syl3me9lcffkWCGz
 7k0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YPc71a/JEX7KqwxZc9QCDwnCUNf7b8VVsIUy3RQlN58=;
 b=A6DHUoUEf8kk7h3hpJJ+2ciQaqjdoUOnGiFavPlxKKSLapObuFf/RZs67a76HPs1Md
 /idj1GdyCky08+OB/iq7oGYKUEmzTbDJLAxDp89NRb3Ob091ScX6E406I2uvxek4y0Vb
 j1WL5+y5beezgxnxOig8/ijZFwhgYtQVGe3oUQMnGnp3EgxDGoH0SEBAoPneFncejIwO
 3MpTxtR4qglDW4nlsmkQE27y/a6ZLFzOGIPIVgBl6k1ytCeAXnnTLSpn/Z/EMi0w1aOX
 q7kkYgJaueTIKFuPQG6WoAanWF87iYotAJypFcT8BMF4CV34ga/aMIH5WdamH+PScsAN
 MGHA==
X-Gm-Message-State: AOAM531mnWYTMfbYBXDf3GutFDezJVu0XRmX67F6fI1/Mr7ay8lqjKGp
 elbiAU9KIt4uBwxrUbLyj6waG68L/SszjAt+YDwG1xueF0YT0E0dkXw=
X-Google-Smtp-Source: ABdhPJy/Wdsy8NF5oA8fjl5LJ5d+L56BHGrWQvj/cDK95IbApTKXf0RiqMsuANZn0wOqUgmSaAa59Jn6eqp4YwdpYyo=
X-Received: by 2002:a17:906:4703:: with SMTP id
 y3mr23021198ejq.346.1639134165019; 
 Fri, 10 Dec 2021 03:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20211203083707.1741283-1-jose.pekkarinen@unikie.com>
 <CAJPV9MpZg_6w5mi0N21Ups061FVFte1om_cEVnpgym6Xywf6rg@mail.gmail.com>
 <ceee3f32-f0b3-2cea-b67f-4b1726b0b144@benettiengineering.com>
In-Reply-To: <ceee3f32-f0b3-2cea-b67f-4b1726b0b144@benettiengineering.com>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Fri, 10 Dec 2021 13:02:33 +0200
Message-ID: <CAJPV9Mpjwh+_H7vVKjqcQcROrw+daU+jW+d=n0Dw5Dev-E2DVQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/3] package/opensc: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8189253533097243969=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8189253533097243969==
Content-Type: multipart/alternative; boundary="000000000000a548d705d2c8a921"

--000000000000a548d705d2c8a921
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 12:29 PM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi Jos=C3=A9,
>
> please use plain-text,
>

Sorry, google thingy, not sure I can fix it :\



> On 10/12/21 07:20, Jos=C3=A9 Pekkarinen wrote:
> >
> >     Hi,
> >
> >     Any comments in the following patchset?
> >
> >     Thanks!
> >
> >     Jos=C3=A9
> >
> >
> > On Fri, Dec 3, 2021 at 10:37 AM Jos=C3=A9 Pekkarinen
>
> Only 1 week has passed, backlog is pretty big(478 patches at the moment)
>

Sorry, I was following linux kernel guidances

of the rule of 1w, I'll be more patient next time.


> > <jose.pekkarinen@unikie.com <mailto:jose.pekkarinen@unikie.com>> wrote:
> >
> >     The patch will add a basic opensc package to build
> >     on buildroot.
>
> This commit log is not sufficient. Can you please take a look at other
> commit log on while adding a "new package"? Try to imitate, that's a
> good starting point.
>

Most I see have empty comment. Mind to elaborate

what is missing?

>     Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com
> >     <mailto:jose.pekkarinen@unikie.com>>
>
> This ^^^ SoB has a strange format, how did you produce the patch?
> Also how did you set the user.email in git?
>

It is properly set, so either git send-email or google added

that extra feaure.


Thanks!

Jos=C3=A9.

--000000000000a548d705d2c8a921
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 10, 2021 at 12:29 PM Giul=
io Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com">giu=
lio.benetti@benettiengineering.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Hi Jos=C3=A9,<br>
<br>
please use plain-text,<br></blockquote><div><br></div></div><blockquote sty=
le=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"=
><div>Sorry, google thingy, not sure I can fix it :\</div></div></blockquot=
e><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
On 10/12/21 07:20, Jos=C3=A9 Pekkarinen wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Any comments in the following patchset?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jos=C3=A9<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Dec 3, 2021 at 10:37 AM Jos=C3=A9 Pekkarinen <br>
<br>
Only 1 week has passed, backlog is pretty big(478 patches at the moment)<br=
></blockquote><div><br></div></div><blockquote style=3D"margin:0 0 0 40px;b=
order:none;padding:0px"><div class=3D"gmail_quote"><div>Sorry, I was follow=
ing linux kernel guidances</div></div></blockquote>of the rule of 1w, I&#39=
;ll be more patient next time.<br><div class=3D"gmail_quote"><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com" target=3D"_blank">jo=
se.pekkarinen@unikie.com</a> &lt;mailto:<a href=3D"mailto:jose.pekkarinen@u=
nikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;&gt; wrote:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The patch will add a basic opensc package to build<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0on buildroot.<br>
<br>
This commit log is not sufficient. Can you please take a look at other <br>
commit log on while adding a &quot;new package&quot;? Try to imitate, that&=
#39;s a <br>
good starting point.<br></blockquote><div><br></div></div><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><=
div>Most I see have empty comment. Mind to elaborate</div></div></blockquot=
e>what is missing?=C2=A0<div><br><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"=
mailto:jose.pekkarinen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie=
.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jose.pekkarinen@unikie=
.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;&gt;<br>
<br>
This ^^^ SoB has a strange format, how did you produce the patch?<br>
Also how did you set the user.email in git?<br></blockquote><div><br></div>=
</div></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"=
><div><div class=3D"gmail_quote"><div>It is properly set, so either git sen=
d-email or google added</div></div></div></blockquote>that extra feaure.<br=
><div><div class=3D"gmail_quote"><div>=C2=A0</div></div></div><blockquote s=
tyle=3D"margin:0 0 0 40px;border:none;padding:0px"><div><div class=3D"gmail=
_quote"><div>Thanks!</div><div><br></div></div></div></blockquote><blockquo=
te style=3D"margin:0 0 0 40px;border:none;padding:0px"><div><div class=3D"g=
mail_quote"><div>Jos=C3=A9.</div></div></div></blockquote></div>

--000000000000a548d705d2c8a921--

--===============8189253533097243969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8189253533097243969==--
