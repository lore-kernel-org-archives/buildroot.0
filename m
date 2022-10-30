Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24E0FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 09:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A77160A84;
	Sun, 30 Oct 2022 09:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A77160A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id juUlhdpdrxtm; Sun, 30 Oct 2022 09:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A0860A74;
	Sun, 30 Oct 2022 09:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A0860A74
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2E2C1BF336
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 09:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97A8B607E1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 09:12:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97A8B607E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGIj66ZekEgv for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 09:12:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAEE960A74
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAEE960A74
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 09:12:08 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-36ad4cf9132so83919497b3.6
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 02:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zUrwdpVyygiloM74UInYRDcpj+lX66ekDokn/7hrukE=;
 b=eMJehF9frM/bLomCsJqEnU7Vvd3jNpwv4x/bxa0eNmv8AFj8XfDW30EmjFkphMJIyT
 bIOU+cd5ANlS5ec/o1lLTmffVbIDxHByYG3GB9Ksh8JWtCbOLHvcgXfKTPKdlpVYJg3j
 d4Al8WF6nDf17NII/CcI+wU9/YILpo9w88FxCqnxw22zz8MmiFLsw58cmeWgD+hTKHDF
 HkWepv0xr5dMIZXP2aV/rBn5sJ18o8NlXjEgRnr44SDdyyXNbZQFcwK/eDHKEnztJCWJ
 0VA9ED+iAaQhCq3xBTYN6Jppgq1kKr5t7wHFG54pjwZfbACS8JOO6Gg2Imz5A7ZIpqq2
 SgUw==
X-Gm-Message-State: ACrzQf2bG5cbuggy/9nKA8aLL+dGexKAoDgVg6+eWEn65Hv6CnjBilQC
 OoBi/GA8wattpuY6Zpm4zag2RflzvTjFUmfZc2U=
X-Google-Smtp-Source: AMsMyM7/U/h++seEE8xRr5X3g+K7LCXEWaRjEARs0Lvd3KVHNEeuGVY5wwinuBiD9wiFh+vrETZbeKm4L0Zaxx+HyrE=
X-Received: by 2002:a81:720a:0:b0:370:c85:7e5c with SMTP id
 n10-20020a81720a000000b003700c857e5cmr7561718ywc.153.1667121127593; Sun, 30
 Oct 2022 02:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221025065539.4646-1-afshin.nasser@gmail.com>
 <CAGm1_ku8QUbDtT+Bt=5jmD46Vws_go6r2dK9oD95i_bgJynLbg@mail.gmail.com>
 <20221026102255.GA602@smart-All-Series>
 <CAGm1_ktx6UuANUZ=Eqbh_wr7JrJNaHz=ou9zg9mSvGP+ivnzmA@mail.gmail.com>
 <20221029080229.GA24217@smart-All-Series>
In-Reply-To: <20221029080229.GA24217@smart-All-Series>
Date: Sun, 30 Oct 2022 10:11:56 +0100
Message-ID: <CAGm1_kuquC8Z9DOZWazKO2jrS4pYVwgYnGWtj8s5WMTBva9wSA@mail.gmail.com>
To: Nasser Afshin <afshin.nasser@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zUrwdpVyygiloM74UInYRDcpj+lX66ekDokn/7hrukE=;
 b=K8qT50sRNiPo29fg8OpkKt+XwlOY/AJjlWEIu650LwE/66QCxv3NV7G0zyFoAKuj8T
 XcpkjDFsM//YL36nJsBElIxYvEOO0PtSZK6S5Afd1qUSi6ykS5P2sB+wahMUIHq+IojH
 kQY9V9dXBC2+VQ2yFzPq45Pp6dMeWKujWU6zo2EOqpxhvBZsAswy/0GlzpZrkpvjp9hh
 WNfuhk4V3/9BtwnF6ZN81Kfl2QQEPnJrku9a+YJ8XJXSPmtCqYPm3uton5KQ68XX2PMm
 xQLz18Mjg3ee9MTQNHSzgbxXm9Tl0C51+iX1+Z0fM8rLtGUBF2dro49MUSF3tPeyYb0a
 4UYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K8qT50sR
Subject: Re: [Buildroot] [PATCH] python-pycrate: new package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nasser,

On Sat, Oct 29, 2022 at 10:02 AM Nasser Afshin <afshin.nasser@gmail.com> wrote:
>
> Hi Yegor,
>
> On Wed, Oct 26, 2022 at 08:21:30PM +0200, Yegor Yefremov wrote:
> > Hi Nasser,
> >
> > On Wed, Oct 26, 2022 at 12:23 PM Nasser Afshin <afshin.nasser@gmail.com> wrote:
> > >
> > > Hi Yegor,
> > >
> > > Thankyou for taking time to review my patch.
> > >
> > > On Tue, Oct 25, 2022 at 10:33:19AM +0200, Yegor Yefremov wrote:
> > > > Hi Nasser,
> > > >
> > > > On Tue, Oct 25, 2022 at 8:55 AM Nasser Afshin <afshin.nasser@gmail.com> wrote:
> > > > >
> > > > > Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Best regards,
Yegor

> > > > > ---
> > > > >  package/Config.in                          |  1 +
> > > > >  package/python-pycrate/Config.in           |  8 ++++++++
> > > > >  package/python-pycrate/python-pycrate.hash |  4 ++++
> > > > >  package/python-pycrate/python-pycrate.mk   | 13 +++++++++++++
> > > >
> > > > An entry to the DEVELOPERS file is missing.
> > >
> > > May you help me to whome this entry should refer?
> >
> > You should add yourself as a "maintainer" of the package you add. Just
> > look at other entries.
> >
> I have added myself as a maintainer of this package. Thankyou.
>
> > >
> > > >
> > > > >  4 files changed, 26 insertions(+)
> > > > >  create mode 100644 package/python-pycrate/Config.in
> > > > >  create mode 100644 package/python-pycrate/python-pycrate.hash
> > > > >  create mode 100644 package/python-pycrate/python-pycrate.mk
> > > > >
> > > > > diff --git a/package/Config.in b/package/Config.in
> > > > > index 56b1a08d8b..2443b7bb27 100644
> > > > > --- a/package/Config.in
> > > > > +++ b/package/Config.in
> > > > > @@ -951,6 +951,7 @@ menu "External python modules"
> > > > >         source "package/python-pyasn1-modules/Config.in"
> > > > >         source "package/python-pycli/Config.in"
> > > > >         source "package/python-pycparser/Config.in"
> > > > > +       source "package/python-pycrate/Config.in"
> > > > >         source "package/python-pycrypto/Config.in"
> > > > >         source "package/python-pycryptodomex/Config.in"
> > > > >         source "package/python-pydal/Config.in"
> > > > > diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
> > > > > new file mode 100644
> > > > > index 0000000000..9e2123d4dd
> > > > > --- /dev/null
> > > > > +++ b/package/python-pycrate/Config.in
> > > > > @@ -0,0 +1,8 @@
> > > > > +config BR2_PACKAGE_PYTHON_PYCRATE
> > > > > +       bool "python-pycrate"
> > > > > +       help
> > > > > +        It provides basically a runtime for encoding and decoding data structures,
> > > > > +        including CSN.1 and ASN.1. Additionally, it features a 3G and LTE mobile core
> > > > > +        network.
> > > > > +
> > > > > +        https://github.com/P1sec/pycrate/
> > > > > diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
> > > > > new file mode 100644
> > > > > index 0000000000..24aa51d8e4
> > > > > --- /dev/null
> > > > > +++ b/package/python-pycrate/python-pycrate.hash
> > > > > @@ -0,0 +1,4 @@
> > > > > +# md5 from https://pypi.python.org/pypi/pycrate/json
> > > > > +md5    075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
> > > > > +# Locally computed
> > > > > +sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
> > > > > diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
> > > > > new file mode 100644
> > > > > index 0000000000..41ce6c18f2
> > > > > --- /dev/null
> > > > > +++ b/package/python-pycrate/python-pycrate.mk
> > > > > @@ -0,0 +1,13 @@
> > > > > +################################################################################
> > > > > +#
> > > > > +# python-pycrate
> > > > > +#
> > > > > +################################################################################
> > > > > +
> > > > > +PYTHON_PYCRATE_VERSION = 0.5.5
> > > > > +PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
> > > > > +PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
> > > > > +PYTHON_PYCRATE_SETUP_TYPE = distutils
> > > >
> > > > SETUP_TYPE is setuptools.
> > > >
> > > > Have you tried this command?
> > > >
> > > > ./utils/scanpypi pycrate
> > > >
> > > > It will do almost everything you need. The thing that is missing is
> > > > licensing info because there is no license file in the source archive.
> > >
> > > Thankyou for pointing this out. Now I send a new version, using this
> > > command and also adding licensing info.
> > > >
> > > > Best regards,
> > > > Yegor
> > > >
> > > > > +PYTHON_PYCRATE_LICENSE = LGPL-2.1-or-later
> > > > > +
> > > > > +$(eval $(python-package))
> > > > > --
> > > > > 2.17.1
> > > > >
> > >
> > > This is the second version of my patch.
> > >
> > > From 979beabd86f1c15d159e37136bc9591fb39b844e Mon Sep 17 00:00:00 2001
> > > From: Nasser Afshin <Afshin.Nasser@gmail.com>
> > > Date: Tue, 25 Oct 2022 16:06:53 +0330
> > > Subject: [PATCH v2] python-pycrate: new package
> > >
> > > Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
> > > ---
> > > v1 -> v2: Added licence file and its checksum
> > >                  Used ./utils/scanpypi pycrate tool to be consistent with
> > >                  others
> > >
> > >  package/Config.in                          |  1 +
> > >  package/python-pycrate/Config.in           |  6 ++++++
> > >  package/python-pycrate/python-pycrate.hash |  6 ++++++
> > >  package/python-pycrate/python-pycrate.mk   | 14 ++++++++++++++
> > >  4 files changed, 27 insertions(+)
> > >  create mode 100644 package/python-pycrate/Config.in
> > >  create mode 100644 package/python-pycrate/python-pycrate.hash
> > >  create mode 100644 package/python-pycrate/python-pycrate.mk
> > >
> > > diff --git a/package/Config.in b/package/Config.in
> > > index e3a34d6e97..a6fcc72cc8 100644
> > > --- a/package/Config.in
> > > +++ b/package/Config.in
> > > @@ -1168,6 +1168,7 @@ menu "External python modules"
> > >         source "package/python-pycairo/Config.in"
> > >         source "package/python-pycares/Config.in"
> > >         source "package/python-pycparser/Config.in"
> > > +       source "package/python-pycrate/Config.in"
> > >         source "package/python-pycryptodomex/Config.in"
> > >         source "package/python-pycups/Config.in"
> > >         source "package/python-pydal/Config.in"
> > > diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
> > > new file mode 100644
> > > index 0000000000..193a973f7e
> > > --- /dev/null
> > > +++ b/package/python-pycrate/Config.in
> > > @@ -0,0 +1,6 @@
> > > +config BR2_PACKAGE_PYTHON_PYCRATE
> > > +       bool "python-pycrate"
> > > +       help
> > > +         A software suite to handle various data formats.
> > > +
> > > +         https://github.com/P1sec/pycrate/
> > > diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
> > > new file mode 100644
> > > index 0000000000..8ad33370b4
> > > --- /dev/null
> > > +++ b/package/python-pycrate/python-pycrate.hash
> > > @@ -0,0 +1,6 @@
> > > +# md5, sha256 from https://pypi.org/pypi/pycrate/json
> > > +md5  075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
> > > +sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
> > > +# Locally computed
> > > +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
> > > +
> > > diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
> > > new file mode 100644
> > > index 0000000000..c0da152656
> > > --- /dev/null
> > > +++ b/package/python-pycrate/python-pycrate.mk
> > > @@ -0,0 +1,14 @@
> > > +################################################################################
> > > +#
> > > +# python-pycrate
> > > +#
> > > +################################################################################
> > > +
> > > +PYTHON_PYCRATE_VERSION = 0.5.5
> > > +PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
> > > +PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
> > > +PYTHON_PYCRATE_SETUP_TYPE = setuptools
> > > +PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/master/license.txt
> > > +PYTHON_PYCRATE_LICENSE = LGPL-2.1+
> > > +
> > > +$(eval $(python-package))
> >
> > The patch looks good now. Thanks.
> >
> > Best regards,
> > Yegor
>
> This is the third version of the patch:
>
> From de6e28885836a6d9a5347a083a68055098508583 Mon Sep 17 00:00:00 2001
> From: Nasser Afshin <Afshin.Nasser@gmail.com>
> Date: Tue, 25 Oct 2022 16:06:53 +0330
> Subject: [PATCH v3] python-pycrate: new package
>
> Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
> ---
> v1 -> v2: Added licence file and its checksum
>                 Used ./utils/scanpypi pycrate tool to be consistent with
>                 others
> v2 -> v3: Added myself as the maintainer of this package
>
>  DEVELOPERS                                 |  3 +++
>  package/Config.in                          |  1 +
>  package/python-pycrate/Config.in           |  6 ++++++
>  package/python-pycrate/python-pycrate.hash |  6 ++++++
>  package/python-pycrate/python-pycrate.mk   | 14 ++++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/python-pycrate/Config.in
>  create mode 100644 package/python-pycrate/python-pycrate.hash
>  create mode 100644 package/python-pycrate/python-pycrate.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6e0b765ba1..a1b48fd45c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2157,6 +2157,9 @@ N:        Murat Demirten <mdemirten@yh.com.tr>
>  F:     package/jpeg-turbo/
>  F:     package/libgeotiff/
>
> +N:     Nasser Afshin <afshin.nasser@gmail.com>
> +F:     package/python-pycrate/
> +
>  N:     Nathaniel Roach <nroach44@gmail.com>
>  F:     package/bandwidthd/
>  F:     package/libgudev/
> diff --git a/package/Config.in b/package/Config.in
> index e3a34d6e97..a6fcc72cc8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1168,6 +1168,7 @@ menu "External python modules"
>         source "package/python-pycairo/Config.in"
>         source "package/python-pycares/Config.in"
>         source "package/python-pycparser/Config.in"
> +       source "package/python-pycrate/Config.in"
>         source "package/python-pycryptodomex/Config.in"
>         source "package/python-pycups/Config.in"
>         source "package/python-pydal/Config.in"
> diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
> new file mode 100644
> index 0000000000..193a973f7e
> --- /dev/null
> +++ b/package/python-pycrate/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_PYCRATE
> +       bool "python-pycrate"
> +       help
> +         A software suite to handle various data formats.
> +
> +         https://github.com/P1sec/pycrate/
> diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
> new file mode 100644
> index 0000000000..8ad33370b4
> --- /dev/null
> +++ b/package/python-pycrate/python-pycrate.hash
> @@ -0,0 +1,6 @@
> +# md5, sha256 from https://pypi.org/pypi/pycrate/json
> +md5  075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
> +sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
> +# Locally computed
> +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
> +
> diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
> new file mode 100644
> index 0000000000..c0da152656
> --- /dev/null
> +++ b/package/python-pycrate/python-pycrate.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-pycrate
> +#
> +################################################################################
> +
> +PYTHON_PYCRATE_VERSION = 0.5.5
> +PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
> +PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
> +PYTHON_PYCRATE_SETUP_TYPE = setuptools
> +PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/master/license.txt
> +PYTHON_PYCRATE_LICENSE = LGPL-2.1+
> +
> +$(eval $(python-package))
> --
> 2.17.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
