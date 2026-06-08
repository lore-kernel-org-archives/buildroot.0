Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9F8CD6E79
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 22:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 900B642B49;
	Mon,  8 Jun 2026 22:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RZ2f1aOup8b; Mon,  8 Jun 2026 22:34:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C83242B4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780958053;
	bh=NFVhqAnQINsITzFVXBTGBJ+w3BWK1zgQVcTzK74W0ag=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RB1DT0Sk4Aqagt/VpMJdBy+MQxABYtTMgqNacaBgD2cgdCgvtIGM5v1I3vipI6jGt
	 DV0YJ/iGtXdwGzouOjCskhaa7WVD0d/zZnOythND1d5mH7may120WbsdS8ELWZWL33
	 78itw2A4CBmmeF25TU8Nblhnstz9l1ZjuRDBzrEmNM3U30HMAVPN0oO8XFO78G2RxN
	 w2BEwrMDsO7jrib8aAsIx8ioSutgymupUkeNjiISzQoah9gFjufHh8REPD0li4BDDx
	 guYpUAbXYsIPKz/ZEf/Gxr6MuaY4W7SiAzcWzpUn8xFK91leS6ZY3w4QsdAbNulesA
	 ktBNBvR9tlaOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C83242B4B;
	Mon,  8 Jun 2026 22:34:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80F45190
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6701242B49
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6pJnbbrDtTB for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 22:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32FD142B4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32FD142B4D
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32FD142B4D
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 22:34:09 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-bebde89cfd3so613820866b.2
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 15:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780958048; cv=none;
 d=google.com; s=arc-20240605;
 b=LUXdkwaSIubCsniUcVXnztMptb6Tul18L6XsWE35ZkJIv8ANLbOVLocb2oXpfRRST/
 8LXdlGur9NyJTPhWJkVNOQ8vaUd2XHeg5N7gPmwx2/S2qvoPNeQceLotuOmG9ZyWvexK
 5n8SleiHc2EL4VONXbYH77/lGSm08pefVjKwOsenSzJzv1f5Pcng1+PoNX1N/yPOird9
 816MV+pg2Tywp6dnv95QO0c4mBr0V/tZVLGAwmba1kmabUF/rd/D+azIkT7CtmJssJKE
 3tZd1lc0tWHa9s6/OQDDWPGnQLxjOmQJUZ0VaMTs7RphTL8X0DCZfeMA2O02Hob+WZYT
 Azww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=VlIQ6fy+tehdTQPh79PSDKRw1BZMeE6WFM/2aMkil7o=;
 fh=Coqigty4ugyvXp/Dt1cx1JesGFcbgsgDYuObHrLCArQ=;
 b=EWhU+sTqIBbXNPsNfhF91j0tUKfvNLnU6H6WjfGDdVJU7p90CTCfex/0alkQvZuFyK
 FVssN/uFuioXYCm8JGESuPxeoACM2Jd4t0wOOy72Hrs5J6l3WvWWrgV2/V0ZglcgeyXi
 WolIglOWP427zXIULukf4abH0hBv4Hvg5wsaDiQmwksCG4E3Oh/tYAmD+rj/Dv7w4D0C
 AevbHk67G1TKtcuVX80wX//4UBFH/cg8g9B+eZm2WlSZ1qB5pZZhOy1/jjn6Fbq4jb5Y
 1ikmBpK0FppkRRUoXIAZi/RM9k37Yyg59omJP45qK/reXRh5e6PCzqqSdBN/32NCUQfA
 geOg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780958048; x=1781562848;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VlIQ6fy+tehdTQPh79PSDKRw1BZMeE6WFM/2aMkil7o=;
 b=LbIv2U38Nzfmv2zpe9pAXqJj9uZbNl/8rlHPt/yt0t3FogJ/3jpjNCGaU3pYLqBK8l
 CRiLB1Eld7Nj838/nj5zP+QTsUP93hpKCnLyXrMHePeJ+BgtAXQVAqsXY7lBe0r/EnYd
 1nvXNyNFwE20gnU/h55Gjsqu0P58PsghxszZU3OqjN+ZprXd3nnAN+S7MNIlLjOEW5n9
 DEUGAC/YgCMPHN83+LHF5n13UQqqXoZIc8RnWzOrqJ6+yXIUqOpM7Q9QdLM8LqBVlcQV
 SGgZ/u699aYuwv8HjXdb4OWCFm9eg3E7ymCBMm7QQAWJ/udsDZOMKZNni6FylCKfPzWU
 DhWw==
X-Gm-Message-State: AOJu0YzxDluVSVPByONkDfiIAX4JBy6dnkl0nJoscG446l/F5cBgpCfJ
 Fw6gmUa3hW4mPbOtWgw22H1HJws8vL5XZRQRLlMjTvprmfG4/0zuzNZ7El6ttTCZHGWoLdm5On1
 KYY2MBECVA3qUYBHyOFF/FsNeaPCNTV2E44kU0og=
X-Gm-Gg: Acq92OGThb6z1xpKg7mgwYyjrfi8tLxaHRkIHMPgzRFUGJOqOc5SensBLrmZtEMRY2r
 fmGAHDVj5hV+b7D60NwMu//dE4C2ZQVrLHXt29f0iIGQgeCI9CDY346EcJVvi8BDD47LGDnfY4y
 WE3UGiitr8q/ByCOos5H61oy7G7Lx5jfEtrWxhTECS+Pdqexzfz2DsLMHcHAfhnM0FH4fdy6ezJ
 Vt8tWye1LcQPjgmA/tmBX3DJcmDyu6SInhfypHX8giJPxkz8483bT6cp3fHOfawL+6v7CfyuUiq
 LeCiQuYAJJkWNwDGjtHUO6G/RdgFOaaxLF0f93MXO2pnqT2RwGNF6pkIb7bEbrz/aROPGBs7U6g
 IlTLLgrAduThWIdYwss5gCqcLRoC6NVVafKHOXWiHz4+wkLFWdc3DJ0XEOU5BNttN3J8FJ0X78Z
 qvDmtzklrGyhYp4A==
X-Received: by 2002:a17:907:94cc:b0:bd5:7c2:7622 with SMTP id
 a640c23a62f3a-bf373afc3a1mr941627066b.49.1780958047808; Mon, 08 Jun 2026
 15:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-0-47fc8262591b@gmail.com>
 <20260524-wip-obbardc-boot-efibootguard-initial-pkg-v3-1-47fc8262591b@gmail.com>
 <c160823f-1e17-4140-a395-da65d69d39a4@rnout.be>
In-Reply-To: <c160823f-1e17-4140-a395-da65d69d39a4@rnout.be>
From: Christopher Obbard <obbardc@gmail.com>
Date: Mon, 8 Jun 2026 23:33:55 +0100
X-Gm-Features: AVVi8Cdcym5uoSh297b0MXVlPOeg2_3zfN69CQBd-r2oDcVuLuYW7mXtBlTfpTQ
Message-ID: <CAP03Xeoxy=19R3D5APig5R-xu2dODv6x8=yfCD1HrBMZcPX=5A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 efibootguard-dev@googlegroups.com, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780958048; x=1781562848; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VlIQ6fy+tehdTQPh79PSDKRw1BZMeE6WFM/2aMkil7o=;
 b=e8Ywjx9koUArBSDr8cAXVVSbdUzjLnP7+hHpcDta7CAVwaCxoXplaw0I9wz4fLYmS+
 MgXeEzjg3wNCsYwETf28nL96vdgJav5eHXdj7Phxqdc703OMltvnodSMdrQO9XzpPJ/z
 gULPtGY1mVpIFqUpUA1hj9yVUhZNMwZxxYs2iMGd9cb3vwZ9O83zFrD2EI7LarFdb3xn
 +9qwHQsDhddoSXh5J7uN3S+QXTHmp8u6i4ySWg4XHQKedgzxFO/z1c/2oVNtOTMv7Rdk
 xcnTTwcK3pEZpxm8HrQrd8+Oe9YqrLvnhqGZJ9dgam5BwkS8vZ1URaa7kWhVdRiGtmxH
 k0nA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=e8Ywjx9k
Subject: Re: [Buildroot] [PATCH v3 1/2] boot/efibootguard: new boot package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

Thank you for your review.

On Tue, 26 May 2026 at 20:37, Arnout Vandecappelle <arnout@rnout.be> wrote:
> On 24/05/2026 19:23, Christopher Obbard wrote:
> > This patch adds a new boot package to Buildroot to build the
> > EFI Boot Guard bootloader from the https://github.com/siemens/efibootguard
> > repository.
> >
> > EFI Boot Guard can be chainloaded as an EFI application or used as a
> > standalone bootloader and can be useful when booting A/B systems.
> >
> > Add a recipe to build the EFI bootloader application, user-space
> > tooling & host tooling (both of which are used to manage EFI Boot Guard
> > configuration).
> >
> > EFI Boot Guard can be built for multiple architectures, but this initial
> > patch only builds the EFI bootloader for x86_64.
>
>   Any particular reason for that? With utils/test-pkg it should be easy enough
> to test if all the architectures indeed work (or at least build).

Thanks; I have now modified the recipe such that it builds for all (supported!)
architectures and now installs the binaries in the right place.


> > Signed-off-by: Christopher Obbard <obbardc@gmail.com>
> [snip]
> > diff --git a/boot/efibootguard/Config.in b/boot/efibootguard/Config.in
> > new file mode 100644
> > index 0000000000..47fd478e8b
> > --- /dev/null
> > +++ b/boot/efibootguard/Config.in
> > @@ -0,0 +1,37 @@
> > +config BR2_TARGET_EFIBOOTGUARD_ARCH_SUPPORTS
> > +     bool
> > +     default y if BR2_x86_64
>
>   Is there actually platform-specific code in efibootguard? I had a very quick
> look and couldn't find anything right away. But of course, it requires a
> watchdog, and all the mentioned watchdog drivers are x86-specific AFAIK.

I modified the recipe to be much more generic for different arches now.


> > +     depends on BR2_USE_MMU
>
>   Where does the MMU dependency come from? Is it just copied from gnu-efi? If
> so, it's better to use
>
>         depends on BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
>
> It's probably better to do that anyway, we like to make sure that for every
> select there is a corresponding depends on for its dependencies.

Thanks, that makes a lot of sense!


> > +
> > +config BR2_TARGET_EFIBOOTGUARD
> > +     bool "efibootguard"
> > +     depends on BR2_TARGET_EFIBOOTGUARD_ARCH_SUPPORTS
> > +     depends on BR2_USE_WCHAR
> > +     select BR2_PACKAGE_GNU_EFI
> > +     select BR2_PACKAGE_PCIUTILS if BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS
>
>   This select should move to the BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS option
> itself.

No, I found that pciutils is needed for the EFI bootload itself. I've
modified it now.


> > +     help
> > +       EFI Boot Guard is a UEFI bootloader intended for robust
> > +       A/B style updates. It arms a hardware watchdog before
> > +       handing over control to the OS and supports a fail-safe
> > +       boot mechanism to roll back if a boot attempt fails.
> > +
> > +       https://github.com/siemens/efibootguard
> > +
> > +if BR2_TARGET_EFIBOOTGUARD
> > +
> > +config BR2_TARGET_EFIBOOTGUARD_X86_64
> > +     bool "x86-64"
> > +     depends on BR2_x86_64
> > +     help
> > +       Select this option if the platform you're targeting has a
> > +       64 bits EFI BIOS.
>
>   I don't see why such an option should be user-selectable. The target
> architecture is sufficient, no? In addition, it is not even used in the .mk file...

Thanks, I removed that useless option.


> > +
> > +config BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS
> > +     bool "install tools"
> > +     help
> > +       Install the efibootguard user-space tools (e.g.
> > +       bg_printenv and bg_setenv) on the target. These tools
> > +       allow reading and updating efibootguard's configuration
> > +       in user-space.
> > +
> > +endif # BR2_TARGET_EFIBOOTGUARD
> > diff --git a/boot/efibootguard/Config.in.host b/boot/efibootguard/Config.in.host
> > new file mode 100644
> > index 0000000000..845c14c079
> > --- /dev/null
> > +++ b/boot/efibootguard/Config.in.host
> > @@ -0,0 +1,8 @@
> > +config BR2_TARGET_HOST_EFIBOOTGUARD
> > +     bool "host efibootguard"
> > +     help
> > +       Build efibootguard companion tools for the host. These
> > +       can be used during image creation to inspect and
> > +       modify the efibootguard configuration data.
> > +
> > +       https://github.com/siemens/efibootguard
> > diff --git a/boot/efibootguard/efibootguard.hash b/boot/efibootguard/efibootguard.hash
> > new file mode 100644
> > index 0000000000..6f5a5cf25c
> > --- /dev/null
> > +++ b/boot/efibootguard/efibootguard.hash
> > @@ -0,0 +1,3 @@
> > +# Locally calculated
> > +sha256  6c68c541311dcc8c2be0042f7887acc2a24d2ac68a88d426380fdbda9f476ae8  efibootguard-0.22.tar.gz
> > +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> > diff --git a/boot/efibootguard/efibootguard.mk b/boot/efibootguard/efibootguard.mk
> > new file mode 100644
> > index 0000000000..c40cef13ac
> > --- /dev/null
> > +++ b/boot/efibootguard/efibootguard.mk
> > @@ -0,0 +1,60 @@
> > +################################################################################
> > +#
> > +# efibootguard
> > +#
> > +################################################################################
> > +
> > +EFIBOOTGUARD_VERSION = 0.22
> > +EFIBOOTGUARD_SITE = $(call github,siemens,efibootguard,refs/tags/v$(EFIBOOTGUARD_VERSION))
> > +EFIBOOTGUARD_LICENSE = GPL-2.0-only
> > +EFIBOOTGUARD_LICENSE_FILES = COPYING
> > +
> > +EFIBOOTGUARD_DEPENDENCIES = \
> > +     gnu-efi \
> > +     host-autoconf-archive
> > +
> > +ifeq ($(BR2_TARGET_EFIBOOTGUARD_INSTALL_TOOLS),y)
> > +EFIBOOTGUARD_DEPENDENCIES += pciutils
>
>   For the host package, there is no dependency on host-pciutils (which doesn't
> exist anyway) but otherwise the options are the same. Is the pciutils dependency
> perhaps optional?

It's needed for the bootloader. I cleaned it up a bit.


> > +EFIBOOTGUARD_INSTALL_TARGET = YES
> > +else
> > +EFIBOOTGUARD_INSTALL_TARGET = NO
> > +endif
> > +
> > +EFIBOOTGUARD_INSTALL_IMAGES = YES
> > +
> > +EFIBOOTGUARD_AUTORECONF = YES
> > +
> > +EFIBOOTGUARD_AUTORECONF_OPTS = \
> > +     -I $(HOST_DIR)/share/autoconf-archive
> > +
> > +EFIBOOTGUARD_CONF_OPTS = \
> > +     --with-gnuefi-sys-dir=$(STAGING_DIR) \
> > +     --with-gnuefi-include-dir=$(STAGING_DIR)/usr/include/efi \
> > +     --with-gnuefi-lib-dir=$(STAGING_DIR)/usr/lib \
> > +     --disable-completion \
> > +     --disable-tests
> > +
> > +# TODO: Perhaps take inspiration from Debian patch https://salsa.debian.org/debian/efibootguard/-/blob/master/debian/patches/always-override-stack-protector-variables-in-EFI-bui.patch?ref_type=heads
>
>   Although that is a good patch (at first sight), it's something that should be
> upstream, and anyway has no relationship with the -no-pie. So I'd just remove
> this comment.

Thanks, I removed it.


> > +EFIBOOTGUARD_CONF_ENV = \
> > +     LDFLAGS="$(LDFLAGS) -no-pie"
> > +
> > +define EFIBOOTGUARD_INSTALL_IMAGES_CMDS
> > +     $(INSTALL) -d $(BINARIES_DIR)/efibootguard
> > +     $(INSTALL) -m 0644 $(@D)/efibootguardx64.efi $(BINARIES_DIR)/efibootguard/
>
>   Why in a subdirectory and not directly in BINARIES_DIR?

Thanks; I moved it to BINARIES_DIR.


Cheers!

Chris
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
