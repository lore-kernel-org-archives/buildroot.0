Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7B7C4332F
	for <buildroot@archiver.kernel.org>; Tue,  8 Nov 2022 08:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEEE360C2C;
	Tue,  8 Nov 2022 08:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEEE360C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9J_lrKio_s_x; Tue,  8 Nov 2022 08:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D7B860B9D;
	Tue,  8 Nov 2022 08:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D7B860B9D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69DD51BF30A
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 08:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5207C40137
 for <buildroot@lists.busybox.net>; Tue,  8 Nov 2022 08:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5207C40137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWj6Y2hnrVg6 for <buildroot@lists.busybox.net>;
 Tue,  8 Nov 2022 08:45:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A196A40127
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A196A40127
 for <buildroot@buildroot.org>; Tue,  8 Nov 2022 08:45:58 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so11193687wmb.2
 for <buildroot@buildroot.org>; Tue, 08 Nov 2022 00:45:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZUbDOe91EdMwAxs1MkE9q5XTH9+2S7Fkkj6qAjJhVyQ=;
 b=nJWJbdEXwYAuJFlKoSUeOgtEye56tQgNFo7rtc4H+I7rH6eGwbta32tcg/7jCCD1pq
 RenlQbyWy4OK4XxeJl+0be7muui21mu6Uw+13rDPjTN3FkwwxqJlrbhJhYXXVuaz0KcG
 raH+ICeSWnb1/tSvAv24EJSNfcK8BLCHUhg7h2jt1tx4TO2Nel/qkyfjbN4r0brLdN+B
 3GPlZXUUhVkpdLXgElHodz9kzOQjMde3zPKEHX+dOXdl+JCCX2ic5RJ4wUMmIgcxh3Ql
 nSd8aJ0ejfbFwNJjynQnMYbu21Jsw9OIG9K9xCq16z8XcJgUir6eYqev2D0urYEJRS3D
 PEfw==
X-Gm-Message-State: ACrzQf2Hh1pRr5p9+HCGpV4z+kvuTEbrGNpJ2iXMqvvpZ4koTlMtICDS
 XEa4XK127WhpDbT1tfK5Um6SVnCyLvdKwEye
X-Google-Smtp-Source: AMsMyM76KJcn2tFdejD8Ug1Yhu0rGmopqgn1312KpeJSo9zWvpgBedVIr9ZqH3BLfzQpnQ8eURFwKQ==
X-Received: by 2002:a05:600c:896:b0:3cf:8e70:f341 with SMTP id
 l22-20020a05600c089600b003cf8e70f341mr17950634wmp.74.1667897155999; 
 Tue, 08 Nov 2022 00:45:55 -0800 (PST)
Received: from smart-All-Series ([185.47.50.92])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c358700b003c6b9749505sm12454687wmq.30.2022.11.08.00.45.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Nov 2022 00:45:55 -0800 (PST)
Date: Tue, 8 Nov 2022 12:15:51 +0330
From: Nasser Afshin <afshin.nasser@gmail.com>
To: buildroot@buildroot.org
Message-ID: <20221108084551.GA22961@smart-All-Series>
References: <20221025065539.4646-1-afshin.nasser@gmail.com>
 <CAGm1_ku8QUbDtT+Bt=5jmD46Vws_go6r2dK9oD95i_bgJynLbg@mail.gmail.com>
 <20221026102255.GA602@smart-All-Series>
 <CAGm1_ktx6UuANUZ=Eqbh_wr7JrJNaHz=ou9zg9mSvGP+ivnzmA@mail.gmail.com>
 <20221029080229.GA24217@smart-All-Series>
 <CAGm1_kuquC8Z9DOZWazKO2jrS4pYVwgYnGWtj8s5WMTBva9wSA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_kuquC8Z9DOZWazKO2jrS4pYVwgYnGWtj8s5WMTBva9wSA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZUbDOe91EdMwAxs1MkE9q5XTH9+2S7Fkkj6qAjJhVyQ=;
 b=mzjHcS4b633GR5FjquY3VlFjyeYvGM8u1mVg3HVS9UF10W8zciHSiXwSk5E26lkmrS
 1D4jYAKL1hQjN0GU2Fq4E23FCJLjsIZA7ITGbRre2PPAsKsKscZrS+P7zUR55QAPBpJs
 YWpkrkTkSc5la8BiSQwbUC7oe+uHhaLsKuk/O8palsyNZbbBOcH/2GVIc8AjsSf7TDPs
 u2ToUhbP/cDBYj0FwM54LioNpySiC9347iqdaXJR7thznY/o8vt0kqIKAsQMpneEEVj7
 nqKek9OxXohHRMlDdJJfdqxDhq3ngl40vkDAM+F5uEunRoJ5KDO06Clz4xBHHQr47t0N
 BAFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mzjHcS4b
Subject: [Buildroot] [PATCH v3 RESEND] python-pycrate: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nasser Afshin <afshin.nasser@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
I'm resending the patch again. Ping!

On Sun, Oct 30, 2022 at 10:11:56AM +0100, Yegor Yefremov wrote:
> Hi Nasser,
> 
> On Sat, Oct 29, 2022 at 10:02 AM Nasser Afshin <afshin.nasser@gmail.com> wrote:
> >
> > Hi Yegor,
> >
> > On Wed, Oct 26, 2022 at 08:21:30PM +0200, Yegor Yefremov wrote:
> > > Hi Nasser,
> > >
> > > On Wed, Oct 26, 2022 at 12:23 PM Nasser Afshin <afshin.nasser@gmail.com> wrote:
> > > >
> > > > Hi Yegor,
> > > >
> > > > Thankyou for taking time to review my patch.
> > > >
> > > > On Tue, Oct 25, 2022 at 10:33:19AM +0200, Yegor Yefremov wrote:
> > > > > Hi Nasser,
> > > > >
> > > > > On Tue, Oct 25, 2022 at 8:55 AM Nasser Afshin <afshin.nasser@gmail.com> wrote:
> > > > > >
> > > > > > Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
> 
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Best regards,
> Yegor
> 
> > > > > > ---
> > > > > >  package/Config.in                          |  1 +
> > > > > >  package/python-pycrate/Config.in           |  8 ++++++++
> > > > > >  package/python-pycrate/python-pycrate.hash |  4 ++++
> > > > > >  package/python-pycrate/python-pycrate.mk   | 13 +++++++++++++
> > > > >
> > > > > An entry to the DEVELOPERS file is missing.
> > > >
> > > > May you help me to whome this entry should refer?
> > >
> > > You should add yourself as a "maintainer" of the package you add. Just
> > > look at other entries.
> > >
> > I have added myself as a maintainer of this package. Thankyou.
> >
> > > >
> > > > >
> > > > > >  4 files changed, 26 insertions(+)
> > > > > >  create mode 100644 package/python-pycrate/Config.in
> > > > > >  create mode 100644 package/python-pycrate/python-pycrate.hash
> > > > > >  create mode 100644 package/python-pycrate/python-pycrate.mk
> > > > > >
> > > > > > diff --git a/package/Config.in b/package/Config.in
> > > > > > index 56b1a08d8b..2443b7bb27 100644
> > > > > > --- a/package/Config.in
> > > > > > +++ b/package/Config.in
> > > > > > @@ -951,6 +951,7 @@ menu "External python modules"
> > > > > >         source "package/python-pyasn1-modules/Config.in"
> > > > > >         source "package/python-pycli/Config.in"
> > > > > >         source "package/python-pycparser/Config.in"
> > > > > > +       source "package/python-pycrate/Config.in"
> > > > > >         source "package/python-pycrypto/Config.in"
> > > > > >         source "package/python-pycryptodomex/Config.in"
> > > > > >         source "package/python-pydal/Config.in"
> > > > > > diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
> > > > > > new file mode 100644
> > > > > > index 0000000000..9e2123d4dd
> > > > > > --- /dev/null
> > > > > > +++ b/package/python-pycrate/Config.in
> > > > > > @@ -0,0 +1,8 @@
> > > > > > +config BR2_PACKAGE_PYTHON_PYCRATE
> > > > > > +       bool "python-pycrate"
> > > > > > +       help
> > > > > > +        It provides basically a runtime for encoding and decoding data structures,
> > > > > > +        including CSN.1 and ASN.1. Additionally, it features a 3G and LTE mobile core
> > > > > > +        network.
> > > > > > +
> > > > > > +        https://github.com/P1sec/pycrate/
> > > > > > diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
> > > > > > new file mode 100644
> > > > > > index 0000000000..24aa51d8e4
> > > > > > --- /dev/null
> > > > > > +++ b/package/python-pycrate/python-pycrate.hash
> > > > > > @@ -0,0 +1,4 @@
> > > > > > +# md5 from https://pypi.python.org/pypi/pycrate/json
> > > > > > +md5    075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
> > > > > > +# Locally computed
> > > > > > +sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
> > > > > > diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
> > > > > > new file mode 100644
> > > > > > index 0000000000..41ce6c18f2
> > > > > > --- /dev/null
> > > > > > +++ b/package/python-pycrate/python-pycrate.mk
> > > > > > @@ -0,0 +1,13 @@
> > > > > > +################################################################################
> > > > > > +#
> > > > > > +# python-pycrate
> > > > > > +#
> > > > > > +################################################################################
> > > > > > +
> > > > > > +PYTHON_PYCRATE_VERSION = 0.5.5
> > > > > > +PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
> > > > > > +PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
> > > > > > +PYTHON_PYCRATE_SETUP_TYPE = distutils
> > > > >
> > > > > SETUP_TYPE is setuptools.
> > > > >
> > > > > Have you tried this command?
> > > > >
> > > > > ./utils/scanpypi pycrate
> > > > >
> > > > > It will do almost everything you need. The thing that is missing is
> > > > > licensing info because there is no license file in the source archive.
> > > >
> > > > Thankyou for pointing this out. Now I send a new version, using this
> > > > command and also adding licensing info.
> > > > >
> > > > > Best regards,
> > > > > Yegor
> > > > >
> > > > > > +PYTHON_PYCRATE_LICENSE = LGPL-2.1-or-later
> > > > > > +
> > > > > > +$(eval $(python-package))
> > > > > > --
> > > > > > 2.17.1
> > > > > >
> > > >
> > > > This is the second version of my patch.
> > > >
> > > > From 979beabd86f1c15d159e37136bc9591fb39b844e Mon Sep 17 00:00:00 2001
> > > > From: Nasser Afshin <Afshin.Nasser@gmail.com>
> > > > Date: Tue, 25 Oct 2022 16:06:53 +0330
> > > > Subject: [PATCH v2] python-pycrate: new package
> > > >
> > > > Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
> > > > ---
> > > > v1 -> v2: Added licence file and its checksum
> > > >                  Used ./utils/scanpypi pycrate tool to be consistent with
> > > >                  others
> > > >
> > > >  package/Config.in                          |  1 +
> > > >  package/python-pycrate/Config.in           |  6 ++++++
> > > >  package/python-pycrate/python-pycrate.hash |  6 ++++++
> > > >  package/python-pycrate/python-pycrate.mk   | 14 ++++++++++++++
> > > >  4 files changed, 27 insertions(+)
> > > >  create mode 100644 package/python-pycrate/Config.in
> > > >  create mode 100644 package/python-pycrate/python-pycrate.hash
> > > >  create mode 100644 package/python-pycrate/python-pycrate.mk
> > > >
> > > > diff --git a/package/Config.in b/package/Config.in
> > > > index e3a34d6e97..a6fcc72cc8 100644
> > > > --- a/package/Config.in
> > > > +++ b/package/Config.in
> > > > @@ -1168,6 +1168,7 @@ menu "External python modules"
> > > >         source "package/python-pycairo/Config.in"
> > > >         source "package/python-pycares/Config.in"
> > > >         source "package/python-pycparser/Config.in"
> > > > +       source "package/python-pycrate/Config.in"
> > > >         source "package/python-pycryptodomex/Config.in"
> > > >         source "package/python-pycups/Config.in"
> > > >         source "package/python-pydal/Config.in"
> > > > diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
> > > > new file mode 100644
> > > > index 0000000000..193a973f7e
> > > > --- /dev/null
> > > > +++ b/package/python-pycrate/Config.in
> > > > @@ -0,0 +1,6 @@
> > > > +config BR2_PACKAGE_PYTHON_PYCRATE
> > > > +       bool "python-pycrate"
> > > > +       help
> > > > +         A software suite to handle various data formats.
> > > > +
> > > > +         https://github.com/P1sec/pycrate/
> > > > diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
> > > > new file mode 100644
> > > > index 0000000000..8ad33370b4
> > > > --- /dev/null
> > > > +++ b/package/python-pycrate/python-pycrate.hash
> > > > @@ -0,0 +1,6 @@
> > > > +# md5, sha256 from https://pypi.org/pypi/pycrate/json
> > > > +md5  075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
> > > > +sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
> > > > +# Locally computed
> > > > +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
> > > > +
> > > > diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
> > > > new file mode 100644
> > > > index 0000000000..c0da152656
> > > > --- /dev/null
> > > > +++ b/package/python-pycrate/python-pycrate.mk
> > > > @@ -0,0 +1,14 @@
> > > > +################################################################################
> > > > +#
> > > > +# python-pycrate
> > > > +#
> > > > +################################################################################
> > > > +
> > > > +PYTHON_PYCRATE_VERSION = 0.5.5
> > > > +PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
> > > > +PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
> > > > +PYTHON_PYCRATE_SETUP_TYPE = setuptools
> > > > +PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/master/license.txt
> > > > +PYTHON_PYCRATE_LICENSE = LGPL-2.1+
> > > > +
> > > > +$(eval $(python-package))
> > >
> > > The patch looks good now. Thanks.
> > >
> > > Best regards,
> > > Yegor
> >
> > This is the third version of the patch:
> >
> > From de6e28885836a6d9a5347a083a68055098508583 Mon Sep 17 00:00:00 2001
> > From: Nasser Afshin <Afshin.Nasser@gmail.com>
> > Date: Tue, 25 Oct 2022 16:06:53 +0330
> > Subject: [PATCH v3] python-pycrate: new package
> >
> > Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
> > ---
> > v1 -> v2: Added licence file and its checksum
> >                 Used ./utils/scanpypi pycrate tool to be consistent with
> >                 others
> > v2 -> v3: Added myself as the maintainer of this package
> >
> >  DEVELOPERS                                 |  3 +++
> >  package/Config.in                          |  1 +
> >  package/python-pycrate/Config.in           |  6 ++++++
> >  package/python-pycrate/python-pycrate.hash |  6 ++++++
> >  package/python-pycrate/python-pycrate.mk   | 14 ++++++++++++++
> >  5 files changed, 30 insertions(+)
> >  create mode 100644 package/python-pycrate/Config.in
> >  create mode 100644 package/python-pycrate/python-pycrate.hash
> >  create mode 100644 package/python-pycrate/python-pycrate.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 6e0b765ba1..a1b48fd45c 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -2157,6 +2157,9 @@ N:        Murat Demirten <mdemirten@yh.com.tr>
> >  F:     package/jpeg-turbo/
> >  F:     package/libgeotiff/
> >
> > +N:     Nasser Afshin <afshin.nasser@gmail.com>
> > +F:     package/python-pycrate/
> > +
> >  N:     Nathaniel Roach <nroach44@gmail.com>
> >  F:     package/bandwidthd/
> >  F:     package/libgudev/
> > diff --git a/package/Config.in b/package/Config.in
> > index e3a34d6e97..a6fcc72cc8 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1168,6 +1168,7 @@ menu "External python modules"
> >         source "package/python-pycairo/Config.in"
> >         source "package/python-pycares/Config.in"
> >         source "package/python-pycparser/Config.in"
> > +       source "package/python-pycrate/Config.in"
> >         source "package/python-pycryptodomex/Config.in"
> >         source "package/python-pycups/Config.in"
> >         source "package/python-pydal/Config.in"
> > diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
> > new file mode 100644
> > index 0000000000..193a973f7e
> > --- /dev/null
> > +++ b/package/python-pycrate/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_PYTHON_PYCRATE
> > +       bool "python-pycrate"
> > +       help
> > +         A software suite to handle various data formats.
> > +
> > +         https://github.com/P1sec/pycrate/
> > diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
> > new file mode 100644
> > index 0000000000..8ad33370b4
> > --- /dev/null
> > +++ b/package/python-pycrate/python-pycrate.hash
> > @@ -0,0 +1,6 @@
> > +# md5, sha256 from https://pypi.org/pypi/pycrate/json
> > +md5  075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
> > +sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
> > +# Locally computed
> > +sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
> > +
> > diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
> > new file mode 100644
> > index 0000000000..c0da152656
> > --- /dev/null
> > +++ b/package/python-pycrate/python-pycrate.mk
> > @@ -0,0 +1,14 @@
> > +################################################################################
> > +#
> > +# python-pycrate
> > +#
> > +################################################################################
> > +
> > +PYTHON_PYCRATE_VERSION = 0.5.5
> > +PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
> > +PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
> > +PYTHON_PYCRATE_SETUP_TYPE = setuptools
> > +PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/master/license.txt
> > +PYTHON_PYCRATE_LICENSE = LGPL-2.1+
> > +
> > +$(eval $(python-package))
> > --
> > 2.17.1
> >

Best regards,
Nasser Afshin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
