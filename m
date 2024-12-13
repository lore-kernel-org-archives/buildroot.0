Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CECE7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 10:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3EB5608D8;
	Fri, 13 Dec 2024 10:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rYoQ5io9ZRh; Fri, 13 Dec 2024 10:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ADFA61091
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1ADFA61091;
	Fri, 13 Dec 2024 10:19:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC6AD115C
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 10:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A208B81EDA
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 10:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_6Nl87V42bQ for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 10:19:10 +0000 (UTC)
X-Greylist: delayed 559 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 13 Dec 2024 10:19:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE22881ED4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE22881ED4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=159.69.201.130;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE22881ED4
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 10:19:09 +0000 (UTC)
Received: from localhost (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 7157F422;
 Fri, 13 Dec 2024 11:09:47 +0100 (CET)
Date: Fri, 13 Dec 2024 11:09:45 +0100
Message-Id: <D6AHOKYUZUH7.2F0O7NKJXTL0N@walle.cc>
To: "Chris Packham" <judge.packham@gmail.com>, "Edgar Bonet"
 <bonet@grenoble.cnrs.fr>
Cc: "Sergey Matyukevich" <geomatsi@gmail.com>, "buildroot"
 <buildroot@buildroot.org>
X-Mailer: aerc 0.16.0
References: <20241208214748.524923-1-geomatsi@gmail.com>
 <dcbd3f77-e737-41a2-9f23-87141d0bdf9b@grenoble.cnrs.fr>
 <Z1in3yM7ddVMYEqq@curiosity>
 <dcfe20ba-9a00-4faf-9cd8-9e800c566d12@grenoble.cnrs.fr>
 <CAFOYHZA3VydNyr+NffezqjmZkwo+zJyB8FZRMtnMBG8SNZvN9Q@mail.gmail.com>
In-Reply-To: <CAFOYHZA3VydNyr+NffezqjmZkwo+zJyB8FZRMtnMBG8SNZvN9Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1734084587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=goejw+uK8hxKCS+Cmz+apGBcxA1kvXCqBbDJEnwO478=;
 b=FBgqew1oTAMtTzmTiDrB1XhwB/5v2ip/FFXv4gUZqxBpQh83KmnDCXysKeOa9/0s2FzAG+
 5wEMWannOJViOG2XTsqzHnLCpZhpGAG5Wjw7Z0oCoOYzSzbB/aCgUut7xl5/yZRiiDPKHM
 4o5aPjsOycEG7+OpWTYfaycEwQ9g1enIPWaHeAGdS4n4sVidacSgJkXFEBo0blZYew3fhz
 6dCG6jC49/+30h8PlU8OJbQxss2aIncxZEgI+aP/NEd3HJmw5GwvtuLm8sVri7c3WZT2+w
 sJmzQYO64cgya/qwWhjkqfT0IWCteV+P+pcnte1ouOPXelHeFalQ87L3jgHkhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=walle.cc
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=FBgqew1o
Subject: Re: [Buildroot] [PATCH 0/3] {linux,
 linux-headers}: add support for 6.12
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
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0238090111207506722=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0238090111207506722==
Content-Type: multipart/signed;
 boundary=9741fd56cf1ad703fb56df6746ce29f9fd7584283258cf2017d1c97a0041;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--9741fd56cf1ad703fb56df6746ce29f9fd7584283258cf2017d1c97a0041
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Dec 11, 2024 at 7:26 PM CET, Chris Packham wrote:
> On Thu, 12 Dec 2024, 12:34=E2=80=AFam Edgar Bonet, <bonet@grenoble.cnrs.f=
r> wrote:
>
> > Hello!
> >
> > About the incompatibility between Linux 6.12 and
> > BR2_LINUX_KERNEL_CUSTOM_DTS_PATH, Sergey Matyukevich wrote:
> > > IIUC at the moment Buildroot includes the following configurations
> > > that make use of BR2_LINUX_KERNEL_CUSTOM_DTS_PATH: [only 5 of them]
> >
> > Oh, I hadn't noticed there were so few of them!
> >
> > > Adding new v6.12 kernel is not going to break any of those boards
> > > right away. However if the build rule for drop-in dtbs will not be
> > > re-enabled (which seems likely), migration to new kernels will be a
> > > problem for those boards.
> >
> > Indeed, this is my concern: I maintain the defconfigs of the Acqua
> > boards (acmesystems_acqua_a5_*), and I would like to upgrade them to
> > Linux 6.12 before the Buildroot 2025.02 release.
> >
> > However, this issue will also affect users that build (or customize)
> > their own configurations with `make nconfig` or similar. If they select
> >
> >     [x] Linux Kernel
> >     [x] Build a Device Tree Blob (DTB)
> >     (some_file) Out-of-tree Device Tree Source file paths
> >
> > and leave `Kernel version' to its default (which is "Latest version"),
> > they would end up with a non-functional configuration.
> >
> > > I don't see how BR2_LINUX_KERNEL_CUSTOM_DTS_PATH can be supported in
> > > this case w/o patching new kernels. Probably it makes sense to conver=
t
> > > those out-of-tree dts files into proper kernel patches ?
> >
> > I see two options for patching the kernel:
> >
> >  1. Use Chris Packham's patch "kbuild: Restore the ability to build out
> >     of tree dtbs".[1] This works for me: if I drop the patch into
> >     board/acmesystems/acqua-a5/patches/linux/, I can change the kernel
> >     version to 6.12.4 and it just works. It seems like the path of leas=
t
> >     resistance for individual defconfigs, but I don't see this becoming
> >     Buildroot's blessed way of supporting custom DTSes.
> >
> >  2. Create a patch that adds the DTS to the kernel tree _and_ the DTB
> >     target to the relevant Makefile. I guess this is what you are
> >     suggesting.
> >
>
> For what it's worth I implemented Masahiro's suggestion (basically option
> 2) for our internal build tool at $dayjob. It's just a bit of sed-ing. It
> works reasonably well. The trickiest part is avoiding repatching the
> Makefile but for buildroot that's just a flag file.

Are you sure you need to patch the Makefile? I've tested both
compiling a dtso and a dts on the latest next. I've tried it on
arm64 and copying it to a proper subdir in dts/ is working with

 $ make <subdir>/test.dtb

To me, it looks like only the flat hierarchy isn't working anymore.
But IMHO it was already wrong to copy a device tree to dts/ if there
was a subdir structure in the first place.

-michael

> > If we go for the second option, then we would be saying that a kernel
> > patch is the canonical way of providing a custom DTS. The
> > BR2_LINUX_KERNEL_CUSTOM_DTS_PATH option would then have to be deprecate=
d
> > and eventually removed, which would be a breaking change for some users=
.
> >
> > I would persoanlly prefer updating the implementation of
> > BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in order to make it compatible with
> > 6.12+ kernels. Maybe Buildroot could, in addition to copying the DTS to
> > the kernel tree, add the relevant target to the Makefile. Basically do
> > what the patch in method 2 is supposed to do.
> >
> > I could try to implement this approach, but it can take me some time
> > (the `make' language is not my cup of tea). In the meantime, I suggest
> > that, in your patch series, you update the help text of
> > BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in order to warn about this option
> > being incompatible with kernels 6.12 and up.
> >
> > Regards,
> >
> > Edgar.
> >
> > [1]
> > https://lore.kernel.org/all/20241015212830.3899891-1-chris.packham@alli=
edtelesis.co.nz/T/#u
> >


--9741fd56cf1ad703fb56df6746ce29f9fd7584283258cf2017d1c97a0041
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ1wH6REcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+A6aAYCfy4wBRSi9rwkoQYn+FVWPIEm3td6RnSez
2YXSNLDwyv4+qyO4x8agZTiJzQ8YqGwBf26haP0LVjjbibN42S7vHqAsH0ocUdyl
9T+GYTG2iYj7x6YgJYSru7cs6WGU+FEOIw==
=GRhO
-----END PGP SIGNATURE-----

--9741fd56cf1ad703fb56df6746ce29f9fd7584283258cf2017d1c97a0041--

--===============0238090111207506722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0238090111207506722==--
