Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BC8C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 17:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB70B40499;
	Fri, 28 Jan 2022 17:23:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMYh-EkToKRh; Fri, 28 Jan 2022 17:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E57BF405AA;
	Fri, 28 Jan 2022 17:23:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EC471BF3B8
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C766415E5
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVa3MyGJITSY for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 17:23:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5FD3409B6
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 17:23:37 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso11498773pjv.1
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 09:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WiIvokWqPEqs2W/7EOHKKznFHXdrmx0CcU08f8srd/w=;
 b=SODzZ3IwSeGst5TFI2CPcePq0O9ijRGKHdaeVR81aa4f2qmWjfkYrR0T+UcbBnfUoq
 qdPItAl0Hp/lZ/hlxyVdWjSuLIihH0zQOjhSe9LPU8cdvlSpTVj7YMv4FFib7H7dMVcL
 Tmg5Pe0QUpAJ03dA9ScyP8tt7iQGfNOuvMQHRKZInJMwD9x3Xy7J6RBoWmyTUb3WKf9K
 jK8F/0Af1UKFk8ENwlsznLdoTSkZ5tG4MRiwkeHGDsRPPTvaqQxVkOuqMmFD0xMuCve1
 V78kSEjynm57FlDE6G48u/egVVMWaryJZ2c+hLL7nzXGYOjPP+yn6ECjZXn1pc2o9zFK
 RN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WiIvokWqPEqs2W/7EOHKKznFHXdrmx0CcU08f8srd/w=;
 b=cxInlB3C8nziIlYzCVNrO7vCv1108vBskbYWOmxtVD0IlhT1uhn3tv1n1IJQ7wwOJY
 aWGJASp/RQ8mtkJunQwpVutt1FEYXOMP4RJqBWHECLCho6K3KAV1TtKBZhP5nzlHfRlm
 8TPSZvmuaFmvjoHW1ZnxPdeRCi5zDO5w/+LR+ANMKw2VIoH8wS+T5fLNt2F/PuDCMbhY
 H050+9Mclz/bp6btQubHzUamug8oLRkD4rc8wQm0+Y9ZSjNPjBpmDtPYofGa8jXbVZ9C
 oLTiXJ7FRCpK/CAQ+stq0vvesSLSrudtvCJNK3AiqKiZmDKUW98VIRJPMc7vlaf3gs3u
 tgcg==
X-Gm-Message-State: AOAM5328TrP9poUXK3JAnNVoS8BL15nCPbzI+qbST+y23RAPdqxYYaY1
 DBd5Melp3qq+igqbf6KklGAVvUv9UiLMk2eGuXo=
X-Google-Smtp-Source: ABdhPJyrvNT/O2Uyp3E2UI88dFp9nZUdMJwZAzvQ6sxo/rAUeSM2jLRR2s1nPFqlhUYcd2nU+Bqa4uRZD/JzAeMoJuM=
X-Received: by 2002:a17:90a:5503:: with SMTP id
 b3mr20734509pji.187.1643390617035; 
 Fri, 28 Jan 2022 09:23:37 -0800 (PST)
MIME-Version: 1.0
References: <20220128105917.30421-1-thomas.devoogdt@barco.com>
 <20220128105917.30421-2-thomas.devoogdt@barco.com>
 <20220128134223.GB765275@momiji>
 <CACXRmJi3_D1n3tJNXgm+6azeVqY8=cA7gPvfWT8xMbR3Dk8eWA@mail.gmail.com>
 <20220128161314.GB770598@momiji>
In-Reply-To: <20220128161314.GB770598@momiji>
From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
Date: Fri, 28 Jan 2022 18:23:25 +0100
Message-ID: <CACXRmJjSOrww35YVVmkg_DEHDaG3ngQts4obTeDUsfsigM4cBQ@mail.gmail.com>
To: Adrian Perez de Castro <aperez@igalia.com>
Subject: Re: [Buildroot] libsoup3 migration (was: Re: [PATCH 2/2]
 package/libsoup: bump to version 3.0.4)
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2003750766493994977=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2003750766493994977==
Content-Type: multipart/alternative; boundary="000000000000f4a86605d6a7b12a"

--000000000000f4a86605d6a7b12a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Adri=C3=A1n, all,

Over time, we might have to support both versions anyway,
since not all packages will migrate that quickly.

If we go for option 1, then we can do it as follows:
Introducing a flag called BR2_PACKAGE_LIBSOUP_3.
The flag should have a life-cycle of 3 stages:

1. The newly introduced flag should default to 'false'.
   All packages which don't support libsoup3 support
   can add a 'depend on !BR2_PACKAGE_LIBSOUP_3' mark.

2. Over time, we can set the default to 'true', but keep
   the possibility to use libsoup2 for packages that still
   lack libsoup3 support.

3. Mark the BR2_PACKAGE_LIBSOUP_3 as legacy.

The main advantage of this strategy is that people can start using libsoup3=
.
The Disadvantage is that the new flag has to be maintained for a while.

Kr,

Thomas

Op vr 28 jan. 2022 om 15:13 schreef Adrian Perez de Castro <
aperez@igalia.com>:

> Hello Thomas, all,
>
> On Fri, 28 Jan 2022 13:33:32 +0100 Thomas Devoogdt <
> thomas.devoogdt@gmail.com> wrote:
> > Hello Adri=C3=A1n, all,
> >
> > I tested indeed libsoup3 against webkitgtk 2.34.4 [1]. By dropping
> > -DUSE_SOUP2=3DON
> > from your commit, I was able to build webkitgtk 2.34.4.
> >
> > You are right, other packages will have to migrate as well,
> > e.g. a GStreamer bump to 1.19.3 is needed [2].
> >
> > A quick search learns me that BR2_PACKAGE_LIBSOUP is/can be selected
> in/for:
> >  - BR2_PACKAGE_GMPC (no explicit support mentioned yet)
> >  - BR2_PACKAGE_GSSDP (support on master branch [3])
> >  - BR2_PACKAGE_GUPNP_TOOLS (no explicit support mentioned yet)
> >  - BR2_PACKAGE_GVFS (no explicit support mentioned yet)
> >  - BR2_PACKAGE_LIBOSTREE (no explicit support mentioned yet)
> >  - BR2_PACKAGE_MIDORI (no explicit support mentioned yet)
> >  - BR2_PACKAGE_WPEWEBKIT (no explicit support mentioned yet)
> >
> >  - BR2_PACKAGE_GST1_PLUGINS_GOOD (starting from 1.19.3)
> >  - BR2_PACKAGE_GSTD (starting from 1.19.3)
> >  - BR2_PACKAGE_WEBKITGTK (starting from 2.34.4)
>
> There is a tracking table for the libsoup3 migration that one of my work
> mates
> has been maintaining up to date; you can find it here:
>
>   https://gitlab.gnome.org/GNOME/libsoup/-/issues/218
>
> For most of the packages from Buildroot that you listed there are patches
> filed to their corresponding upstreams.
>
> The way I see it, there are three possible ways for a migration:
>
> - Keep both libsoup2 and libsoup3 in the tree, migrate packages to libsou=
p3
>   where possible and where we do not see conflicts (like loading both
> versions
>   in the same process) likely to happen.
>
> - Replace libsoup2 with libsoup3 *now*, import patches into the Buildroot
> tree
>   for the packages which do not yet have releases compatible with libsoup=
3.
>
> - Replace libsoup2 with libsoup3 *later*, once all upstreams of packages
>   present in Buildroot put out releases that work with libsoup3.
>
> Personally I tend to think the last option is likely to be the best, to
> avoid
> confusions and the possibility that people who use Buildroot as basis for
> their work get into nasty situations due to both libsoup2 and libsoup3
> being
> available.
>
> Opinions?
>
> > ---
> > [1]
> >
> https://git.sr.ht/~aperezdc/buildroot/commit/5dc402d58659a35a30afd1de1a8f=
b8075034f3fc
> > [2]
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1044
> > [3] https://gitlab.gnome.org/GNOME/gssdp/-/merge_requests/7
> >
> >
> > Op vr 28 jan. 2022 om 12:42 schreef Adrian Perez de Castro <
> > aperez@igalia.com>:
> >
> > > Hello Thomas, all,
> > >
> > > On Fri, 28 Jan 2022 11:59:17 +0100 Thomas Devoogdt <
> > > thomas.devoogdt@gmail.com> wrote:
> > > > Drop upstreamed patch:
> > > >
> > >
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2a23e=
31e83f815ab667c
> > > >
> > > > The gnome option was dropped in:
> > > >
> > >
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/3fcaa882c4eb29fd754cdb6dd=
06195632cb4b52a
> > > >
> > > > A new "libnghttp2" dependency is added since libsoup 2.99.6 (HTTP2
> > > backend):
> > > >
> > >
> https://gitlab.gnome.org/GNOME/libsoup/-/commit/1a1d29c3114ca86c673d0c0b0=
2a492d0962dcfe8
> > > >
> > > > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > > > ---
> > > >  Config.in.legacy                              |  6 +++
> > > >  .../0001-meson.build-set-c_std-to-gnu99.patch | 40
> -------------------
> > > >  package/libsoup/Config.in                     |  6 +--
> > > >  package/libsoup/libsoup.hash                  |  4 +-
> > > >  package/libsoup/libsoup.mk                    | 11 ++---
> > > >  package/midori/Config.in                      |  1 -
> > > >  6 files changed, 12 insertions(+), 56 deletions(-)
> > > >  delete mode 100644
> > > package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
> > >
> > > Note that libsoup3 has a new API [1] (and ABI, therefore). Packages
> using
> > > libsoup2 may not even compile with libsoup3, or may crash at runtime =
in
> > > unexpected ways.
> > >
> > > You will need followup patches to modify packages that depend on
> libsoup
> > > to make them use libsoup2. For example in package/wpewebkit.mk we are
> > > currently passing -DUSE_SOUP2=3DON to CMake, which needs to be change=
d to
> > > OFF.
> > >
> > > Some packages may not even support yet building with libsoup3.
> Therefore
> > > we may need to keep the libsoup2 package. This is possible, as both
> > > versions
> > > are parallel-installable. But then there is one more issue: one canno=
t
> use
> > > both libraries in the same process. Which means, for example, if
> wpewebkit
> > > gets changed to use libsoup3, then GStreamer *also* needs to be chang=
ed
> > > because both are used inside WebKit.
> > >
> > > These are all reasons why I have not yet sent patches to do the switc=
h.
> > > Probably we want to discuss how to go ahead with the libsoup3
> migration in
> > > Buildroot.
> > >
> > > Cheers,
> > > =E2=80=94Adri=C3=A1n
> > >
> > > ---
> > > [1] https://libsoup.org/libsoup-3.0/ch02.html
> > >
>
> Cheers,
> =E2=80=94Adri=C3=A1n
>

--000000000000f4a86605d6a7b12a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Adri=C3=A1n, all,<br><div><br></div=
><div>Over time, we might have to support both versions anyway,=C2=A0</div>=
<div>since not all packages will migrate that quickly.=C2=A0</div><div><br>=
</div><div>If we go for option 1, then we can do it as follows:</div><div>I=
ntroducing a flag called=C2=A0BR2_PACKAGE_LIBSOUP_3.</div><div>The flag sho=
uld have a life-cycle=C2=A0of 3 stages:</div><div><br></div><div>1. The new=
ly introduced flag should default to &#39;false&#39;.</div><div>=C2=A0 =C2=
=A0All packages which don&#39;t support libsoup3 support</div><div>=C2=A0 =
=C2=A0can add a &#39;depend on !BR2_PACKAGE_LIBSOUP_3&#39; mark.</div><div>=
<br></div><div>2. Over time, we can set the default to &#39;true&#39;, but =
keep</div><div>=C2=A0 =C2=A0the possibility to use libsoup2 for packages th=
at still</div><div>=C2=A0 =C2=A0lack libsoup3 support.</div><div><br></div>=
<div>3. Mark the BR2_PACKAGE_LIBSOUP_3 as legacy.</div><div><br></div><div>=
The main advantage of this strategy is that people can start using libsoup3=
.</div><div>The Disadvantage=C2=A0is that the new flag has to be=C2=A0maint=
ained for a while.</div><div><br></div><div>Kr,</div><div><br></div><div>Th=
omas</div><div><br></div></div><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Op vr 28 jan. 2022 om 15:13 schreef Adrian Perez de Ca=
stro &lt;<a href=3D"mailto:aperez@igalia.com">aperez@igalia.com</a>&gt;:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Thomas, all,=
<br>
<br>
On Fri, 28 Jan 2022 13:33:32 +0100 Thomas Devoogdt &lt;<a href=3D"mailto:th=
omas.devoogdt@gmail.com" target=3D"_blank">thomas.devoogdt@gmail.com</a>&gt=
; wrote:<br>
&gt; Hello Adri=C3=A1n, all,<br>
&gt; <br>
&gt; I tested indeed libsoup3 against webkitgtk 2.34.4 [1]. By dropping<br>
&gt; -DUSE_SOUP2=3DON<br>
&gt; from your commit, I was able to build webkitgtk 2.34.4.<br>
&gt; <br>
&gt; You are right, other packages will have to migrate as well,<br>
&gt; e.g. a GStreamer bump to 1.19.3 is needed [2].<br>
&gt; <br>
&gt; A quick search learns me that BR2_PACKAGE_LIBSOUP is/can be selected i=
n/for:<br>
&gt;=C2=A0 - BR2_PACKAGE_GMPC (no explicit support mentioned yet)<br>
&gt;=C2=A0 - BR2_PACKAGE_GSSDP (support on master branch [3])<br>
&gt;=C2=A0 - BR2_PACKAGE_GUPNP_TOOLS (no explicit support mentioned yet)<br=
>
&gt;=C2=A0 - BR2_PACKAGE_GVFS (no explicit support mentioned yet)<br>
&gt;=C2=A0 - BR2_PACKAGE_LIBOSTREE (no explicit support mentioned yet)<br>
&gt;=C2=A0 - BR2_PACKAGE_MIDORI (no explicit support mentioned yet)<br>
&gt;=C2=A0 - BR2_PACKAGE_WPEWEBKIT (no explicit support mentioned yet)<br>
&gt; <br>
&gt;=C2=A0 - BR2_PACKAGE_GST1_PLUGINS_GOOD (starting from 1.19.3)<br>
&gt;=C2=A0 - BR2_PACKAGE_GSTD (starting from 1.19.3)<br>
&gt;=C2=A0 - BR2_PACKAGE_WEBKITGTK (starting from 2.34.4)<br>
<br>
There is a tracking table for the libsoup3 migration that one of my work ma=
tes<br>
has been maintaining up to date; you can find it here:<br>
<br>
=C2=A0 <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/issues/218" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/libsoup/-/=
issues/218</a><br>
<br>
For most of the packages from Buildroot that you listed there are patches<b=
r>
filed to their corresponding upstreams. <br>
<br>
The way I see it, there are three possible ways for a migration:<br>
<br>
- Keep both libsoup2 and libsoup3 in the tree, migrate packages to libsoup3=
<br>
=C2=A0 where possible and where we do not see conflicts (like loading both =
versions<br>
=C2=A0 in the same process) likely to happen.<br>
<br>
- Replace libsoup2 with libsoup3 *now*, import patches into the Buildroot t=
ree<br>
=C2=A0 for the packages which do not yet have releases compatible with libs=
oup3.<br>
<br>
- Replace libsoup2 with libsoup3 *later*, once all upstreams of packages<br=
>
=C2=A0 present in Buildroot put out releases that work with libsoup3.<br>
<br>
Personally I tend to think the last option is likely to be the best, to avo=
id<br>
confusions and the possibility that people who use Buildroot as basis for<b=
r>
their work get into nasty situations due to both libsoup2 and libsoup3 bein=
g<br>
available.<br>
<br>
Opinions?<br>
<br>
&gt; ---<br>
&gt; [1]<br>
&gt; <a href=3D"https://git.sr.ht/~aperezdc/buildroot/commit/5dc402d58659a3=
5a30afd1de1a8fb8075034f3fc" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.sr.ht/~aperezdc/buildroot/commit/5dc402d58659a35a30afd1de1a8fb8075034f3fc=
</a><br>
&gt; [2] <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-/me=
rge_requests/1044" rel=3D"noreferrer" target=3D"_blank">https://gitlab.free=
desktop.org/gstreamer/gstreamer/-/merge_requests/1044</a><br>
&gt; [3] <a href=3D"https://gitlab.gnome.org/GNOME/gssdp/-/merge_requests/7=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gssdp=
/-/merge_requests/7</a><br>
&gt; <br>
&gt; <br>
&gt; Op vr 28 jan. 2022 om 12:42 schreef Adrian Perez de Castro &lt;<br>
&gt; <a href=3D"mailto:aperez@igalia.com" target=3D"_blank">aperez@igalia.c=
om</a>&gt;:<br>
&gt; <br>
&gt; &gt; Hello Thomas, all,<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 28 Jan 2022 11:59:17 +0100 Thomas Devoogdt &lt;<br>
&gt; &gt; <a href=3D"mailto:thomas.devoogdt@gmail.com" target=3D"_blank">th=
omas.devoogdt@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; Drop upstreamed patch:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d43=
1bdb094c59997f2a23e31e83f815ab667c" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.gnome.org/GNOME/libsoup/-/commit/5c3d431bdb094c59997f2a23e31e8=
3f815ab667c</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The gnome option was dropped in:<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/3fcaa8=
82c4eb29fd754cdb6dd06195632cb4b52a" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.gnome.org/GNOME/libsoup/-/commit/3fcaa882c4eb29fd754cdb6dd0619=
5632cb4b52a</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; A new &quot;libnghttp2&quot; dependency is added since libso=
up 2.99.6 (HTTP2<br>
&gt; &gt; backend):<br>
&gt; &gt; &gt;<br>
&gt; &gt; <a href=3D"https://gitlab.gnome.org/GNOME/libsoup/-/commit/1a1d29=
c3114ca86c673d0c0b02a492d0962dcfe8" rel=3D"noreferrer" target=3D"_blank">ht=
tps://gitlab.gnome.org/GNOME/libsoup/-/commit/1a1d29c3114ca86c673d0c0b02a49=
2d0962dcfe8</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.=
devoogdt@barco.com" target=3D"_blank">thomas.devoogdt@barco.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 Config.in.legacy=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
6 +++<br>
&gt; &gt; &gt;=C2=A0 .../0001-meson.build-set-c_std-to-gnu99.patch | 40 ---=
----------------<br>
&gt; &gt; &gt;=C2=A0 package/libsoup/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +--<br>
&gt; &gt; &gt;=C2=A0 package/libsoup/libsoup.hash=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
&gt; &gt; &gt;=C2=A0 package/libsoup/<a href=3D"http://libsoup.mk" rel=3D"n=
oreferrer" target=3D"_blank">libsoup.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ++---<br>
&gt; &gt; &gt;=C2=A0 package/midori/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
&gt; &gt; &gt;=C2=A0 6 files changed, 12 insertions(+), 56 deletions(-)<br>
&gt; &gt; &gt;=C2=A0 delete mode 100644<br>
&gt; &gt; package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch<br>
&gt; &gt;<br>
&gt; &gt; Note that libsoup3 has a new API [1] (and ABI, therefore). Packag=
es using<br>
&gt; &gt; libsoup2 may not even compile with libsoup3, or may crash at runt=
ime in<br>
&gt; &gt; unexpected ways.<br>
&gt; &gt;<br>
&gt; &gt; You will need followup patches to modify packages that depend on =
libsoup<br>
&gt; &gt; to make them use libsoup2. For example in package/<a href=3D"http=
://wpewebkit.mk" rel=3D"noreferrer" target=3D"_blank">wpewebkit.mk</a> we a=
re<br>
&gt; &gt; currently passing -DUSE_SOUP2=3DON to CMake, which needs to be ch=
anged to<br>
&gt; &gt; OFF.<br>
&gt; &gt;<br>
&gt; &gt; Some packages may not even support yet building with libsoup3. Th=
erefore<br>
&gt; &gt; we may need to keep the libsoup2 package. This is possible, as bo=
th<br>
&gt; &gt; versions<br>
&gt; &gt; are parallel-installable. But then there is one more issue: one c=
annot use<br>
&gt; &gt; both libraries in the same process. Which means, for example, if =
wpewebkit<br>
&gt; &gt; gets changed to use libsoup3, then GStreamer *also* needs to be c=
hanged<br>
&gt; &gt; because both are used inside WebKit.<br>
&gt; &gt;<br>
&gt; &gt; These are all reasons why I have not yet sent patches to do the s=
witch.<br>
&gt; &gt; Probably we want to discuss how to go ahead with the libsoup3 mig=
ration in<br>
&gt; &gt; Buildroot.<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt; =E2=80=94Adri=C3=A1n<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt; [1] <a href=3D"https://libsoup.org/libsoup-3.0/ch02.html" rel=3D"=
noreferrer" target=3D"_blank">https://libsoup.org/libsoup-3.0/ch02.html</a>=
<br>
&gt; &gt;<br>
<br>
Cheers,<br>
=E2=80=94Adri=C3=A1n<br>
</blockquote></div></div>

--000000000000f4a86605d6a7b12a--

--===============2003750766493994977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2003750766493994977==--
