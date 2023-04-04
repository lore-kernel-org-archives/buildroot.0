Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467A2C761A6
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 15:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5A4840A87;
	Tue,  4 Apr 2023 15:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5A4840A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrHGMeFYsoMK; Tue,  4 Apr 2023 15:35:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F16840364;
	Tue,  4 Apr 2023 15:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F16840364
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B2DE1BF2A6
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 15:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E6DA409B4
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 15:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E6DA409B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sGr1f8nu2k79 for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 15:35:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C25BC409AE
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C25BC409AE
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 15:35:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h11so35891547lfu.8
 for <buildroot@buildroot.org>; Tue, 04 Apr 2023 08:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680622521;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ZP/6z28sunmcygrQ9awCDSzLxm2AnOAmIjCqYQ8ruU=;
 b=w6nAtgxWuIHUOT+qE/BPCIbhlkszVpBhc5McOfOBXWG7WdFFMCZH1uD1EkDOWTlFFS
 8dqmpugAIUIXk1GagnmC/y8XxKpALADO1jK1g9YaRA+RBkvS3EeyaDhHjMog1JcLAvji
 lsHGXZbQaPaWV9IeLQs9EXKFkIoVwE9Q1dFbM55+8fl4A4BituE4dPhvyyWRtFJ1rE3v
 Sa/06MYoCIeypzQKygwTMgqC24ZAVhjEwgghosJ1XWAeq4qau2g02Qmj1gMRSlDTjX6H
 ZPQvFjsEp6yF/l9NWPRpNbl+/VtuWkMBmjg2y1+wZvBO1b5A6FPv21GkP8JFnQfYeuME
 DWfg==
X-Gm-Message-State: AAQBX9cX7c9O4qOOtNNFKd36UOSHlgKytx2Q415ktxjfLfSfsYF6cDKl
 0UGFKROy8kmn9A5e7GolIhbcxJEXR8+Vajy/3BxdLA==
X-Google-Smtp-Source: AKy350Z9rP1kkb86UTP3CapgqbmEvgxRuUBzl5VmM2TM3mQgTzEjwfoOxy2OVffoIn+W487nogB+wQQoYJ5AaGfpmrQ=
X-Received: by 2002:a19:7417:0:b0:4eb:1606:48d5 with SMTP id
 v23-20020a197417000000b004eb160648d5mr894080lfe.7.1680622521427; Tue, 04 Apr
 2023 08:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230403114947.1823718-1-sebastian.weyer@smile.fr>
 <ZCw2yOGVaMQ3sE8N@debian>
In-Reply-To: <ZCw2yOGVaMQ3sE8N@debian>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
Date: Tue, 4 Apr 2023 17:35:09 +0200
Message-ID: <CADSVbUv8GkUdK6FojK_d0bo9auh9_S0yp_3ta==bRBidXCHVqA@mail.gmail.com>
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Alexander Egorenkov <egorenar@linux.ibm.com>,
 Mark Corbin <mark@dibsco.co.uk>, 
 Dick Olsson <hi@senzilla.io>, Thomas Huth <huth@tuxfamily.org>, 
 Romain Naour <romain.naour@gmail.com>, Niklas Cassel <niklas.cassel@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1680622521;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ZP/6z28sunmcygrQ9awCDSzLxm2AnOAmIjCqYQ8ruU=;
 b=XEK2PklFyxLIZAMj83PLA26zccHBoknVpMILV92hPl2R+MViUc1JgwW5TpWsSft11x
 Tgq09EXWn0UmhFnHw0CJtFrD7ckCoKBBUZgXrtFycTHHZIlpAQ8IrGXzvgA74wbu0g3K
 iomWXes+1LE4Go1njqAA8Ll/2u/BK7vxF5EWpjd+bZgDe7WIpVxklt8wJEB0FDkpTDCZ
 aPccAlgjWSzD/WXc3+McOuxWUL1xrxRzVMu3dVZ59ta3/ibMpxaqmit8uGODlg0fcdXk
 qSJwPX4cuUHck/8MVxKssJd41kNK/Hp7sUy3/pEuq6VN69Zr+ZQ2+jlAwjUeLu43Nv2G
 RCwg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=XEK2PklF
Subject: Re: [Buildroot] [PATCH v2 1/1] configs/qemu: update defconfigs to
 Linux 6.2.9
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
Content-Type: multipart/mixed; boundary="===============0457688744520177539=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0457688744520177539==
Content-Type: multipart/alternative; boundary="0000000000006440c405f8846c4e"

--0000000000006440c405f8846c4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

Thank you for testing.
Not sure how the whitespace slipped in. I'll fix it and send a new version.

Best regards,
Sebastian

On Tue, Apr 4, 2023 at 4:40=E2=80=AFPM Vincent Stehl=C3=A9 <vincent.stehle@=
arm.com>
wrote:

> On Mon, Apr 03, 2023 at 01:49:46PM +0200, Sebastian Weyer wrote:
> > Just updating all qemu defconfigs to the latest Kernel version:
> >
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dlinux-6.2.y&id=3De128ce12e29c5a6d9a88c7b8a1c8e07402c38fed
> >
> > Tested using external toolchains:
> > https://gitlab.com/DocSepp/buildroot/-/pipelines/826008372
> >
> > Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> > ---
> > v2:
> >     - remove Kernel header version from comment in
> >       qemu_riscv64_nommu_virt_defconfig
> >     - use kernel version 6.2.9 instead of 6.1.11
> >
> > The pipeline used here yielded the same results as Romain's for the
> > previous version of the patch:
> > https://gitlab.com/kubu93/buildroot/-/pipelines/776319124
> > With the exception that the defconfigs he removed aren't removed for th=
e
> > new pipeline
> > ---
> >  configs/qemu_aarch64_ebbr_defconfig       | 4 ++--
> >  configs/qemu_aarch64_sbsa_defconfig       | 4 ++--
> >  configs/qemu_aarch64_virt_defconfig       | 4 ++--
> >  configs/qemu_arm_ebbr_defconfig           | 4 ++--
> >  configs/qemu_arm_versatile_defconfig      | 4 ++--
> >  configs/qemu_arm_vexpress_defconfig       | 4 ++--
> >  configs/qemu_arm_vexpress_tz_defconfig    | 4 ++--
>
> Hi Sebastian,
>
> Thanks for this patch.
>
> I have quickly tested all the aarch64 and arm defconfigs. They all work o=
n
> my
> side except the qemu_aarch64_virt_defconfig, which has a typo (see below)=
.
> It
> does work fine with the typo fixed.
>
> Best regards,
> Vincent.
>
> >  configs/qemu_m68k_mcf5208_defconfig       | 4 ++--
> >  configs/qemu_m68k_q800_defconfig          | 4 ++--
> >  configs/qemu_microblazebe_mmu_defconfig   | 4 ++--
> >  configs/qemu_microblazeel_mmu_defconfig   | 4 ++--
> >  configs/qemu_mips32r2_malta_defconfig     | 4 ++--
> >  configs/qemu_mips32r2el_malta_defconfig   | 4 ++--
> >  configs/qemu_mips32r6_malta_defconfig     | 4 ++--
> >  configs/qemu_mips32r6el_malta_defconfig   | 4 ++--
> >  configs/qemu_mips64_malta_defconfig       | 4 ++--
> >  configs/qemu_mips64el_malta_defconfig     | 4 ++--
> >  configs/qemu_mips64r6_malta_defconfig     | 4 ++--
> >  configs/qemu_mips64r6el_malta_defconfig   | 4 ++--
> >  configs/qemu_nios2_10m50_defconfig        | 4 ++--
> >  configs/qemu_or1k_defconfig               | 4 ++--
> >  configs/qemu_ppc64_e5500_defconfig        | 4 ++--
> >  configs/qemu_ppc64_pseries_defconfig      | 4 ++--
> >  configs/qemu_ppc64le_powernv8_defconfig   | 4 ++--
> >  configs/qemu_ppc64le_pseries_defconfig    | 4 ++--
> >  configs/qemu_ppc_bamboo_defconfig         | 4 ++--
> >  configs/qemu_ppc_e500mc_defconfig         | 4 ++--
> >  configs/qemu_ppc_g3beige_defconfig        | 4 ++--
> >  configs/qemu_ppc_mac99_defconfig          | 4 ++--
> >  configs/qemu_ppc_mpc8544ds_defconfig      | 4 ++--
> >  configs/qemu_riscv32_virt_defconfig       | 4 ++--
> >  configs/qemu_riscv64_nommu_virt_defconfig | 6 +++---
> >  configs/qemu_riscv64_virt_defconfig       | 4 ++--
> >  configs/qemu_s390x_defconfig              | 4 ++--
> >  configs/qemu_sh4_r2d_defconfig            | 4 ++--
> >  configs/qemu_sh4eb_r2d_defconfig          | 4 ++--
> >  configs/qemu_sparc64_sun4u_defconfig      | 4 ++--
> >  configs/qemu_sparc_ss10_defconfig         | 4 ++--
> >  configs/qemu_x86_64_defconfig             | 4 ++--
> >  configs/qemu_x86_defconfig                | 4 ++--
> >  configs/qemu_xtensa_lx60_defconfig        | 4 ++--
> >  configs/qemu_xtensa_lx60_nommu_defconfig  | 4 ++--
> >  42 files changed, 85 insertions(+), 85 deletions(-)
> >
> > diff --git a/configs/qemu_aarch64_ebbr_defconfig
> b/configs/qemu_aarch64_ebbr_defconfig
> > index e3157089a9..e5714c1ed5 100644
> > --- a/configs/qemu_aarch64_ebbr_defconfig
> > +++ b/configs/qemu_aarch64_ebbr_defconfig
> > @@ -6,12 +6,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image=
.sh
> board/qemu/aarch64-ebbr/p
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG) -c
> board/qemu/aarch64-ebbr/genimage.cfg"
> >
> >  # Linux headers
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.1.12"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> >
> > diff --git a/configs/qemu_aarch64_sbsa_defconfig
> b/configs/qemu_aarch64_sbsa_defconfig
> > index 609444e787..e368721252 100644
> > --- a/configs/qemu_aarch64_sbsa_defconfig
> > +++ b/configs/qemu_aarch64_sbsa_defconfig
> > @@ -17,12 +17,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh
> board/qemu/aarch64-sbsa/a
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG) -c
> board/qemu/aarch64-sbsa/genimage.cfg"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> >
> > diff --git a/configs/qemu_aarch64_virt_defconfig
> b/configs/qemu_aarch64_virt_defconfig
> > index 03df0ad9e2..9115569ab9 100644
> > --- a/configs/qemu_aarch64_virt_defconfig
> > +++ b/configs/qemu_aarch64_virt_defconfig
> > @@ -15,12 +15,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > + BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
>    ^
> A spurious space slipped in, which breaks the build.
>
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/aarch64-virt/linux.conf=
ig"
> >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> > diff --git a/configs/qemu_arm_ebbr_defconfig
> b/configs/qemu_arm_ebbr_defconfig
> > index 8fbb3069bc..c530dd502c 100644
> > --- a/configs/qemu_arm_ebbr_defconfig
> > +++ b/configs/qemu_arm_ebbr_defconfig
> > @@ -7,12 +7,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image=
.sh
> board/qemu/arm-ebbr/post-
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG) -c
> board/qemu/arm-ebbr/genimage.cfg"
> >
> >  # Linux headers
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.1.12"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/qemu/arm-ebbr/linux.fragm=
ent"
> >
> > diff --git a/configs/qemu_arm_versatile_defconfig
> b/configs/qemu_arm_versatile_defconfig
> > index 4f43273a82..50f0f62e39 100644
> > --- a/configs/qemu_arm_versatile_defconfig
> > +++ b/configs/qemu_arm_versatile_defconfig
> > @@ -15,12 +15,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"versatile"
> >
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/qemu/arm-versatile/linux.=
fragment"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> > diff --git a/configs/qemu_arm_vexpress_defconfig
> b/configs/qemu_arm_vexpress_defconfig
> > index 2c813456f4..997e11be10 100644
> > --- a/configs/qemu_arm_vexpress_defconfig
> > +++ b/configs/qemu_arm_vexpress_defconfig
> > @@ -20,12 +20,12 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >  BR2_TARGET_ROOTFS_EXT2_SIZE=3D"64M"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"vexpress"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> >  BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"vexpress-v2p-ca9"
> > diff --git a/configs/qemu_arm_vexpress_tz_defconfig
> b/configs/qemu_arm_vexpress_tz_defconfig
> > index 576c441154..1ea602de0e 100644
> > --- a/configs/qemu_arm_vexpress_tz_defconfig
> > +++ b/configs/qemu_arm_vexpress_tz_defconfig
> > @@ -17,12 +17,12 @@ BR2_TARGET_ROOTFS_CPIO_UIMAGE=3Dy
> >  # BR2_TARGET_ROOTFS_TAR is not set
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"vexpress"
> >
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/qemu/arm-vexpress-tz/linu=
x.fragment"
> >
> > diff --git a/configs/qemu_m68k_mcf5208_defconfig
> b/configs/qemu_m68k_mcf5208_defconfig
> > index 0490b9e29e..7e3acaf41a 100644
> > --- a/configs/qemu_m68k_mcf5208_defconfig
> > +++ b/configs/qemu_m68k_mcf5208_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/m68k-mcf5208/linux.conf=
ig"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_m68k_q800_defconfig
> b/configs/qemu_m68k_q800_defconfig
> > index 30d8982db3..00b08f9753 100644
> > --- a/configs/qemu_m68k_q800_defconfig
> > +++ b/configs/qemu_m68k_q800_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/m68k-q800/linux.conf=
ig"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_microblazebe_mmu_defconfig
> b/configs/qemu_microblazebe_mmu_defconfig
> > index 7bd2ae53b8..6701d9077d 100644
> > --- a/configs/qemu_microblazebe_mmu_defconfig
> > +++ b/configs/qemu_microblazebe_mmu_defconfig
> > @@ -15,12 +15,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/microblazebe-mmu/linux.=
config"
> >  BR2_LINUX_KERNEL_LINUX_BIN=3Dy
> > diff --git a/configs/qemu_microblazeel_mmu_defconfig
> b/configs/qemu_microblazeel_mmu_defconfig
> > index cd8c5a3cb2..674e88911e 100644
> > --- a/configs/qemu_microblazeel_mmu_defconfig
> > +++ b/configs/qemu_microblazeel_mmu_defconfig
> > @@ -15,12 +15,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/microblazeel-mmu/linux.=
config"
> >  BR2_LINUX_KERNEL_LINUX_BIN=3Dy
> > diff --git a/configs/qemu_mips32r2_malta_defconfig
> b/configs/qemu_mips32r2_malta_defconfig
> > index 49d84c308b..f24422102e 100644
> > --- a/configs/qemu_mips32r2_malta_defconfig
> > +++ b/configs/qemu_mips32r2_malta_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/mips32r2-malta/linux.co=
nfig"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_mips32r2el_malta_defconfig
> b/configs/qemu_mips32r2el_malta_defconfig
> > index 5363018c47..26356dde3d 100644
> > --- a/configs/qemu_mips32r2el_malta_defconfig
> > +++ b/configs/qemu_mips32r2el_malta_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/mips32r2el-malta/linux.=
config"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_mips32r6_malta_defconfig
> b/configs/qemu_mips32r6_malta_defconfig
> > index f77feb9b6d..82c37317a7 100644
> > --- a/configs/qemu_mips32r6_malta_defconfig
> > +++ b/configs/qemu_mips32r6_malta_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/mips32r6-malta/linux.co=
nfig"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_mips32r6el_malta_defconfig
> b/configs/qemu_mips32r6el_malta_defconfig
> > index 575034441a..9f6a3f3a44 100644
> > --- a/configs/qemu_mips32r6el_malta_defconfig
> > +++ b/configs/qemu_mips32r6el_malta_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/mips32r6el-malta/linux.=
config"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_mips64_malta_defconfig
> b/configs/qemu_mips64_malta_defconfig
> > index e9438fda1e..60eb2ecdc3 100644
> > --- a/configs/qemu_mips64_malta_defconfig
> > +++ b/configs/qemu_mips64_malta_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/mips64-malta/linux.conf=
ig"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_mips64el_malta_defconfig
> b/configs/qemu_mips64el_malta_defconfig
> > index 4b1c8e22af..96b92dc264 100644
> > --- a/configs/qemu_mips64el_malta_defconfig
> > +++ b/configs/qemu_mips64el_malta_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/mips64el-malta/linux.co=
nfig"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_mips64r6_malta_defconfig
> b/configs/qemu_mips64r6_malta_defconfig
> > index 87ef7902af..42676eae80 100644
> > --- a/configs/qemu_mips64r6_malta_defconfig
> > +++ b/configs/qemu_mips64r6_malta_defconfig
> > @@ -15,12 +15,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/mips64r6-malta/linux.co=
nfig"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_mips64r6el_malta_defconfig
> b/configs/qemu_mips64r6el_malta_defconfig
> > index 5774207f65..4ec537a0e9 100644
> > --- a/configs/qemu_mips64r6el_malta_defconfig
> > +++ b/configs/qemu_mips64r6el_malta_defconfig
> > @@ -15,12 +15,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/mips64r6el-malta/linux.=
config"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_nios2_10m50_defconfig
> b/configs/qemu_nios2_10m50_defconfig
> > index 4b9c53e8de..8a6059b738 100644
> > --- a/configs/qemu_nios2_10m50_defconfig
> > +++ b/configs/qemu_nios2_10m50_defconfig
> > @@ -1,7 +1,7 @@
> >  BR2_nios2=3Dy
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"10m50"
> >
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/qemu/nios2-10m50/linux.fr=
agment"
> >  BR2_TARGET_ROOTFS_INITRAMFS=3Dy
> > @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image=
.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel needs mkimage
> >  BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy
> > diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig
> > index b3d9d79156..9cd6bf7372 100644
> > --- a/configs/qemu_or1k_defconfig
> > +++ b/configs/qemu_or1k_defconfig
> > @@ -10,12 +10,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/or1k/linux.config"
> >
> > diff --git a/configs/qemu_ppc64_e5500_defconfig
> b/configs/qemu_ppc64_e5500_defconfig
> > index 6ad03c4c87..bb5a5268a4 100644
> > --- a/configs/qemu_ppc64_e5500_defconfig
> > +++ b/configs/qemu_ppc64_e5500_defconfig
> > @@ -12,12 +12,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as the kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.17.7"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"corenet64_smp"
> >
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/qemu/ppc64-e5500/linux.fr=
agment"
> >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> > diff --git a/configs/qemu_ppc64_pseries_defconfig
> b/configs/qemu_ppc64_pseries_defconfig
> > index 50844dc93b..5cddbd8242 100644
> > --- a/configs/qemu_ppc64_pseries_defconfig
> > +++ b/configs/qemu_ppc64_pseries_defconfig
> > @@ -16,12 +16,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.17.7"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"pseries"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> >
> > diff --git a/configs/qemu_ppc64le_powernv8_defconfig
> b/configs/qemu_ppc64le_powernv8_defconfig
> > index f6a5c3d409..edb4fe2832 100644
> > --- a/configs/qemu_ppc64le_powernv8_defconfig
> > +++ b/configs/qemu_ppc64le_powernv8_defconfig
> > @@ -16,12 +16,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.17.7"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"powernv"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> >
> > diff --git a/configs/qemu_ppc64le_pseries_defconfig
> b/configs/qemu_ppc64le_pseries_defconfig
> > index 7ce5a9d310..418e632331 100644
> > --- a/configs/qemu_ppc64le_pseries_defconfig
> > +++ b/configs/qemu_ppc64le_pseries_defconfig
> > @@ -16,12 +16,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.17.7"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"pseries_le"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> >
> > diff --git a/configs/qemu_ppc_bamboo_defconfig
> b/configs/qemu_ppc_bamboo_defconfig
> > index f4cc5589e7..75266dc24b 100644
> > --- a/configs/qemu_ppc_bamboo_defconfig
> > +++ b/configs/qemu_ppc_bamboo_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.17.7"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"44x/bamboo"
> >
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/qemu/ppc-bamboo/linux.fra=
gment"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_ppc_e500mc_defconfig
> b/configs/qemu_ppc_e500mc_defconfig
> > index 0a1877c44b..c110627611 100644
> > --- a/configs/qemu_ppc_e500mc_defconfig
> > +++ b/configs/qemu_ppc_e500mc_defconfig
> > @@ -11,12 +11,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as the kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.17.7"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"corenet32_smp"
> >
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/qemu/ppc-e500mc/linux.fra=
gment"
> >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> > diff --git a/configs/qemu_ppc_g3beige_defconfig
> b/configs/qemu_ppc_g3beige_defconfig
> > index 1c11bcf77d..a14a641b23 100644
> > --- a/configs/qemu_ppc_g3beige_defconfig
> > +++ b/configs/qemu_ppc_g3beige_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.17.7"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/ppc-g3beige/linux.confi=
g"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_ppc_mac99_defconfig
> b/configs/qemu_ppc_mac99_defconfig
> > index 2331041c2a..ec11cf8946 100644
> > --- a/configs/qemu_ppc_mac99_defconfig
> > +++ b/configs/qemu_ppc_mac99_defconfig
> > @@ -6,12 +6,12 @@ BR2_powerpc_7400=3Dy
> >  BR2_SYSTEM_DHCP=3D"eth0"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.17.7"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"pmac32"
> >
> BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D"board/qemu/ppc-mac99/linux.frag=
ment"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_ppc_mpc8544ds_defconfig
> b/configs/qemu_ppc_mpc8544ds_defconfig
> > index b9a0812d52..ebb09a4efa 100644
> > --- a/configs/qemu_ppc_mpc8544ds_defconfig
> > +++ b/configs/qemu_ppc_mpc8544ds_defconfig
> > @@ -15,12 +15,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.17.7"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/ppc-mpc8544ds/linux.con=
fig"
> >  BR2_LINUX_KERNEL_VMLINUX=3Dy
> > diff --git a/configs/qemu_riscv32_virt_defconfig
> b/configs/qemu_riscv32_virt_defconfig
> > index f354e303e5..b38c97652f 100644
> > --- a/configs/qemu_riscv32_virt_defconfig
> > +++ b/configs/qemu_riscv32_virt_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.43"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"rv32"
> >  BR2_LINUX_KERNEL_IMAGE=3Dy
> >
> > diff --git a/configs/qemu_riscv64_nommu_virt_defconfig
> b/configs/qemu_riscv64_nommu_virt_defconfig
> > index ee70beb208..c9b7200883 100644
> > --- a/configs/qemu_riscv64_nommu_virt_defconfig
> > +++ b/configs/qemu_riscv64_nommu_virt_defconfig
> > @@ -3,8 +3,8 @@ BR2_riscv=3Dy
> >  BR2_RISCV_64=3Dy
> >  # BR2_RISCV_USE_MMU is not set
> >
> > -# Linux headers same as kernel, a 5.19 series
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=3Dy
> > +# Linux headers same as kernel
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Busybox with hush
> >  BR2_PACKAGE_BUSYBOX_CONFIG=3D"package/busybox/busybox-minimal.config"
> > @@ -22,7 +22,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.19"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_DEFCONFIG=3D"nommu_virt"
> >  BR2_LINUX_KERNEL_IMAGE=3Dy
> >
> > diff --git a/configs/qemu_riscv64_virt_defconfig
> b/configs/qemu_riscv64_virt_defconfig
> > index b3174a152c..fd0ff16791 100644
> > --- a/configs/qemu_riscv64_virt_defconfig
> > +++ b/configs/qemu_riscv64_virt_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.43"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_IMAGE=3Dy
> >
> > diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfi=
g
> > index 6bbcca0896..78184eca1f 100644
> > --- a/configs/qemu_s390x_defconfig
> > +++ b/configs/qemu_s390x_defconfig
> > @@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=3Dy
> >  # BR2_TARGET_ROOTFS_TAR is not set
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.1.4"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> >
> > diff --git a/configs/qemu_sh4_r2d_defconfig
> b/configs/qemu_sh4_r2d_defconfig
> > index 0f12b7dfe9..9267270ccd 100644
> > --- a/configs/qemu_sh4_r2d_defconfig
> > +++ b/configs/qemu_sh4_r2d_defconfig
> > @@ -15,12 +15,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Linux kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/sh4-r2d/linux.config=
"
> >  BR2_LINUX_KERNEL_ZIMAGE=3Dy
> > diff --git a/configs/qemu_sh4eb_r2d_defconfig
> b/configs/qemu_sh4eb_r2d_defconfig
> > index d5ee371e79..e4d48e1f90 100644
> > --- a/configs/qemu_sh4eb_r2d_defconfig
> > +++ b/configs/qemu_sh4eb_r2d_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Linux kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/sh4eb-r2d/linux.conf=
ig"
> >  BR2_LINUX_KERNEL_ZIMAGE=3Dy
> > diff --git a/configs/qemu_sparc64_sun4u_defconfig
> b/configs/qemu_sparc64_sun4u_defconfig
> > index 485b497e71..c064a7b939 100644
> > --- a/configs/qemu_sparc64_sun4u_defconfig
> > +++ b/configs/qemu_sparc64_sun4u_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Linux kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/sparc64-sun4u/linux.con=
fig"
> >
> > diff --git a/configs/qemu_sparc_ss10_defconfig
> b/configs/qemu_sparc_ss10_defconfig
> > index 2ba04c0864..af26a2fb55 100644
> > --- a/configs/qemu_sparc_ss10_defconfig
> > +++ b/configs/qemu_sparc_ss10_defconfig
> > @@ -14,12 +14,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Linux kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/sparc-ss10/linux.con=
fig"
> >
> > diff --git a/configs/qemu_x86_64_defconfig
> b/configs/qemu_x86_64_defconfig
> > index cc505a8540..6562bc1f52 100644
> > --- a/configs/qemu_x86_64_defconfig
> > +++ b/configs/qemu_x86_64_defconfig
> > @@ -16,12 +16,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/x86_64/linux.config"
> >  BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=3Dy
> > diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig
> > index 34b7e2d292..7886cb4ccf 100644
> > --- a/configs/qemu_x86_defconfig
> > +++ b/configs/qemu_x86_defconfig
> > @@ -17,12 +17,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/x86/linux.config"
> >
> > diff --git a/configs/qemu_xtensa_lx60_defconfig
> b/configs/qemu_xtensa_lx60_defconfig
> > index cb78106091..ade45fa180 100644
> > --- a/configs/qemu_xtensa_lx60_defconfig
> > +++ b/configs/qemu_xtensa_lx60_defconfig
> > @@ -16,12 +16,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/xtensa-lx60/linux.confi=
g"
> >  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy
> > diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig
> b/configs/qemu_xtensa_lx60_nommu_defconfig
> > index 4be1b66edc..c6ba892486 100644
> > --- a/configs/qemu_xtensa_lx60_nommu_defconfig
> > +++ b/configs/qemu_xtensa_lx60_nommu_defconfig
> > @@ -20,12 +20,12 @@
> BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/qemu/post-image.sh"
> >  BR2_ROOTFS_POST_SCRIPT_ARGS=3D"$(BR2_DEFCONFIG)"
> >
> >  # Linux headers same as kernel
> > -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy
> >
> >  # Kernel
> >  BR2_LINUX_KERNEL=3Dy
> >  BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.18"
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"6.2.9"
> >  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy
> >
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D"board/qemu/xtensa-lx60/linux-nommu=
.config"
> >  BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy
> > --
> > 2.25.1
> >
>


--=20
[image: eco] Pour la plan=C3=A8te, n'imprimez ce mail que si c'est n=C3=A9c=
essaire
[image: SMILE] <http://www.smile.eu/>

10-12 Rue Nicolas Appert
44100 NANTES
*Sebastian WEYER*
Stagiaire production

[image: email] sebastian.weyer@smile.fr
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

--0000000000006440c405f8846c4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><div>Hi Vincent,<br><br></=
div>Thank you for testing.<br></div>Not sure how the whitespace slipped in.=
 I&#39;ll fix it and send a new version.<br><br></div>Best regards,<br></di=
v>Sebastian<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Apr 4, 2023 at 4:40=E2=80=AFPM Vincent Stehl=C3=A9 =
&lt;<a href=3D"mailto:vincent.stehle@arm.com">vincent.stehle@arm.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon,=
 Apr 03, 2023 at 01:49:46PM +0200, Sebastian Weyer wrote:<br>
&gt; Just updating all qemu defconfigs to the latest Kernel version:<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linu=
x.git/commit/?h=3Dlinux-6.2.y&amp;id=3De128ce12e29c5a6d9a88c7b8a1c8e07402c3=
8fed" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org/pub/scm/l=
inux/kernel/git/stable/linux.git/commit/?h=3Dlinux-6.2.y&amp;id=3De128ce12e=
29c5a6d9a88c7b8a1c8e07402c38fed</a><br>
&gt; <br>
&gt; Tested using external toolchains:<br>
&gt; <a href=3D"https://gitlab.com/DocSepp/buildroot/-/pipelines/826008372"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/DocSepp/buildroot/=
-/pipelines/826008372</a><br>
&gt; <br>
&gt; Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@s=
mile.fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- remove Kernel header version from comment in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_riscv64_nommu_virt_defconfig<br>
&gt;=C2=A0 =C2=A0 =C2=A0- use kernel version 6.2.9 instead of 6.1.11<br>
&gt; <br>
&gt; The pipeline used here yielded the same results as Romain&#39;s for th=
e<br>
&gt; previous version of the patch:<br>
&gt; <a href=3D"https://gitlab.com/kubu93/buildroot/-/pipelines/776319124" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/kubu93/buildroot/-/=
pipelines/776319124</a><br>
&gt; With the exception that the defconfigs he removed aren&#39;t removed f=
or the<br>
&gt; new pipeline<br>
&gt; ---<br>
&gt;=C2=A0 configs/qemu_aarch64_ebbr_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
&gt;=C2=A0 configs/qemu_aarch64_sbsa_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
&gt;=C2=A0 configs/qemu_aarch64_virt_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
&gt;=C2=A0 configs/qemu_arm_ebbr_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_arm_versatile_defconfig=C2=A0 =C2=A0 =C2=A0 | 4 ++-=
-<br>
&gt;=C2=A0 configs/qemu_arm_vexpress_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
&gt;=C2=A0 configs/qemu_arm_vexpress_tz_defconfig=C2=A0 =C2=A0 | 4 ++--<br>
<br>
Hi Sebastian,<br>
<br>
Thanks for this patch.<br>
<br>
I have quickly tested all the aarch64 and arm defconfigs. They all work on =
my<br>
side except the qemu_aarch64_virt_defconfig, which has a typo (see below). =
It<br>
does work fine with the typo fixed.<br>
<br>
Best regards,<br>
Vincent.<br>
<br>
&gt;=C2=A0 configs/qemu_m68k_mcf5208_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
&gt;=C2=A0 configs/qemu_m68k_q800_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 4 ++--<br>
&gt;=C2=A0 configs/qemu_microblazebe_mmu_defconfig=C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_microblazeel_mmu_defconfig=C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_mips32r2_malta_defconfig=C2=A0 =C2=A0 =C2=A0| 4 ++-=
-<br>
&gt;=C2=A0 configs/qemu_mips32r2el_malta_defconfig=C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_mips32r6_malta_defconfig=C2=A0 =C2=A0 =C2=A0| 4 ++-=
-<br>
&gt;=C2=A0 configs/qemu_mips32r6el_malta_defconfig=C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_mips64_malta_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
&gt;=C2=A0 configs/qemu_mips64el_malta_defconfig=C2=A0 =C2=A0 =C2=A0| 4 ++-=
-<br>
&gt;=C2=A0 configs/qemu_mips64r6_malta_defconfig=C2=A0 =C2=A0 =C2=A0| 4 ++-=
-<br>
&gt;=C2=A0 configs/qemu_mips64r6el_malta_defconfig=C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_nios2_10m50_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
4 ++--<br>
&gt;=C2=A0 configs/qemu_or1k_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_ppc64_e5500_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
4 ++--<br>
&gt;=C2=A0 configs/qemu_ppc64_pseries_defconfig=C2=A0 =C2=A0 =C2=A0 | 4 ++-=
-<br>
&gt;=C2=A0 configs/qemu_ppc64le_powernv8_defconfig=C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_ppc64le_pseries_defconfig=C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 configs/qemu_ppc_bamboo_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_ppc_e500mc_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_ppc_g3beige_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
4 ++--<br>
&gt;=C2=A0 configs/qemu_ppc_mac99_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 4 ++--<br>
&gt;=C2=A0 configs/qemu_ppc_mpc8544ds_defconfig=C2=A0 =C2=A0 =C2=A0 | 4 ++-=
-<br>
&gt;=C2=A0 configs/qemu_riscv32_virt_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
&gt;=C2=A0 configs/qemu_riscv64_nommu_virt_defconfig | 6 +++---<br>
&gt;=C2=A0 configs/qemu_riscv64_virt_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
4 ++--<br>
&gt;=C2=A0 configs/qemu_s390x_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 configs/qemu_sh4_r2d_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 configs/qemu_sh4eb_r2d_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 4 ++--<br>
&gt;=C2=A0 configs/qemu_sparc64_sun4u_defconfig=C2=A0 =C2=A0 =C2=A0 | 4 ++-=
-<br>
&gt;=C2=A0 configs/qemu_sparc_ss10_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_x86_64_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 configs/qemu_x86_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 configs/qemu_xtensa_lx60_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
4 ++--<br>
&gt;=C2=A0 configs/qemu_xtensa_lx60_nommu_defconfig=C2=A0 | 4 ++--<br>
&gt;=C2=A0 42 files changed, 85 insertions(+), 85 deletions(-)<br>
&gt; <br>
&gt; diff --git a/configs/qemu_aarch64_ebbr_defconfig b/configs/qemu_aarch6=
4_ebbr_defconfig<br>
&gt; index e3157089a9..e5714c1ed5 100644<br>
&gt; --- a/configs/qemu_aarch64_ebbr_defconfig<br>
&gt; +++ b/configs/qemu_aarch64_ebbr_defconfig<br>
&gt; @@ -6,12 +6,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/post=
-image.sh board/qemu/aarch64-ebbr/p<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG) -c board/qe=
mu/aarch64-ebbr/genimage.cfg&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.1.12&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch6=
4_sbsa_defconfig<br>
&gt; index 609444e787..e368721252 100644<br>
&gt; --- a/configs/qemu_aarch64_sbsa_defconfig<br>
&gt; +++ b/configs/qemu_aarch64_sbsa_defconfig<br>
&gt; @@ -17,12 +17,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh board/qemu/aarch64-sbsa/a<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG) -c board/qe=
mu/aarch64-sbsa/genimage.cfg&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch6=
4_virt_defconfig<br>
&gt; index 03df0ad9e2..9115569ab9 100644<br>
&gt; --- a/configs/qemu_aarch64_virt_defconfig<br>
&gt; +++ b/configs/qemu_aarch64_virt_defconfig<br>
&gt; @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; + BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
=C2=A0 =C2=A0^<br>
A spurious space slipped in, which breaks the build.<br>
<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/aarch64-v=
irt/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
&gt; diff --git a/configs/qemu_arm_ebbr_defconfig b/configs/qemu_arm_ebbr_d=
efconfig<br>
&gt; index 8fbb3069bc..c530dd502c 100644<br>
&gt; --- a/configs/qemu_arm_ebbr_defconfig<br>
&gt; +++ b/configs/qemu_arm_ebbr_defconfig<br>
&gt; @@ -7,12 +7,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/post=
-image.sh board/qemu/arm-ebbr/post-<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG) -c board/qe=
mu/arm-ebbr/genimage.cfg&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.1.12&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;board/qemu/arm-eb=
br/linux.fragment&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_v=
ersatile_defconfig<br>
&gt; index 4f43273a82..50f0f62e39 100644<br>
&gt; --- a/configs/qemu_arm_versatile_defconfig<br>
&gt; +++ b/configs/qemu_arm_versatile_defconfig<br>
&gt; @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;versatile&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;board/qemu/arm-ve=
rsatile/linux.fragment&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
&gt; diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_ve=
xpress_defconfig<br>
&gt; index 2c813456f4..997e11be10 100644<br>
&gt; --- a/configs/qemu_arm_vexpress_defconfig<br>
&gt; +++ b/configs/qemu_arm_vexpress_defconfig<br>
&gt; @@ -20,12 +20,12 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFI=
G)&quot;<br>
&gt;=C2=A0 BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;64M&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;vexpress&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;vexpress-v2p-ca9&quot;<=
br>
&gt; diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm=
_vexpress_tz_defconfig<br>
&gt; index 576c441154..1ea602de0e 100644<br>
&gt; --- a/configs/qemu_arm_vexpress_tz_defconfig<br>
&gt; +++ b/configs/qemu_arm_vexpress_tz_defconfig<br>
&gt; @@ -17,12 +17,12 @@ BR2_TARGET_ROOTFS_CPIO_UIMAGE=3Dy<br>
&gt;=C2=A0 # BR2_TARGET_ROOTFS_TAR is not set<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;vexpress&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;board/qemu/arm-ve=
xpress-tz/linux.fragment&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_m68k_mcf5208_defconfig b/configs/qemu_m68k_m=
cf5208_defconfig<br>
&gt; index 0490b9e29e..7e3acaf41a 100644<br>
&gt; --- a/configs/qemu_m68k_mcf5208_defconfig<br>
&gt; +++ b/configs/qemu_m68k_mcf5208_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/m68k-mcf5=
208/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_m68k_q800_defconfig b/configs/qemu_m68k_q800=
_defconfig<br>
&gt; index 30d8982db3..00b08f9753 100644<br>
&gt; --- a/configs/qemu_m68k_q800_defconfig<br>
&gt; +++ b/configs/qemu_m68k_q800_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/m68k-q800=
/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_mi=
croblazebe_mmu_defconfig<br>
&gt; index 7bd2ae53b8..6701d9077d 100644<br>
&gt; --- a/configs/qemu_microblazebe_mmu_defconfig<br>
&gt; +++ b/configs/qemu_microblazebe_mmu_defconfig<br>
&gt; @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/microblaz=
ebe-mmu/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_LINUX_BIN=3Dy<br>
&gt; diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_mi=
croblazeel_mmu_defconfig<br>
&gt; index cd8c5a3cb2..674e88911e 100644<br>
&gt; --- a/configs/qemu_microblazeel_mmu_defconfig<br>
&gt; +++ b/configs/qemu_microblazeel_mmu_defconfig<br>
&gt; @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/microblaz=
eel-mmu/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_LINUX_BIN=3Dy<br>
&gt; diff --git a/configs/qemu_mips32r2_malta_defconfig b/configs/qemu_mips=
32r2_malta_defconfig<br>
&gt; index 49d84c308b..f24422102e 100644<br>
&gt; --- a/configs/qemu_mips32r2_malta_defconfig<br>
&gt; +++ b/configs/qemu_mips32r2_malta_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/mips32r2-=
malta/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_mips32r2el_malta_defconfig b/configs/qemu_mi=
ps32r2el_malta_defconfig<br>
&gt; index 5363018c47..26356dde3d 100644<br>
&gt; --- a/configs/qemu_mips32r2el_malta_defconfig<br>
&gt; +++ b/configs/qemu_mips32r2el_malta_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/mips32r2e=
l-malta/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_mips32r6_malta_defconfig b/configs/qemu_mips=
32r6_malta_defconfig<br>
&gt; index f77feb9b6d..82c37317a7 100644<br>
&gt; --- a/configs/qemu_mips32r6_malta_defconfig<br>
&gt; +++ b/configs/qemu_mips32r6_malta_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/mips32r6-=
malta/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_mips32r6el_malta_defconfig b/configs/qemu_mi=
ps32r6el_malta_defconfig<br>
&gt; index 575034441a..9f6a3f3a44 100644<br>
&gt; --- a/configs/qemu_mips32r6el_malta_defconfig<br>
&gt; +++ b/configs/qemu_mips32r6el_malta_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/mips32r6e=
l-malta/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_mips64_malta_defconfig b/configs/qemu_mips64=
_malta_defconfig<br>
&gt; index e9438fda1e..60eb2ecdc3 100644<br>
&gt; --- a/configs/qemu_mips64_malta_defconfig<br>
&gt; +++ b/configs/qemu_mips64_malta_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/mips64-ma=
lta/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_mips64el_malta_defconfig b/configs/qemu_mips=
64el_malta_defconfig<br>
&gt; index 4b1c8e22af..96b92dc264 100644<br>
&gt; --- a/configs/qemu_mips64el_malta_defconfig<br>
&gt; +++ b/configs/qemu_mips64el_malta_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/mips64el-=
malta/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_mips64r6_malta_defconfig b/configs/qemu_mips=
64r6_malta_defconfig<br>
&gt; index 87ef7902af..42676eae80 100644<br>
&gt; --- a/configs/qemu_mips64r6_malta_defconfig<br>
&gt; +++ b/configs/qemu_mips64r6_malta_defconfig<br>
&gt; @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/mips64r6-=
malta/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_mips64r6el_malta_defconfig b/configs/qemu_mi=
ps64r6el_malta_defconfig<br>
&gt; index 5774207f65..4ec537a0e9 100644<br>
&gt; --- a/configs/qemu_mips64r6el_malta_defconfig<br>
&gt; +++ b/configs/qemu_mips64r6el_malta_defconfig<br>
&gt; @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/mips64r6e=
l-malta/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_1=
0m50_defconfig<br>
&gt; index 4b9c53e8de..8a6059b738 100644<br>
&gt; --- a/configs/qemu_nios2_10m50_defconfig<br>
&gt; +++ b/configs/qemu_nios2_10m50_defconfig<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 BR2_nios2=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;10m50&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;board/qemu/nios2-=
10m50/linux.fragment&quot;<br>
&gt;=C2=A0 BR2_TARGET_ROOTFS_INITRAMFS=3Dy<br>
&gt; @@ -11,7 +11,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/post=
-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel needs mkimage<br>
&gt;=C2=A0 BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy<br>
&gt; diff --git a/configs/qemu_or1k_defconfig b/configs/qemu_or1k_defconfig=
<br>
&gt; index b3d9d79156..9cd6bf7372 100644<br>
&gt; --- a/configs/qemu_or1k_defconfig<br>
&gt; +++ b/configs/qemu_or1k_defconfig<br>
&gt; @@ -10,12 +10,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/or1k/linu=
x.config&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_ppc64_e5500_defconfig b/configs/qemu_ppc64_e=
5500_defconfig<br>
&gt; index 6ad03c4c87..bb5a5268a4 100644<br>
&gt; --- a/configs/qemu_ppc64_e5500_defconfig<br>
&gt; +++ b/configs/qemu_ppc64_e5500_defconfig<br>
&gt; @@ -12,12 +12,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as the kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.17.7&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;corenet64_smp&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;board/qemu/ppc64-=
e5500/linux.fragment&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
&gt; diff --git a/configs/qemu_ppc64_pseries_defconfig b/configs/qemu_ppc64=
_pseries_defconfig<br>
&gt; index 50844dc93b..5cddbd8242 100644<br>
&gt; --- a/configs/qemu_ppc64_pseries_defconfig<br>
&gt; +++ b/configs/qemu_ppc64_pseries_defconfig<br>
&gt; @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.17.7&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;pseries&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_ppc64le_powernv8_defconfig b/configs/qemu_pp=
c64le_powernv8_defconfig<br>
&gt; index f6a5c3d409..edb4fe2832 100644<br>
&gt; --- a/configs/qemu_ppc64le_powernv8_defconfig<br>
&gt; +++ b/configs/qemu_ppc64le_powernv8_defconfig<br>
&gt; @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.17.7&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;powernv&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_ppc64le_pseries_defconfig b/configs/qemu_ppc=
64le_pseries_defconfig<br>
&gt; index 7ce5a9d310..418e632331 100644<br>
&gt; --- a/configs/qemu_ppc64le_pseries_defconfig<br>
&gt; +++ b/configs/qemu_ppc64le_pseries_defconfig<br>
&gt; @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.17.7&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;pseries_le&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_ppc_bamboo_defconfig b/configs/qemu_ppc_bamb=
oo_defconfig<br>
&gt; index f4cc5589e7..75266dc24b 100644<br>
&gt; --- a/configs/qemu_ppc_bamboo_defconfig<br>
&gt; +++ b/configs/qemu_ppc_bamboo_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.17.7&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;44x/bamboo&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;board/qemu/ppc-ba=
mboo/linux.fragment&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_ppc_e500mc_defconfig b/configs/qemu_ppc_e500=
mc_defconfig<br>
&gt; index 0a1877c44b..c110627611 100644<br>
&gt; --- a/configs/qemu_ppc_e500mc_defconfig<br>
&gt; +++ b/configs/qemu_ppc_e500mc_defconfig<br>
&gt; @@ -11,12 +11,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as the kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.17.7&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;corenet32_smp&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;board/qemu/ppc-e5=
00mc/linux.fragment&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
&gt; diff --git a/configs/qemu_ppc_g3beige_defconfig b/configs/qemu_ppc_g3b=
eige_defconfig<br>
&gt; index 1c11bcf77d..a14a641b23 100644<br>
&gt; --- a/configs/qemu_ppc_g3beige_defconfig<br>
&gt; +++ b/configs/qemu_ppc_g3beige_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.17.7&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/ppc-g3bei=
ge/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_ppc_mac99_defconfig b/configs/qemu_ppc_mac99=
_defconfig<br>
&gt; index 2331041c2a..ec11cf8946 100644<br>
&gt; --- a/configs/qemu_ppc_mac99_defconfig<br>
&gt; +++ b/configs/qemu_ppc_mac99_defconfig<br>
&gt; @@ -6,12 +6,12 @@ BR2_powerpc_7400=3Dy<br>
&gt;=C2=A0 BR2_SYSTEM_DHCP=3D&quot;eth0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.17.7&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;pmac32&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES=3D&quot;board/qemu/ppc-ma=
c99/linux.fragment&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_m=
pc8544ds_defconfig<br>
&gt; index b9a0812d52..ebb09a4efa 100644<br>
&gt; --- a/configs/qemu_ppc_mpc8544ds_defconfig<br>
&gt; +++ b/configs/qemu_ppc_mpc8544ds_defconfig<br>
&gt; @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.17.7&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/ppc-mpc85=
44ds/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_VMLINUX=3Dy<br>
&gt; diff --git a/configs/qemu_riscv32_virt_defconfig b/configs/qemu_riscv3=
2_virt_defconfig<br>
&gt; index f354e303e5..b38c97652f 100644<br>
&gt; --- a/configs/qemu_riscv32_virt_defconfig<br>
&gt; +++ b/configs/qemu_riscv32_virt_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.43&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;rv32&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_IMAGE=3Dy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_riscv64_nommu_virt_defconfig b/configs/qemu_=
riscv64_nommu_virt_defconfig<br>
&gt; index ee70beb208..c9b7200883 100644<br>
&gt; --- a/configs/qemu_riscv64_nommu_virt_defconfig<br>
&gt; +++ b/configs/qemu_riscv64_nommu_virt_defconfig<br>
&gt; @@ -3,8 +3,8 @@ BR2_riscv=3Dy<br>
&gt;=C2=A0 BR2_RISCV_64=3Dy<br>
&gt;=C2=A0 # BR2_RISCV_USE_MMU is not set<br>
&gt;=C2=A0 <br>
&gt; -# Linux headers same as kernel, a 5.19 series<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_19=3Dy<br>
&gt; +# Linux headers same as kernel<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Busybox with hush<br>
&gt;=C2=A0 BR2_PACKAGE_BUSYBOX_CONFIG=3D&quot;package/busybox/busybox-minim=
al.config&quot;<br>
&gt; @@ -22,7 +22,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)=
&quot;<br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.19&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;nommu_virt&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_IMAGE=3Dy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_riscv64_virt_defconfig b/configs/qemu_riscv6=
4_virt_defconfig<br>
&gt; index b3174a152c..fd0ff16791 100644<br>
&gt; --- a/configs/qemu_riscv64_virt_defconfig<br>
&gt; +++ b/configs/qemu_riscv64_virt_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.43&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_IMAGE=3Dy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconf=
ig<br>
&gt; index 6bbcca0896..78184eca1f 100644<br>
&gt; --- a/configs/qemu_s390x_defconfig<br>
&gt; +++ b/configs/qemu_s390x_defconfig<br>
&gt; @@ -12,12 +12,12 @@ BR2_TARGET_ROOTFS_EXT2=3Dy<br>
&gt;=C2=A0 # BR2_TARGET_ROOTFS_TAR is not set<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.1.4&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_def=
config<br>
&gt; index 0f12b7dfe9..9267270ccd 100644<br>
&gt; --- a/configs/qemu_sh4_r2d_defconfig<br>
&gt; +++ b/configs/qemu_sh4_r2d_defconfig<br>
&gt; @@ -15,12 +15,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/sh4-r2d/l=
inux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_ZIMAGE=3Dy<br>
&gt; diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d=
_defconfig<br>
&gt; index d5ee371e79..e4d48e1f90 100644<br>
&gt; --- a/configs/qemu_sh4eb_r2d_defconfig<br>
&gt; +++ b/configs/qemu_sh4eb_r2d_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/sh4eb-r2d=
/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_ZIMAGE=3Dy<br>
&gt; diff --git a/configs/qemu_sparc64_sun4u_defconfig b/configs/qemu_sparc=
64_sun4u_defconfig<br>
&gt; index 485b497e71..c064a7b939 100644<br>
&gt; --- a/configs/qemu_sparc64_sun4u_defconfig<br>
&gt; +++ b/configs/qemu_sparc64_sun4u_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/sparc64-s=
un4u/linux.config&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss=
10_defconfig<br>
&gt; index 2ba04c0864..af26a2fb55 100644<br>
&gt; --- a/configs/qemu_sparc_ss10_defconfig<br>
&gt; +++ b/configs/qemu_sparc_ss10_defconfig<br>
&gt; @@ -14,12 +14,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/sparc-ss1=
0/linux.config&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_x86_64_defconfig b/configs/qemu_x86_64_defco=
nfig<br>
&gt; index cc505a8540..6562bc1f52 100644<br>
&gt; --- a/configs/qemu_x86_64_defconfig<br>
&gt; +++ b/configs/qemu_x86_64_defconfig<br>
&gt; @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/x86_64/li=
nux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=3Dy<br>
&gt; diff --git a/configs/qemu_x86_defconfig b/configs/qemu_x86_defconfig<b=
r>
&gt; index 34b7e2d292..7886cb4ccf 100644<br>
&gt; --- a/configs/qemu_x86_defconfig<br>
&gt; +++ b/configs/qemu_x86_defconfig<br>
&gt; @@ -17,12 +17,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/x86/linux=
.config&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_=
lx60_defconfig<br>
&gt; index cb78106091..ade45fa180 100644<br>
&gt; --- a/configs/qemu_xtensa_lx60_defconfig<br>
&gt; +++ b/configs/qemu_xtensa_lx60_defconfig<br>
&gt; @@ -16,12 +16,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/xtensa-lx=
60/linux.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy<br>
&gt; diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_x=
tensa_lx60_nommu_defconfig<br>
&gt; index 4be1b66edc..c6ba892486 100644<br>
&gt; --- a/configs/qemu_xtensa_lx60_nommu_defconfig<br>
&gt; +++ b/configs/qemu_xtensa_lx60_nommu_defconfig<br>
&gt; @@ -20,12 +20,12 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;board/qemu/po=
st-image.sh&quot;<br>
&gt;=C2=A0 BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;$(BR2_DEFCONFIG)&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Linux headers same as kernel<br>
&gt; -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy<br>
&gt; +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_2=3Dy<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Kernel<br>
&gt;=C2=A0 BR2_LINUX_KERNEL=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy<br>
&gt; -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;5.15.18&quot;<br>
&gt; +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D&quot;6.2.9&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=3Dy<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE=3D&quot;board/qemu/xtensa-lx=
60/linux-nommu.config&quot;<br>
&gt;=C2=A0 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=3Dy<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">
    <img src=3D"http://ftp.smile.fr/client/Communication/signature/img/eco.=
png" alt=3D"eco" width=3D"13" height=3D"11">
            Pour la plan=C3=A8te, n&#39;imprimez ce mail que si c&#39;est n=
=C3=A9cessaire
    <table style=3D"padding:20px" border=3D"0"><tbody><tr><td style=3D"font=
-size:13px;color:rgb(255,128,84);text-align:center;padding-right:30px"><a h=
ref=3D"http://www.smile.eu/" target=3D"_blank">
                    <img style=3D"max-width: 100%; height: auto;" src=3D"ht=
tp://ftp.smile.fr/client/Communication/signature/img/Logo-new.png" alt=3D"S=
MILE">
                </a><br><br>
                    <p style=3D"line-height:15px">10-12 Rue Nicolas Appert<=
br>
44100 NANTES</p>
            </td>
            <td style=3D"border-left:1px solid rgb(59,127,254);padding-left=
:20px;font-size:13px;color:rgb(255,128,84)">
                <div style=3D"color:rgb(255,128,84);font-size:14px">
                    <b>Sebastian WEYER</b>
                </div>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    Stagiaire production<br>
                   =20
                </div><br>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    <span style=3D"white-space:nowrap"><img style=3D"margin=
-right: 5px;" src=3D"http://ftp.smile.fr/client/Communication/signature/img=
/mail.png" alt=3D"email" width=3D"12" height=3D"10">
                        <a href=3D"mailto:sebastian.weyer@smile.fr" style=
=3D"color:rgb(59,127,254);font-size:13px;text-decoration:none" target=3D"_b=
lank">sebastian.weyer@smile.fr</a>
                    </span>
                     <br>
                                                    <span style=3D"white-sp=
ace:nowrap"><img style=3D"margin-right: 5px;" src=3D"http://ftp.smile.fr/cl=
ient/Communication/signature/img/web.png" alt=3D"url" width=3D"12" height=
=3D"12">
<a href=3D"http://www.smile.eu" style=3D"color:rgb(59,127,254);font-size:13=
px;text-decoration:none" target=3D"_blank">http://www.smile.eu</a> =20
                  </span>
                                </div>

                <br>
                <div>
                    <span><a style=3D"margin-right:5px" href=3D"https://twi=
tter.com/GroupeSmile" target=3D"_blank"><img src=3D"http://ftp.smile.fr/cli=
ent/Communication/signature/img/rs-twitter.png" alt=3D"Twitter" style=3D"ma=
x-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.linkedin.com/company/smile" target=3D"_blank"><img src=3D"http://ftp.smile=
.fr/client/Communication/signature/img/rs-linkedin.png" alt=3D"LinkedIn" st=
yle=3D"max-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://git=
hub.com/Smile-SA" target=3D"_blank"><img src=3D"http://ftp.smile.fr/client/=
Communication/signature/img/rs-github.png" alt=3D"Github" style=3D"max-widt=
h: 100%; height: auto;"></a></span>
                </div>
            </td>
        </tr>
        </tbody>
    </table></div></div></div>

--0000000000006440c405f8846c4e--


--===============0457688744520177539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0457688744520177539==--


