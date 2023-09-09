Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ECCEEB58C
	for <buildroot@archiver.kernel.org>; Sat,  9 Sep 2023 13:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9722460E07;
	Sat,  9 Sep 2023 13:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9722460E07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0t4ol3IXxEk; Sat,  9 Sep 2023 13:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC44060BDF;
	Sat,  9 Sep 2023 13:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC44060BDF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E79AE1BF2F4
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 13:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD0AE60BDF
 for <buildroot@lists.busybox.net>; Sat,  9 Sep 2023 13:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD0AE60BDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TqVt-qeX3rxS for <buildroot@lists.busybox.net>;
 Sat,  9 Sep 2023 13:00:47 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CFFB60797
 for <buildroot@buildroot.org>; Sat,  9 Sep 2023 13:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CFFB60797
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2bceb02fd2bso48195721fa.1
 for <buildroot@buildroot.org>; Sat, 09 Sep 2023 06:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694264445; x=1694869245;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Z5Sm2sO8nuDBnNNcPEjSp8K3uN2TjO0HzMNwM2eIo8=;
 b=jT/1AfWO9Hpt1JdFUElfetwSmBbk0c5BQc7dm6vl7hqWJ0+wNQkBczx4HZS2vYf8Q/
 dliu5ZWHOKjB3mT3Ophhp39I7MKW08GX13JwTrcphQvRgZ7VxRHVX/6ABl4LYTVwicZD
 aDfXG9THlEVSuwPwMK2bFLTaJGXYH7EptltbagOY86utydRGTmzyCohKAnqLj9XK//2B
 Q8wF7C6OIpOCEyEmiViSW0LdyuH66/dEQQ1o69Q074vm11z3mFbAgcko8z1PBYcmCRM4
 ij9ds8VR7w69ifjpHo+/rdUzwQ0Yg7vkIMcCvnlcnPaFilJPhbbAGOhUI2BPtdTPTUcf
 5yBw==
X-Gm-Message-State: AOJu0YwB9K6up2Ftm9j94U1sil4rfWqO+x/ITLnfrvZgBevcF2TPzZzg
 vG2RylhXI6oSVQF8xXGMfnQx2Dfu3h1Cxg==
X-Google-Smtp-Source: AGHT+IE+umURETLU1upE1AwI2jqWAgFnH++Ju/iY65TUrq+HeJWj5LG/ednNl9ZkqwPQvnZwLPrI+g==
X-Received: by 2002:a2e:9919:0:b0:2b9:b9c8:99 with SMTP id
 v25-20020a2e9919000000b002b9b9c80099mr3968529lji.22.1694264444806; 
 Sat, 09 Sep 2023 06:00:44 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a05651c010400b002b9415597d0sm653935ljb.78.2023.09.09.06.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 06:00:43 -0700 (PDT)
Date: Sat, 9 Sep 2023 15:03:13 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZPxtEfe6FVIucVWS@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
 <20230908225704.0aafa7eb@windsurf>
MIME-Version: 1.0
In-Reply-To: <20230908225704.0aafa7eb@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694264445; x=1694869245; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+Z5Sm2sO8nuDBnNNcPEjSp8K3uN2TjO0HzMNwM2eIo8=;
 b=NkDxnK9/YwvcQw8GXkMUGgJ6MnFk/U4jfQrSnNQlj1Mvb6ixQSzRJ72LzY9RVEvGPG
 H9sXiGiGjC5yUGxefGx1yUz6nhRN/PH1WnIdISWd/99nEaIfkxX9UQ9oxmPb9gczSV44
 qENPQheOclAZNMglaMAdc49FpRvq8XS0H1hUnYn4YJJT3xzBuf2pEM3Zgv6d1pQswtCA
 iMBfq5Z3PYFMjd9eBLpi/w+HFKntU+saY3BvlKZxnKqUY7nO40iETb8tP2Jb66M5PSvH
 i3twKZUXw1z36xdPO+qsGCQfqwlkI15rHm62ZexhWpqsmYZlOpzM4z1P5fJcTxrI0UqB
 PnTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=NkDxnK9/
Subject: Re: [Buildroot] [PATCH 1/2] package/criu: new package
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
Content-Type: multipart/mixed; boundary="===============8417800129032074065=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8417800129032074065==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sXKWrpTLbHrKoquP"
Content-Disposition: inline


--sXKWrpTLbHrKoquP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thank you for your solid review.
Apparently I haven't done my homework very well. Sorry for that.

On Fri, Sep 08, 2023 at 10:57:04PM +0200, Thomas Petazzoni wrote:
> Hello Marcus,
>=20
> Thanks for your contribution! See some suggestions below.
>=20
> On Fri,  8 Sep 2023 10:27:40 +0200
> Marcus Folkesson <marcus.folkesson@gmail.com> wrote:
>=20

[...]

> > +	bool "criu"
> > +	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> > +	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
> > +	depends on BR2_INSTALL_LIBSTDCPP # protobuf
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, libnl
> > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
> > +	depends on !BR2_TOOLCHAIN_USES_MUSL
>=20
> Where does this dependency come from?

I'm pretty sure that I read that CRIU does not compile with musl
somewhere, but it seems like it does when I had a closer look.
I will remove it.


[...]

>=20
> > +	select BR2_PACKAGE_HOST_PYTHON3_SSL
> > +	select BR2_PACKAGE_PROTOBUF
> > +	select BR2_PACKAGE_PROTOBUF_C
> > +	select BR2_PACKAGE_LIBAIO
> > +	select BR2_PACKAGE_LIBBSD
> > +	select BR2_PACKAGE_LIBCAP
> > +	select BR2_PACKAGE_LIBNET
> > +	select BR2_PACKAGE_LIBNL
> > +	select BR2_PACKAGE_PYTHON3
> > +	select BR2_PACKAGE_PYTHON_PIP
>=20
> It needs pip on the target? Seems odd.

What I actually need is host-python-pip as it is used during the
installation step. Is there a way to only select the host-part from the=20
PYTHON_PIP package?

>=20
> > +	help
> > +	  Checkpoint/Restore In Userspace (CRIU), is a software tool for the =
Linux operating system to make it possible to freeze a running=20
> > +	  application and checkpoint it to persistent storage as a collection=
 of files.
>=20
> This needs to be wrapped to the proper length. Run "make check-package"
> to get the details.

Thank you.

[...]

> > +
> > +CRIU_CFLAGS =3D $(TARGET_CFLAGS)
> > +CRIU_CFLAGS +=3D -D__WORDSIZE -D__USE_GNU -D_GNU_SOURCE
>=20
> Can be:
>=20
> CRIU_CFLAGS =3D \
> 	$(TARGET_CFLAGS) \
> 	-D__WORDSIZE \
> 	-D...
>=20
> However, this is odd. Why aren't those flags set by the package
> Makefile?

I actually took those flags from the yocto recipe [1], but at least
_GNU_SOURCE seems to be in the package Makefile anyway.

I will remove __USE_GNU and _GNU-SOURCE.
Do not know about __WORDSIZE though.

[...]

> > +
> > +#Needed as it adds strange paths to the tool otherwise. E.g.  $CROSS_C=
OMPILE/usr/bin/gcc
> > +CRIU_MAKE_ENV +=3D HOSTLD=3Dld
> > +CRIU_MAKE_ENV +=3D HOSTCC=3Dgcc
>=20
> Meh. Not sure to understand here. Maybe you want to pass
> $(TARGET_CONFIGURE_OPTS), which does include HOSTCC, HOSTLD, and more.

Sounds better.

[...]

>=20
> Ditto.
>=20
> In the Makefile:
>=20
> ifneq ($(filter-out x86 arm aarch64 ppc64 s390 mips loongarch64,$(ARCH)),)
>         $(error "The architecture $(ARCH) isn't supported")
> endif
>=20
> So you need a BR2_PACKAGE_CRIU_ARCH_SUPPORTS option that lists those
> architectures only.

Will do.

[...]

>=20
> > +endif
> > +
> > +define CRIU_BUILD_CMDS
> > +    rm -rf $(@D)/images/google/protobuf/descriptor.proto
> > +    ln -s  $(STAGING_DIR)/usr/include/google/protobuf/descriptor.proto=
 $(@D)/images/google/protobuf/descriptor.proto
>=20
> Please indent those lines with one tab.
>=20
> > +	$(CRIU_MAKE_ENV) $(MAKE) USERCFLAGS=3D"$(CRIU_CFLAGS)" -C $(@D)
>=20
> I don't understand how this can know which cross-compiler to use, you
> are not passing it anywhere as far as I can see.

Hrm, I had CROSS_COMPILE=3D$(TARGET_CROSS) at first, then I though I saw
that $(TARGET_MAKE_ENV) had it set.
Unfortunately, my last test was was on x86_64, so I did not notice it
was wrong.

I will put it back.

>=20
> Could you have a look at addressing those comments and sending an
> updated version?
>=20
> Thanks a lot!
>=20
> Thomas
> --=20
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

[1] https://git.yoctoproject.org/meta-virtualization/tree/recipes-container=
s/criu/criu_git.bb

Thanks,
Marcus




--sXKWrpTLbHrKoquP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmT8bQwACgkQiIBOb1ld
UjJe4A/7B5Bufr5n5suoNlG8T9K5ZKn+lsFx+m/e90JXozCxufJ9nziHA6CP9d0C
vkRXFsLbo2vQCUSEjnswR9GMJBlnRUtHPMliL0Vn+hG8pkCt4k//+zFDfIhIxB/G
MEz2jkfmKL4KFhZ8HmqiB+t4vzEbztbQYMlPSyG4SrEMGGr4h6uWIkpGcxLKqJLj
rS4emd5x5IRB1zkzbHbBcauH5uIvf3vogU+RUBhcuAJJFVoPE59KZyn1OjB9h1bP
9fNIfqKVeobYHtICQbDMKLFppZyGXkSs29j2MuRI87CzOhpNg4BTirOg+KmGbl7v
KzXPeuyuuOTgyysvCQsYiu8yHU4TzX/tLhDhvNOqmwmY3o78ksoiQCLdc5pJ0Z+O
1ATiJ8EfRVPB3dL982mhW0rPI459XYlE6oNOqKiP+nX3ZRCrtpLQ60tmvhYeguAL
lLRzCJ/n+6NRm/ofzMCjoFOrkNInTByeWwC+pRnqUcAWu3CTq67b5VESEnxFllNg
JZLoM76+lkyJiK79vlytG5O+lNDWmGyV+zkwRIIT6uyBMGdmSleZFlJk+64IEwYQ
xHlUlheJksvk6fwu9iOPu8E6WD7tlzXMP3ztE+EQ9U3WOX1OLfw81CQgw5RCQhye
vLJ9P5cBZg4D7dSQYGXqmFLNbJ6XLVUaHNkLU4FETyYhRNFf+P4=
=Av+u
-----END PGP SIGNATURE-----

--sXKWrpTLbHrKoquP--

--===============8417800129032074065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8417800129032074065==--
