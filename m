Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BD8C00528
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 14:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFB72610A4;
	Mon, 31 Jul 2023 14:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFB72610A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Ucl-JQXmRH7; Mon, 31 Jul 2023 14:56:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7328610A7;
	Mon, 31 Jul 2023 14:56:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7328610A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B61F1BF31B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E74746108D
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 14:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E74746108D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5P9ok-Gfi01 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 14:56:28 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2D1A610A4
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 14:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2D1A610A4
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe3c7f16bbso944126e87.0
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 07:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690815385; x=1691420185;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PqZ706SzO+3t4gRttFRHYPWdi55OMeGbfv1326fx6rI=;
 b=Utxlx8PA25oc8cL3ELzKaqsl13vCra7FGmFH5XdIWqm/vSv6I7bkW7ikkcBwCWsbyV
 0Q/J7Ls6YlppkNIPrt/V3LdRL7j5vK4LsvA/UiznY7ts8k9y1bYT/4i1rPXjRYSdd7cq
 XE7+8zSMLq+WCyFhoi+8845ZxcWaB/lGB+pXIIpLy17ErfIL9PB5U9p0L1FLy/axzLil
 WXigFa00UtQqOp2Jo7IDerufznPuepXUPkrbjVAAJAziIpOsQQeLfYJPdPdyS8NvAqTG
 VJ1my9rmK18MAXyquoOYnr/1ch3LTgohLYVdaucnUBaqB5rO1etFfbgopirnSgtdGEL/
 KI/w==
X-Gm-Message-State: ABy/qLY6fv9fB8ZwJOvi1prNGJAFhDeooHGehsHfI2aUNO1piwWw5I9b
 mM1gYQOVIIxU4Z4hv5MpgcxndZXxIOzQ8tMgU38q8g==
X-Google-Smtp-Source: APBJJlFcz0+ghm9otHEpUqdVce10Pi/3HF+0jfi+Hrk+wCAHA7FaJl+c9YO9F6QBwHlF/TT+Pfyi9g==
X-Received: by 2002:ac2:4db8:0:b0:4fb:fe97:5e35 with SMTP id
 h24-20020ac24db8000000b004fbfe975e35mr22608lfe.47.1690815384880; 
 Mon, 31 Jul 2023 07:56:24 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com.
 [209.85.208.181]) by smtp.gmail.com with ESMTPSA id
 q16-20020ac24a70000000b004fcdf5aff11sm2107322lfp.34.2023.07.31.07.56.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 07:56:24 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so58714931fa.2
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 07:56:24 -0700 (PDT)
X-Received: by 2002:a2e:805a:0:b0:2b9:35ae:c9ac with SMTP id
 p26-20020a2e805a000000b002b935aec9acmr149588ljg.2.1690815383754; Mon, 31 Jul
 2023 07:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230726202838.1931660-1-christian@aperture.us>
 <20230726202838.1931660-3-christian@aperture.us>
 <a9b895f5-5136-6d92-34a7-ada38a3da21f@benettiengineering.com>
 <20230731164321.615664d5@windsurf>
In-Reply-To: <20230731164321.615664d5@windsurf>
Date: Mon, 31 Jul 2023 07:56:13 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pz8HTe3DRdSkrh1CwwDy427YWJJBcXN_gh-mPmkPU0WQ@mail.gmail.com>
Message-ID: <CA+h8R2pz8HTe3DRdSkrh1CwwDy427YWJJBcXN_gh-mPmkPU0WQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690815385; x=1691420185;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PqZ706SzO+3t4gRttFRHYPWdi55OMeGbfv1326fx6rI=;
 b=MhF9+8w0bQo2DdNMdoThmO7QqtCYRvd4J34REXo64hUjuQUqEO38KERHwue6S4Nb66
 kVMtLgXyFUHEYJ1r2QDbY7A7lWQjmNx1WVw7sdTO10MaT0B2I1fTuMnT+IbdtNkfEXyL
 cOhUxHb+mlhsrEjdyOzOcsMw76TdXJgY0SPoWCg1QUVdJJg5RJINrfU/Jc7YqAX//pSq
 98+v3rRnxCEd1j2MXOecoRxVLJZTVzc6FI0q5r+80XsKxBMI+RYCHBLN0pwQkNqf9J78
 1XZl9k1+G1oBJUJeZuT+f1Ayv+t73hHm1Ktvd3v7TFIIYbK8N+xnIjYQJsNtFfO/jY4M
 4DSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=MhF9+8w0
Subject: Re: [Buildroot] [PATCH v1 3/3] boot/uboot: add host-python-pylibfdt
 dependency if needed
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5134807784494917752=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5134807784494917752==
Content-Type: multipart/alternative; boundary="00000000000054612f0601c9a241"

--00000000000054612f0601c9a241
Content-Type: text/plain; charset="UTF-8"

Thomas,

On Mon, Jul 31, 2023, 7:43 AM Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> On Mon, 31 Jul 2023 16:10:48 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>
> > U-Boot approach for this is to force Python3 to build libfdtpy[1]
> > but what we experience here is a consequence of Buildroot's commit
> > 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33 [2]
> >
> > Something happens after that patch has been applied that basically
> > passes Buildroot's host dtc to UBOOT_MAKE_OPTS:
> > ```
> > UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
> > ```
> > The root cause seems to be Python3 anyway as U-Boot patch points.
> >
> > Since we can't patch every U-Boot version we could fix Python3 but
> > using the approach proposed by Christian is easier to be honest.
> >
> > To prove it's a Python3 issue you can see from one of my Gitlab-CI
> > failure[3] that various U-Boot versions are different, not the last
> > one(2023.07).
>
> Hm, thanks for your feedback, but even after reading 3 times your
> e-mail, I still don't grasp what's going on. You've pointed out that
> Buildroot commit 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33 is when build
> failures starting to occur. But what's the relationship between setting
> DTC and U-Boot having issues finding pylibfdt?
>

If DTC is set the uboot makefile attempts to use the external python
package instead of building the internal one

Best,
Christian

--00000000000054612f0601c9a241
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thomas,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jul 31, 2023, 7:43 AM Thomas Petazzon=
i &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@boot=
lin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 31 J=
ul 2023 16:10:48 +0200<br>
Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com"=
 target=3D"_blank" rel=3D"noreferrer">giulio.benetti@benettiengineering.com=
</a>&gt; wrote:<br>
<br>
&gt; U-Boot approach for this is to force Python3 to build libfdtpy[1]<br>
&gt; but what we experience here is a consequence of Buildroot&#39;s commit=
 <br>
&gt; 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33 [2]<br>
&gt; <br>
&gt; Something happens after that patch has been applied that basically<br>
&gt; passes Buildroot&#39;s host dtc to UBOOT_MAKE_OPTS:<br>
&gt; ```<br>
&gt; UBOOT_MAKE_OPTS +=3D DTC=3D$(HOST_DIR)/bin/dtc<br>
&gt; ```<br>
&gt; The root cause seems to be Python3 anyway as U-Boot patch points.<br>
&gt; <br>
&gt; Since we can&#39;t patch every U-Boot version we could fix Python3 but=
<br>
&gt; using the approach proposed by Christian is easier to be honest.<br>
&gt; <br>
&gt; To prove it&#39;s a Python3 issue you can see from one of my Gitlab-CI=
<br>
&gt; failure[3] that various U-Boot versions are different, not the last<br=
>
&gt; one(2023.07).<br>
<br>
Hm, thanks for your feedback, but even after reading 3 times your<br>
e-mail, I still don&#39;t grasp what&#39;s going on. You&#39;ve pointed out=
 that<br>
Buildroot commit 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33 is when build<br>
failures starting to occur. But what&#39;s the relationship between setting=
<br>
DTC and U-Boot having issues finding pylibfdt?<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">If DTC is set the uboot makef=
ile attempts to use the external python package instead of building the int=
ernal one</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best,</div><di=
v dir=3D"auto">Christian</div></div>

--00000000000054612f0601c9a241--

--===============5134807784494917752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5134807784494917752==--
