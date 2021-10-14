Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94F5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:00:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F73E61151
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F73E61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C8B406F1;
	Thu, 14 Oct 2021 21:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wN02RqREYhY2; Thu, 14 Oct 2021 21:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56CFE406FC;
	Thu, 14 Oct 2021 21:00:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5521C1BF343
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43DC160BAF
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mw3ydOpS6zzS for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:00:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3D606083E
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:00:43 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 r1-20020a4a9641000000b002b6b55007bfso2320169ooi.3
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J/aLNjl+qUzyeKpA+kPRdmUgizz+yjnDT83Cw6LF6N4=;
 b=LCAseVWkBh07Ha+qMrv2+AvVonQT/ta6LIJ6F6W+gs2ajilshbf1i5mSVKLzZFUr7z
 DPjPnwBXQkCb7dapoxmYFFN5AYhwqJbYwBcvmU7G0CBHprYO/ZvxAzuZdCOD32j5mqgN
 GP7OaS4raEcZhifJUxxGgKUuIfEfCI9+fefbsT9B64bpH6r3BoBbk6Gck7e2JIsVQP/5
 yaZx64rgPVPl76Z1AHib4e/ccBZAFy3jXfTuVLKCRxI+aoOiEpPqx57MRPcnxnKkkUTO
 lGyobtKrI4WnmFcDs2RuI+R3/P11HeRYNhuGTwiBNRJ3+F8puqNlxqkoHUtr1vieIx+G
 L6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J/aLNjl+qUzyeKpA+kPRdmUgizz+yjnDT83Cw6LF6N4=;
 b=b1E7ejYUa111OCM0EDLcD3SGDqjKl6zRqC0fHzqRoPOLWjkZq897frFDP0ez7jNL7e
 DZaTOO5hn+xeBiyChC8GhjI3XetI48kvpnZCIrGtBKPVKGMVGXbgZhBCfHATtL4WyWu8
 guhM/qirtPWO4mJRiApHPDPKwne3ad0/vECY2kOIfWz012pb9UQbb02d3RqNoU5er0Uc
 0m5EC0HTzgc+MZihvhHR/a2uOx4cu6EhAA8DiMB1CAqh5Su9BKOVHBLulGGKfKSt+QLA
 muHjjPXdYzDZufY/9PwJYX627qvEMPS7Zhr8iZthfFB+5xX4uQfywTHZHwH4BXZjIVCk
 WwhA==
X-Gm-Message-State: AOAM532XldvekUBvtY5JZJpRx7I8qrIQwANI1YNpanYdEyWxfFClfx7s
 y3SXAeiD/OS3wMaD6TVmZjCPPgRqQYu/W25W8pw=
X-Google-Smtp-Source: ABdhPJzQOFdGRc82ElS0ijnywiHUFBAAM3cEqmJRr0SqXEvXtaQmVGfzZYGv/5+vljWszV5lchC0c7hIYOaQoWVvHQE=
X-Received: by 2002:a4a:ea54:: with SMTP id j20mr6001997ooe.22.1634245242596; 
 Thu, 14 Oct 2021 14:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211007193121.3775311-1-james.hilliard1@gmail.com>
 <0c6ae527-348c-58dd-72ff-d4dfd5863b74@mind.be>
In-Reply-To: <0c6ae527-348c-58dd-72ff-d4dfd5863b74@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 14 Oct 2021 15:00:31 -0600
Message-ID: <CADvTj4r5JmveVPdzCRQK5EOD7w6rmKLp52fTYWw2pQYd9KLXaw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/2] package/python-markupsafe: bump to
 version 2.0.1
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, Lionel Flandrin <lionel@svkt.org>,
 Matt Weber <matthew.weber@collins.com>, Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 14, 2021 at 2:37 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>   Hi James,
>
>   Quote a few changes needed I'm afraid...
>
> On 07/10/2021 21:31, James Hilliard wrote:
> > Drop python2 support.
> >
> > Remove python3-markupsafe host build as python2 host builds for
> > markupsafe are not supported, python3 host builds are moved to
> > python-markupsafe.
> >
> > Propagate reverse python3 dependency.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/python-flask-babel/Config.in             |  1 +
> >   package/python-flask-cors/Config.in              |  1 +
> >   package/python-flask-expects-json/Config.in      |  1 +
> >   package/python-flask-jsonrpc/Config.in           |  1 +
> >   package/python-flask-login/Config.in             |  1 +
> >   package/python-flask-sqlalchemy/Config.in        |  1 +
> >   package/python-flask-wtf/Config.in               |  1 +
> >   package/python-flask/Config.in                   |  1 +
> >   package/python-jinja2/Config.in                  |  1 +
> >   package/python-markupsafe/Config.in              |  1 +
> >   package/python-markupsafe/python-markupsafe.hash |  9 +++++----
> >   package/python-markupsafe/python-markupsafe.mk   |  7 ++++---
> >   package/python-wtforms/Config.in                 |  1 +
> >   package/python3-jinja2/python3-jinja2.mk         |  2 +-
> >   .../python3-markupsafe/python3-markupsafe.hash   |  1 -
> >   package/python3-markupsafe/python3-markupsafe.mk | 16 ----------------
> >   16 files changed, 21 insertions(+), 25 deletions(-)
> >   delete mode 120000 package/python3-markupsafe/python3-markupsafe.hash
> >   delete mode 100644 package/python3-markupsafe/python3-markupsafe.mk
> >
> > diff --git a/package/python-flask-babel/Config.in b/package/python-flask-babel/Config.in
> > index 272d9ef1c1..52f05f1e6a 100644
> > --- a/package/python-flask-babel/Config.in
> > +++ b/package/python-flask-babel/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_FLASK_BABEL
> >       bool "python-flask-babel"
> > +     depends on BR2_PACKAGE_PYTHON3
>
>   We normally put a comment behind it to say where it comes from, if the package
> itself doesn't directly depend on python3.

Well it's due to markupsafe and jinja2 being moved to python3 only so figured
would be a bit verbose, also didn't bother since we are preparing to
drop python2
support entirely.

>
> >       select BR2_PACKAGE_PYTHON_FLASK # runtime
> >       select BR2_PACKAGE_PYTHON_BABEL # runtime
> >       select BR2_PACKAGE_PYTHON_JINJA2 # runtime
> > diff --git a/package/python-flask-cors/Config.in b/package/python-flask-cors/Config.in
> > index e2e84797f9..f34f77e5b0 100644
> > --- a/package/python-flask-cors/Config.in
> > +++ b/package/python-flask-cors/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_FLASK_CORS
> >       bool "python-flask-cors"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       select BR2_PACKAGE_PYTHON_FLASK # runtime
> >       select BR2_PACKAGE_PYTHON_SIX # runtime
>
>   You should check if six is really needed if it's python3 only (some packages
> drop the dependency on six if it's python3 anyway). Just check if any match of
> `import .*six' is conditional or not.

It does appear to be still needed as it's an unconditional import:
https://github.com/corydolphin/flask-cors/blob/3.0.10/flask_cors/core.py#L19

>
>
> >       help
> > diff --git a/package/python-flask-expects-json/Config.in b/package/python-flask-expects-json/Config.in
> > index 901234762e..efe4c248d3 100644
> > --- a/package/python-flask-expects-json/Config.in
> > +++ b/package/python-flask-expects-json/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_FLASK_EXPECTS_JSON
> >       bool "python-flask-expects-json"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       select BR2_PACKAGE_PYTHON_FLASK # runtime
> >       select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
> >       help
> > diff --git a/package/python-flask-jsonrpc/Config.in b/package/python-flask-jsonrpc/Config.in
> > index c8ecd854b3..4bc13f9bcb 100644
> > --- a/package/python-flask-jsonrpc/Config.in
> > +++ b/package/python-flask-jsonrpc/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_FLASK_JSONRPC
> >       bool "python-flask-jsonrpc"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       # runtime dependency
> >       select BR2_PACKAGE_PYTHON_FLASK
> >       help
> > diff --git a/package/python-flask-login/Config.in b/package/python-flask-login/Config.in
> > index 88c413e2a2..00fa58d783 100644
> > --- a/package/python-flask-login/Config.in
> > +++ b/package/python-flask-login/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_FLASK_LOGIN
> >       bool "python-flask-login"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       # runtime dependency
> >       select BR2_PACKAGE_PYTHON_FLASK
> >       help
> > diff --git a/package/python-flask-sqlalchemy/Config.in b/package/python-flask-sqlalchemy/Config.in
> > index fa4a035110..e96bd7078c 100644
> > --- a/package/python-flask-sqlalchemy/Config.in
> > +++ b/package/python-flask-sqlalchemy/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_FLASK_SQLALCHEMY
> >       bool "python-flask-sqlalchemy"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       select BR2_PACKAGE_PYTHON_FLASK # runtime
> >       select BR2_PACKAGE_PYTHON_SQLALCHEMY # runtime
> >       help
> > diff --git a/package/python-flask-wtf/Config.in b/package/python-flask-wtf/Config.in
> > index bb15489956..022ea89265 100644
> > --- a/package/python-flask-wtf/Config.in
> > +++ b/package/python-flask-wtf/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_FLASK_WTF
> >       bool "python-flask-wtf"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       select BR2_PACKAGE_PYTHON_FLASK # runtime
> >       select BR2_PACKAGE_PYTHON_ITSDANGEROUS # runtime
> >       select BR2_PACKAGE_PYTHON_WTFORMS # runtime
> > diff --git a/package/python-flask/Config.in b/package/python-flask/Config.in
> > index 0e5b64ce59..56bfe10f01 100644
> > --- a/package/python-flask/Config.in
> > +++ b/package/python-flask/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_FLASK
> >       bool "python-flask"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       select BR2_PACKAGE_PYTHON_CLICK # runtime
> >       select BR2_PACKAGE_PYTHON_JINJA2 # runtime
> >       select BR2_PACKAGE_PYTHON_WERKZEUG # runtime
> > diff --git a/package/python-jinja2/Config.in b/package/python-jinja2/Config.in
> > index 5b99df75b8..27f6b1a7dd 100644
> > --- a/package/python-jinja2/Config.in
> > +++ b/package/python-jinja2/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_JINJA2
> >       bool "python-jinja2"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
> >       select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
>
>   This should be removed. There are a bunch of those in various packages.

It's removed here:
https://patchwork.ozlabs.org/project/buildroot/patch/20211007193121.3775311-2-james.hilliard1@gmail.com/

>
> >       select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
>
>   The condition part of this one should also be removed.
>
>
>   python-jinja2 has a host variant. Making it python3-only means you also have
> to set HOST_PYTHON_JINJA2_NEEDS_HOST_PYTHON = python3
>
> (there may be others as well)
>
> > diff --git a/package/python-markupsafe/Config.in b/package/python-markupsafe/Config.in
> > index 48421e0a32..cd7cb2d8e9 100644
> > --- a/package/python-markupsafe/Config.in
> > +++ b/package/python-markupsafe/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_MARKUPSAFE
> >       bool "python-markupsafe"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       help
> >         MarkupSafe implements a XML/HTML/XHTML Markup safe string
> >         for Python.
> > diff --git a/package/python-markupsafe/python-markupsafe.hash b/package/python-markupsafe/python-markupsafe.hash
> > index df07662a86..520bb405fb 100644
> > --- a/package/python-markupsafe/python-markupsafe.hash
> > +++ b/package/python-markupsafe/python-markupsafe.hash
> > @@ -1,4 +1,5 @@
> > -# md5 from https://pypi.python.org/pypi/markupsafe/json, sha256 locally computed
> > -md5  43fd756864fe42063068e092e220c57b  MarkupSafe-1.1.1.tar.gz
> > -sha256       29872e92839765e546828bb7754a68c418d927cd064fd4708fab9fe9c8bb116b  MarkupSafe-1.1.1.tar.gz
> > -sha256       489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
> > +# md5, sha256 from https://pypi.org/pypi/markupsafe/json
> > +md5  892e0fefa3c488387e5cc0cad2daa523  MarkupSafe-2.0.1.tar.gz
> > +sha256  594c67807fb16238b30c44bdf74f36c02cdf22d1c8cda91ef8a0ed8dabf5620a  MarkupSafe-2.0.1.tar.gz
> > +# Locally computed sha256 checksums
> > +sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
> > diff --git a/package/python-markupsafe/python-markupsafe.mk b/package/python-markupsafe/python-markupsafe.mk
> > index f067d94f34..14a8d06dfe 100644
> > --- a/package/python-markupsafe/python-markupsafe.mk
> > +++ b/package/python-markupsafe/python-markupsafe.mk
> > @@ -4,13 +4,14 @@
> >   #
> >   ################################################################################
> >
> > -# Please keep in sync with package/python3-markupsafe/python3-markupsafe.mk
> > -PYTHON_MARKUPSAFE_VERSION = 1.1.1
> > +PYTHON_MARKUPSAFE_VERSION = 2.0.1
> >   PYTHON_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON_MARKUPSAFE_VERSION).tar.gz
> > -PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
> > +PYTHON_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/bf/10/ff66fea6d1788c458663a84d88787bae15d45daa16f6b3ef33322a51fc7e
> >   PYTHON_MARKUPSAFE_SETUP_TYPE = setuptools
> >   PYTHON_MARKUPSAFE_LICENSE = BSD-3-Clause
> >   PYTHON_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
> >
> > +HOST_PYTHON_MARKUPSAFE_NEEDS_HOST_PYTHON = python3
>
>   Yes, like this :-)
>
> > +
> >   $(eval $(python-package))
> >   $(eval $(host-python-package))
> > diff --git a/package/python-wtforms/Config.in b/package/python-wtforms/Config.in
> > index 33a17d3d37..0cc136fc13 100644
> > --- a/package/python-wtforms/Config.in
> > +++ b/package/python-wtforms/Config.in
> > @@ -1,5 +1,6 @@
> >   config BR2_PACKAGE_PYTHON_WTFORMS
> >       bool "python-wtforms"
> > +     depends on BR2_PACKAGE_PYTHON3
> >       select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
> >       help
> >         A flexible forms validation and rendering library for
> > diff --git a/package/python3-jinja2/python3-jinja2.mk b/package/python3-jinja2/python3-jinja2.mk
> > index 5d29e1d889..41081db04a 100644
> > --- a/package/python3-jinja2/python3-jinja2.mk
> > +++ b/package/python3-jinja2/python3-jinja2.mk
> > @@ -15,6 +15,6 @@ PYTHON3_JINJA2_CPE_ID_PRODUCT = jinja2
> >
> >   HOST_PYTHON3_JINJA2_NEEDS_HOST_PYTHON = python3
> >   # In host build, setup.py tries to download markupsafe if it is not installed
> > -HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python3-markupsafe
> > +HOST_PYTHON3_JINJA2_DEPENDENCIES = host-python-markupsafe
>
>   Since python-jinja2 became python3-only, this package can be removed entirely.

Which I did here:
https://patchwork.ozlabs.org/project/buildroot/patch/20211007193121.3775311-2-james.hilliard1@gmail.com/

Should I not be splitting up changes like this in a series?

I tried to keep most of the python-jinja2 changes in the second patch, it was
intended that they be reviewed/applied at the same time.

>
>
>   Regards,
>   Arnout
>
>
> >
> >   $(eval $(host-python-package))
> > diff --git a/package/python3-markupsafe/python3-markupsafe.hash b/package/python3-markupsafe/python3-markupsafe.hash
> > deleted file mode 120000
> > index 947cfa12d7..0000000000
> > --- a/package/python3-markupsafe/python3-markupsafe.hash
> > +++ /dev/null
> > @@ -1 +0,0 @@
> > -../python-markupsafe/python-markupsafe.hash
> > \ No newline at end of file
> > diff --git a/package/python3-markupsafe/python3-markupsafe.mk b/package/python3-markupsafe/python3-markupsafe.mk
> > deleted file mode 100644
> > index 58f6e67b64..0000000000
> > --- a/package/python3-markupsafe/python3-markupsafe.mk
> > +++ /dev/null
> > @@ -1,16 +0,0 @@
> > -################################################################################
> > -#
> > -# python3-markupsafe
> > -#
> > -################################################################################
> > -
> > -PYTHON3_MARKUPSAFE_VERSION = 1.1.1
> > -PYTHON3_MARKUPSAFE_SOURCE = MarkupSafe-$(PYTHON3_MARKUPSAFE_VERSION).tar.gz
> > -PYTHON3_MARKUPSAFE_SITE = https://files.pythonhosted.org/packages/b9/2e/64db92e53b86efccfaea71321f597fa2e1b2bd3853d8ce658568f7a13094
> > -PYTHON3_MARKUPSAFE_SETUP_TYPE = setuptools
> > -PYTHON3_MARKUPSAFE_LICENSE = BSD-3-Clause
> > -PYTHON3_MARKUPSAFE_LICENSE_FILES = LICENSE.rst
> > -
> > -HOST_PYTHON3_MARKUPSAFE_NEEDS_HOST_PYTHON = python3
> > -
> > -$(eval $(host-python-package))
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
