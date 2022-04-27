Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E304C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 06:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 941BB82FAE;
	Wed, 27 Apr 2022 06:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5N7Tc_DzyND7; Wed, 27 Apr 2022 06:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADA5682EB5;
	Wed, 27 Apr 2022 06:22:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9241E1BF831
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 06:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F0494195F
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 06:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nR_uZ-nfl_D for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 06:22:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80C104195E
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 06:22:38 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id e15so1694368iob.3
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 23:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a8HRPrlsew+NPGZF0sr7X4BT/xfHstPE4ikQ9FvGKUU=;
 b=jgQQ0FuKhql3SzlSBnbD5CCEj6XIv1AeUE/ND+hT/Jz600D3amLrfU0cxP96WggaKd
 TZ8RphxkWdWR0RYFa+yoI3ZvkDs6haPnoxEUthr2H6RBfN2JmgK1VggDCrp//sn4xgs6
 I3jCu4SGl9cqhe3NLR8O0ZSeIfMM53FuAyyN4srY/iq6nqcrl78BUPC63+T6fVrEyvoh
 5ktDz+McjRsUJZUfSSZJjnUOiGezGDr5ATiS+BnBQN9lMHdUds//TuCwFrJn7PIHNwCX
 0LJSzMAPeQx8FlykWapwCA5+0uk02mzhOsc8ePLJwkUtfsCa+YTA0aBBXxRjBekClBeZ
 ajxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a8HRPrlsew+NPGZF0sr7X4BT/xfHstPE4ikQ9FvGKUU=;
 b=tkhQGaDRbqQZF8NjirMDeCI/qGRb0FiPdSJaeVr87WOULS1fih1fmcGfL2GFPKEwu5
 LSI6PMAZjkQwAQLpqDp/hR/TPZuGoJXA+sxN2DawhJDZg15mWUpzxL4+Mvt2870I1o1S
 0srra102tX1WVTupBJgZmCz/A5mcShCEzCFkqIfZe5manxVcK1TzWW4lXDEiIdKFALCl
 8j5v8h49H5PWrlnOA//ZuW6xRqCauRnN1/c3k/2j6OtvR633uyKxrsC1jU7bMVyRa9i1
 F4ggbpfevbgJqtED9lDoEXzcNaJ1sT0HEUllymoZxgzRmrXxS2jPJSSDN7uU3HyjvhSm
 8DCA==
X-Gm-Message-State: AOAM530bxnrTTBL4iIqe5q0dq0vFZN41W4z23ZKrV1X5wq9OJ1Uhgyci
 MtVFopHQC1I/FnT0bMfKJ7flFNtsgSd9EQreN32ssHtkjFU=
X-Google-Smtp-Source: ABdhPJwaM1XAUnfJIiTUB08PzrmoqqPg1bsZolcTc2zGhobke329vHOmXE11N5cnyayWn4kVohpaoNvB3MVEUQioQYE=
X-Received: by 2002:a92:db0e:0:b0:2cc:2590:767b with SMTP id
 b14-20020a92db0e000000b002cc2590767bmr11049136iln.260.1651040557407; Tue, 26
 Apr 2022 23:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220426132833.1579873-1-salvador.joseluis@gmail.com>
 <87bkwn21vp.fsf@tarshish> <20220427000159.58749c28@windsurf>
In-Reply-To: <20220427000159.58749c28@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Wed, 27 Apr 2022 08:22:26 +0200
Message-ID: <CAH+XeQauT5dPqNhG0ykmoWK5Oo90h8bx7TV_=50+7Nxy6JJSnQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/prerequisite.txt: add
 diffutils
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4700424938564015866=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4700424938564015866==
Content-Type: multipart/alternative; boundary="000000000000ef242205dd9cd548"

--000000000000ef242205dd9cd548
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

El mi=C3=A9, 27 abr 2022 a las 0:02, Thomas Petazzoni (<
thomas.petazzoni@bootlin.com>) escribi=C3=B3:

> Hello,
>
> On Tue, 26 Apr 2022 20:16:12 +0300
> Baruch Siach via buildroot <buildroot@buildroot.org> wrote:
>
> > Hi Jos=C3=A9,
> >
> > On Tue, Apr 26 2022, Jos=C3=A9 Luis Salvador Rufo wrote:
> > > Patch title: docs/manual/prerequisite.txt: add diffutils
> >
> > No need for this line in the commit log body. The email subject line
> > appears as head line of the git commit once applied.
>
> Yep.
>
> > > The command `cmp` is used by `package/pkg-generic.mk` at commit
> > > 8623cc5deb5. This command is provided by `diffutils`.
> >
> > Actually, we have host-diffutils, so we can build cmp if the host does
> > not have it installed. All we need is support added under
> > support/dependencies/ like a few other utilities.
>
> Yes, but we're not going to build host-diffutils if cmp is missing.
> It's not done in our current implementation, and I don't think we want
> to do that. So it seems like diffutils is indeed a hard requirement.
>
> > We also don't list findutils as prerequisite, even though we rely
> > heavily on the 'find' utility.
>
> So perhaps we should list findutils as well in our hard requirements?
>

Seems fair, IMHO.


>
> Jos=C3=A9 Luis: practically speaking, with which distribution have you be=
en
> able to get a system without diffutils/findutils installed by default?


Docker official Archlinux image. On other hand `findutils` is installed by
default in this image.

```shell
=E2=9D=AF docker pull archlinux:latest
latest: Pulling from library/archlinux
b65db44913f6: Pull complete
beb98d5a80d3: Pull complete
Digest:
sha256:a9a59155d8cfd44d01432a1ef011dc015ff96e970adf787b632229fd637ea98c
Status: Downloaded newer image for archlinux:latest
docker.io/library/archlinux:latest

=E2=9D=AF docker run -it --rm archlinux:latest
[root@354a655ce3f9 /]# pacman -Qi diffutils
warning: database file for 'core' does not exist (use '-Sy' to download)
warning: database file for 'extra' does not exist (use '-Sy' to download)
warning: database file for 'community' does not exist (use '-Sy' to
download)
error: package 'diffutils' was not found
[root@354a655ce3f9 /]# pacman -Qi findutils
warning: database file for 'core' does not exist (use '-Sy' to download)
warning: database file for 'extra' does not exist (use '-Sy' to download)
warning: database file for 'community' does not exist (use '-Sy' to
download)
Name            : findutils
Version         : 4.9.0-1
Description     : GNU utilities to locate files
Architecture    : x86_64
URL             : https://www.gnu.org/software/findutils/
Licenses        : GPL3
Groups          : base-devel
Provides        : None
Depends On      : glibc  sh
Optional Deps   : None
Required By     : base  ca-certificates-utils
Optional For    : None
Conflicts With  : None
Replaces        : None
Installed Size  : 1416.31 KiB
Packager        : Tobias Powalowski <tpowa@archlinux.org>
Build Date      : Wed 02 Feb 2022 05:55:26 AM UTC
Install Date    : Sun 24 Apr 2022 12:04:13 AM UTC
Install Reason  : Installed as a dependency for another package
Install Script  : No
Validated By    : Signature
```

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000ef242205dd9cd548
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello=C2=A0Thomas,</div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El mi=C3=A9, 27 abr 202=
2 a las 0:02, Thomas Petazzoni (&lt;<a href=3D"mailto:thomas.petazzoni@boot=
lin.com">thomas.petazzoni@bootlin.com</a>&gt;) escribi=C3=B3:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Tue, 26 Apr 2022 20:16:12 +0300<br>
Baruch Siach via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.org" t=
arget=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
<br>
&gt; Hi Jos=C3=A9,<br>
&gt; <br>
&gt; On Tue, Apr 26 2022, Jos=C3=A9 Luis Salvador Rufo wrote:<br>
&gt; &gt; Patch title: docs/manual/prerequisite.txt: add diffutils=C2=A0 <b=
r>
&gt; <br>
&gt; No need for this line in the commit log body. The email subject line<b=
r>
&gt; appears as head line of the git commit once applied.<br>
<br>
Yep.<br>
<br>
&gt; &gt; The command `cmp` is used by `package/<a href=3D"http://pkg-gener=
ic.mk" rel=3D"noreferrer" target=3D"_blank">pkg-generic.mk</a>` at commit<b=
r>
&gt; &gt; 8623cc5deb5. This command is provided by `diffutils`.=C2=A0 <br>
&gt; <br>
&gt; Actually, we have host-diffutils, so we can build cmp if the host does=
<br>
&gt; not have it installed. All we need is support added under<br>
&gt; support/dependencies/ like a few other utilities.<br>
<br>
Yes, but we&#39;re not going to build host-diffutils if cmp is missing.<br>
It&#39;s not done in our current implementation, and I don&#39;t think we w=
ant<br>
to do that. So it seems like diffutils is indeed a hard requirement.<br>
<br>
&gt; We also don&#39;t list findutils as prerequisite, even though we rely<=
br>
&gt; heavily on the &#39;find&#39; utility.<br>
<br>
So perhaps we should list findutils as well in our hard requirements?<br></=
blockquote><div>=C2=A0</div><div>Seems fair, IMHO.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Jos=C3=A9 Luis: practically speaking, with which distribution have you been=
<br>
able to get a system without diffutils/findutils installed by default?</blo=
ckquote><div>=C2=A0</div><div>Docker official Archlinux image. On other han=
d `findutils` is installed by default in this image.</div><div><br></div><d=
iv>```shell</div><div>=E2=9D=AF docker pull archlinux:latest<br>latest: Pul=
ling from library/archlinux<br>b65db44913f6: Pull complete<br>beb98d5a80d3:=
 Pull complete<br>Digest: sha256:a9a59155d8cfd44d01432a1ef011dc015ff96e970a=
df787b632229fd637ea98c<br>Status: Downloaded newer image for archlinux:late=
st<br><a href=3D"http://docker.io/library/archlinux:latest">docker.io/libra=
ry/archlinux:latest</a><br><br>=E2=9D=AF docker run -it --rm archlinux:late=
st<br>[root@354a655ce3f9 /]# pacman -Qi diffutils<br>warning: database file=
 for &#39;core&#39; does not exist (use &#39;-Sy&#39; to download)<br>warni=
ng: database file for &#39;extra&#39; does not exist (use &#39;-Sy&#39; to =
download)<br>warning: database file for &#39;community&#39; does not exist =
(use &#39;-Sy&#39; to download)<br>error: package &#39;diffutils&#39; was n=
ot found<br>[root@354a655ce3f9 /]# pacman -Qi findutils<br>warning: databas=
e file for &#39;core&#39; does not exist (use &#39;-Sy&#39; to download)<br=
>warning: database file for &#39;extra&#39; does not exist (use &#39;-Sy&#3=
9; to download)<br>warning: database file for &#39;community&#39; does not =
exist (use &#39;-Sy&#39; to download)<br>Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0: findutils<br>Version =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 4.9.0-1<b=
r>Description =C2=A0 =C2=A0 : GNU utilities to locate files<br>Architecture=
 =C2=A0 =C2=A0: x86_64<br>URL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : <=
a href=3D"https://www.gnu.org/software/findutils/">https://www.gnu.org/soft=
ware/findutils/</a><br>Licenses =C2=A0 =C2=A0 =C2=A0 =C2=A0: GPL3<br>Groups=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: base-devel<br>Provides =C2=A0 =C2=A0 =
=C2=A0 =C2=A0: None<br>Depends On =C2=A0 =C2=A0 =C2=A0: glibc =C2=A0sh<br>O=
ptional Deps =C2=A0 : None<br>Required By =C2=A0 =C2=A0 : base =C2=A0ca-cer=
tificates-utils<br>Optional For =C2=A0 =C2=A0: None<br>Conflicts With =C2=
=A0: None<br>Replaces =C2=A0 =C2=A0 =C2=A0 =C2=A0: None<br>Installed Size =
=C2=A0: 1416.31 KiB<br>Packager =C2=A0 =C2=A0 =C2=A0 =C2=A0: Tobias Powalow=
ski &lt;<a href=3D"mailto:tpowa@archlinux.org">tpowa@archlinux.org</a>&gt;<=
br>Build Date =C2=A0 =C2=A0 =C2=A0: Wed 02 Feb 2022 05:55:26 AM UTC<br>Inst=
all Date =C2=A0 =C2=A0: Sun 24 Apr 2022 12:04:13 AM UTC<br>Install Reason =
=C2=A0: Installed as a dependency for another package<br>Install Script =C2=
=A0: No<br>Validated By =C2=A0 =C2=A0: Signature<br></div><div>```<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000ef242205dd9cd548--

--===============4700424938564015866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4700424938564015866==--
