Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA0C4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 22:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9F7F81316;
	Mon, 14 Nov 2022 22:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9F7F81316
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WiqiaHP_66UU; Mon, 14 Nov 2022 22:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E972B812F9;
	Mon, 14 Nov 2022 22:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E972B812F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF6CE1BF36D
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B995A606E7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 22:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B995A606E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6NkNER1bY9zz for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 22:50:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B37606AA
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8B37606AA
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 22:50:18 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id b11so11697093pjp.2
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 14:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nVTC53cRsX9uzw4sj5ZhEgkWmdClXw2uteC8u4/qX8c=;
 b=mnkATDH6JG1ss2tuCYiAYa0GG9owjBIJ7q1cYK+E+FwD46+Zx3ufWSsdCf+HLIDOXp
 GEMo6qr3HDOm0LXgnjWdVtesWg6o/7ua9fiUiT5sK8D3qKmUw1Ks+5tSLV71loBnYqWc
 Pychp56RXJIDhTUDzJgxBvur5hFfbxGeusYNJd0AFmmgzw5yRNZ7kSv8p1bJKLV8RMYr
 rEfq1g4JMuhSYIXf0AOBnVo8ymNsK9xRvhd9ihf+ChGmeVuIbOmrOLi2lle725wmbcoU
 dJ5U3ufsNFQiW0rs85z6xW3XXcBjFpqO87KoHXod/+lHjnyYtLq6Y4cvG6Yp25KcyT0W
 NTuw==
X-Gm-Message-State: ANoB5pk+vvs202LtEZorwXqZSD6v9vi8V5PocuPS+9g2XoQhfdg51F2H
 gwJWQk94pISCwi8sf21OIWto8Be4x77r64D4g+0bpgKbc3A=
X-Google-Smtp-Source: AA0mqf7n79nOxbFbbuywpslJq9/sNiMLt5vGgMdD7bvsX08ew+WS1zYSy8BUXEHJZmRwkiKKC2d3eAJwIZ2Hppo7h3g=
X-Received: by 2002:a17:902:f60c:b0:186:878e:3b0d with SMTP id
 n12-20020a170902f60c00b00186878e3b0dmr1174424plg.149.1668466218204; Mon, 14
 Nov 2022 14:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20221107022458.3448020-1-james.hilliard1@gmail.com>
 <20221107022458.3448020-2-james.hilliard1@gmail.com>
 <20221114234532.3aa355df@windsurf>
In-Reply-To: <20221114234532.3aa355df@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Nov 2022 18:50:08 -0400
Message-ID: <CADvTj4poEndRsUJSGX5JPx4AHm3P9s-NRU6Ujp-SsWvmuwzzMg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nVTC53cRsX9uzw4sj5ZhEgkWmdClXw2uteC8u4/qX8c=;
 b=ZEe0gW5OlgGGd6nXkHm6Qrto6Qzv6SJnO4lL2YeOsvVUxHhzRpNIivC1VriBUCA5E3
 +LzU+XoRmyOBS12TAnjItNRfyzkVKC2IuIcAj7s6lldfWg8/gdTCHghaFxQ3tzZpjGn1
 WUkY/dXJX7BelrLN3TGMgQv42ajALzsJK8CTCpLK0l/KLxcChyOMp1DyJJ3W0wyZjhDw
 otpqIHdzS8x0aQ4AgQZQEtHzGtOa3FypnC+iuFA+V0YjHo31ZTdOTHCkNYjQJv19ay8P
 zNr329q9aZSo7JkZ2V204/Owze0kXgMBdkfL+yxY3ixvWWY3eQ+e3o5QuV9XviQiS1/a
 MRBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZEe0gW5O
Subject: Re: [Buildroot] [PATCH 2/3] package/zxing-cpp: bump to version 1.4.0
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
Content-Type: multipart/mixed; boundary="===============6934524133425624655=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6934524133425624655==
Content-Type: multipart/alternative; boundary="00000000000041818f05ed761095"

--00000000000041818f05ed761095
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 14, 2022, 6:45 PM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello James,
>
> On Sun,  6 Nov 2022 19:24:57 -0700
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > -ifeq ($(BR2_PACKAGE_LIBICONV),y)
> > -ZXING_CPP_DEPENDENCIES += libiconv
> > +ifeq
> ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),y)
> > +ifeq ($(BR2_PACKAGE_OPENCV3),y)
> > +ZXING_CPP_DEPENDENCIES += opencv3
> > +endif
> > +ifeq ($(BR2_PACKAGE_OPENCV4),y)
> > +ZXING_CPP_DEPENDENCIES += opencv4
> > +endif
> > +ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_OpenCV=TRUE
> > +else
> > +ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_OpenCV=TRUE
> >  endif
> >
> > -ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),y)
> > -ZXING_CPP_DEPENDENCIES += opencv3
> > -ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
> > +ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),y)
>
> Are you sure this is correct? I believe it should be:
>
> ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
>
> or:
>
> ifeq ($(BR2_PACKAGE_PYTHON3),y)
>
> since anyway pybind is guaranteed to be available when python3 is
> enabled, since you select it.
>
> > +ZXING_CPP_DEPENDENCIES += python3 python-pybind
> > +ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=ON
> > +else
> > +ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_QT5BASE),y)
> > +ZXING_CPP_DEPENDENCIES += qt5base
> > +ifeq
> ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yy)
> > +ZXING_CPP_DEPENDENCIES += qt5declarative qt5multimedia
> > +endif
> > +ifeq
> ($(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yyy)
> > +ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_Qt5=TRUE
>
> it's a bit confusing what's happening here. Why are the dependencies
> different than the condition used to enable Qt support?
>

This variable makes all optional qt deps required, so we only set it when
all optional
qt deps are present.

Some features only need some qt deps.


> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000041818f05ed761095
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Nov 14, 2022, 6:45 PM Thomas Petazzoni &lt;<a =
href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello James,<br>
<br>
On Sun,=C2=A0 6 Nov 2022 19:24:57 -0700<br>
James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" target=3D"_=
blank" rel=3D"noreferrer">james.hilliard1@gmail.com</a>&gt; wrote:<br>
<br>
&gt; -ifeq ($(BR2_PACKAGE_LIBICONV),y)<br>
&gt; -ZXING_CPP_DEPENDENCIES +=3D libiconv<br>
&gt; +ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_HIG=
HGUI),y)<br>
&gt; +ifeq ($(BR2_PACKAGE_OPENCV3),y)<br>
&gt; +ZXING_CPP_DEPENDENCIES +=3D opencv3<br>
&gt; +endif<br>
&gt; +ifeq ($(BR2_PACKAGE_OPENCV4),y)<br>
&gt; +ZXING_CPP_DEPENDENCIES +=3D opencv4<br>
&gt; +endif<br>
&gt; +ZXING_CPP_CONF_OPTS +=3D -DCMAKE_REQUIRE_FIND_PACKAGE_OpenCV=3DTRUE<b=
r>
&gt; +else<br>
&gt; +ZXING_CPP_CONF_OPTS +=3D -DCMAKE_DISABLE_FIND_PACKAGE_OpenCV=3DTRUE<b=
r>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; -ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),y)<br>
&gt; -ZXING_CPP_DEPENDENCIES +=3D opencv3<br>
&gt; -ZXING_CPP_CONF_OPTS +=3D -DBUILD_OPENCV=3DON<br>
&gt; +ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),y)<br>
<br>
Are you sure this is correct? I believe it should be:<br>
<br>
ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)<br>
<br>
or:<br>
<br>
ifeq ($(BR2_PACKAGE_PYTHON3),y)<br>
<br>
since anyway pybind is guaranteed to be available when python3 is<br>
enabled, since you select it.<br>
<br>
&gt; +ZXING_CPP_DEPENDENCIES +=3D python3 python-pybind<br>
&gt; +ZXING_CPP_CONF_OPTS +=3D -DBUILD_PYTHON_MODULE=3DON<br>
&gt; +else<br>
&gt; +ZXING_CPP_CONF_OPTS +=3D -DBUILD_PYTHON_MODULE=3DOFF<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_QT5BASE),y)<br>
&gt; +ZXING_CPP_DEPENDENCIES +=3D qt5base<br>
&gt; +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA)=
,yy)<br>
&gt; +ZXING_CPP_DEPENDENCIES +=3D qt5declarative qt5multimedia<br>
&gt; +endif<br>
&gt; +ifeq ($(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(=
BR2_PACKAGE_QT5MULTIMEDIA),yyy)<br>
&gt; +ZXING_CPP_CONF_OPTS +=3D -DCMAKE_REQUIRE_FIND_PACKAGE_Qt5=3DTRUE<br>
<br>
it&#39;s a bit confusing what&#39;s happening here. Why are the dependencie=
s<br>
different than the condition used to enable Qt support?<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">This variable makes =
all optional qt deps required, so we only set it when all optional</div><di=
v dir=3D"auto">qt deps are present.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Some features only need some qt deps.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--00000000000041818f05ed761095--

--===============6934524133425624655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6934524133425624655==--
