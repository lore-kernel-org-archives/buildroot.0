Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF6ECA0ECA
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 12:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F90E41960;
	Tue, 12 Sep 2023 12:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F90E41960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_CZV6QzaLQd; Tue, 12 Sep 2023 12:51:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CDE541B8C;
	Tue, 12 Sep 2023 12:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CDE541B8C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05A8B1BF841
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 12:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCD5C41B8C
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 12:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCD5C41B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwJ8qGNzJF3X for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 12:51:12 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B2EF41960
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 12:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B2EF41960
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5008d16cc36so9533187e87.2
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 05:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694523070; x=1695127870;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RtgGt6J5YU/djPanhf8keShMFORMCVjedTmfbXtVvA4=;
 b=DEqnGL6RkWFjuIPaHMzWbKBpA/4PGcxXi5oVEpvyoqexnvWc6CACGqQbIQKbGStnMQ
 nMkRs6V04P58rSpfNuEFo+o9jObWfOzE8vjnD38tWQt2mlXg3qt2b4bdA2h4j1p+12i+
 MOI6aRBy+VWnCngYGjlwht30S2OCd1/sWhLAVutcVd0wvJ8ETYWKKjBxrDSfu7OJ9Elz
 LA4MrreEw1lAQD9cCIz/kubIX9d6aZUXyw+jVt63Ld6rY2B1tiX/vuCPWhY8GetN1ofe
 bR0T9oGCPj56Y27ThCiC66vJ++H5HqJiXY5wCD8WaVxv1EWbgfl/3PvHcLtH9V6YLFCo
 tLXg==
X-Gm-Message-State: AOJu0Yx06faJKRL7R2EODNshQYYL9VHrfbL6ClkhpvXQOYLdOb+41N51
 vYp/wPPo8grvuwxGRP9glSQ=
X-Google-Smtp-Source: AGHT+IFY/FbAD/Ea8IjTU0kIS4l3YEZBGuV5xbSWOI/dTckcdxhBz3Rp5Ha+/EYwdTqoN37YqBgXmA==
X-Received: by 2002:a05:6512:15a3:b0:4fb:7cea:882a with SMTP id
 bp35-20020a05651215a300b004fb7cea882amr12454221lfb.3.1694523069637; 
 Tue, 12 Sep 2023 05:51:09 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 r25-20020aa7d599000000b005256d80cdaesm5821500edq.65.2023.09.12.05.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 05:51:08 -0700 (PDT)
Date: Tue, 12 Sep 2023 14:53:37 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZQBfUcvieaqDg7sv@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
 <20230908225704.0aafa7eb@windsurf> <ZPxtEfe6FVIucVWS@gmail.com>
 <20230909155549.15a4b507@windsurf>
 <35d775ed8e08f7082c025d0c32f53bb4@free.fr>
 <ZP4cBkx2VFsfsN7M@gmail.com>
 <6316e92cc730f0e9fdd11379a95dd10b@free.fr>
MIME-Version: 1.0
In-Reply-To: <6316e92cc730f0e9fdd11379a95dd10b@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694523070; x=1695127870; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RtgGt6J5YU/djPanhf8keShMFORMCVjedTmfbXtVvA4=;
 b=nSBIQo7jWen7Q1SUyhHJAj7iLZLE0Pw2PpIBCfK2nxHqvsuMFRS3xWYt6wrUTdkmJg
 RT/Z4vWYagELsdkqfPOEwyFbuDxXwAt45xEx4PkU6TGJK4iairoBlLtxAIHD3BOSHuJP
 sk8FoS2R0E4l4aPABgLpIFregIIsMqVqS9fv4Ro/jeDrop0Xz4rB8/rBne8ge2al6Duc
 QjADqyx+lNdDUayW+wjuB5b1EjNya5SoQZHTG5NdTFSx5ELY1gMJfiPYT9aesS54r8w/
 LWqXKcClLp6vVfNc9ywibEFSIvbOC6/cOb0vQtNqkZwlY12NaQ6CsK90ln3y0jQsoc1u
 PASw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nSBIQo7j
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4275461667064943428=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4275461667064943428==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="agWjYh6IQmZqTAl1"
Content-Disposition: inline


--agWjYh6IQmZqTAl1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Julien,


On Sun, Sep 10, 2023 at 11:05:19PM +0200, Julien Olivain wrote:
> Hi Marcus,
>=20
> On 10/09/2023 21:41, Marcus Folkesson wrote:
> > Hi Julien,
> >=20
> > On Sat, Sep 09, 2023 at 11:16:27PM +0200, Julien Olivain wrote:
> > > Hi Thomas, Marcus,
> > >=20
> > > On 09/09/2023 15:55, Thomas Petazzoni wrote:
> > > > On Sat, 9 Sep 2023 15:03:13 +0200
> > > > Marcus Folkesson <marcus.folkesson@gmail.com> wrote:
> > > >
> > > > > Thank you for your solid review.
> > >=20
> > > [...]
> > >=20
> > > > One good thing would be to have a runtime test for criu, in
> > > > support/testing. Julien Olivain (in Cc) can probably provide some
> > > > guidance here.
> > >=20
> > >=20
> > > Marcus, you should be able to reproduce that with the command:
> > >=20
> > >     utils/test-pkg -p criu
> >=20
> > I've sent out a v2 where the comments from Thomas is addressed. But I am
> > not able to reproduce the errors you got with test-pkg.
> >=20
> > I'm not sure why it skips my tests. Could you please provide some
> > guidance?
>=20
> All test are skipped because of the "depends on
> BR2_PACKAGE_HOST_PYTHON3" not being set by default.
>=20
> I'm not sure is this "depends on" is really needed, as I expect it
> to be a build dependency. If it's the case, the dependency is only
> needed in the .mk file. I let the reviewers comment the v2 patch
> on that topic...
>=20
> Anyways, for the moment, this can be managed by manually creating a
> config setting this for test-pkg. For example:
>=20
>     cat > criu.config <<EOF
>     BR2_PACKAGE_HOST_PYTHON3=3Dy
>     BR2_PACKAGE_CRIU=3Dy
>     EOF
>=20
> Then, test-pkg will no longer skip the tests. On my side, I now see:
>=20
>     utils/test-pkg -c criu.config -p criu
>                     bootlin-armv5-uclibc [1/6]: FAILED
>                      bootlin-armv7-glibc [2/6]: FAILED
>                    bootlin-armv7m-uclibc [3/6]: SKIPPED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: SKIPPED
>                             sourcery-arm [6/6]: FAILED
>     6 builds, 2 skipped, 3 build failed, 0 legal-info failed, 0 show-info
> failed
>=20
> I let you inspect the build log files ~/br-test-pkg/*/logfile for
> the details.


The error seems to be related to host-libzlib rather than criu :-/


make[1]: Leaving directory '/home/marcus/mnt/encwork/git/br-test-pkg/bootli=
n-armv5-uclibc/build/host-libzlib-1.3'
***
*** ERROR: package host-libzlib installs executables without proper RPATH:
***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bi=
n/xmlwf
***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bi=
n/pkgconf
***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bi=
n/protoc
***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bi=
n/protoc-gen-c
***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bi=
n/python3.11
***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/host/bi=
n/openssl
make: *** [package/pkg-generic.mk:305: /home/marcus/mnt/encwork/git/br-test=
-pkg/bootlin-armv5-uclibc/build/host-libzlib-1.3/.stamp_host_installed] Err=
or 1


>=20
> With this v2, I am now able to build criu on some x86_64 and Aarch64
> configurations, so I can start writing a runtime test ;)

Yeay!

> Thanks again!
>=20
> Julien.


/Marcus

--agWjYh6IQmZqTAl1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmUAX0wACgkQiIBOb1ld
UjLkVBAAmofFONty27YGoq3kDlYZPml760IyynSGWUPdm6mgcJW/sgnqN1L5VB7d
03iTi6yyP85ZcATl5V3UxY5IaImTNSxZE7Ii+jnEApHab3TiudYw1Ir+tB6Qggg0
gZq6iL06CdMRA3qlQVIiysmaGVcY5pCq49D4mr206NQ8kwtzEkNYVPNmNjidwe02
AmWgfgArzXflHD6TzVyRKcVDL29TCqGfUQSFPMr/7Q+alAhfANL2fxzN1adPK1Q1
G0eeVW+6Ll+jEQMzw0zPMX+cMwnuCRK3u5JrTIob9e1NF6kJ8IovJJ1x8JYZcem6
Zu/B/DHQUgyRUVafInoUyne8zicDErR71YgEq42x/tEOp3XpNzqKDfHkrAaa/D4F
YeAbfMrp9Cm8MZRlM33poLVzpEukPE8iLGs92akohb13gLhojWuqQgFDaHzCDgPK
U2dqhN9vI1rTXQaeeS7pqg2JVqm9DXvJy0YH0zZdZSBd1E1LuMayT8f9bIrS/JBD
vQSl3zOG7NAAdvfASgbNVgiWJsNKFD3kX6VrhBzkhU8rP2970Qd/9mzUgbMPLAIU
sjxp5gl0db+lo14152S+rtrci7QiG9zwzj6kiGWiksmrbQjMsGn75jgHyldR8rLy
Z7Z+b2qvAFjaZZOuTILJXd+lqyq9kXrY/aMjUBYwqAXCvzySGlE=
=lx1w
-----END PGP SIGNATURE-----

--agWjYh6IQmZqTAl1--

--===============4275461667064943428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4275461667064943428==--
