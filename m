Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5271E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 15:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89B04606C1;
	Tue,  7 Jan 2025 15:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAK8Mfmb_Dud; Tue,  7 Jan 2025 15:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7FEE60704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7FEE60704;
	Tue,  7 Jan 2025 15:54:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA3046B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 15:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E7FD403DE
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 15:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWIiOkV1eRbG for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 15:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=tim.gover@raspberrypi.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DEA9940323
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEA9940323
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEA9940323
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 15:54:17 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-21619108a6bso215967665ad.3
 for <buildroot@buildroot.org>; Tue, 07 Jan 2025 07:54:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736265257; x=1736870057;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KtQHSxiD+kOPfgwfC6sXB7NY1k6SuH8LxHYp99xsAqw=;
 b=NRrmDla6R/tDjNbHmove/ZzW2yTdybgfL1AdgI+4Z/UkIbNm2mNJvrI21hYJqmZ8A2
 AlWivgmBEj2O9qC99osg0CayRAiBvgSYbbkqKZunpWlO4lCeFKmRa7jL1zNvHhcMr9vv
 cGweAJFnK6ryx7BswL9tvBYPUOElUCnS8bEXRAsw8hdlzbIoWuarKVzByjxo5f2BlbNs
 rCZGRgoJV2z52SR4X3dyaWD9d9uFJL3EgjIWeqg4GHh1cHYvtkd+5vtwMUolwA8kAIF0
 a7EYkrgpwEvTMOkyIFbQV46L4WWJed2skbw7azzYwt3CwAjvN3krrzfbnsDOFCNam+17
 iQaw==
X-Gm-Message-State: AOJu0YwyT3s+g9zn/qDfpTgr+MbOeXcufnPPPpXA4QI7E7LdUiOHS6b2
 ajeqtyRQqbpODp1AF7wEOiWjOVaasNZXq9Uwn/Fq5CFOQkacG3N+5cJsejDb8uoUWnMfmnlvMFN
 37Lbak06H6tZp4qpF13Vhhu5QpkXCjVjVeK4xYQ==
X-Gm-Gg: ASbGncvwVMgaelr1ls9ySTfYyxu1Pa4XqCi2hPMpHSEDlqQ8ah8YcEjg1FF+VnNDk5Z
 RCwOeCtYDJCwf1TonJbmWgvQLkCSAqK6ArUtkPLZProKXtwtu+fxEbBuzpDQQGCP1D8yKrg==
X-Google-Smtp-Source: AGHT+IEu6iCscKv7Kc5b3g+kZhkYUse6we9GD7L85ZcrzxLQen1R8xs2IW7ZXG2ELSeJwy86FHK602sEBJGocjsJkPY=
X-Received: by 2002:a05:6a20:1582:b0:1e0:d5f3:f3ed with SMTP id
 adf61e73a8af0-1e5e048ab3bmr97805258637.19.1736265257066; Tue, 07 Jan 2025
 07:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20241216125800.219227-1-tim.gover@raspberrypi.com>
 <20241216125800.219227-2-tim.gover@raspberrypi.com>
 <20241230000816.34cc40be@windsurf>
In-Reply-To: <20241230000816.34cc40be@windsurf>
Date: Tue, 7 Jan 2025 15:54:07 +0000
X-Gm-Features: AbW1kvY83IXFaKg_zvl85xukrwF5KP6h_ZpDrbFqSB0PnBLW_Xlah6osG5BrK3s
Message-ID: <CAAvKZ67mYqJtFF=oVQpRjjLVObyqvfeGgD=K3se+p65LxstYYQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Tim Gover via buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1736265257; x=1736870057; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KtQHSxiD+kOPfgwfC6sXB7NY1k6SuH8LxHYp99xsAqw=;
 b=W1Wwj0LrorG8CDuCbY5qx8mDCk3Z1r8QVhK5hvZbhdUw20mQde/Qbh5jqjP9B8JdWf
 /QjtbN3mB7qujoYPVefBOiWUTGtJk70aKRkwTMIixDy34tUrqgtJ+Qbbc1y0wWwYzuYD
 7AsvM+bGf6TcN9rLEa8DPJM5iEqvs60Sp/47jO5Mq8qCFcIy0HWmBnYKXlYIZ/9blcEJ
 Z/TcYRT9PJj6GxCa2JnpIPigekOjNrBuZzO80KqKWOIKfmyr7vF1ReXLM3Bd1BkSSbZ2
 630ddh5umYcBnFQ++K6ozxTkMae08DsdWzBplIYeirFKQTCBWiJykPTF/ol4524E1oEk
 2pTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=raspberrypi.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=W1Wwj0Lr
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-eeprom: New package for RPi
 bootloader tools
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Tim Gover via buildroot <buildroot@buildroot.org>
Reply-To: Tim Gover <tim.gover@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 29 Dec 2024 at 23:08, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Tim,
>
> Thanks a lot for your submission, and sorry for the delay in getting
> back to you! See below some feedback.
>
> On Mon, 16 Dec 2024 12:58:00 +0000
> Tim Gover via buildroot <buildroot@buildroot.org> wrote:
>
> > This package adds the host and OS tools for configuring
> > the bootloader and building/signing tools for signed boot.
> >
> > Normally, the host tools would be invoked from a post-build
> > script to sign the boot.img file. The device tools would be
> > invoked from a custom on-device software update process e.g.
> > using rpi-eeprom-digest to verify the signature of a boot.img
> > file against a public key retrieved from the EEPROM.
>
> Thanks for the good explanation of why both a target and host package
> are needed.
>
> >  configs/raspberrypi5_defconfig     |  1 +
> >  package/Config.in                  |  1 +
> >  package/Config.in.host             |  1 +
> >  package/rpi-eeprom/Config.in       |  9 +++++++++
> >  package/rpi-eeprom/Config.in.host  |  9 +++++++++
> >  package/rpi-eeprom/rpi-eeprom.hash |  1 +
> >  package/rpi-eeprom/rpi-eeprom.mk   | 27 +++++++++++++++++++++++++++
> >  7 files changed, 49 insertions(+)
> >  create mode 100644 package/rpi-eeprom/Config.in
> >  create mode 100644 package/rpi-eeprom/Config.in.host
> >  create mode 100644 package/rpi-eeprom/rpi-eeprom.hash
> >  create mode 100644 package/rpi-eeprom/rpi-eeprom.mk
>
> Could you please add an entry in the DEVELOPERS file for this new
> package?
>
> > diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
> > index 8cbd533eee..6d364ad32f 100644
> > --- a/configs/raspberrypi5_defconfig
> > +++ b/configs/raspberrypi5_defconfig
> > @@ -31,3 +31,4 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
> >  BR2_PACKAGE_HOST_GENIMAGE=y
> >  BR2_PACKAGE_HOST_KMOD_XZ=y
> >  BR2_PACKAGE_HOST_MTOOLS=y
> > +BR2_PACKAGE_HOST_RPI_EEPROM=y
>
> I'd prefer to see this done as a separate commit (possibly in the same
> patch series). However, the bigger question is why is this only done
> for RPi5, and not the other RaspberryPi? Is there anything that makes
> this tool RPi5-specific?

The tools are common to the Pi4 and Pi5 family. In retrospect there
was no need for the
raspberrypi5_defconfig to be changed to enable this by default because
right now most
systems won't use this.

>
> > diff --git a/package/rpi-eeprom/Config.in b/package/rpi-eeprom/Config.in
> > new file mode 100644
> > index 0000000000..02e1109264
> > --- /dev/null
> > +++ b/package/rpi-eeprom/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_RPI_EEPROM
> > +     bool "rpi-eeprom"
> > +     select BR2_PACKAGE_LIBOPENSSL
>
> Why is openssl needed? You don't even depend on it in the .mk file.
>
> Also, you should directly select BR2_PACKAGE_LIBOPENSSL. But you should
> select BR2_PACKAGE_OPENSSL, and then if only openssl is supported (and
> not libressl), you also need to select
> BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL. openssl is kind of a special
> beast, as it's a virtual package with two implementations: libopenssl
> and libressl.
>
> > +     select BR2_PACKAGE_PYTHON3
> > +     select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX
>
> Are these runtime dependencies? If so:
>
>         select BR2_PACKAGE_PYTHON3 # runtime
>         select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX # runtime
>
> > +     help
> > +       Raspberry Pi bootloader tools.
>
> A slightly longer help text with more details would make sense, perhaps
> borrowing some details from your commit log on the use case (here for
> the target package).
>
> > +       https://github.com/raspberrypi/rpi-eeprom
> > diff --git a/package/rpi-eeprom/Config.in.host b/package/rpi-eeprom/Config.in.host
> > new file mode 100644
> > index 0000000000..3d36d7bec8
> > --- /dev/null
> > +++ b/package/rpi-eeprom/Config.in.host
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_HOST_RPI_EEPROM
> > +     bool "host rpi-eeprom"
> > +     select BR2_PACKAGE_LIBOPENSSL
> > +     select BR2_PACKAGE_PYTHON3
> > +     select BR2_PACKAGE_PYTHON_PYCRYPTODOMEX
>
> These selects don't make sense, as you're selecting target packages...
> while we're here in the option enabling the host variant of rpi-eeprom.
> Most likely you don't need any "select" here.
>
> > +     help
> > +       Raspberry Pi bootloader tools.
> > +
> > +       https://github.com/raspberrypi/rpi-eeprom
> > diff --git a/package/rpi-eeprom/rpi-eeprom.hash b/package/rpi-eeprom/rpi-eeprom.hash
> > new file mode 100644
> > index 0000000000..27cd0bfdf3
> > --- /dev/null
> > +++ b/package/rpi-eeprom/rpi-eeprom.hash
> > @@ -0,0 +1 @@
> > +sha256  90970fd9a72c29449a8f4f27577395a1fb418f87b979adeb81d51300f959dab9  rpi-eeprom-fe7bfc720165464d9dfe2f85fe090ca22a625bd7.tar.gz
>
> Please add a comment on where this hash comes from. Most likely:
>
> # Locally calculated
>
> Also, please add a hash for the LICENSE file (see other packages).
>
> > diff --git a/package/rpi-eeprom/rpi-eeprom.mk b/package/rpi-eeprom/rpi-eeprom.mk
> > new file mode 100644
> > index 0000000000..db1634315f
> > --- /dev/null
> > +++ b/package/rpi-eeprom/rpi-eeprom.mk
> > @@ -0,0 +1,27 @@
> > +################################################################################
> > +#
> > +# rpi-eeprom
> > +#
> > +################################################################################
> > +
> > +RPI_EEPROM_VERSION = fe7bfc720165464d9dfe2f85fe090ca22a625bd7
> > +RPI_EEPROM_SITE = $(call github,raspberrypi,rpi-eeprom,$(RPI_EEPROM_VERSION))
> > +RPI_EEPROM_LICENSE = BSD-3-Clause
> > +RPI_EEPROM_LICENSE_FILES = LICENSE
> > +
> > +HOST_RPI_EEPROM_INSTALL = YES
> > +RPI_EEPROM_INSTALL = YES
>
> Neither of these are needed/have an effect.
>
> You will most likely need:
>
> HOST_RPI_EEPROM_DEPENDENCIES = host-python3 host-python-pycryptodomex
>
> indeed, for the host package, we need the package to be fully
> functional right after its installation, as other packages depending on
> it might use it right after.
>
> However, for the target package, we only care that everything is on the
> target once it runs, hence select BR2_PACKAGE_PYTHON3 + select
> BR2_PACKAGE_PYTHON_PYCRYPTODOMEX in Config.in is sufficient.
>
> Could you have a look at adjusting those details and submitting a
> second iteration of this patch?

Thanks for the feedback. I'll endeavor to make those changes as soon
as possible.

I need to think a bit more about the weak runtime dependencies
(optional features) but
will probably recommend including real openssl because the rpi-eeprom-digest
script launches the openssl binary to verify a signature.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
