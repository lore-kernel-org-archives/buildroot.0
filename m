Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D6EEB596
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 05:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 710CF81434;
	Wed, 13 Sep 2023 05:54:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 710CF81434
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sW9IXsAMEbD4; Wed, 13 Sep 2023 05:54:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94EFF81435;
	Wed, 13 Sep 2023 05:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94EFF81435
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 204EC1BF95F
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 05:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F32104193B
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 05:54:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F32104193B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vzLM61etSxh for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 05:54:21 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 542D44193A
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 05:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 542D44193A
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5029ace4a28so665259e87.1
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 22:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694584459; x=1695189259;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1u4TskhGqbWeGCMGOIa4wNOyEnRRx97BZGc0hqNO0O8=;
 b=iRDKIY1nZxmo1ZUdOJyxAEivIVqJigXUXudj3LVjAbaHR7/aB5hQ8ai5KzltaHZn3f
 4TN8iIehLshwJ67C0JSV912/eWGefv6vI0dJGAAWBsU6qJ9IIn1jTVjUqXLPTF0FFeMA
 Bs1umo6IQL/mzj4Eof3IkRX6bBk18rfZFGdQNtmq+dSpGopS+nFpa7ePU+d4MXI55YGp
 smGPssAyX5byYb7JKUlw4SPK3lo5KXTDQtaKYq0afyMiKd4LxHieI0/cZyoZs/fmJwu0
 S6SffE1SfPdJxIyurSXZeGVIdRHG691W0X1T75D4+E4U/SKSdgB3V2aunw9pRVT3Itx2
 1nAA==
X-Gm-Message-State: AOJu0YyTUwd9zL1dNqzK90mXD8Plhh1DAoZD+RsmUHhyOfgoUs6mDqk2
 ITavhzs+bA57EF7Uncm3uFlCIm8/VXkEig==
X-Google-Smtp-Source: AGHT+IG4PuBql4+p5W1qlruBps7fWh478hLkZ8Ee9c358m/7s0NP8nCYSTmS0doLbbzcMQXPcTheVA==
X-Received: by 2002:a05:6512:118d:b0:502:9672:48b8 with SMTP id
 g13-20020a056512118d00b00502967248b8mr1552759lfr.5.1694584458684; 
 Tue, 12 Sep 2023 22:54:18 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a197405000000b004fe15a2f0f6sm1996943lfe.62.2023.09.12.22.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 22:54:17 -0700 (PDT)
Date: Wed, 13 Sep 2023 07:56:47 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZQFPH5Ch_nhY8JtJ@gmail.com>
References: <20230908082741.409005-1-marcus.folkesson@gmail.com>
 <20230908225704.0aafa7eb@windsurf> <ZPxtEfe6FVIucVWS@gmail.com>
 <20230909155549.15a4b507@windsurf>
 <35d775ed8e08f7082c025d0c32f53bb4@free.fr>
 <ZP4cBkx2VFsfsN7M@gmail.com>
 <6316e92cc730f0e9fdd11379a95dd10b@free.fr>
 <ZQBfUcvieaqDg7sv@gmail.com>
 <a0991242abf58a2ea58071b1e32837f0@free.fr>
MIME-Version: 1.0
In-Reply-To: <a0991242abf58a2ea58071b1e32837f0@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694584459; x=1695189259; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1u4TskhGqbWeGCMGOIa4wNOyEnRRx97BZGc0hqNO0O8=;
 b=VpF6srZF8mKBCeXXagmrDCbxwqD1R382Iev3dsoUoY+pVptzYVZqofIaB3zeQERGii
 GtdnE0vCHvlQihDdIvMMHh3uFKoUI6InTBQn6dDxlVpuLrCwDTD0GjxICZ5+6k9m3yHD
 1uH5lk3vi4x8QCU0PoErd5K5LX3xRiFOPew4zmYCqVUL2hOtUsUt4CJ9+oLk1aw/TRAu
 9HR4xTA27YXKiHwVJNF1oKJim86hGeld/X27ICIcQoiiJ6dCMAOJCVuTn/Qs4xhGVEyG
 IdwInoipsL4JIRDfKOqlwRKsX3ZI9Awd4dWPdhsVryQhPoSQNkwVU76iGv2qkXTut9Y5
 pHhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VpF6srZF
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
Content-Type: multipart/mixed; boundary="===============8119965990908601435=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8119965990908601435==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U2JpOnwlsFIjD0kn"
Content-Disposition: inline


--U2JpOnwlsFIjD0kn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Tue, Sep 12, 2023 at 11:53:32PM +0200, Julien Olivain wrote:
> Hi Marcus,
>=20
> On 12/09/2023 14:53, Marcus Folkesson wrote:
> > Hi Julien,
> >=20
> >=20
> > On Sun, Sep 10, 2023 at 11:05:19PM +0200, Julien Olivain wrote:
> > > Hi Marcus,
> > >=20
> > > On 10/09/2023 21:41, Marcus Folkesson wrote:
> > > > Hi Julien,
> > > >
> > > > On Sat, Sep 09, 2023 at 11:16:27PM +0200, Julien Olivain wrote:
> > > > > Hi Thomas, Marcus,
> > > > >
> > > > > On 09/09/2023 15:55, Thomas Petazzoni wrote:
> > > > > > On Sat, 9 Sep 2023 15:03:13 +0200
> > > > > > Marcus Folkesson <marcus.folkesson@gmail.com> wrote:
> > > > > >
> > > > > > > Thank you for your solid review.
> > > > >
> > > > > [...]
> > > > >
> > > > > > One good thing would be to have a runtime test for criu, in
> > > > > > support/testing. Julien Olivain (in Cc) can probably provide so=
me
> > > > > > guidance here.
> > > > >
> > > > >
> > > > > Marcus, you should be able to reproduce that with the command:
> > > > >
> > > > >     utils/test-pkg -p criu
> > > >
> > > > I've sent out a v2 where the comments from Thomas is addressed. But=
 I am
> > > > not able to reproduce the errors you got with test-pkg.
> > > >
> > > > I'm not sure why it skips my tests. Could you please provide some
> > > > guidance?
> > >=20
> > > All test are skipped because of the "depends on
> > > BR2_PACKAGE_HOST_PYTHON3" not being set by default.
> > >=20
> > > I'm not sure is this "depends on" is really needed, as I expect it
> > > to be a build dependency. If it's the case, the dependency is only
> > > needed in the .mk file. I let the reviewers comment the v2 patch
> > > on that topic...
> > >=20
> > > Anyways, for the moment, this can be managed by manually creating a
> > > config setting this for test-pkg. For example:
> > >=20
> > >     cat > criu.config <<EOF
> > >     BR2_PACKAGE_HOST_PYTHON3=3Dy
> > >     BR2_PACKAGE_CRIU=3Dy
> > >     EOF
> > >=20
> > > Then, test-pkg will no longer skip the tests. On my side, I now see:
> > >=20
> > >     utils/test-pkg -c criu.config -p criu
> > >                     bootlin-armv5-uclibc [1/6]: FAILED
> > >                      bootlin-armv7-glibc [2/6]: FAILED
> > >                    bootlin-armv7m-uclibc [3/6]: SKIPPED
> > >                      bootlin-x86-64-musl [4/6]: OK
> > >                       br-arm-full-static [5/6]: SKIPPED
> > >                             sourcery-arm [6/6]: FAILED
> > >     6 builds, 2 skipped, 3 build failed, 0 legal-info failed, 0
> > > show-info
> > > failed
> > >=20
> > > I let you inspect the build log files ~/br-test-pkg/*/logfile for
> > > the details.
> >=20
> >=20
> > The error seems to be related to host-libzlib rather than criu :-/
> >=20
> >=20
> > make[1]: Leaving directory '/home/marcus/mnt/encwork/git/br-test-pkg/bo=
otlin-armv5-uclibc/build/host-libzlib-1.3'
> > ***
> > *** ERROR: package host-libzlib installs executables without proper
> > RPATH:
> > ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/hos=
t/bin/xmlwf
> > ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/hos=
t/bin/pkgconf
> > ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/hos=
t/bin/protoc
> > ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/hos=
t/bin/protoc-gen-c
> > ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/hos=
t/bin/python3.11
> > ***   /home/marcus/mnt/encwork/git/br-test-pkg/bootlin-armv5-uclibc/hos=
t/bin/openssl
> > make: *** [package/pkg-generic.mk:305: /home/marcus/mnt/encwork/git/br-=
test-pkg/bootlin-armv5-uclibc/build/host-libzlib-1.3/.stamp_host_installed]
> > Error 1
>=20
> For information, on my side, I see the criu package build failing
> for various reasons.
>=20
> For example, toolchain bootlin-armv5-uclibc is failing with:
>=20
> compel/arch/arm/src/lib/infect.c: In function =E2=80=98compel_set_task_ex=
t_regs=E2=80=99:
> compel/arch/arm/src/lib/infect.c:107:20: error: =E2=80=98PTRACE_SETVFPREG=
S=E2=80=99
> undeclared (first use in this function); did you mean =E2=80=98PTRACE_SET=
FPREGS=E2=80=99?
>   107 |         if (ptrace(PTRACE_SETVFPREGS, pid, NULL, ext_regs)) {
>       |                    ^~~~~~~~~~~~~~~~~
>       |                    PTRACE_SETFPREGS

I've replaced

config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
	bool
	default y if BR2_arm
	...

With:

config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
	bool
	default y if BR2_ARM_CPU_ARMV6
	default y if BR2_ARM_CPU_ARMV7A
	default y if BR2_ARM_CPU_ARMV7M
	default y if BR2_ARM_CPU_ARMV8A
	default y if BR2_ARM_CPU_ARMV8M


Due to this comment from the yocto recipe:

#
# CRIU just can be built on ARMv7 and ARMv6, so the Makefile check
# if the ARCH is ARMv7 or ARMv6.
#

So the toolchain bootlin-armv5-uclibc will be skipped.


>=20
> Toolchain bootlin-armv7-glibc failing with:
>=20
> /br-test-pkg/bootlin-armv7-glibc/host/bin/arm-linux-ld:
> ./compel/plugins/std.lib.a(log.o): in function `std_vprint_num':
> log.c:(.text+0x2c0): undefined reference to `__aeabi_idivmod'
> /br-test-pkg/bootlin-armv7-glibc/host/bin/arm-linux-ld:
> ./compel/plugins/std.lib.a(log.o): in function `sbuf_printf':
> log.c:(.text+0x41c): undefined reference to `__aeabi_idivmod'
> /br-test-pkg/bootlin-armv7-glibc/host/bin/arm-linux-ld:
> ./compel/plugins/std.lib.a(string.o): in function `std_vdprintf':
> string.c:(.text+0x114): undefined reference to `__aeabi_idivmod'
>=20
> There is possibly others.  I'll try to investigate how to resolve those
> issues.
>=20
> > > With this v2, I am now able to build criu on some x86_64 and Aarch64
> > > configurations, so I can start writing a runtime test ;)
> >=20
> > Yeay!
>=20
> I have now a fully working test on Aarch64. I'll send it when criu
> will be merged.
>=20
> Best regards,
>=20
> Julien.

/Marcus

--U2JpOnwlsFIjD0kn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmUBTxoACgkQiIBOb1ld
UjIfjw/+MwxXq8YE4OF0Hk6LOboM9td7kc/0KXjuPxAi2QwpFBU1lE/Vt68qrDDd
EtBuo6SX35Nxvl5EHIssflzjsKDAt6D2DMm/+NXVe5YNu9gN2uXGqh6y7uWbGyPu
XaFD8Chay4oKyL9+LZNLzHQOwKrejlOw9BpfMIMFzEMD7byR7nUHbREAA9OqZ2e/
zgjZlNhHQ4bXXmUPu1tdVADV4Ac1EXg6eTc5rw0pq/Q1DmIQe4TA7pQfdVqKa0em
zWb3JfjdRThOpOIlfknRtKI6Q7tJYspawXH5c3c8NeFj0huJeOQHsAqMKi47EBaz
dQFFQuRGJVUgRqFuSNySfZPn4kKBGnztObSXEwdk/30QXPImolKpkKa1a6CAoGIK
vllz4mfKHwYjebonvnTBlZODy92yxcT6T9OVHq3YUefEXFNNlkO2GrkomuwZ9Mlh
20qO33boa0TVNx4Km8k/bb5SJCoQTqR7Gc5/NGEqzdnhYXUPjrTci9juPZ9SuFpU
y0pLyN3sxfQFqqbXbMtMqMeDAUmCDr8dChs70QcHow+mEgYydD09ddhopWcS94D8
h9HdnlV1sZMz9dcxV1HOC5pnY2aiZKAolhrjnaNj4/xtK62itBLiHyO32pcfg4na
gp7viWJF5FKGm17j6+rlY+fGIXZ1dTOj5k5zQ4kYUxkAbkPnyKw=
=M5+6
-----END PGP SIGNATURE-----

--U2JpOnwlsFIjD0kn--

--===============8119965990908601435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8119965990908601435==--
