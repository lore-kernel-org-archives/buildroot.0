Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA44C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 06:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 097DD607D1;
	Sat, 10 Dec 2022 06:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 097DD607D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XOBrBmKpp-9Y; Sat, 10 Dec 2022 06:16:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2DCD60A6F;
	Sat, 10 Dec 2022 06:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2DCD60A6F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0CF1BF5A5
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 06:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5483416DC
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 06:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5483416DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zcs4g9sLNUQc for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 06:15:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48CD3416B5
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48CD3416B5
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 06:15:59 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id q1so4910679pgl.11
 for <buildroot@buildroot.org>; Fri, 09 Dec 2022 22:15:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q03xMlILBs+UL2X+1zncOcHkUYXyIafqIFSRqlt0iUw=;
 b=DY1emQx1TfYEUc3VDglvBLiAXnF4FtarbSvPubqtTQ+9LTf9gadykxBxYuGS4fr05x
 iHh0CepXk+o2rbGHRiqjNUxUhH51lW/94iH2YSOvCeyA65slaNmE0IGMNzg9ofqP4x3i
 HVwP1XuxxGviAGKb/wqNRyJH/aaETLW2PxyNAFukv+ZAnaqZKIR5+Kct4bL91PGvYFGK
 0o5m2Fi85l8K3ExSG/qbzDrRhjyvokVl+ad6q3gKiddiWYxqEOdr4ANq5B6LbcX21YUQ
 rKkVPT/uoKTUVP/WYV4RA0AQCc4VF/VpQqeIc1QERf8ZsI1NvLKJbkBc6EN4NBB2J28I
 9UOw==
X-Gm-Message-State: ANoB5plcEjAdzRx9dI2Oxus/4kurW30hshUHUFNcU5ts3UYv4y4h5OEW
 QyOpRgvkyLyizDWDlMvUfJ3hrwLV5PzR7Qx84y67lA==
X-Google-Smtp-Source: AA0mqf5ChsU/HkQqcc+DX/dF1XJfchzA15MtUELMqixdVVpA5VISQtyIBAbB0RMNwXi86s7JIWqA7H4Knw336pn4DKQ=
X-Received: by 2002:a63:2f02:0:b0:479:2109:43e with SMTP id
 v2-20020a632f02000000b004792109043emr196256pgv.495.1670652958505; Fri, 09 Dec
 2022 22:15:58 -0800 (PST)
MIME-Version: 1.0
References: <L7LIMR.275SNWR6N2GZ1@asklandd.dk>
 <238d6047-b2c9-244a-2301-7faa93f3057d@gmail.com>
 <CAGm1_kvZRbdiG_cN0q+j2uotkH1JiQ7G0_8jh5DOMRGFzWE-Bw@mail.gmail.com>
In-Reply-To: <CAGm1_kvZRbdiG_cN0q+j2uotkH1JiQ7G0_8jh5DOMRGFzWE-Bw@mail.gmail.com>
From: Stephan Henningsen <stephan@asklandd.dk>
Date: Sat, 10 Dec 2022 07:15:47 +0100
Message-ID: <CAH0Z9QL7Dq9x=pZMYimTs8vwA1_cgozfVX=G7FASKJWzTech1w@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asklandd-dk.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q03xMlILBs+UL2X+1zncOcHkUYXyIafqIFSRqlt0iUw=;
 b=2TVg3ChK+Qaq8DCW3f9N6Yu6oB2ZLYQb5hfObpD4uQrd/9Y/5JJb8uZV+D5GGkjoAf
 UKwKEc4d6iJB0oC4QJrR5mD5EiRxQrOUu1N4tPzqk62esIO8m0Hzt0CjZLEyONRy9PPD
 7+/dJdmlPNtAPhDtN3FjrdrV75VoGDM4M1axOBt6Gh8uDxOGIiuHUoSCs3C7E5e2smyL
 ReCuDQtdXTyNlsjEmfFDj8KoPaLPs6q0XITV7XzRVqnqj9GW0QO/t0es8DJdCjRf+S3B
 qLQwBafTHSGRdH00gcDvOnyavu+uL1kJS7kedVegFLr2lSmOhCDSYyiT4Oku5KzqLMFe
 DBLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=asklandd-dk.20210112.gappssmtp.com
 header.i=@asklandd-dk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=2TVg3ChK
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5139000254803235988=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5139000254803235988==
Content-Type: multipart/alternative; boundary="000000000000228f0705ef733478"

--000000000000228f0705ef733478
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for your reply!

Good suggestion.  I've split the patch in two and sent them separately as
they're technically unrelated.

I've tried but I can't figure out how to use git send-email,
but I did send the e-mail as plain text this time, so I hope it works.

On ons, dec 7 2022 at 13:56:06 +01:00:00, Yegor Yefremov <
yegorslists@googlemail.com> wrote:

Hi Stephan, all, I would split this patch in two: On Wed, Dec 7, 2022 at
1:33 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:

On 12/7/22 16:33, Stephan Henningsen wrote: > Hi there, > > I've made a
patch for the linux-firmware package which features: > - bump to latest
release tag: 20221109 > - update hashes, remove some obsolete file hashes.
> - add config option and build tags that adds firmware for a new set of
wifi devices. > > > -- > hhjj, > Stephan > > > linux-firmware.hash: add
hash of bumped tarball, remove hash of deleted files > linux-firmware.mk:
add new config option for Intel Wi-Fi 6 and 6E devices > Config.in: add
config option for installing firmware for Intel Wi-Fi 6 and 6E devices > >
Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk> > > diff
-purN linux-firmware.orig/Config.in linux-firmware/Config.in > ---
linux-firmware.orig/Config.in 2022-12-05 23:53:38.980005580 +0100 > +++
linux-firmware/Config.in 2022-12-05 22:37:34.706706894 +0100 > @@ -268,6
+268,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIF > Firmware files for
the Intel Wifi 9xxx devices supported by > the iwlwifi kernel driver. > >
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E > + bool "Intel iwlwifi Wi-Fi
6/6E > + help > + Firmware files for the Intel Wi-Fi 6 and Wi-Fi 6E devices
> + supported by the iwlwifi kernel driver. > + > config
BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8 > bool "Libertas SD 8686 v8"
> help > diff -purN linux-firmware.orig/linux-firmware.hash
linux-firmware/linux-firmware.hash > ---
linux-firmware.orig/linux-firmware.hash 2022-12-05 23:53:38.980005580 +0100
> +++ linux-firmware/linux-firmware.hash 2022-12-01 00:17:16.257440762
+0100 > @@ -1,5 +1,5 @@ > # From
https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc >
-sha256 e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5
linux-firmware-20221012.tar.xz > +sha256
c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701
linux-firmware-20221109.tar.xz

one commit for version bump

> # Hash for license files > sha256
8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9
LICENCE.Abilis > @@ -14,11 +14,9 @@ sha256 a5777f9e80aca0603b0648454de99616
> sha256 ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f
LICENCE.cypress > sha256
60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83
LICENCE.fw_sst_0f28 > sha256
5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4
LICENCE.ibt_firmware > -sha256
8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c
LICENSE.ice_enhanced > sha256
0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d
LICENCE.it913x > sha256
16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5
LICENCE.iwlwifi_firmware > sha256
0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3
LICENCE.microchip > -sha256
59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4
LICENCE.moxa > sha256
2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4d25c
LICENCE.qat_firmware > sha256
4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822
LICENCE.qla2xxx > sha256
d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd
LICENCE.ralink-firmware.txt > @@ -35,6 +33,7 @@ sha256
8542aeabf2761935122d693561e16766 > sha256
be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc
LICENSE.qcom > sha256
fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f
LICENSE.radeon > sha256
2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9
LICENSE.sdma_firmware > -sha256
6857749e23d6a2853e5d33f6d6012a60d5baa2b4d51b5f8c6799d00d68733841 WHENCE >
+sha256 75afdb5d45a21ff95ff7aa82d67bc42a83830f2def98ea937c01d6e7603d76f9
WHENCE > sha256
fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a
qcom/NOTICE.txt > sha256
bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604
LICENCE.e100 > + > diff -purN linux-firmware.orig/linux-firmware.mk
linux-firmware/linux-firmware.mk > --- linux-firmware.orig/linux-firmware.mk
2022-12-05 23:53:38.980005580 +0100 > +++ linux-firmware/linux-firmware.mk
2022-12-06 00:20:25.012916380 +0100 > @@ -4,7 +4,7 @@ > # >
################################################################################
> > -LINUX_FIRMWARE_VERSION = 20221012 > +LINUX_FIRMWARE_VERSION = 20221109
> LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz >
LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware >
LINUX_FIRMWARE_INSTALL_IMAGES = YES > @@ -514,6 +514,11 @@
LINUX_FIRMWARE_FILES += iwlwifi-9???-*.u > LINUX_FIRMWARE_ALL_LICENSE_FILES
+= LICENCE.iwlwifi_firmware > endif > > +ifeq
($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y) > +LINUX_FIRMWARE_FILES +=
iwlwifi-so-a0-gf-a0*.{ucode,pnvm} > +LINUX_FIRMWARE_ALL_LICENSE_FILES +=
LICENCE.iwlwifi_firmware > +endif > + > ifeq
($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y) > LINUX_FIRMWARE_FILES +=
tigon/* > # No license file; the license is in the file WHENCE

Another for adding IWLWIFI_6E. Regards, Yegor

> Hi, If you'd like to send patches here, please use git-send-email(1). Do
not send it as attachment, let alone HTML email. Also, if you instead send
them through mail client, configure it so that tabs and spaces are
preserved (tabs don't get expanded to spaces) and long lines are not
wrapped. Thanks. -- An old man doll... just what I always wanted! - Clara
_______________________________________________ buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--000000000000228f0705ef733478
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div id=3D"m_-1157697392325707109geary-body" dir=3D"auto"=
><div>Hi,</div><div><br></div><div>Thanks for your reply!</div><div><br></d=
iv><div>Good suggestion.=C2=A0 I&#39;ve split the patch in two and sent the=
m separately as they&#39;re technically unrelated.</div><div><br></div><div=
>I&#39;ve tried but I can&#39;t figure out how to use git send-email,</div>=
<div>but I did send the e-mail as plain text this time, so I hope it works.=
</div></div><div id=3D"m_-1157697392325707109geary-signature" dir=3D"auto">=
</div><div id=3D"m_-1157697392325707109geary-quote" dir=3D"auto"><br>On ons=
, dec 7 2022 at 13:56:06 +01:00:00, Yegor Yefremov &lt;<a href=3D"mailto:ye=
gorslists@googlemail.com" target=3D"_blank" rel=3D"noreferrer">yegorslists@=
googlemail.com</a>&gt; wrote:<br><blockquote type=3D"cite"><div style=3D"wh=
ite-space:break-spaces">Hi Stephan, all,

I would split this patch in two:

On Wed, Dec 7, 2022 at 1:33 PM Bagas Sanjaya &lt;<a href=3D"mailto:bagasdot=
me@gmail.com" target=3D"_blank" rel=3D"noreferrer">bagasdotme@gmail.com</a>=
&gt; wrote:
<blockquote>
 On 12/7/22 16:33, Stephan Henningsen wrote:
 &gt; Hi there,
 &gt;
 &gt; I&#39;ve made a patch for the linux-firmware package which features:
 &gt; - bump to latest release tag: 20221109
 &gt; - update hashes, remove some obsolete file hashes.
 &gt; - add config option and build tags that adds firmware for a new set o=
f wifi devices.
 &gt;
 &gt;
 &gt; --
 &gt; hhjj,
 &gt; Stephan
 &gt;
 &gt;
 &gt; linux-firmware.hash:  add hash of bumped tarball, remove hash of dele=
ted files
 &gt; <a href=3D"http://linux-firmware.mk" target=3D"_blank" rel=3D"norefer=
rer">linux-firmware.mk</a>:    add new config option for Intel Wi-Fi 6 and =
6E devices
 &gt; Config.in:  add config option for installing firmware for Intel Wi-Fi=
 6 and 6E devices
 &gt;
 &gt; Signed-off-by: Stephan Henningsen &lt;<a href=3D"mailto:stephan+build=
root@asklandd.dk" target=3D"_blank" rel=3D"noreferrer">stephan+buildroot@as=
klandd.dk</a>&gt;
 &gt;
 &gt; diff -purN linux-firmware.orig/Config.in linux-firmware/Config.in
 &gt; --- linux-firmware.orig/Config.in    2022-12-05 23:53:38.980005580 +0=
100
 &gt; +++ linux-firmware/Config.in    2022-12-05 22:37:34.706706894 +0100
 &gt; @@ -268,6 +268,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIF
 &gt;        Firmware files for the Intel Wifi 9xxx devices supported by
 &gt;        the iwlwifi kernel driver.
 &gt;
 &gt; +config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E
 &gt; +    bool &quot;Intel iwlwifi Wi-Fi 6/6E
 &gt; +    help
 &gt; +      Firmware files for the Intel Wi-Fi 6 and Wi-Fi 6E devices
 &gt; +          supported by the iwlwifi kernel driver.
 &gt; +
 &gt;  config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
 &gt;      bool &quot;Libertas SD 8686 v8&quot;
 &gt;      help
 &gt; diff -purN linux-firmware.orig/linux-firmware.hash linux-firmware/lin=
ux-firmware.hash
 &gt; --- linux-firmware.orig/linux-firmware.hash    2022-12-05 23:53:38.98=
0005580 +0100
 &gt; +++ linux-firmware/linux-firmware.hash    2022-12-01 00:17:16.2574407=
62 +0100
 &gt; @@ -1,5 +1,5 @@
 &gt;  # From <a href=3D"https://mirrors.edge.kernel.org/pub/linux/kernel/f=
irmware/sha256sums.asc" target=3D"_blank" rel=3D"noreferrer">https://mirror=
s.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc</a>
 &gt; -sha256  e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa66=
7fa5  linux-firmware-20221012.tar.xz
 &gt; +sha256  c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a319=
0701  linux-firmware-20221109.tar.xz
</blockquote>
one commit for version bump


<blockquote> &gt;  # Hash for license files
 &gt;  sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1=
e2e9  LICENCE.Abilis
 &gt; @@ -14,11 +14,9 @@ sha256  a5777f9e80aca0603b0648454de99616
 &gt;  sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750=
015f  LICENCE.cypress
 &gt;  sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2=
ae83  LICENCE.fw_sst_0f28
 &gt;  sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52=
fce4  LICENCE.ibt_firmware
 &gt; -sha256  8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481=
c15c  LICENSE.ice_enhanced
 &gt;  sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675=
be7d  LICENCE.it913x
 &gt;  sha256  16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305=
e5c5  LICENCE.iwlwifi_firmware
 &gt;  sha256  0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e9=
86c3  LICENCE.microchip
 &gt; -sha256  59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d=
42a4  LICENCE.moxa
 &gt;  sha256  2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4=
d25c  LICENCE.qat_firmware
 &gt;  sha256  4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d=
5822  LICENCE.qla2xxx
 &gt;  sha256  d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac74=
61bd  LICENCE.ralink-firmware.txt
 &gt; @@ -35,6 +33,7 @@ sha256  8542aeabf2761935122d693561e16766
 &gt;  sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988=
a9bc  LICENSE.qcom
 &gt;  sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d=
8c6f  LICENSE.radeon
 &gt;  sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f=
92b9  LICENSE.sdma_firmware
 &gt; -sha256  6857749e23d6a2853e5d33f6d6012a60d5baa2b4d51b5f8c6799d00d6873=
3841  WHENCE
 &gt; +sha256  75afdb5d45a21ff95ff7aa82d67bc42a83830f2def98ea937c01d6e7603d=
76f9  WHENCE
 &gt;  sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7=
309a  qcom/NOTICE.txt
 &gt;  sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0=
d604  LICENCE.e100
 &gt; +
 &gt; diff -purN linux-firmware.orig/<a href=3D"http://linux-firmware.mk" t=
arget=3D"_blank" rel=3D"noreferrer">linux-firmware.mk</a> linux-firmware/<a=
 href=3D"http://linux-firmware.mk" target=3D"_blank" rel=3D"noreferrer">lin=
ux-firmware.mk</a>
 &gt; --- linux-firmware.orig/<a href=3D"http://linux-firmware.mk" target=
=3D"_blank" rel=3D"noreferrer">linux-firmware.mk</a>    2022-12-05 23:53:38=
.980005580 +0100
 &gt; +++ linux-firmware/<a href=3D"http://linux-firmware.mk" target=3D"_bl=
ank" rel=3D"noreferrer">linux-firmware.mk</a>    2022-12-06 00:20:25.012916=
380 +0100
 &gt; @@ -4,7 +4,7 @@
 &gt;  #
 &gt;  ####################################################################=
############
 &gt;
 &gt; -LINUX_FIRMWARE_VERSION =3D 20221012
 &gt; +LINUX_FIRMWARE_VERSION =3D 20221109
 &gt;  LINUX_FIRMWARE_SOURCE =3D linux-firmware-$(LINUX_FIRMWARE_VERSION).t=
ar.xz
 &gt;  LINUX_FIRMWARE_SITE =3D $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 &gt;  LINUX_FIRMWARE_INSTALL_IMAGES =3D YES
 &gt; @@ -514,6 +514,11 @@ LINUX_FIRMWARE_FILES +=3D iwlwifi-9???-*.u
 &gt;  LINUX_FIRMWARE_ALL_LICENSE_FILES +=3D LICENCE.iwlwifi_firmware
 &gt;  endif
 &gt;
 &gt; +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
 &gt; +LINUX_FIRMWARE_FILES +=3D iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
 &gt; +LINUX_FIRMWARE_ALL_LICENSE_FILES +=3D LICENCE.iwlwifi_firmware
 &gt; +endif
 &gt; +
 &gt;  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
 &gt;  LINUX_FIRMWARE_FILES +=3D tigon/*
 &gt;  # No license file; the license is in the file WHENCE
</blockquote>
Another for adding IWLWIFI_6E.

Regards,
Yegor

<blockquote> &gt;

 Hi,

 If you&#39;d like to send patches here, please use git-send-email(1).
 Do not send it as attachment, let alone HTML email. Also, if you
 instead send them through mail client, configure it so that tabs
 and spaces are preserved (tabs don&#39;t get expanded to spaces) and
 long lines are not wrapped.

 Thanks.


 --
 An old man doll... just what I always wanted! - Clara

 _______________________________________________
 buildroot mailing list
 <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"norefe=
rrer">buildroot@buildroot.org</a>
 <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" target=
=3D"_blank" rel=3D"noreferrer">https://lists.buildroot.org/mailman/listinfo=
/buildroot</a>
</blockquote></div></blockquote></div></div>

--000000000000228f0705ef733478--

--===============5139000254803235988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5139000254803235988==--
