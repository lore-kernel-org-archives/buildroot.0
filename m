Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACA3C4708D
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 10:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 192A5607CA;
	Mon,  5 Dec 2022 10:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 192A5607CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wcyV-e-Dui61; Mon,  5 Dec 2022 10:01:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F05AE607E3;
	Mon,  5 Dec 2022 10:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F05AE607E3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1481BF592
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 10:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41166415EC
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 10:01:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41166415EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mDAo-JDGoC7r for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 10:01:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D443415E7
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D443415E7
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 10:01:32 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so59287pjr.3
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 02:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yn99THq2KvfMXFkUEV/hckEc5pnBaPzaujVc7jkhylo=;
 b=w2VCJMiPRnswxR0NFB1DaNqXnujTcpYeoq4xiluH4ogTKav9IjGlTCzHRW+e0fVH39
 in3p0Az9HbdleTMNDmIa1LrVgdx+Z16IhFVkYpMsP8U37ZxZGTdc6RgFA9Ipbj7V59Hv
 fgcdw9pwr/dOuT2vwylPQ5AKOoxJajgGBAES5m9gtTC2IBUrCS10kx0XpTBCNYi9hEPP
 zIxclU6vaa281Hu1F0NWrWVXOgs0FRDg6dwQje4vOGFLnb4ABAaQycNX5Dy2/ksXCD29
 990BoptRUnITNUl5JO9D40LRQ3/nC98yac6hV5MNFoEiKv6Vq7tkG7dzmgF1G+sliFo6
 uMwg==
X-Gm-Message-State: ANoB5pnHZiuU5Wx73T1IlzzwOGcBF6B/4XzaLWVghZpR2JZHK6sQoRbj
 plh3yuqGJEQakR/vhNptOl4WqRHfmIBkR8XTAVg=
X-Google-Smtp-Source: AA0mqf7NBdY4rflo7nPjyCzIufqCP0aPP1w8NyFAxYdPMMbs/rvLnTvYLgVPF2nsuaMCG+NxESwi0y2WeUnYh4GcG/o=
X-Received: by 2002:a17:902:e948:b0:189:26bb:870b with SMTP id
 b8-20020a170902e94800b0018926bb870bmr66116241pll.53.1670234491707; Mon, 05
 Dec 2022 02:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20221013121041.1398841-1-jesseevg@gmail.com>
 <20221204203528.GF2855@scaer>
In-Reply-To: <20221204203528.GF2855@scaer>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Mon, 5 Dec 2022 11:01:20 +0100
Message-ID: <CAMdwsN81VOr9Q8i4Z8VaGu2K0_QjW7Vm7KzYPTiB2S-2ehc2eQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yn99THq2KvfMXFkUEV/hckEc5pnBaPzaujVc7jkhylo=;
 b=MUCAeZRM2fYg734BeI0UsBi7yfP9Yl/SzqUG1MKSnKbV70arjSBInotO7KICSrBplv
 HSvFZJ3l5tsVptOTIdw6EN7HLecon8avfM6OxFb6VaSh1Dlm6tZK7U24PSBgY/R5j+7F
 nHqUjObDm5/SDLW/9Y3oNXwxq8KvSO5qTJWW9m3B711NmhxsFPSrP1ihxExawinaj+rU
 j71oEtw8OdOFl04izeyQhRSP/gGa45P1EMuYAoCAl1OzIz86p6AQKdgnaFO9qStCjxlE
 8djDQZ6h/PFqWXfDSN3n8oJSH+g8CSKpIYjr+/kaMUYwIqQaTtW+1iKRKogsWnO6/H/N
 epVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MUCAeZRM
Subject: Re: [Buildroot] [PATCH v2 1/1] package/qt6: Change license hashes
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Op zo 4 dec. 2022 om 21:35 schreef Yann E. MORIN <yann.morin.1998@free.fr>:
>
> Jesse, All,
>
> On 2022-10-13 14:10 +0200, Jesse Van Gavere spake thusly:
> > There was a major rework of how licenses are used in the Qt codebase
> > along with a new location for all licenses, so change the hash file to
> > reflect these changes
> > https://github.com/qt/qtserialport/commit/bb05a26d52c834cc7f3c549f3e5d66f76baf42a2
> >
> > Changes for v2:
> >  - Also adjust the makefiles to refer to these new license file names
> >  - Added myself to the developers for the qt6 package for good measure
> >
> > Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
>
> Again, sorry that I missed that patch of yours, I applied Fabrice's
> patches instead.
>
> Still, I applied the part adding yourself to DEVELOPERS for the qt6
> package.
>
> Thank you!
>
> Regards,
> Yann E. MORIN.
>

Hello Yann, all,

No problem at all, those things happen.
But on a similar note, would it be possible for my other outstanding
patches to  get a look?
http://patchwork.ozlabs.org/project/buildroot/list/?series=&submitter=84716&state=&q=&archive=&delegate=
I'm currently holding off from committing more qt related
patches/functionality until it's a bit more baselined,  most of that
is still in my initial extending Qt6 patch set.
Or if there's anything I can do to help the process here, let me know.
Thanks!

Regards,
Jesse

> > ---
> >  DEVELOPERS                                   |  1 +
> >  package/qt6/qt6base/qt6base.hash             | 15 ++++++++++-----
> >  package/qt6/qt6base/qt6base.mk               |  4 ++--
> >  package/qt6/qt6serialport/qt6serialport.hash | 12 +++++++-----
> >  package/qt6/qt6serialport/qt6serialport.mk   |  4 ++--
> >  5 files changed, 22 insertions(+), 14 deletions(-)
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 59121c6a54..6cb8d0fc54 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1478,6 +1478,7 @@ F:      package/x11r7/xdriver_xf86-video-imx/
> >  F:   package/x11r7/xdriver_xf86-video-imx-viv/
> >
> >  N:   Jesse Van Gavere <jesseevg@gmail.com>
> > +F:   package/qt6/
> >  F:   package/qt6/qt6serialport/
> >
> >  N:   Jianhui Zhao <zhaojh329@gmail.com>
> > diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
> > index 5dd26973fa..b004347a5a 100644
> > --- a/package/qt6/qt6base/qt6base.hash
> > +++ b/package/qt6/qt6base/qt6base.hash
> > @@ -2,8 +2,13 @@
> >  sha256  cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d  qtbase-everywhere-src-6.4.0.tar.xz
> >
> >  # Hashes for license files
> > -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> > -sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> > -sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
> > -sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
> > -sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSE.FDL
> > +sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
> > +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> > +sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5  LICENSES/BSL-1.0.txt
> > +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
> > +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
> > +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> > +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
> > +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
> > +sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
> > +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
> > diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
> > index b7ee6037f3..b53d53c653 100644
> > --- a/package/qt6/qt6base/qt6base.mk
> > +++ b/package/qt6/qt6base/qt6base.mk
> > @@ -7,8 +7,8 @@
> >  QT6BASE_VERSION = $(QT6_VERSION)
> >  QT6BASE_SITE = $(QT6_SITE)
> >  QT6BASE_SOURCE = qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
> > -QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
> > -QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> > +QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 no invariants (docs)
> > +QT6BASE_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt LICENSES/Qt-GPL-exception-1.0.txt LICENSES/LGPL-3.0-only.txt LICENSES/GFDL-1.3-no-invariants-only.txt
> >  QT6BASE_DEPENDENCIES = \
> >       host-ninja \
> >       host-qt6base \
> > diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
> > index fb1b3dcf6b..887f67b2ae 100644
> > --- a/package/qt6/qt6serialport/qt6serialport.hash
> > +++ b/package/qt6/qt6serialport/qt6serialport.hash
> > @@ -2,8 +2,10 @@
> >  sha256  f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483  qtserialport-everywhere-src-6.4.0.tar.xz
> >
> >  # Hashes for license files:
> > -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
> > -sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE.GPL3
> > -sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652  LICENSE.GPL3-EXCEPT
> > -sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.LGPL3
> > -sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
> > +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
> > +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
> > +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
> > +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
> > +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
> > +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
> > +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
> > diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
> > index 01763657b8..03197fd60d 100644
> > --- a/package/qt6/qt6serialport/qt6serialport.mk
> > +++ b/package/qt6/qt6serialport/qt6serialport.mk
> > @@ -9,8 +9,8 @@ QT6SERIALPORT_SITE = $(QT6_SITE)
> >  QT6SERIALPORT_SOURCE = qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
> >  QT6SERIALPORT_INSTALL_STAGING = YES
> >  QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
> > -QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 (docs)
> > -QT6SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> > +QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), GFDL-1.3 no invariants (docs)
> > +QT6SERIALPORT_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt LICENSES/Qt-GPL-exception-1.0.txt LICENSES/LGPL-3.0-only.txt LICENSES/GFDL-1.3-no-invariants-only.txt
> >  QT6SERIALPORT_CONF_OPTS = \
> >       -GNinja \
> >       -DQT_HOST_PATH=$(HOST_DIR) \
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
