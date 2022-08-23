Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099B5C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 17:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 961D960F69;
	Tue, 23 Aug 2022 17:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 961D960F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6Dm4ep6sajY; Tue, 23 Aug 2022 17:30:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3EF260F5E;
	Tue, 23 Aug 2022 17:30:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3EF260F5E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A5D21BF417
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 17:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72FB24091E
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 17:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72FB24091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m7eCQ7QV_CEQ for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 17:30:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DA87400C5
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DA87400C5
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 17:30:18 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id r69so12871490pgr.2
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 10:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=lhGT+K3HmqXvmbiKvPX9P5PZDbRWorLZI4blozzM/l0=;
 b=z13P2hmpaoxq5QEXD3s41Ff5mX8g9IYklO/2PxPR/i2MpnWj/qqaHdKE/i/sSYqBwb
 39TymPhsagmw64jf2icxJhs1lHnIq49P/MBFcXUw+69ZQQyve3atNLEfCqkDfiTqbL9C
 AQLduVHQoXBJMbeT6cH8n9xOmpnSA6w6NvFc3IWCY7azo/DwNLwmwRXX5n7Caj24jslG
 ROghLEJSjnqVMBp7i/7EzKDnMK+gKtVqLt9GExpa99buxa/UI8xf+gdhD8xhUxepdSeK
 seugfG8X6w5VfitlHkdlB8g5gSAgROIVK2LFrW4hzRy7uhVrCF7c29c5Qog2iVh3RyY3
 Zcvg==
X-Gm-Message-State: ACgBeo07JC/+ZkkIalJaF+ShuLFQeUWXy+YDbIRuIazVJ7Bcc5fOFv1X
 CTpuTLQrUA08x8A1ql3tNbt+DCGMVevzYfRF3Sg=
X-Google-Smtp-Source: AA6agR6Nh/LHYHMUEKrf0/V3Xe6WOMdV3h0q1air/twVGugRjp/7Vlp4OOoA+LDalZA6kTp7mHEiqQGWc8HhxOSSeJg=
X-Received: by 2002:a63:224d:0:b0:42a:81ff:68ca with SMTP id
 t13-20020a63224d000000b0042a81ff68camr12295014pgm.290.1661275817747; Tue, 23
 Aug 2022 10:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220807210317.9415-1-heiko.thiery@gmail.com>
 <20220808104133.6479c0a5@windsurf>
 <CAEyMn7Y+2=+2ruq-4+kvHqX2YXVNoGYLskYrYpjKfAxPfY2XOw@mail.gmail.com>
 <20220809100602.2fb39e1c@windsurf> <20220815121412.3be64939@windsurf>
In-Reply-To: <20220815121412.3be64939@windsurf>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 23 Aug 2022 19:30:04 +0200
Message-ID: <CAEyMn7ZyX6L2V3zTBdbzZ7ECokUS5pWoqUVKKAq4no5Ay4Fa-w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=lhGT+K3HmqXvmbiKvPX9P5PZDbRWorLZI4blozzM/l0=;
 b=M0cNl5MRxRtFtjmETyTzPcGPBSbznXR2hozznjL7c9WKrz9EVQZZr8/OlabSOciNCp
 2SUuUdWqnE9IEMQ5qmU4CgwAjCRRNrAgJ/irE4C44IhRYYETuag9qBglrACd3+znaG55
 IFvKD/wRADENTI/NmERuuFtZBdFWXNk0hhMHHpUyiuqvMypZOeO7qPglpb9EVNryf2Ca
 Dj3KQC6MtcH7KFHH/bXj0g9UMagG5qXSJqIArbdigo4G949TBjzbA8g/17XIqMc6MLTm
 ikbXNymm2e5OFzmy37EbgILH3JgxVCswm5D+qXb9AeT0oYTW/CP/AONwx+sx0C2uRrol
 9yAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=M0cNl5MR
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: fix
 build failure with u-boot 2022.04
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
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Mo., 15. Aug. 2022 um 12:14 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Heiko,
>
> On Tue, 9 Aug 2022 10:06:02 +0200
> Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:
>
> > But this is not normal, because:
> >
> > UBOOT_MAKE_OPTS += \
> >         CROSS_COMPILE="$(TARGET_CROSS)" \
> >         ARCH=$(UBOOT_ARCH) \
> >         HOSTCC="$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem /,$(HOST_CFLAGS)))" \
> >         HOSTLDFLAGS="$(HOST_LDFLAGS)" \
> >         $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS))
> >
> > see we're passing HOSTLDFLAGS here? It contains -L$(HOST_DIR)/lib. So
> > it means there is also something wrong in U-Boot in that it doesn't use
> > $(HOSTLDFLAGS).
>
> Could you try this change in U-Boot:
>
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 69983a19a44..7624304e3e9 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -89,7 +89,7 @@ hostcxx_flags  = -Wp,-MD,$(depfile) $(__hostcxx_flags)
>  # Create executable from a single .c file
>  # host-csingle -> Executable
>  quiet_cmd_host-csingle         = HOSTCC  $@
> -      cmd_host-csingle = $(HOSTCC) $(hostc_flags) -o $@ $< \
> +      cmd_host-csingle = $(HOSTCC) $(hostc_flags) $(KBUILD_HOSTLDFLAGS) -o $@ $< \
>                 $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(@F))
>  $(host-csingle): $(obj)/%: $(src)/%.c FORCE
>         $(call if_changed_dep,host-csingle)
>
> (without your pkg-config patch, of course).
>
> Indeed, scripts/Makefile.host is a copy of the kernel's
> scripts/Makefile.host, and the kernel copy does use KBUILD_HOSTLDFLAGS
> when building host tools that are based on a single source file, but
> for some reason the U-Boot copy does not have it, which doesn't make
> much sense.

Indeed ... I just added this change to my local copy of u-boot rebuild
it without the previous patch and it works.

>
> I think it doesn't mean your pkg-config patch is bogus: it still makes
> sense to use pkg-config when possible, but I also think not passing
> KBUILD_HOSTLDFLAGS is incorrect.
>
> Of course, if it works, I think both patches should be submitted to
> U-Boot upstream.

I will prepare an U-Boot patch and send it to the mailing list. I saw
that you cahnged the patch in patchwork to "changes requested". Would
you accept it with the "new" patch?

> Could you have a look?

without the change:
--- 8< ---
  /usr/bin/gcc -O2 -isystem
/home/hthiery/sources/mainline/buildroot/output/host/include
-Wp,-MD,tools/.mkeficapsule.d -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer   -std=gnu11    -DCONFIG_FIT_SIGNATURE
-DCONFIG_FIT_SIGNATURE_MAX_SIZE=0xffffffff -DCONFIG_FIT_CIPHER
-include ./include/compiler.h -idirafterinclude
-idirafter./arch/arm/include -I./scripts/dtc/libfdt -I./tools
-DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE  -o
tools/mkeficapsule tools/mkeficapsule.c   -lgnutls -luuid
--- 8< ---

with the change you suggested:
--- 8< ---
  /usr/bin/gcc -O2 -isystem
/home/hthiery/sources/mainline/buildroot/output/host/include
-Wp,-MD,tools/.mkeficapsule.d -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer   -std=gnu11    -DCONFIG_FIT_SIGNATURE
-DCONFIG_FIT_SIGNATURE_MAX_SIZE=0xffffffff -DCONFIG_FIT_CIPHER
-include ./include/compiler.h -idirafterinclude
-idirafter./arch/arm/include -I./scripts/dtc/libfdt -I./tools
-DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE
-L/home/hthiery/sources/mainline/buildroot/output/host/lib
-Wl,-rpath,/home/hthiery/sources/mainline/buildroot/output/host/lib -o
tools/mkeficapsule tools/mkeficapsule.c   -lgnutls -luuid
--- 8< ---

> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

-- 
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
