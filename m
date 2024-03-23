Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F70AC54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 18:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 641AA408A6;
	Sat, 23 Mar 2024 18:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UIUeDcMCaRYe; Sat, 23 Mar 2024 18:52:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D3D140527
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D3D140527;
	Sat, 23 Mar 2024 18:52:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A66081BF2A5
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 18:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A71E4028D
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 18:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrwsNDo0QMzY for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 18:52:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA710400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA710400B8
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA710400B8
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 18:52:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A53A7CE0934;
 Sat, 23 Mar 2024 18:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DB8C433C7;
 Sat, 23 Mar 2024 18:52:14 +0000 (UTC)
Mime-Version: 1.0
Date: Sat, 23 Mar 2024 20:52:13 +0200
Message-Id: <D01CU8Q4DIO9.1PINW90AAMZU4@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Arnout Vandecappelle" <arnout@mind.be>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0
References: <20240321182126.24115-1-jarkko@kernel.org>
 <20240321182126.24115-3-jarkko@kernel.org>
 <a5a18fd5-6c05-4231-a7b1-a6c1965919c8@mind.be>
In-Reply-To: <a5a18fd5-6c05-4231-a7b1-a6c1965919c8@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711219935;
 bh=4t2vQumSFlDcZAlFqjBuObZpuB5hP8HFr0MRD6eRFRU=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=Q7IklFAiS+7sL0oF+x7C8ndKzsum7mTag0u+Wl0TdW91cIc2HQ1rU3qhNFH0NHe21
 49TuLouepnfcU77VY3auOvc+28us+ce5eOVcZDcBNo3Bcr0qJqb8NcTF8YpziQeZhS
 O3HBqOoiTzlfuhLez+Icyt72oIgRrJ5m2OcTmevKqWDOKj18XhauT5Ry7Zi5vG+8Nn
 sHZgDNt/QKCor89K8pPHMWmoddv1djS+AqhZp7Iy/4nRed9RVbJ/wGAeR6u4DfSbyu
 mGMIMmAy5XvXD9a7qSkxB+4E8Z54LVhFe+6MMpQr7POJtNoCIgpdICjDhKj5SM4LMc
 MUfQ6OEwWU/tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q7IklFAi
Subject: Re: [Buildroot] [PATCH RFC 2/2] package/swtpm: add host package
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
Cc: Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri Mar 22, 2024 at 10:47 PM EET, Arnout Vandecappelle wrote:
>   Hi Jarkko.
>
> On 21/03/2024 19:21, Jarkko Sakkinen wrote:
> > Add swtpm and its dependency libtpms to host packages. These are useful
> > for emulating TPM in QEMU environment.
>
>   I don't understand... Does it mean that you run host-swtpm next to host-qemu 
> and you somehow connect them so it gets exposed as a TPM2 device inside the qemu VM?

Yes:

https://gitlab.com/jarkkojs/linux-tpmdd-test/-/blob/main/board/qemu/run-qemu.sh.in?ref_type=heads

>
> > 
> > Link: https://gitlab.com/jarkkojs/linux-tpmdd-test
> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > ---
> >   package/libtpms/Config.in                     |  9 ++++
> >   package/libtpms/libtpms.hash                  |  1 +
> >   package/libtpms/libtpms.mk                    | 15 ++++++
>
>   Please split this in a separate patch for libtpms (so 3 patches in the series).
>
>   You also need package/Config.in to source package/libtpms/Config.in
>
>   Also, please run `make check-package`. There will undoubtedly be some coding 
> style issues.
>
>   Finally, please add yourself to the DEVELOPERS file for this package. This 
> way, you'll get an e-mail if the package fails in the autobuilders, or when a 
> new version is released if the package is registered on release-monitoring.org. 
> See https://nightly.buildroot.org/#DEVELOPERS

OK, got it. I'll follow the steps.

Yeah, these used to be lying in BR2_EXTERNAL and I was not exactly sure
how to proceed so I thought that better not to over-engineer.

>
> >   .../0001-comment-out-expect-and-socat.patch   | 46 +++++++++++++++++++
> >   package/swtpm/Config.host.in                  |  8 ++++
>
>   You also need to add this to package/Config.in.host

+1

> >   package/swtpm/swtpm.hash                      |  1 +
> >   package/swtpm/swtpm.mk                        | 17 +++++++
> >   7 files changed, 97 insertions(+)
> >   create mode 100644 package/libtpms/Config.in
> >   create mode 100644 package/libtpms/libtpms.hash
> >   create mode 100644 package/libtpms/libtpms.mk
> >   create mode 100644 package/swtpm/0001-comment-out-expect-and-socat.patch
> >   create mode 100644 package/swtpm/Config.host.in
> >   create mode 100644 package/swtpm/swtpm.hash
> >   create mode 100644 package/swtpm/swtpm.mk
> > 
> > diff --git a/package/libtpms/Config.in b/package/libtpms/Config.in
> > new file mode 100644
> > index 0000000000..7ef61cf53c
> > --- /dev/null
> > +++ b/package/libtpms/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_LIBTPMS
> > +	bool "libtpms"
> > +        depends on BR2_USE_WCHAR # glib2
> > +        depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
> > +        depends on BR2_USE_MMU # glib2
>
>   If you have those dependencies, I'd expect a corresponding `select 
> BR2_PACKAGE_GLIB2`. However, there isn't any dependency at all in the .mk file, 
> so I guess this is in fact not needed.

+1

>
> > +	help
> > +	  TPM emulation library
> > +
> > +	  https://github.com/stefanberger/libtpms
> > diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
> > new file mode 100644
> > index 0000000000..c31d824af6
> > --- /dev/null
> > +++ b/package/libtpms/libtpms.hash
> > @@ -0,0 +1 @@
> > +sha256  2807466f1563ebe45fdd12dd26e501e8a0c4fbb99c7c428fbb508789efd221c0  v0.9.6.tar.gz
>
>   Please make sure that the license file is also in the .hash file. You can 
> check this with `make legal-info`.

+1

>
> > diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
> > new file mode 100644
> > index 0000000000..5b1151baff
> > --- /dev/null
> > +++ b/package/libtpms/libtpms.mk
> > @@ -0,0 +1,15 @@
> > +################################################################################
> > +#
> > +# libtpms
> > +#
> > +################################################################################
> > +
> > +LIBTPMS_VERSION = v0.9.6
>
>   Drop the v from the version, otherwise release-monitoring and CPE/CVE checks 
> don't work. You can add the v below.

+1

>
> > +LIBTPMS_SOURCE = $(LIBTPMS_VERSION).tar.gz
>
>   Don't override LIBTPMS_SOURCE, there's no need for that, the default 
> (libtpms-0.9.6.tar.gz) is better. The github URL will still work. Note that the 
> hash will change if you change the filename.

+1

>
> > +LIBTPMS_SITE = $(call github,stefanberger,libtpms,$(LIBTPMS_VERSION))
>
>   This is where the v should be added:
>
> LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))

+1

>
> > +LIBTPMS_LICENSE = BSD-3-Clause
>
>   It's actually BSD-4-Clause. And unfortunately, it also contains file which 
> seem to be covered with a modified BSD-2-Clause instead, but let's ignore that :-)
>
>   Please add the license file as well:
>
> LIBTPMS_LICENSE_FILES = LICENSE

+1

>
> > +LIBTPMS_INSTALL_STAGING = YES
> > +LIBTPMS_AUTORECONF = YES
>
>   You should add a comment explaining why autoreconf is needed - in this case, 
> because we get the source from git. It's also good to mention in the commit 
> message that upstream doesn't create release tarballs that include the configure 
> script.

+1

>
> > +
> > +$(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> > diff --git a/package/swtpm/0001-comment-out-expect-and-socat.patch b/package/swtpm/0001-comment-out-expect-and-socat.patch
> > new file mode 100644
> > index 0000000000..09dcc49a7b
> > --- /dev/null
> > +++ b/package/swtpm/0001-comment-out-expect-and-socat.patch
> > @@ -0,0 +1,46 @@
> > +From 067c32ba93774b273de9af872b5587798dcabb15 Mon Sep 17 00:00:00 2001
> > +From: Jarkko Sakkinen <jarkko@kernel.org>
> > +Date: Tue, 19 Dec 2023 05:21:20 +0200
> > +Subject: [PATCH] configure.ac: comment out "expect" and "socat"
>
>   Please replace this with the patch from PR 844 (and add --disable-tests). Or 
> wait until Stefan releases v0.8.2 (probably very soon).

Yeah, this happened after I sent this (had a short discussion and I
tested and ack'd the fix).

Anyway:

+1

>
> > +
> > +Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > +---
> > + configure.ac | 16 ++++++++--------
> > + 1 file changed, 8 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 49caf96..4acc763 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -394,20 +394,20 @@ AS_IF([test "x$enable_default_pcr_banks" != "x"],[
> > + pcr_bank_checks
> > + AC_SUBST([DEFAULT_PCR_BANKS])
> > +
> > +-AC_PATH_PROG([EXPECT], expect)
> > +-if test "x$EXPECT" = "x"; then
> > +-	AC_MSG_ERROR([expect is required: expect package])
> > +-fi
> > ++# AC_PATH_PROG([EXPECT], expect)
> > ++# if test "x$EXPECT" = "x"; then
> > ++# 	AC_MSG_ERROR([expect is required: expect package])
> > ++# fi
> > +
> > + AC_PATH_PROG([GAWK], gawk)
> > + if test "x$GAWK" = "x"; then
> > + 	AC_MSG_ERROR([gawk is required: gawk package])
> > + fi
> > +
> > +-AC_PATH_PROG([SOCAT], socat)
> > +-if test "x$SOCAT" = "x"; then
> > +-	AC_MSG_ERROR([socat is required: socat package])
> > +-fi
> > ++# AC_PATH_PROG([SOCAT], socat)
> > ++# if test "x$SOCAT" = "x"; then
> > ++# 	AC_MSG_ERROR([socat is required: socat package])
> > ++# fi
> > +
> > + AC_PATH_PROG([BASE64], base64)
> > + if test "x$BASE64" = "x"; then
> > +--
> > +2.40.1
> > +
> > diff --git a/package/swtpm/Config.host.in b/package/swtpm/Config.host.in
> > new file mode 100644
> > index 0000000000..e77eea2aa5
> > --- /dev/null
> > +++ b/package/swtpm/Config.host.in
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_HOST_SWTPM
> > +	bool "swtpm-host"
>
>   Should be "host swtpm"

+1

>
> > +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
> > +	select BR2_PACKAGE_GOBJECT_INTROSPECTION
>
>   This is selecting the _target_ gobject-introspection, which makes no sense for 
> a host package.

Hmm... do not want to say anything just yet because tbh cannot recall
why it is there but I'll look into this.

>
> > +	help
> > +	  Compiles SWTPM software TPM emulator for the host.
> > +
> > +	  https://github.com/stefanberger/swtpm
>
>   We want to point to something like documentation, which in this case is the 
> wiki: https://github.com/stefanberger/swtpm/wiki

+1

>
> > diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
> > new file mode 100644
> > index 0000000000..882f06d7a5
> > --- /dev/null
> > +++ b/package/swtpm/swtpm.hash
> > @@ -0,0 +1 @@
> > +sha256 7bba52aa41090f75087034fac5fe8daed10c3e7e7234df7c9558849318927f41  v0.8.1.tar.gz
> > diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
> > new file mode 100644
> > index 0000000000..79fbf1f420
> > --- /dev/null
> > +++ b/package/swtpm/swtpm.mk
> > @@ -0,0 +1,17 @@
> > +################################################################################
> > +#
> > +# swtpm
> > +#
> > +################################################################################
> > +
> > +SWTPM_VERSION = v0.8.1
> > +SWTPM_SOURCE = $(SWTPM_VERSION).tar.gz
> > +SWTPM_SITE = $(call github,stefanberger,swtpm,$(SWTPM_VERSION))
> > +SWTPM_LICENSE = BSD-3-Clause
> > +SWTPM_AUTORECONF = YES
>
>   Same comments as for libtpms for the above 5 lines.

+1

>
> > +
> > +HOST_SWTPM_DEPENDENCIES = host-libtasn1 host-openssl host-pkgconf host-json-glib host-libtpms
>
>   Can you try inside a container (e.g. using utils/docker-run) if this is really 
> sufficient?

Does it work with podman?

>
> > +HOST_SWTPM_CONF_ENV = PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)"
>
>   This should already be part of the default configure environment, are you sure 
> it is needed?

Tbh, no I'm not sure :-) I'll try to remove it and see what happens!

>
>   Regards,
>   Arnout
>
> > +HOST_SWTPM_CONF_OPTS = --without-seccomp
> > +
> > +$(eval $(host-autotools-package))

OK, thanks for the throughout and sane remarks!

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
