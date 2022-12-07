Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3767C4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 12:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D44840B42;
	Wed,  7 Dec 2022 12:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D44840B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id myZV2oSMCgin; Wed,  7 Dec 2022 12:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D451405F5;
	Wed,  7 Dec 2022 12:56:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D451405F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D6361BF4DB
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 12:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65F9781E64
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 12:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65F9781E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2xCnV1WDIao for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 12:56:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CDEC81E61
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CDEC81E61
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 12:56:19 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3cbdd6c00adso184888897b3.11
 for <buildroot@buildroot.org>; Wed, 07 Dec 2022 04:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/fx1cBN0FwqnCa2Zd5XQBalglIRbdKR+yVmCxozoqG4=;
 b=s2fzUZr/uPGKyr97BwdcwwNml02xw4o+04os9rT//PpQmjg8zWjtuSWq9jgkVZCTtB
 xgJ4JD/KQRG0gwXnIw3G9FI2GvxNfwEqjdK9ogx+6v8ch4NRVcSpguuBZSb1IpQs5sKE
 1aSXGSo6rPwzNPCwx1l4pDA/f6pOPIgizmSQhnQ3MzAI/njiDJ6we7GYomcp+ZIM293g
 LZfqPQniH5bErnf1BpzxDDJDaPyx7YR6Ll23+Q1Uo6NT4t7B/bkItou22OFe/Ssu9puo
 +HGhkzAzdAmJk78+zWtFVPe4aPU1RdrDNC77sG10pYlRbw5/bnbNRoh4X1PFW/ZWbdek
 2Q7w==
X-Gm-Message-State: ANoB5pnKndMk1Z02NBGn2IDWs/UnczusrQcq5SEW0PLFu1aIuQVFXpKi
 vMJcOF6pN5PPc+pVJZSlraC77QZl602tUGK731w=
X-Google-Smtp-Source: AA0mqf5GwJagxfxIklXwQf/RgXTR/FhyCAEaNuD6Fp1CubARubqbNMUQvfMryYJ5zdzqx1y1hV5YZn6ceLCujrQRvbc=
X-Received: by 2002:a0d:e2c1:0:b0:35b:c180:d44c with SMTP id
 l184-20020a0de2c1000000b0035bc180d44cmr19963552ywe.153.1670417777897; Wed, 07
 Dec 2022 04:56:17 -0800 (PST)
MIME-Version: 1.0
References: <L7LIMR.275SNWR6N2GZ1@asklandd.dk>
 <238d6047-b2c9-244a-2301-7faa93f3057d@gmail.com>
In-Reply-To: <238d6047-b2c9-244a-2301-7faa93f3057d@gmail.com>
Date: Wed, 7 Dec 2022 13:56:06 +0100
Message-ID: <CAGm1_kvZRbdiG_cN0q+j2uotkH1JiQ7G0_8jh5DOMRGFzWE-Bw@mail.gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/fx1cBN0FwqnCa2Zd5XQBalglIRbdKR+yVmCxozoqG4=;
 b=qaZ7gK+Ur1LEwM6LYFxBYEaacteS/DctlEBwtzLbiQfCk6nP0zhCPwZisG7VOQ011R
 mCIWlzxthVBRLf6db9PBPi75vt0YG6B1BjzIT96Wfxc9cALQvsVgn6CssL7b2+vBtUDN
 n3F+npMP3EGyi8kuvHiAknIuyUM66Jfr38G6Xt+miMqedTYzZEXZ1/hhELhIcYAfrmNG
 9GqNtl31cFPYFN9HffoFZM9/ANBQKEftItn0gqo2VOP8r711w7sr+Ultubqnnvc8ma9o
 ex7ve8BJ09D8D7VqDOP+xa1JBhXexcaIjZ5U3IfShtyr65eaPp/LSYyx7v8aahjG2m4f
 pL7Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qaZ7gK+U
Subject: Re: [Buildroot] patch: linux-firmware-20221109
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Stephan Henningsen <stephan@asklandd.dk>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Stephan, all,

I would split this patch in two:

On Wed, Dec 7, 2022 at 1:33 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On 12/7/22 16:33, Stephan Henningsen wrote:
> > Hi there,
> >
> > I've made a patch for the linux-firmware package which features:
> > - bump to latest release tag: 20221109
> > - update hashes, remove some obsolete file hashes.
> > - add config option and build tags that adds firmware for a new set of wifi devices.
> >
> >
> > --
> > hhjj,
> > Stephan
> >
> >
> > linux-firmware.hash:  add hash of bumped tarball, remove hash of deleted files
> > linux-firmware.mk:    add new config option for Intel Wi-Fi 6 and 6E devices
> > Config.in:  add config option for installing firmware for Intel Wi-Fi 6 and 6E devices
> >
> > Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
> >
> > diff -purN linux-firmware.orig/Config.in linux-firmware/Config.in
> > --- linux-firmware.orig/Config.in    2022-12-05 23:53:38.980005580 +0100
> > +++ linux-firmware/Config.in    2022-12-05 22:37:34.706706894 +0100
> > @@ -268,6 +268,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIF
> >        Firmware files for the Intel Wifi 9xxx devices supported by
> >        the iwlwifi kernel driver.
> >
> > +config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E
> > +    bool "Intel iwlwifi Wi-Fi 6/6E
> > +    help
> > +      Firmware files for the Intel Wi-Fi 6 and Wi-Fi 6E devices
> > +          supported by the iwlwifi kernel driver.
> > +
> >  config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
> >      bool "Libertas SD 8686 v8"
> >      help
> > diff -purN linux-firmware.orig/linux-firmware.hash linux-firmware/linux-firmware.hash
> > --- linux-firmware.orig/linux-firmware.hash    2022-12-05 23:53:38.980005580 +0100
> > +++ linux-firmware/linux-firmware.hash    2022-12-01 00:17:16.257440762 +0100
> > @@ -1,5 +1,5 @@
> >  # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
> > -sha256  e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5  linux-firmware-20221012.tar.xz
> > +sha256  c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701  linux-firmware-20221109.tar.xz

one commit for version bump


> >  # Hash for license files
> >  sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
> > @@ -14,11 +14,9 @@ sha256  a5777f9e80aca0603b0648454de99616
> >  sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
> >  sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENCE.fw_sst_0f28
> >  sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
> > -sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  LICENSE.ice_enhanced
> >  sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
> >  sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  LICENCE.iwlwifi_firmware
> >  sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  LICENCE.microchip
> > -sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  LICENCE.moxa
> >  sha256  2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4d25c  LICENCE.qat_firmware
> >  sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  LICENCE.qla2xxx
> >  sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  LICENCE.ralink-firmware.txt
> > @@ -35,6 +33,7 @@ sha256  8542aeabf2761935122d693561e16766
> >  sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
> >  sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
> >  sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
> > -sha256  6857749e23d6a2853e5d33f6d6012a60d5baa2b4d51b5f8c6799d00d68733841  WHENCE
> > +sha256  75afdb5d45a21ff95ff7aa82d67bc42a83830f2def98ea937c01d6e7603d76f9  WHENCE
> >  sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
> >  sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
> > +
> > diff -purN linux-firmware.orig/linux-firmware.mk linux-firmware/linux-firmware.mk
> > --- linux-firmware.orig/linux-firmware.mk    2022-12-05 23:53:38.980005580 +0100
> > +++ linux-firmware/linux-firmware.mk    2022-12-06 00:20:25.012916380 +0100
> > @@ -4,7 +4,7 @@
> >  #
> >  ################################################################################
> >
> > -LINUX_FIRMWARE_VERSION = 20221012
> > +LINUX_FIRMWARE_VERSION = 20221109
> >  LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
> >  LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
> >  LINUX_FIRMWARE_INSTALL_IMAGES = YES
> > @@ -514,6 +514,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-9???-*.u
> >  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
> > +LINUX_FIRMWARE_FILES += iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
> > +LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
> >  LINUX_FIRMWARE_FILES += tigon/*
> >  # No license file; the license is in the file WHENCE

Another for adding IWLWIFI_6E.

Regards,
Yegor

> >
>
> Hi,
>
> If you'd like to send patches here, please use git-send-email(1).
> Do not send it as attachment, let alone HTML email. Also, if you
> instead send them through mail client, configure it so that tabs
> and spaces are preserved (tabs don't get expanded to spaces) and
> long lines are not wrapped.
>
> Thanks.
>
>
> --
> An old man doll... just what I always wanted! - Clara
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
