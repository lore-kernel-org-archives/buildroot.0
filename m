Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79E3C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 08:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80C51813D7;
	Sat, 29 Oct 2022 08:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80C51813D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id txjnSUkpTXsR; Sat, 29 Oct 2022 08:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EEE581399;
	Sat, 29 Oct 2022 08:02:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EEE581399
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB67C1BF59E
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9693E40297
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 08:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9693E40297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lA7a7TPeqdDC for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 08:02:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02BCA40017
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02BCA40017
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 08:02:36 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id g12so9253030wrs.10
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 01:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzf+/CZmmPPGf1aTM6LxEa20is0SAXpDe81ZW/+lmyc=;
 b=QxFgRGbV3VQjril1iICsrwCQnAAOzZd+q2iQxdLSsLpKAnuZL3F9gbDOmcinkZAhRo
 aTG8WggUDGrEUAK3ehaNB8yxWDHJ18VSz8/j6XFvAFyX8SlpsNGkpsKBjN8RtEcrGitK
 hw/9dlZiLuwbVuHn7L9ab6buKXLOiLP23A8KoBvSDNRakmaunExcZxnQF5h/LoKpuUj5
 uqZeGnu1eNItgnfJ7w1P69LE+wLDC7ahw9awRlw/cMOdgpLZIoiwOUtoGbQUrcK+J+Bo
 LwnSvNqrzKuhzXmYC6pOf5Wfn4lBoNI3RXFYq7cOEFLIFLuB5knFtaD2A2cmaW7L+ruE
 Jkwg==
X-Gm-Message-State: ACrzQf1ck/+qsq/tbt5dH1MThQtDd28Y0YN6U99gd5x87IuY5VY1rf49
 YcGV9QZfF34L5+PpyESjupTMGDdmKPoyWZVV
X-Google-Smtp-Source: AMsMyM6MpAIgtbHhMmpT96FndtkEDWG1hTP5ELNn4HPORT9t6jflz6UpxTtBPYnZytgOa5blLaCzGA==
X-Received: by 2002:a5d:68ce:0:b0:236:9981:d216 with SMTP id
 p14-20020a5d68ce000000b002369981d216mr1708220wrw.384.1667030554805; 
 Sat, 29 Oct 2022 01:02:34 -0700 (PDT)
Received: from smart-All-Series (ip34.ip-145-239-104.eu. [145.239.104.34])
 by smtp.gmail.com with ESMTPSA id
 m9-20020adff389000000b002366e8eee11sm802421wro.101.2022.10.29.01.02.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Oct 2022 01:02:34 -0700 (PDT)
Date: Sat, 29 Oct 2022 11:32:29 +0330
From: Nasser Afshin <afshin.nasser@gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Message-ID: <20221029080229.GA24217@smart-All-Series>
References: <20221025065539.4646-1-afshin.nasser@gmail.com>
 <CAGm1_ku8QUbDtT+Bt=5jmD46Vws_go6r2dK9oD95i_bgJynLbg@mail.gmail.com>
 <20221026102255.GA602@smart-All-Series>
 <CAGm1_ktx6UuANUZ=Eqbh_wr7JrJNaHz=ou9zg9mSvGP+ivnzmA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGm1_ktx6UuANUZ=Eqbh_wr7JrJNaHz=ou9zg9mSvGP+ivnzmA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzf+/CZmmPPGf1aTM6LxEa20is0SAXpDe81ZW/+lmyc=;
 b=PSQDgCTgWqCvEyt1ZT3t5dwoKGYssy0bKeEhEq3PeL9FTpZ+IqyibdPRBGYcqHEpst
 u+A0TGznMTaIIuswPY/I1hlLTZGhGU6UJ7V4b/VK+0p01+01LWSycX7oTgxEdzYig2BG
 A3NLQkfo/FBMEGVuqwDhOa+TxcE5fm/zImXSN8kKjS7lLcIRrJ+ynWTh7k8zMUw12ezH
 bM4KIte8pTMDpvsxzx5cQVtvXxaRWwSjzlMZynKKinWzqsI9AY3RnKd7fZ43o6gPl4/O
 45Jto6R8q2khIzkrI/EmM+o3tRTLHpJHvU3WvZ3WFkKc9/ryWf+91TaDnzMGvRsKEgcs
 9QHg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PSQDgCTg
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yegor,

On Wed, Oct 26, 2022 at 08:21:30PM +0200, Yegor Yefremov wrote:
> Hi Nasser,
> 
> On Wed, Oct 26, 2022 at 12:23 PM Nasser Afshin <afshin.nasser@gmail.com> wrote:
> >
> > Hi Yegor,
> >
> > Thankyou for taking time to review my patch.
> >
> > On Tue, Oct 25, 2022 at 10:33:19AM +0200, Yegor Yefremov wrote:
> > > Hi Nasser,
> > >
> > > On Tue, Oct 25, 2022 at 8:55 AM Nasser Afshin <afshin.nasser@gmail.com> wrote:
> > > >
> > > > Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
> > > > ---
> > > >  package/Config.in                          |  1 +
> > > >  package/python-pycrate/Config.in           |  8 ++++++++
> > > >  package/python-pycrate/python-pycrate.hash |  4 ++++
> > > >  package/python-pycrate/python-pycrate.mk   | 13 +++++++++++++
> > >
> > > An entry to the DEVELOPERS file is missing.
> >
> > May you help me to whome this entry should refer?
> 
> You should add yourself as a "maintainer" of the package you add. Just
> look at other entries.
> 
I have added myself as a maintainer of this package. Thankyou.

> >
> > >
> > > >  4 files changed, 26 insertions(+)
> > > >  create mode 100644 package/python-pycrate/Config.in
> > > >  create mode 100644 package/python-pycrate/python-pycrate.hash
> > > >  create mode 100644 package/python-pycrate/python-pycrate.mk
> > > >
> > > > diff --git a/package/Config.in b/package/Config.in
> > > > index 56b1a08d8b..2443b7bb27 100644
> > > > --- a/package/Config.in
> > > > +++ b/package/Config.in
> > > > @@ -951,6 +951,7 @@ menu "External python modules"
> > > >         source "package/python-pyasn1-modules/Config.in"
> > > >         source "package/python-pycli/Config.in"
> > > >         source "package/python-pycparser/Config.in"
> > > > +       source "package/python-pycrate/Config.in"
> > > >         source "package/python-pycrypto/Config.in"
> > > >         source "package/python-pycryptodomex/Config.in"
> > > >         source "package/python-pydal/Config.in"
> > > > diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
> > > > new file mode 100644
> > > > index 0000000000..9e2123d4dd
> > > > --- /dev/null
> > > > +++ b/package/python-pycrate/Config.in
> > > > @@ -0,0 +1,8 @@
> > > > +config BR2_PACKAGE_PYTHON_PYCRATE
> > > > +       bool "python-pycrate"
> > > > +       help
> > > > +        It provides basically a runtime for encoding and decoding data structures,
> > > > +        including CSN.1 and ASN.1. Additionally, it features a 3G and LTE mobile core
> > > > +        network.
> > > > +
> > > > +        https://github.com/P1sec/pycrate/
> > > > diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
> > > > new file mode 100644
> > > > index 0000000000..24aa51d8e4
> > > > --- /dev/null
> > > > +++ b/package/python-pycrate/python-pycrate.hash
> > > > @@ -0,0 +1,4 @@
> > > > +# md5 from https://pypi.python.org/pypi/pycrate/json
> > > > +md5    075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
> > > > +# Locally computed
> > > > +sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
> > > > diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
> > > > new file mode 100644
> > > > index 0000000000..41ce6c18f2
> > > > --- /dev/null
> > > > +++ b/package/python-pycrate/python-pycrate.mk
> > > > @@ -0,0 +1,13 @@
> > > > +################################################################################
> > > > +#
> > > > +# python-pycrate
> > > > +#
> > > > +################################################################################
> > > > +
> > > > +PYTHON_PYCRATE_VERSION = 0.5.5
> > > > +PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
> > > > +PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
> > > > +PYTHON_PYCRATE_SETUP_TYPE = distutils
> > >
> > > SETUP_TYPE is setuptools.
> > >
> > > Have you tried this command?
> > >
> > > ./utils/scanpypi pycrate
> > >
> > > It will do almost everything you need. The thing that is missing is
> > > licensing info because there is no license file in the source archive.
> >
> > Thankyou for pointing this out. Now I send a new version, using this
> > command and also adding licensing info.
> > >
> > > Best regards,
> > > Yegor
> > >
> > > > +PYTHON_PYCRATE_LICENSE = LGPL-2.1-or-later
> > > > +
> > > > +$(eval $(python-package))
> > > > --
> > > > 2.17.1
> > > >
> >
> > This is the second version of my patch.
> >
> > From 979beabd86f1c15d159e37136bc9591fb39b844e Mon Sep 17 00:00:00 2001
> > From: Nasser Afshin <Afshin.Nasser@gmail.com>
> > Date: Tue, 25 Oct 2022 16:06:53 +0330
> > Subject: [PATCH v2] python-pycrate: new package
> >
> > Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
> > ---
> > v1 -> v2: Added licence file and its checksum
> >                  Used ./utils/scanpypi pycrate tool to be consistent with
> >                  others
> >
> >  package/Config.in                          |  1 +
> >  package/python-pycrate/Config.in           |  6 ++++++
> >  package/python-pycrate/python-pycrate.hash |  6 ++++++
> >  package/python-pycrate/python-pycrate.mk   | 14 ++++++++++++++
> >  4 files changed, 27 insertions(+)
> >  create mode 100644 package/python-pycrate/Config.in
> >  create mode 100644 package/python-pycrate/python-pycrate.hash
> >  create mode 100644 package/python-pycrate/python-pycrate.mk
> >
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
> 
> The patch looks good now. Thanks.
> 
> Best regards,
> Yegor

This is the third version of the patch:

From de6e28885836a6d9a5347a083a68055098508583 Mon Sep 17 00:00:00 2001
From: Nasser Afshin <Afshin.Nasser@gmail.com>
Date: Tue, 25 Oct 2022 16:06:53 +0330
Subject: [PATCH v3] python-pycrate: new package

Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
---
v1 -> v2: Added licence file and its checksum
		Used ./utils/scanpypi pycrate tool to be consistent with
		others
v2 -> v3: Added myself as the maintainer of this package

 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/python-pycrate/Config.in           |  6 ++++++
 package/python-pycrate/python-pycrate.hash |  6 ++++++
 package/python-pycrate/python-pycrate.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-pycrate/Config.in
 create mode 100644 package/python-pycrate/python-pycrate.hash
 create mode 100644 package/python-pycrate/python-pycrate.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6e0b765ba1..a1b48fd45c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2157,6 +2157,9 @@ N:	Murat Demirten <mdemirten@yh.com.tr>
 F:	package/jpeg-turbo/
 F:	package/libgeotiff/
 
+N:	Nasser Afshin <afshin.nasser@gmail.com>
+F:	package/python-pycrate/
+
 N:	Nathaniel Roach <nroach44@gmail.com>
 F:	package/bandwidthd/
 F:	package/libgudev/
diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..a6fcc72cc8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1168,6 +1168,7 @@ menu "External python modules"
 	source "package/python-pycairo/Config.in"
 	source "package/python-pycares/Config.in"
 	source "package/python-pycparser/Config.in"
+	source "package/python-pycrate/Config.in"
 	source "package/python-pycryptodomex/Config.in"
 	source "package/python-pycups/Config.in"
 	source "package/python-pydal/Config.in"
diff --git a/package/python-pycrate/Config.in b/package/python-pycrate/Config.in
new file mode 100644
index 0000000000..193a973f7e
--- /dev/null
+++ b/package/python-pycrate/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_PYCRATE
+	bool "python-pycrate"
+	help
+	  A software suite to handle various data formats.
+
+	  https://github.com/P1sec/pycrate/
diff --git a/package/python-pycrate/python-pycrate.hash b/package/python-pycrate/python-pycrate.hash
new file mode 100644
index 0000000000..8ad33370b4
--- /dev/null
+++ b/package/python-pycrate/python-pycrate.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/pycrate/json
+md5  075622d5d573274cd4dbfe268ca52f7f  pycrate-0.5.5.tar.gz
+sha256  59f09331890a389a6b98412f19f4fb021c5a75a35ab07bf5ba0d1e299a0967af  pycrate-0.5.5.tar.gz
+# Locally computed
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  license.txt
+
diff --git a/package/python-pycrate/python-pycrate.mk b/package/python-pycrate/python-pycrate.mk
new file mode 100644
index 0000000000..c0da152656
--- /dev/null
+++ b/package/python-pycrate/python-pycrate.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pycrate
+#
+################################################################################
+
+PYTHON_PYCRATE_VERSION = 0.5.5
+PYTHON_PYCRATE_SOURCE = pycrate-$(PYTHON_PYCRATE_VERSION).tar.gz
+PYTHON_PYCRATE_SITE = https://files.pythonhosted.org/packages/25/8f/b3d7e0b541aa04b2f0f7aa694a6946b572bfa2e2627cf1f12b5416d633df
+PYTHON_PYCRATE_SETUP_TYPE = setuptools
+PYTHON_PYCRATE_EXTRA_DOWNLOADS = https://raw.githubusercontent.com/P1sec/pycrate/master/license.txt
+PYTHON_PYCRATE_LICENSE = LGPL-2.1+
+
+$(eval $(python-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
