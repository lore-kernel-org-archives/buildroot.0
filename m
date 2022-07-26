Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD64BC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 15:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 624C740158;
	Tue, 26 Jul 2022 15:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 624C740158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z5KFXsjr8hkX; Tue, 26 Jul 2022 15:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00FE54016A;
	Tue, 26 Jul 2022 15:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00FE54016A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B9A5D1BF5A2
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9249D4016A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 15:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9249D4016A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5b9RDEaVWPSy for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 15:47:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E76B340158
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E76B340158
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 15:47:43 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w5so5791699edd.13
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 08:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LvNvnxPx7syqaKuVhDe8B8bDSe529ZM8DTg3Bg7qLsw=;
 b=Ry1GNGc19/WWGt/BdrweIS83kzMW4TFtLvLxg2499K+q1N9yt8korHMcokY33Fr4Je
 J6oggFXksDFPdZR3Fi1TzxhamI88z0BZbwflKTgKOqCvTgHmaXMNyoCVSx23p2juGULF
 WJTMD2XH5JY1TPlRfE2kFmx9lQB4s3tx99rgpeziCQ5eAGh8Cf6OuJ0oN3mh+agQ04cJ
 hiuMpFenxlBqFT56ZxKm9DTZI8ZGRQKNRW3ikay7gTvgxZOuSK0ZikfhBSoxRogqpd8G
 bHOHZo5joMTRqjsmKqOtjTlgQUGpH1/dy3WCE0y4Hkyw8TFwLaGSDXMOg+cgJu9PzYbE
 NFaQ==
X-Gm-Message-State: AJIora+z7QbWpWjoRu9qLnnclO04UrGN5LP+AWQsxEuDjZ2Gr+S03hLi
 mmJStlFVuXVb/Fkthu72GxT9LrmTpNo+e3TsWNXKLKVKs0k=
X-Google-Smtp-Source: AGRyM1td/c8e6XrKE2dvnME9XKGgpBrVgZt4wD3/pPi9lLvfAsfelCYTgAfF2EcTofu/sNDm6/Pk9Yg2gEZ2y4X8Rhw=
X-Received: by 2002:a05:6402:3293:b0:43b:c82a:1a45 with SMTP id
 f19-20020a056402329300b0043bc82a1a45mr19131421eda.349.1658850461861; Tue, 26
 Jul 2022 08:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220726145646.1894310-1-nicolas.tran@smile.fr>
 <2a53c4f3-b7a2-f66e-e4c7-992e2f8d9de4@theobroma-systems.com>
In-Reply-To: <2a53c4f3-b7a2-f66e-e4c7-992e2f8d9de4@theobroma-systems.com>
From: Nicolas TRAN <nicolas.tran@smile.fr>
Date: Tue, 26 Jul 2022 17:47:26 +0200
Message-ID: <CAJdGGv4KiB=RYu-awg8DQyF3dYdpZRWFQ0bGTS5tiSb_v7O3xg@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LvNvnxPx7syqaKuVhDe8B8bDSe529ZM8DTg3Bg7qLsw=;
 b=sdbR5k+wWkUI0CXSdNlXwPvA26KIkLjG/Hz5WULN2Q6J5iH4/jq8wWV/kmoovpNJ2e
 CSr+o7VbhoOzvYcoogDgAkezQ4RTD0yh7T2S4yqZTgrMGNA/74LCzxkYfpsBnbDW3GcD
 f/jj77Bn5f1QIQ7vQJEW56L/cI9LbkGFYo01LdW+3jueeLZfe5iEvcIMI00zSAOsNaVP
 i3ANWc5OQ0tOFZypesDjHiN2SmTwmTB06WdEWyRrwL8AwUdzfSgxcwpTMuEHdW3K2dy2
 K37/EqV0cOaeWnh6jahGJ2+9tr8hheKxOD2rQrBAbalskQvA2x8knoJ+S8NiD1hJ4Su+
 ln5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=sdbR5k+w
Subject: Re: [Buildroot] [PATCH 1/1] new package: package/dust
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
Content-Type: multipart/mixed; boundary="===============1177707799159425578=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1177707799159425578==
Content-Type: multipart/alternative; boundary="00000000000083dc3605e4b738da"

--00000000000083dc3605e4b738da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Quentin,
Thanks for your review! I have been using dust on Buildroot for a while now
and I missed the release version of the package before patching it. (What a
shame!)
Also, this was supposed to be my SoB. I'm relatively new to Buildroot and
I didn't understand where it was supposed to be located. Now, I get it.
I will be sending another patch very soon. Thank you.

Yours,
Nicolas

On Tue, Jul 26, 2022 at 5:13 PM Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Nicolas,
>
> On 7/26/22 16:56, Nicolas Tran wrote:
> > dust is an alternative of the command du from the Linux kernel,
> > written in Rust. It aims to be more intuitive and visual in order
> > to give the user a better view of his system's storage capacity.
> >
> > ---
>
> I think git am will not like this separator and have the commit log stop
> here instead of including the rest til the next separator (with your
> SoB). Maybe -- would be enough, or move this after the other separator
> before the list of modified files?
>
> > The package has been checked with correct formatting and
> > without typos:
> > $ ./utils/check-package package/dust/*
> >
> > Tests have been run using test-pkg:
> > $ ./utils/test-pkg -c dust.config -p dust
> >
> > test-pkg config:
> > To run the test, the file dust.config contains the following line
> > BR2_PACKAGE_DUST=3Dy
> >
> > Results:
> >       bootlin-armv5-uclibc [1/6]: SKIPPED
> >        bootlin-armv7-glibc [2/6]: OK
> >      bootlin-armv7m-uclibc [3/6]: SKIPPED
> >        bootlin-x86-64-musl [4/6]: OK
> >         br-arm-full-static [5/6]: SKIPPED
> >               sourcery-arm [6/6]: OK
> >
> > Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
> > ---
> >   DEVELOPERS             |  1 +
> >   package/Config.in      |  1 +
> >   package/dust/Config.in | 12 ++++++++++++
> >   package/dust/dust.hash |  3 +++
> >   package/dust/dust.mk   | 12 ++++++++++++
> >   5 files changed, 29 insertions(+)
> >   create mode 100644 package/dust/Config.in
> >   create mode 100644 package/dust/dust.hash
> >   create mode 100644 package/dust/dust.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 1dede4b83b..7a0fa47595 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2180,6 +2180,7 @@ F:      package/ofono/
> >
> >   N:  Nicolas Tran <nicolas.tran@smile.fr>
> >   F:  package/hyperfine/
> > +F:  package/dust/
> >
> >   N:  Niklas Cassel <niklas.cassel@wdc.com>
> >   F:  configs/qemu_riscv64_nommu_virt_defconfig
> > diff --git a/package/Config.in b/package/Config.in
> > index d264449b30..a283fadc41 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -210,6 +210,7 @@ menu "Filesystem and flash utilities"
> >       source "package/curlftpfs/Config.in"
> >       source "package/davfs2/Config.in"
> >       source "package/dosfstools/Config.in"
> > +     source "package/dust/Config.in"
> >       source "package/e2fsprogs/Config.in"
> >       source "package/e2tools/Config.in"
> >       source "package/ecryptfs-utils/Config.in"
> > diff --git a/package/dust/Config.in b/package/dust/Config.in
> > new file mode 100644
> > index 0000000000..c02cf1aa83
> > --- /dev/null
> > +++ b/package/dust/Config.in
> > @@ -0,0 +1,12 @@
> > +config BR2_PACKAGE_DUST
> > +     bool "dust"
> > +     depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
> > +     depends on BR2_INSTALL_LIBSTDCPP # host-rustc
> > +     select BR2_PACKAGE_HOST_RUSTC
> > +     help
> > +       dust is an alternative written in Rust of the command "du"
> > +       from the Linux kernel. It aims to be more intuitive and visual
> > +       in order to give the user a better view of his system's
> > +       current storage capacity.
> > +
> > +
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_bootand=
y_dust.git&d=3DDwICAg&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIzVmkNPvw5y=
mA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DqKkjyC6yAxeKvJmYdNlsDzDhFdDO=
0vSahgOTnZgBDNPKmYuAGOdkwdWdM3O_CAAt&s=3DgH07_ilQO9wqi8bv07RYANita8mpsOhdq7=
k__dVsOqg&e=3D
> > diff --git a/package/dust/dust.hash b/package/dust/dust.hash
> > new file mode 100644
> > index 0000000000..82043b497d
> > --- /dev/null
> > +++ b/package/dust/dust.hash
> > @@ -0,0 +1,3 @@
> > +# Locally computed
> > +sha256
> 8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19789bebde
> dust-0.8.1.tar.gz
> > +sha256
> c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
> > diff --git a/package/dust/dust.mk b/package/dust/dust.mk
> > new file mode 100644
> > index 0000000000..a889d64f56
> > --- /dev/null
> > +++ b/package/dust/dust.mk
> > @@ -0,0 +1,12 @@
> >
> +########################################################################=
########
> > +#
> > +# dust
> > +#
> >
> +########################################################################=
########
> > +
> > +DUST_VERSION =3D 0.8.1
> > +DUST_SITE =3D $(call github,bootandy,dust,v$(DUST_VERSION)-alpha.2)
>
> There's a v0.8.1 released about two weeks ago, better use it instead of
> alpha.2?
>
> Cheers,
> Quentin
>

--00000000000083dc3605e4b738da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Quentin,</div><div>Thanks for your review! I ha=
ve been using dust on Buildroot for a while now</div><div>and I missed the =
release version of the package before patching it. (What a shame!)<br></div=
><div>Also, this was supposed to be my SoB. I&#39;m relatively new to Build=
root and</div><div>I didn&#39;t understand where it was supposed to be loca=
ted. Now, I get it.</div><div>I will be sending another patch very soon. Th=
ank you.<br></div><div><br></div><div>Yours,</div><div>Nicolas<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Jul 26, 2022 at 5:13 PM Quentin Schulz &lt;<a href=3D"mailto:quentin.s=
chulz@theobroma-systems.com">quentin.schulz@theobroma-systems.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Nicolas=
,<br>
<br>
On 7/26/22 16:56, Nicolas Tran wrote:<br>
&gt; dust is an alternative of the command du from the Linux kernel,<br>
&gt; written in Rust. It aims to be more intuitive and visual in order<br>
&gt; to give the user a better view of his system&#39;s storage capacity.<b=
r>
&gt; <br>
&gt; ---<br>
<br>
I think git am will not like this separator and have the commit log stop <b=
r>
here instead of including the rest til the next separator (with your <br>
SoB). Maybe -- would be enough, or move this after the other separator <br>
before the list of modified files?<br>
<br>
&gt; The package has been checked with correct formatting and<br>
&gt; without typos:<br>
&gt; $ ./utils/check-package package/dust/*<br>
&gt; <br>
&gt; Tests have been run using test-pkg:<br>
&gt; $ ./utils/test-pkg -c dust.config -p dust<br>
&gt; <br>
&gt; test-pkg config:<br>
&gt; To run the test, the file dust.config contains the following line<br>
&gt; BR2_PACKAGE_DUST=3Dy<br>
&gt; <br>
&gt; Results:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bootlin-armv5-uclibc [1/6]: SKIPPED<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 bootlin-armv7-glibc [2/6]: OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bootlin-armv7m-uclibc [3/6]: SKIPPED<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 bootlin-x86-64-musl [4/6]: OK<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br-arm-full-static [5/6]: SKIPPED<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sourcery-arm [6/=
6]: OK<br>
&gt; <br>
&gt; Signed-off-by: Nicolas Tran &lt;<a href=3D"mailto:nicolas.tran@smile.f=
r" target=3D"_blank">nicolas.tran@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0package/Config.in=C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0package/dust/Config.in | 12 ++++++++++++<br>
&gt;=C2=A0 =C2=A0package/dust/dust.hash |=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A0package/dust/<a href=3D"http://dust.mk" rel=3D"noreferrer"=
 target=3D"_blank">dust.mk</a>=C2=A0 =C2=A0| 12 ++++++++++++<br>
&gt;=C2=A0 =C2=A05 files changed, 29 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/dust/Config.in<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/dust/dust.hash<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/dust/<a href=3D"http://dust.mk"=
 rel=3D"noreferrer" target=3D"_blank">dust.mk</a><br>
&gt; <br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; index 1dede4b83b..7a0fa47595 100644<br>
&gt; --- a/DEVELOPERS<br>
&gt; +++ b/DEVELOPERS<br>
&gt; @@ -2180,6 +2180,7 @@ F:=C2=A0 =C2=A0 =C2=A0 package/ofono/<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0N:=C2=A0 Nicolas Tran &lt;<a href=3D"mailto:nicolas.tran@s=
mile.fr" target=3D"_blank">nicolas.tran@smile.fr</a>&gt;<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/hyperfine/<br>
&gt; +F:=C2=A0 package/dust/<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0N:=C2=A0 Niklas Cassel &lt;<a href=3D"mailto:niklas.cassel=
@wdc.com" target=3D"_blank">niklas.cassel@wdc.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 configs/qemu_riscv64_nommu_virt_defconfig<br>
&gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; index d264449b30..a283fadc41 100644<br>
&gt; --- a/package/Config.in<br>
&gt; +++ b/package/Config.in<br>
&gt; @@ -210,6 +210,7 @@ menu &quot;Filesystem and flash utilities&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/curlftpfs/Config.in&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/davfs2/Config.in&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/dosfstools/Config.in&qu=
ot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0source &quot;package/dust/Config.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/e2fsprogs/Config.in&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/e2tools/Config.in&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/ecryptfs-utils/Config.i=
n&quot;<br>
&gt; diff --git a/package/dust/Config.in b/package/dust/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c02cf1aa83<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/dust/Config.in<br>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +config BR2_PACKAGE_DUST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;dust&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUP=
PORTS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP # host-rustc<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_RUSTC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dust is an alternative written in Rust of =
the command &quot;du&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0from the Linux kernel. It aims to be more =
intuitive and visual<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0in order to give the user a better view of=
 his system&#39;s<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0current storage capacity.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://urldefense.proofpoint.c=
om/v2/url?u=3Dhttps-3A__github.com_bootandy_dust.git&amp;d=3DDwICAg&amp;c=
=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZ=
Z4njZguQhZhkI_-172IIy1t&amp;m=3DqKkjyC6yAxeKvJmYdNlsDzDhFdDO0vSahgOTnZgBDNP=
KmYuAGOdkwdWdM3O_CAAt&amp;s=3DgH07_ilQO9wqi8bv07RYANita8mpsOhdq7k__dVsOqg&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__github.com_bootandy_dust.git&amp;d=3DDwICAg&amp;c=
=3D_sEr5x9kUWhuk4_nFwjJtA&amp;r=3DLYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZ=
Z4njZguQhZhkI_-172IIy1t&amp;m=3DqKkjyC6yAxeKvJmYdNlsDzDhFdDO0vSahgOTnZgBDNP=
KmYuAGOdkwdWdM3O_CAAt&amp;s=3DgH07_ilQO9wqi8bv07RYANita8mpsOhdq7k__dVsOqg&a=
mp;e=3D</a><br>
&gt; diff --git a/package/dust/dust.hash b/package/dust/dust.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..82043b497d<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/dust/dust.hash<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +# Locally computed<br>
&gt; +sha256=C2=A0 8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19=
789bebde=C2=A0 dust-0.8.1.tar.gz<br>
&gt; +sha256=C2=A0 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dc=
f35d0ab4=C2=A0 LICENSE<br>
&gt; diff --git a/package/dust/<a href=3D"http://dust.mk" rel=3D"noreferrer=
" target=3D"_blank">dust.mk</a> b/package/dust/<a href=3D"http://dust.mk" r=
el=3D"noreferrer" target=3D"_blank">dust.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a889d64f56<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/dust/<a href=3D"http://dust.mk" rel=3D"noreferrer" targe=
t=3D"_blank">dust.mk</a><br>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# dust<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +DUST_VERSION =3D 0.8.1<br>
&gt; +DUST_SITE =3D $(call github,bootandy,dust,v$(DUST_VERSION)-alpha.2)<b=
r>
<br>
There&#39;s a v0.8.1 released about two weeks ago, better use it instead of=
 <br>
alpha.2?<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div>

--00000000000083dc3605e4b738da--

--===============1177707799159425578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1177707799159425578==--
