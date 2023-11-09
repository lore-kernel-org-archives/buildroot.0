Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067B6C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 15:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8788240127;
	Thu,  9 Nov 2023 15:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8788240127
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nO3sJkWinfWy; Thu,  9 Nov 2023 15:18:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 681CC40A56;
	Thu,  9 Nov 2023 15:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 681CC40A56
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D1661BF40A
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 15:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EB9141E98
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 15:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB9141E98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEeECpnqCZEc for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 15:18:53 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8782C41E97
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 15:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8782C41E97
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso156614766b.1
 for <buildroot@buildroot.org>; Thu, 09 Nov 2023 07:18:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699543131; x=1700147931;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dydSVXCoklMdF2bQYkcKhHAvYmZlu84Wi36+0X8t91U=;
 b=wIK1WoE/lTPnD3cmBOl9fU/US4j/pGlM2l/kM2hAmV1zojI3z7qY0SJL3NhiwUgqql
 oQzwe8pF618PjtymTP1MiDeMK9SCO0u1O12GI4Dg32yb5jQaVtRx563/SknBCPXDSApe
 eN+zOaHps/45Q6ZckzZM8TzN65PDqX9O7CY4NfN3xRm2C7fL677LP/aQ3l3zXVRGMK+Y
 LauF3jYE+qQGjXiorymkTx6WF07j900mRgEu3chQqgVpRIcoAIeX/9tBtr7InTfABOss
 DObMkT+9dLpVuqbK8PuGQ/dQ7SPgRhEmxtBPDbvPds4P8oNZlSHk3a3/sii4/3citoUS
 XF4g==
X-Gm-Message-State: AOJu0YzQgwOvshUnOiK+IAVHcasa+VXsFKJ0RrYHtuU8T2fx/4NQev7d
 FBI3M2cDvvi7iCuf2S35uQQIGRaRu/TUT83g7KirkTILBdY=
X-Google-Smtp-Source: AGHT+IFHhVejPOxMpNE+drbbNfxNrkIPUX1Eh31y+aPfzdoXljswrDtm4QfpI5WPch4DfITKThqVDSaH+PSCnf5K244=
X-Received: by 2002:a17:907:318e:b0:9e3:675f:e36b with SMTP id
 xe14-20020a170907318e00b009e3675fe36bmr3083750ejb.59.1699543130970; Thu, 09
 Nov 2023 07:18:50 -0800 (PST)
MIME-Version: 1.0
References: <20231018141155.533944-1-vfazio@gmail.com>
 <24b09b4b-98e9-4311-9cc1-977e60e351d6@mind.be>
In-Reply-To: <24b09b4b-98e9-4311-9cc1-977e60e351d6@mind.be>
From: Vincent Fazio <vfazio@gmail.com>
Date: Thu, 9 Nov 2023 09:18:39 -0600
Message-ID: <CAOrEah4weL=oLeTzx_19JjE+CY_p91Y3_OSp8--m6RWo3hrT6A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699543131; x=1700147931; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dydSVXCoklMdF2bQYkcKhHAvYmZlu84Wi36+0X8t91U=;
 b=FszRP3voHhnXHSNUtiD2MzDCkDlMsrFRttCEyCLB1dlvsLx0AzEVvt/PWz5dFcBjcb
 vgv11Wtl828tm7ZrGGMPdTialCnNxzjHWzCFXbQYfypa6SNqW8TcPKHdSyGaoG+/syWj
 uJXPBQKtSlfxOXGD1kzPn3usXuR5sQjLK/ke816lIoIvSUigB4uEC/c8SFFLNHR4/AvL
 8UyOUUW8qR22WgLto8m/vy9k3zB/vgjGMUYY4Z+3ILTIEIZk99jLYXWKTPRzpdvL5Om4
 knDlI2GaHvkx8kIOC9/0M2NHMN9TUGrQUNmn8fN1pG2GxmhVSAYfk+TIdk58ogEfeKQo
 ZBwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FszRP3vo
Subject: Re: [Buildroot] [PATCH 1/1] support/dependencies: bump minimal tar
 version to 1.35
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1845024283185568352=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1845024283185568352==
Content-Type: multipart/alternative; boundary="0000000000009a1ee00609b9b8da"

--0000000000009a1ee00609b9b8da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All

On Wed, Nov 8, 2023 at 3:01=E2=80=AFPM Arnout Vandecappelle <arnout@mind.be=
> wrote:

>   Hi Vincent,
>
> On 18/10/2023 16:11, Vincent Fazio wrote:
> > GNU tar 1.35 includes a breaking change [0] that changes the tar header
> > created for each regular file even for "stable" formats like pax (which
> > we use in support/download/helpers::mk_tar_gz).
> >
> > Previously, normal files had the devmajor/devminor fields of the header
> > filled with ASCII zero (0x30). These fields are now null which also
> > affects the checksum value in the header as well.
> >
> >    $ diff <(head -n 100 xxd.1.34.output) <(head -n 100 xxd.1.35.output)
> >    10c10
> >    < 00000090: 3037 3500 3031 3531 3637 0020 3000 0000  075.015167. 0..=
.
> >    ---
> >    > 00000090: 3037 3500 3031 3337 3237 0020 3000 0000  075.013727. 0..=
.
> >    21,22c21,22
> >    < 00000140: 0000 0000 0000 0000 0030 3030 3030 3030  .........000000=
0
> >    < 00000150: 0030 3030 3030 3030 0000 0000 0000 0000  .0000000.......=
.
> >    ---
> >    > 00000140: 0000 0000 0000 0000 0000 0000 0000 0000  ...............=
.
> >    > 00000150: 0000 0000 0000 0000 0000 0000 0000 0000  ...............=
.
> >
> > This has the consequence of causing hash mismatches for any tarball
> > created with a version prior to 1.35.
> >
> > Instead of reverting back to a host specific version (see 37a909cacf)
> > and adding a cap to the maximal tar version (see ec50e407be), just
> > establish that 1.35+ should be used going forward.
> >
> > This change requires an updated BR_FMT_VERSION for both git and svn.
> >
> > [0]
> https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D738de9ecdec45ebfeb=
999628742373b5f8253bd0
> >
> > Signed-off-by: Vincent Fazio <vfazio@gmail.com>
>
>   We discussed with 3 more maintainers (Peter, Romain and myself) and cam=
e
> to
> the conclusion that it is really too annoying that almost everybody would
> have
> to build host-tar (unconditionally!). At the moment, of the main distros,
> only
>


The host-tar package takes between 20-45 seconds to build. I don't see that
as overly burdensome on a build that can potentially take upwards of half
an hour.



> Fedora 39 (just released) and Arch Linux already have 1.35.
>
>

We're already in a situation where people are using the latest Arch and
encountering this (a colleague of Thomas in fact).
It's what drove the investigation in October and this patch. They were
using an older buildroot, so there's not much that can be done there.
It's not ideal, but we can document the limitation with distributions using
tar 1.35 and recommend utilizing a build container that uses a previous
version of tar.



>   The idea is to apply this "bump minimal tar" only when more major
> distros have
> switched to 1.35 or later. Or, perhaps with the additional time we find a=
n
> alternative that is hopefully more stable. I was thinking of switching to
> sharutils, for example - last release is from 2015 so very stable! :-)
>
>

Based on testing Yann did back in the day
(cbe95b1a455bbefcaa90a08cf3dd1a590630921e) the --format=3Dposix format has
been stable since at least GNU tar 1.27 released 10 years ago.
I did open an issue in GNU tar for this change and asked about the
guarantee of stability: https://savannah.gnu.org/bugs/index.php?64875
Pending the outcome of that issue, we can maybe not do anything for now
except recommend against using distros with tar 1.35

I personally think it's better to do the bump and account for the behavior
change now. The build of host-tar 1.35 will eventually not be required as
the new version is adopted by distros vs sticking with 1.34 and then slowly
forcing more builds of older tar on newer distros.



>
  So, for the time being, we can do the following:
>
> - in check-host-tar.sh, check that system tar < 1.35;
> - in package/tar, add a patch that reverts 738de9ecde (probably need to
> revert
> c3663838 as well).
>


I don't agree with reverting these commits in 1.35 as it causes
functionally different behavior between BR built tar and distribution built
tar on the same version.
The only way to guarantee previous/stable behavior would be to _always_ use
BR built tar with reverts, which you didn't want to do above.

It would also make the recipe a bit funky, where we're specifically
applying a patch to 1.35 for the host because we rely on the behavior or
earlier versions
but probably don't want to do that for the target.



>
>
>   Regarding ec50e407be: we're indeed in a similar situation as back then.
> It's
> not ideal to have a maximal version, but for now it's better than putting
> the
> minimum at 1.35.
>
>

We could set the host tar version to 1.34, but it sounded like there were
concerns about security? The only CVE I see at a glance is CVE-2022-48303.
Upstream
https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D3da78400eafcccb97e2f=
2fd4b227ea40d794ede8
Oddly, Debian hasn't ported the patch but Ubuntu has.


I obviously defer to the decision of the maintainers, but wanted to voice
my thoughts.


>
>   Regards,
>   Arnout
>
>
> > ---
> > This patch should be coordinated with other patches [1] that update the
> > BR_FMT_VERSION revision for git or svn as all of the tarball hashes wil=
l
> > need to be regenerated tree-wide.
> >
> > [1] https://patchwork.ozlabs.org/project/buildroot/list/?series=3D37374=
2
> > ---
> >   package/pkg-download.mk                |  4 ++--
> >   support/dependencies/check-host-tar.sh | 10 ++++++----
> >   2 files changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index e5cd83d859..d33eb2d811 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -20,8 +20,8 @@ export LOCALFILES :=3D $(call qstrip,$(BR2_LOCALFILES=
))
> >
> >   # Version of the format of the archives we generate in the
> corresponding
> >   # download backend:
> > -BR_FMT_VERSION_git =3D -br1
> > -BR_FMT_VERSION_svn =3D -br3
> > +BR_FMT_VERSION_git =3D -br2
> > +BR_FMT_VERSION_svn =3D -br4
> >
> >   DL_WRAPPER =3D support/download/dl-wrapper
> >
> > diff --git a/support/dependencies/check-host-tar.sh
> b/support/dependencies/check-host-tar.sh
> > index b7d607a47a..d56d0242a9 100755
> > --- a/support/dependencies/check-host-tar.sh
> > +++ b/support/dependencies/check-host-tar.sh
> > @@ -27,11 +27,13 @@ if [ -n "${version_bsd}" ] ; then
> >       exit 1
> >   fi
> >
> > -# Minimal version =3D 1.27 (previous versions do not correctly unpack
> archives
> > -# containing hard-links if the --strip-components option is used or
> create
> > -# different gnu long link headers for path elements > 100 characters).
> > +# Minimal version =3D 1.35
> > +# GNU tar upstream commit 738de9ecd introduced a "breaking" change tha=
t
> > +# affects tarballs regardless of mode (pax/ustar/v7) such that tarball=
s
> > +# generated with 1.35 will not hash to the same value as those generat=
ed
> > +# by previous versions of tar.
> >   major_min=3D1
> > -minor_min=3D27
> > +minor_min=3D35
> >
> >   if [ $major -lt $major_min ]; then
> >       # echo nothing: no suitable tar found
>

--0000000000009a1ee00609b9b8da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>All<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Nov 8, 2023 at 3:01=E2=80=AFPM Arnout=
 Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 H=
i Vincent,<br>
<br>
On 18/10/2023 16:11, Vincent Fazio wrote:<br>
&gt; GNU tar 1.35 includes a breaking change [0] that changes the tar heade=
r<br>
&gt; created for each regular file even for &quot;stable&quot; formats like=
 pax (which<br>
&gt; we use in support/download/helpers::mk_tar_gz).<br>
&gt; <br>
&gt; Previously, normal files had the devmajor/devminor fields of the heade=
r<br>
&gt; filled with ASCII zero (0x30). These fields are now null which also<br=
>
&gt; affects the checksum value in the header as well.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 $ diff &lt;(head -n 100 xxd.1.34.output) &lt;(head -n 100=
 xxd.1.35.output)<br>
&gt;=C2=A0 =C2=A0 10c10<br>
&gt;=C2=A0 =C2=A0 &lt; 00000090: 3037 3500 3031 3531 3637 0020 3000 0000=C2=
=A0 075.015167. 0...<br>
&gt;=C2=A0 =C2=A0 ---<br>
&gt;=C2=A0 =C2=A0 &gt; 00000090: 3037 3500 3031 3337 3237 0020 3000 0000=C2=
=A0 075.013727. 0...<br>
&gt;=C2=A0 =C2=A0 21,22c21,22<br>
&gt;=C2=A0 =C2=A0 &lt; 00000140: 0000 0000 0000 0000 0030 3030 3030 3030=C2=
=A0 .........0000000<br>
&gt;=C2=A0 =C2=A0 &lt; 00000150: 0030 3030 3030 3030 0000 0000 0000 0000=C2=
=A0 .0000000........<br>
&gt;=C2=A0 =C2=A0 ---<br>
&gt;=C2=A0 =C2=A0 &gt; 00000140: 0000 0000 0000 0000 0000 0000 0000 0000=C2=
=A0 ................<br>
&gt;=C2=A0 =C2=A0 &gt; 00000150: 0000 0000 0000 0000 0000 0000 0000 0000=C2=
=A0 ................<br>
&gt; <br>
&gt; This has the consequence of causing hash mismatches for any tarball<br=
>
&gt; created with a version prior to 1.35.<br>
&gt; <br>
&gt; Instead of reverting back to a host specific version (see 37a909cacf)<=
br>
&gt; and adding a cap to the maximal tar version (see ec50e407be), just<br>
&gt; establish that 1.35+ should be used going forward.<br>
&gt; <br>
&gt; This change requires an updated BR_FMT_VERSION for both git and svn.<b=
r>
&gt; <br>
&gt; [0] <a href=3D"https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D=
738de9ecdec45ebfeb999628742373b5f8253bd0" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D738de9ecdec45ebf=
eb999628742373b5f8253bd0</a><br>
&gt; <br>
&gt; Signed-off-by: Vincent Fazio &lt;<a href=3D"mailto:vfazio@gmail.com" t=
arget=3D"_blank">vfazio@gmail.com</a>&gt;<br>
<br>
=C2=A0 We discussed with 3 more maintainers (Peter, Romain and myself) and =
came to <br>
the conclusion that it is really too annoying that almost everybody would h=
ave <br>
to build host-tar (unconditionally!). At the moment, of the main distros, o=
nly <br></blockquote><div><br></div><div><br></div><div>The host-tar packag=
e takes between 20-45 seconds to build. I don&#39;t see=20
that as overly burdensome on a build that can potentially take upwards=20
of half an hour.</div><div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
Fedora 39 (just released) and Arch Linux already have 1.35.<br>
<br></blockquote><div><br></div><div><br></div><div><div>We&#39;re already =
in a situation where people are using the latest Arch and encountering this=
 (a colleague of Thomas in fact).=C2=A0</div><div>It&#39;s what drove the i=
nvestigation in October and this patch. They were using an older buildroot,=
 so there&#39;s not much that can be done there.</div><div>It&#39;s not ide=
al, but we can document the limitation with distributions using tar 1.35 an=
d recommend utilizing a build container that uses a previous version of tar=
.<br><br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
=C2=A0 The idea is to apply this &quot;bump minimal tar&quot; only when mor=
e major distros have <br>
switched to 1.35 or later. Or, perhaps with the additional time we find an =
<br>
alternative that is hopefully more stable. I was thinking of switching to <=
br>
sharutils, for example - last release is from 2015 so very stable! :-)<br>
<br></blockquote><div><br></div><div><br></div><div>Based on testing Yann d=
id back in the day (cbe95b1a455bbefcaa90a08cf3dd1a590630921e) the --format=
=3Dposix format has been stable since at least GNU tar 1.27 released 10 yea=
rs ago.</div><div>I did open an issue in GNU tar for this change and asked =
about the guarantee of stability: <a href=3D"https://savannah.gnu.org/bugs/=
index.php?64875">https://savannah.gnu.org/bugs/index.php?64875</a></div><di=
v>Pending the outcome of that issue, we can maybe not do anything for now e=
xcept recommend against using distros with tar 1.35</div><div><br></div><di=
v>I personally think it&#39;s better to do the bump and account for the beh=
avior change now. The build of host-tar 1.35 will eventually not be require=
d as the new version is adopted by distros vs sticking with 1.34 and then s=
lowly forcing more builds of older tar on newer distros.<br></div><div></di=
v><div><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">=C2=A0 <br></blockquote><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
=C2=A0 So, for the time being, we can do the following:<br>
<br>
- in check-host-tar.sh, check that system tar &lt; 1.35;<br>
- in package/tar, add a patch that reverts 738de9ecde (probably need to rev=
ert <br>
c3663838 as well).<br></blockquote><div><br></div><div><br></div><div>I don=
&#39;t agree with reverting these commits in 1.35 as it causes functionally=
 different behavior between BR built tar and distribution built tar on the =
same version.</div><div>The only way to guarantee previous/stable behavior =
would be to _always_ use BR built tar with reverts, which you didn&#39;t wa=
nt to do above.</div><div><br></div><div>It would also make the recipe a bi=
t funky, where we&#39;re specifically applying a patch to 1.35 for the host=
 because we rely on the behavior or earlier versions</div><div>but probably=
 don&#39;t want to do that for the target.</div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
=C2=A0 Regarding ec50e407be: we&#39;re indeed in a similar situation as bac=
k then. It&#39;s <br>
not ideal to have a maximal version, but for now it&#39;s better than putti=
ng the <br>
minimum at 1.35.<br>
<br></blockquote><div><br><br></div><div>We could set the host tar version =
to 1.34, but it sounded like there were concerns about security? The only C=
VE I see at a glance is CVE-2022-48303.<br></div><div>Upstream <a href=3D"h=
ttps://git.savannah.gnu.org/cgit/tar.git/commit/?id=3D3da78400eafcccb97e2f2=
fd4b227ea40d794ede8">https://git.savannah.gnu.org/cgit/tar.git/commit/?id=
=3D3da78400eafcccb97e2f2fd4b227ea40d794ede8</a></div><div>Oddly, Debian has=
n&#39;t ported the patch but Ubuntu has. </div><div><br></div><div><br></di=
v><div>I obviously defer to the decision of the maintainers, but wanted to =
voice my thoughts.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
<br>
&gt; ---<br>
&gt; This patch should be coordinated with other patches [1] that update th=
e<br>
&gt; BR_FMT_VERSION revision for git or svn as all of the tarball hashes wi=
ll<br>
&gt; need to be regenerated tree-wide.<br>
&gt; <br>
&gt; [1] <a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/?se=
ries=3D373742" rel=3D"noreferrer" target=3D"_blank">https://patchwork.ozlab=
s.org/project/buildroot/list/?series=3D373742</a><br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/<a href=3D"http://pkg-download.mk" rel=3D"noreferr=
er" target=3D"_blank">pkg-download.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
&gt;=C2=A0 =C2=A0support/dependencies/check-host-tar.sh | 10 ++++++----<br>
&gt;=C2=A0 =C2=A02 files changed, 8 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/<a href=3D"http://pkg-download.mk" rel=3D"norefer=
rer" target=3D"_blank">pkg-download.mk</a> b/package/<a href=3D"http://pkg-=
download.mk" rel=3D"noreferrer" target=3D"_blank">pkg-download.mk</a><br>
&gt; index e5cd83d859..d33eb2d811 100644<br>
&gt; --- a/package/<a href=3D"http://pkg-download.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">pkg-download.mk</a><br>
&gt; +++ b/package/<a href=3D"http://pkg-download.mk" rel=3D"noreferrer" ta=
rget=3D"_blank">pkg-download.mk</a><br>
&gt; @@ -20,8 +20,8 @@ export LOCALFILES :=3D $(call qstrip,$(BR2_LOCALFILE=
S))<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Version of the format of the archives we generate in the=
 corresponding<br>
&gt;=C2=A0 =C2=A0# download backend:<br>
&gt; -BR_FMT_VERSION_git =3D -br1<br>
&gt; -BR_FMT_VERSION_svn =3D -br3<br>
&gt; +BR_FMT_VERSION_git =3D -br2<br>
&gt; +BR_FMT_VERSION_svn =3D -br4<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0DL_WRAPPER =3D support/download/dl-wrapper<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/support/dependencies/check-host-tar.sh b/support/dependen=
cies/check-host-tar.sh<br>
&gt; index b7d607a47a..d56d0242a9 100755<br>
&gt; --- a/support/dependencies/check-host-tar.sh<br>
&gt; +++ b/support/dependencies/check-host-tar.sh<br>
&gt; @@ -27,11 +27,13 @@ if [ -n &quot;${version_bsd}&quot; ] ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -# Minimal version =3D 1.27 (previous versions do not correctly unpack=
 archives<br>
&gt; -# containing hard-links if the --strip-components option is used or c=
reate<br>
&gt; -# different gnu long link headers for path elements &gt; 100 characte=
rs).<br>
&gt; +# Minimal version =3D 1.35<br>
&gt; +# GNU tar upstream commit 738de9ecd introduced a &quot;breaking&quot;=
 change that<br>
&gt; +# affects tarballs regardless of mode (pax/ustar/v7) such that tarbal=
ls<br>
&gt; +# generated with 1.35 will not hash to the same value as those genera=
ted<br>
&gt; +# by previous versions of tar.<br>
&gt;=C2=A0 =C2=A0major_min=3D1<br>
&gt; -minor_min=3D27<br>
&gt; +minor_min=3D35<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0if [ $major -lt $major_min ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# echo nothing: no suitable tar found<br>
</blockquote></div></div>

--0000000000009a1ee00609b9b8da--

--===============1845024283185568352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1845024283185568352==--
