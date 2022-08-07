Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5D7C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 16:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06B20827AA;
	Sun,  7 Aug 2022 16:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06B20827AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8dShEGFkDDGv; Sun,  7 Aug 2022 16:50:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA09827A5;
	Sun,  7 Aug 2022 16:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CA09827A5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64DB31BF681
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D13660B2B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 16:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D13660B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXuvsusGHyyM for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 16:50:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B339A60B26
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B339A60B26
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 16:50:33 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id o15so10455006yba.10
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 09:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=0FLDepH7EmmePQT3sr2nQOOzA2UPWC1QoJuNGWH/iGg=;
 b=26FFkMvNOPY63JlZeVgkXNDw6NFGu3r4BBnfu6Sb6y4f9Mv+S5yIzTp6O8SP9e/kmY
 f0pEJCFnTiP8DlKoFFu4ExF/cegQpdTi/9OwsfYNUbonSuKcSKFmdkFzjfWysEE6qo2w
 Yo/vl9FxOy87Qqd1D6pykSM/surXNNxhAuPNTJoJZp7aHzlGbd6psfru45oDFBoNMvK6
 X78D8heixev7NpRez/NMogBG2LA87dO+gXUKLQSxUF7d5Odi8Rb1wKBC3g8LxtyOKa2j
 6YlkyZ7gu46K/D2vTnsMEAYQux6LCyDrG5qhUgCrIK0ylMfBsKFR+AeOLBppzWjEq0bc
 i2OA==
X-Gm-Message-State: ACgBeo2Zc3/qVMDzAYMB4SGD8PMs9aukGlkwMYMWijADj9/Xq9e8kgG4
 lvJZZDLJNbEVEk1afrOjumFF7rx33XjFkCemrS0=
X-Google-Smtp-Source: AA6agR7TZwJldYA63iq0J3d0Jgd/azOv3qg3WgKERfJ2ZFpzym4pLbeJFsicw9N8OkyVnJHbsRbffQtJhl+OdymjHEU=
X-Received: by 2002:a05:6902:1148:b0:67b:7301:62f4 with SMTP id
 p8-20020a056902114800b0067b730162f4mr12442529ybu.570.1659891032581; Sun, 07
 Aug 2022 09:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-3-emile.cormier.jr@gmail.com>
 <20220807165300.2137b391@windsurf>
 <CAM70yxD-pbF7awEqoP-y5kKG_VZj1oTXZYb8s-zw6rE_nAM5dw@mail.gmail.com>
 <20220807181000.4ad50de7@windsurf>
In-Reply-To: <20220807181000.4ad50de7@windsurf>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Sun, 7 Aug 2022 13:50:21 -0300
Message-ID: <CAM70yxAZVBfgD=12aQ2ZHn1b719Sko=+zn5M-L5QzObFUuWgzA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=0FLDepH7EmmePQT3sr2nQOOzA2UPWC1QoJuNGWH/iGg=;
 b=NPVrP+nXF8IC3FCSk5h2ZrnXVw/9DQgBnwvvp2MAv6jX0GOaMFfpE+946a4cSvizyr
 1b9YByaGKSz5agZIgMl8GHYK1cB+nXOp86yaUSM3f5KC5fI4v3pwJr39akPPCV8xlWrU
 KfoIyybvm4HKmgf6mNNanpZC8SbBqKiHM9/na9waQpHn+g0IrnJNqKNun07wILnNvMkl
 b3+4S34aCunlzF5mgAse5ooq52gdcyHulUD4K56u7YKBahFLFVIZ4TH5M8hjCqN/KDk1
 cxIbKeUl8jh/teIM43NHanpSNVqq8N76a6MgqAAswPrrJVX77bPdrgsuv7pESR3++rDg
 1u/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NPVrP+nX
Subject: Re: [Buildroot] [PATCH 3/6] package/python-zlmdb: add new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7236862558862168118=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7236862558862168118==
Content-Type: multipart/alternative; boundary="0000000000005ceb3b05e5a97f32"

--0000000000005ceb3b05e5a97f32
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 7, 2022 at 1:10 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Do you still have some time to comment on
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20220403221953.1158787-6-emile.cormier.jr@gmail.com/
> ? I was looking at it, and wanted to ask a few questions.
>

I'll try to answer your question as time allows. It's unfortunate this
wasn't done sooner while everything was still fresh in my mind, but I
understand that you might have had other priorities.

--0000000000005ceb3b05e5a97f32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, Aug 7, 2022 at 1:10 PM Thomas Petazzoni &lt;<a href=3D"mailt=
o:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Do you still ha=
ve some time to comment on<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20220403221=
953.1158787-6-emile.cormier.jr@gmail.com/" rel=3D"noreferrer" target=3D"_bl=
ank">https://patchwork.ozlabs.org/project/buildroot/patch/20220403221953.11=
58787-6-emile.cormier.jr@gmail.com/</a><br>
? I was looking at it, and wanted to ask a few questions.<br></blockquote><=
div><br></div><div>I&#39;ll try to answer your question as time allows. It&=
#39;s unfortunate this wasn&#39;t done sooner while everything was still fr=
esh in my mind, but I understand that you might have had other priorities.<=
br></div></div></div>

--0000000000005ceb3b05e5a97f32--

--===============7236862558862168118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7236862558862168118==--
