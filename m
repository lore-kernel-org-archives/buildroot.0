Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D819C352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 09:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 073664181C;
	Wed,  7 Dec 2022 09:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 073664181C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FhT5ysk7XX8; Wed,  7 Dec 2022 09:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A4FE4183F;
	Wed,  7 Dec 2022 09:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A4FE4183F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF6431BF327
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 09:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C826840609
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 09:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C826840609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnzX9Eodq3OG for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 09:33:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FCDD400CE
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FCDD400CE
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 09:33:30 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id kw15so9116517ejc.10
 for <buildroot@buildroot.org>; Wed, 07 Dec 2022 01:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:to:subject:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tXab4QcwWfFsprzQKNRVfG1PPbPbHH8F5agMuhTV1+c=;
 b=2lX5qsJnTbi628/7vdm3p2ltEvsQiN2NrJTw5uDrcYHTLcJdmmzCHbXlBhLJgm4WKe
 0quUux8fc6kPazIvImpC6CwfMJJtDxZ67FPxs3RneQO4GoNNshUSVqgaVAjjX7+xBN/s
 KHTiVI1BhhGkEon/l+BzehNEEZwA4a7L4+pyvIWn/kXVPoe2X0rQ8VeGQbsJZ/oIqiuO
 pCe5qpmE36vINabaGlI072vmOehB4Yfw07rXiJBKFWBXLtkXdEp1heYtuBE3IMAyIZwK
 gQbkQa23EjbGaiaGsUl8lNIAKMb8LzjmkgNJU4fp+jDV4EeF2wX1Qnqbaou7gkD+sS5m
 mYvg==
X-Gm-Message-State: ANoB5pkkAdpJkOMWNupe/F9hn74CjsfFWyJsh4PJsHQLCD6OQ3F7B2n1
 GI0YLZYyIEUC6m1iyNYvJfEgVSOqHms/vmSS+Nw=
X-Google-Smtp-Source: AA0mqf4bbuc2JUS58ev9HriCO8q1+f2mMm8rHml3mEgZkVFIU2OpsBarIVhsBWGMWmyjwwmc6SQ2uw==
X-Received: by 2002:a17:906:158f:b0:78d:45e9:97be with SMTP id
 k15-20020a170906158f00b0078d45e997bemr73244309ejd.565.1670405608263; 
 Wed, 07 Dec 2022 01:33:28 -0800 (PST)
Received: from [10.0.0.222] (5.186.52.63.static.fibianet.dk. [5.186.52.63])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b00734bfab4d59sm8418565ejh.170.2022.12.07.01.33.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 01:33:27 -0800 (PST)
Date: Wed, 07 Dec 2022 10:33:21 +0100
From: Stephan Henningsen <stephan@asklandd.dk>
To: buildroot@buildroot.org
Message-Id: <L7LIMR.275SNWR6N2GZ1@asklandd.dk>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-I4ofAx9gGg5L/waHGJBO"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asklandd-dk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:to:subject:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tXab4QcwWfFsprzQKNRVfG1PPbPbHH8F5agMuhTV1+c=;
 b=QvQd5UudHFVT8eOGCniG6yCetw68skRuJiVlS+oAOt89ucbMdcICpq+m4sMR3MzbAx
 hurVd8bvpcb4CpJUaP9c6BJIyBbCIWU23ZSVtVTwHE/h7ysxLuDh8udN4PQMdcKAV6vT
 3wG17sNFPKZ3Z+quyWVvxlAqpQKSBuR1/tISqrZgeqK2Db+77yH3LzExpXKg1tQ26H9M
 oFtAlSLGINqtZ4FN/qelssJ+Bf2IGbka7LAC+q3Sh2r4RM/xrOJVJ39gJxGXwQbGEsmE
 SlBMqPeO1gOzNoMGWCyTgjoZ2hnzEpgtJwedMu1sOQXXA8+4EsM9ICWpFLym5yvIkStg
 AlcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=asklandd-dk.20210112.gappssmtp.com
 header.i=@asklandd-dk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QvQd5Uud
Subject: [Buildroot] patch: linux-firmware-20221109
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--=-I4ofAx9gGg5L/waHGJBO
Content-Type: multipart/alternative; boundary="=-1/ySikdIlA4J+0cDfFvp"

--=-1/ySikdIlA4J+0cDfFvp
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi there,

I've made a patch for the linux-firmware package which features:
- bump to latest release tag: 20221109
- update hashes, remove some obsolete file hashes.
- add config option and build tags that adds firmware for a new set of 
wifi devices.


-- 
hhjj,
Stephan

linux-firmware.hash:  add hash of bumped tarball, remove hash of 
deleted files
linux-firmware.mk:    add new config option for Intel Wi-Fi 6 and 6E 
devices
Config.in:  add config option for installing firmware for Intel Wi-Fi 6 
and 6E devices

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk> 
<mailto:stephan+buildroot@asklandd.dk>

diff -purN linux-firmware.orig/Config.in linux-firmware/Config.in
--- linux-firmware.orig/Config.in    2022-12-05 23:53:38.980005580 +0100
+++ linux-firmware/Config.in    2022-12-05 22:37:34.706706894 +0100
@@ -268,6 +268,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIF
       Firmware files for the Intel Wifi 9xxx devices supported by
       the iwlwifi kernel driver.

+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E
+    bool "Intel iwlwifi Wi-Fi 6/6E
+    help
+      Firmware files for the Intel Wi-Fi 6 and Wi-Fi 6E devices
+          supported by the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
     bool "Libertas SD 8686 v8"
     help
diff -purN linux-firmware.orig/linux-firmware.hash 
linux-firmware/linux-firmware.hash
--- linux-firmware.orig/linux-firmware.hash    2022-12-05 
23:53:38.980005580 +0100
+++ linux-firmware/linux-firmware.hash    2022-12-01 00:17:16.257440762 
+0100
@@ -1,5 +1,5 @@
 # From 
<https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc>
-sha256  
e9d174af729511c8cccb60ec4e0b223b3c44b67d813b42d1ab9813acfa667fa5  
linux-firmware-20221012.tar.xz
+sha256  
c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190701  
linux-firmware-20221109.tar.xz

 # Hash for license files
 sha256  
8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  
LICENCE.Abilis
@@ -14,11 +14,9 @@ sha256  a5777f9e80aca0603b0648454de99616
 sha256  
ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  
LICENCE.cypress
 sha256  
60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  
LICENCE.fw_sst_0f28
 sha256  
5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  
LICENCE.ibt_firmware
-sha256  
8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c15c  
LICENSE.ice_enhanced
 sha256  
0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  
LICENCE.it913x
 sha256  
16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5  
LICENCE.iwlwifi_firmware
 sha256  
0fc67bd715b3395f3f2af464781910e9e69c4ba23da304352229b42dc9e986c3  
LICENCE.microchip
-sha256  
59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4  
LICENCE.moxa
 sha256  
2051d5bf0755a0668f8c3d9a0d1c41d4b8cc411aba70f720fda71ae9e3b4d25c  
LICENCE.qat_firmware
 sha256  
4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822  
LICENCE.qla2xxx
 sha256  
d7bec70668ddd4aae8fb4aa32870e54b49fcdb0b9b007aa9f54b53a1ac7461bd  
LICENCE.ralink-firmware.txt
@@ -35,6 +33,7 @@ sha256  8542aeabf2761935122d693561e16766
 sha256  
be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  
LICENSE.qcom
 sha256  
fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  
LICENSE.radeon
 sha256  
2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  
LICENSE.sdma_firmware
-sha256  
6857749e23d6a2853e5d33f6d6012a60d5baa2b4d51b5f8c6799d00d68733841  WHENCE
+sha256  
75afdb5d45a21ff95ff7aa82d67bc42a83830f2def98ea937c01d6e7603d76f9  WHENCE
 sha256  
fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  
qcom/NOTICE.txt
 sha256  
bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  
LICENCE.e100
+
diff -purN linux-firmware.orig/linux-firmware.mk 
linux-firmware/linux-firmware.mk
--- linux-firmware.orig/linux-firmware.mk    2022-12-05 
23:53:38.980005580 +0100
+++ linux-firmware/linux-firmware.mk    2022-12-06 00:20:25.012916380 
+0100
@@ -4,7 +4,7 @@
 #
 
################################################################################

-LINUX_FIRMWARE_VERSION = 20221012
+LINUX_FIRMWARE_VERSION = 20221109
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -514,6 +514,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-9???-*.u
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif

+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)
+LINUX_FIRMWARE_FILES += iwlwifi-so-a0-gf-a0*.{ucode,pnvm}
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
 LINUX_FIRMWARE_FILES += tigon/*
 # No license file; the license is in the file WHENCE



--=-1/ySikdIlA4J+0cDfFvp
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Hi there,</div><div><div><br></div=
><div>I've made a patch for the linux-firmware package which features:</div=
><div>- bump to latest release tag: 20221109</div><div>- update hashes, rem=
ove some obsolete file hashes.</div><div>- add config option and build tags=
 that adds firmware for a new set of wifi devices.</div><div><br><br></div>=
<div>--&nbsp;<br>hhjj,</div><div>Stephan</div><p><br></p><p>linux-firmware.=
hash:&nbsp; add hash of bumped tarball, remove hash of deleted files<br>lin=
ux-firmware.mk:&nbsp;&nbsp;&nbsp; add new config option for Intel Wi-Fi 6 a=
nd 6E devices<br>Config.in:&nbsp; add config option for installing firmware=
 for Intel Wi-Fi 6 and 6E devices<br><br>Signed-off-by: Stephan Henningsen&=
nbsp;<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:stephan+buildroot@as=
klandd.dk">&lt;stephan+buildroot@asklandd.dk&gt;</a><br><br>diff -purN linu=
x-firmware.orig/Config.in linux-firmware/Config.in<br>--- linux-firmware.or=
ig/Config.in&nbsp;&nbsp;&nbsp; 2022-12-05 23:53:38.980005580 +0100<br>+++ l=
inux-firmware/Config.in&nbsp;&nbsp;&nbsp; 2022-12-05 22:37:34.706706894 +01=
00<br>@@ -268,6 +268,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIF<br>&nbs=
p;&nbsp;&nbsp;&nbsp; &nbsp; Firmware files for the Intel Wifi 9xxx devices =
supported by<br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; the iwlwifi kernel driver.<=
br>&nbsp;<br>+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E<br>+&nbsp;&nbsp;=
&nbsp; bool "Intel iwlwifi Wi-Fi 6/6E<br>+&nbsp;&nbsp;&nbsp; help<br>+&nbsp=
;&nbsp;&nbsp; &nbsp; Firmware files for the Intel Wi-Fi 6 and Wi-Fi 6E devi=
ces<br>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; supported by=
 the iwlwifi kernel driver.<br>+<br>&nbsp;config BR2_PACKAGE_LINUX_FIRMWARE=
_LIBERTAS_SD8686_V8<br>&nbsp;&nbsp;&nbsp;&nbsp; bool "Libertas SD 8686 v8"<=
br>&nbsp;&nbsp;&nbsp;&nbsp; help<br>diff -purN linux-firmware.orig/linux-fi=
rmware.hash linux-firmware/linux-firmware.hash<br>--- linux-firmware.orig/l=
inux-firmware.hash&nbsp;&nbsp;&nbsp; 2022-12-05 23:53:38.980005580 +0100<br=
>+++ linux-firmware/linux-firmware.hash&nbsp;&nbsp;&nbsp; 2022-12-01 00:17:=
16.257440762 +0100<br>@@ -1,5 +1,5 @@<br>&nbsp;# From&nbsp;<a class=3D"moz-=
txt-link-freetext" href=3D"https://mirrors.edge.kernel.org/pub/linux/kernel=
/firmware/sha256sums.asc">https://mirrors.edge.kernel.org/pub/linux/kernel/=
firmware/sha256sums.asc</a><br>-sha256&nbsp; e9d174af729511c8cccb60ec4e0b22=
3b3c44b67d813b42d1ab9813acfa667fa5&nbsp; linux-firmware-20221012.tar.xz<br>=
+sha256&nbsp; c0ddffbbcf30f2e015bddd5c6d3ce1f13976b906aceabda4a57e3c41a3190=
701&nbsp; linux-firmware-20221109.tar.xz<br>&nbsp;<br>&nbsp;# Hash for lice=
nse files<br>&nbsp;sha256&nbsp; 8116433f4004fc0c24d72b3d9e497808b724aa0e5e1=
cd63fc1bf66b715b1e2e9&nbsp; LICENCE.Abilis<br>@@ -14,11 +14,9 @@ sha256&nbs=
p; a5777f9e80aca0603b0648454de99616<br>&nbsp;sha256&nbsp; ae0db6cc4db339411=
48df0f67de53e76a77b1b5a46b3165edb7040aa2750015f&nbsp; LICENCE.cypress<br>&n=
bsp;sha256&nbsp; 60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0=
e2ae83&nbsp; LICENCE.fw_sst_0f28<br>&nbsp;sha256&nbsp; 5181b0b51efc79d5acb2=
c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4&nbsp; LICENCE.ibt_firmware<br>=
-sha256&nbsp; 8c45a83562a69f7ac4207e4cb5c0063af2e545791b3947bc81dc82305481c=
15c&nbsp; LICENSE.ice_enhanced<br>&nbsp;sha256&nbsp; 0e0c11073ba3c832097da3=
8e0905da36b8a3526f219407977b13b71c6675be7d&nbsp; LICENCE.it913x<br>&nbsp;sh=
a256&nbsp; 16d5040c7cf851fc693b7542e20870935b99802533ea1bfd231c377a2305e5c5=
&nbsp; LICENCE.iwlwifi_firmware<br>&nbsp;sha256&nbsp; 0fc67bd715b3395f3f2af=
464781910e9e69c4ba23da304352229b42dc9e986c3&nbsp; LICENCE.microchip<br>-sha=
256&nbsp; 59ae206c89108905ebdc9ad4c9336526bd2c0d50fbf988c21e8c2a82719d42a4&=
nbsp; LICENCE.moxa<br>&nbsp;sha256&nbsp; 2051d5bf0755a0668f8c3d9a0d1c41d4b8=
cc411aba70f720fda71ae9e3b4d25c&nbsp; LICENCE.qat_firmware<br>&nbsp;sha256&n=
bsp; 4071a11d878dbc0ac6d9e71203d03b151638f9d7a8bc47a54c3cb964100d5822&nbsp;=
 LICENCE.qla2xxx<br>&nbsp;sha256&nbsp; d7bec70668ddd4aae8fb4aa32870e54b49fc=
db0b9b007aa9f54b53a1ac7461bd&nbsp; LICENCE.ralink-firmware.txt<br>@@ -35,6 =
+33,7 @@ sha256&nbsp; 8542aeabf2761935122d693561e16766<br>&nbsp;sha256&nbsp=
; be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc&nbsp; LI=
CENSE.qcom<br>&nbsp;sha256&nbsp; fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01=
cb08d602906add686d8c6f&nbsp; LICENSE.radeon<br>&nbsp;sha256&nbsp; 2bdd2e716=
f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9&nbsp; LICENSE.sdma_=
firmware<br>-sha256&nbsp; 6857749e23d6a2853e5d33f6d6012a60d5baa2b4d51b5f8c6=
799d00d68733841&nbsp; WHENCE<br>+sha256&nbsp; 75afdb5d45a21ff95ff7aa82d67bc=
42a83830f2def98ea937c01d6e7603d76f9&nbsp; WHENCE<br>&nbsp;sha256&nbsp; fa43=
e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a&nbsp; qcom/NOT=
ICE.txt<br>&nbsp;sha256&nbsp; bef9c828e84f21e7835b4de7daf954a327e1ff777871b=
58e116039b684c0d604&nbsp; LICENCE.e100<br>+<br>diff -purN linux-firmware.or=
ig/linux-firmware.mk linux-firmware/linux-firmware.mk<br>--- linux-firmware=
.orig/linux-firmware.mk&nbsp;&nbsp;&nbsp; 2022-12-05 23:53:38.980005580 +01=
00<br>+++ linux-firmware/linux-firmware.mk&nbsp;&nbsp;&nbsp; 2022-12-06 00:=
20:25.012916380 +0100<br>@@ -4,7 +4,7 @@<br>&nbsp;#<br>&nbsp;##############=
##################################################################<br>&nbsp=
;<br>-LINUX_FIRMWARE_VERSION =3D 20221012<br>+LINUX_FIRMWARE_VERSION =3D 20=
221109<br>&nbsp;LINUX_FIRMWARE_SOURCE =3D linux-firmware-$(LINUX_FIRMWARE_V=
ERSION).tar.xz<br>&nbsp;LINUX_FIRMWARE_SITE =3D $(BR2_KERNEL_MIRROR)/linux/=
kernel/firmware<br>&nbsp;LINUX_FIRMWARE_INSTALL_IMAGES =3D YES<br>@@ -514,6=
 +514,11 @@ LINUX_FIRMWARE_FILES +=3D iwlwifi-9???-*.u<br>&nbsp;LINUX_FIRMW=
ARE_ALL_LICENSE_FILES +=3D LICENCE.iwlwifi_firmware<br>&nbsp;endif<br>&nbsp=
;<br>+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_6E),y)<br>+LINUX_FIRMWARE_=
FILES +=3D iwlwifi-so-a0-gf-a0*.{ucode,pnvm}<br>+LINUX_FIRMWARE_ALL_LICENSE=
_FILES +=3D LICENCE.iwlwifi_firmware<br>+endif<br>+<br>&nbsp;ifeq ($(BR2_PA=
CKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)<br>&nbsp;LINUX_FIRMWARE_FILES +=3D=
 tigon/*<br>&nbsp;# No license file; the license is in the file WHENCE</p><=
/div></div>
--=-1/ySikdIlA4J+0cDfFvp--

--=-I4ofAx9gGg5L/waHGJBO
Content-Type: text/x-patch
Content-Disposition: attachment; filename=linux-firmware-20221109.patch
Content-Transfer-Encoding: base64

bGludXgtZmlybXdhcmUuaGFzaDogIGFkZCBoYXNoIG9mIGJ1bXBlZCB0YXJiYWxsLCByZW1vdmUg
aGFzaCBvZiBkZWxldGVkIGZpbGVzCmxpbnV4LWZpcm13YXJlLm1rOiAgICBhZGQgbmV3IGNvbmZp
ZyBvcHRpb24gZm9yIEludGVsIFdpLUZpIDYgYW5kIDZFIGRldmljZXMKQ29uZmlnLmluOiAgYWRk
IGNvbmZpZyBvcHRpb24gZm9yIGluc3RhbGxpbmcgZmlybXdhcmUgZm9yIEludGVsIFdpLUZpIDYg
YW5kIDZFIGRldmljZXMKClNpZ25lZC1vZmYtYnk6IFN0ZXBoYW4gSGVubmluZ3NlbiA8c3RlcGhh
bitidWlsZHJvb3RAYXNrbGFuZGQuZGs+CgpkaWZmIC1wdXJOIGxpbnV4LWZpcm13YXJlLm9yaWcv
Q29uZmlnLmluIGxpbnV4LWZpcm13YXJlL0NvbmZpZy5pbgotLS0gbGludXgtZmlybXdhcmUub3Jp
Zy9Db25maWcuaW4JMjAyMi0xMi0wNSAyMzo1MzozOC45ODAwMDU1ODAgKzAxMDAKKysrIGxpbnV4
LWZpcm13YXJlL0NvbmZpZy5pbgkyMDIyLTEyLTA1IDIyOjM3OjM0LjcwNjcwNjg5NCArMDEwMApA
QCAtMjY4LDYgKzI2OCwxMiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkVfSVdM
V0lGCiAJICBGaXJtd2FyZSBmaWxlcyBmb3IgdGhlIEludGVsIFdpZmkgOXh4eCBkZXZpY2VzIHN1
cHBvcnRlZCBieQogCSAgdGhlIGl3bHdpZmkga2VybmVsIGRyaXZlci4KIAorY29uZmlnIEJSMl9Q
QUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0lXTFdJRklfNkUKKwlib29sICJJbnRlbCBpd2x3aWZpIFdp
LUZpIDYvNkUKKwloZWxwCisJICBGaXJtd2FyZSBmaWxlcyBmb3IgdGhlIEludGVsIFdpLUZpIDYg
YW5kIFdpLUZpIDZFIGRldmljZXMKKyAgICAgICAgICBzdXBwb3J0ZWQgYnkgdGhlIGl3bHdpZmkg
a2VybmVsIGRyaXZlci4KKwogY29uZmlnIEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0xJQkVS
VEFTX1NEODY4Nl9WOAogCWJvb2wgIkxpYmVydGFzIFNEIDg2ODYgdjgiCiAJaGVscApkaWZmIC1w
dXJOIGxpbnV4LWZpcm13YXJlLm9yaWcvbGludXgtZmlybXdhcmUuaGFzaCBsaW51eC1maXJtd2Fy
ZS9saW51eC1maXJtd2FyZS5oYXNoCi0tLSBsaW51eC1maXJtd2FyZS5vcmlnL2xpbnV4LWZpcm13
YXJlLmhhc2gJMjAyMi0xMi0wNSAyMzo1MzozOC45ODAwMDU1ODAgKzAxMDAKKysrIGxpbnV4LWZp
cm13YXJlL2xpbnV4LWZpcm13YXJlLmhhc2gJMjAyMi0xMi0wMSAwMDoxNzoxNi4yNTc0NDA3NjIg
KzAxMDAKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0cHM6Ly9taXJyb3JzLmVkZ2Uua2VybmVs
Lm9yZy9wdWIvbGludXgva2VybmVsL2Zpcm13YXJlL3NoYTI1NnN1bXMuYXNjCi1zaGEyNTYgIGU5
ZDE3NGFmNzI5NTExYzhjY2NiNjBlYzRlMGIyMjNiM2M0NGI2N2Q4MTNiNDJkMWFiOTgxM2FjZmE2
NjdmYTUgIGxpbnV4LWZpcm13YXJlLTIwMjIxMDEyLnRhci54egorc2hhMjU2ICBjMGRkZmZiYmNm
MzBmMmUwMTViZGRkNWM2ZDNjZTFmMTM5NzZiOTA2YWNlYWJkYTRhNTdlM2M0MWEzMTkwNzAxICBs
aW51eC1maXJtd2FyZS0yMDIyMTEwOS50YXIueHoKIAogIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVz
CiBzaGEyNTYgIDgxMTY0MzNmNDAwNGZjMGMyNGQ3MmIzZDllNDk3ODA4YjcyNGFhMGU1ZTFjZDYz
ZmMxYmY2NmI3MTViMWUyZTkgIExJQ0VOQ0UuQWJpbGlzCkBAIC0xNCwxMSArMTQsOSBAQCBzaGEy
NTYgIGE1Nzc3ZjllODBhY2EwNjAzYjA2NDg0NTRkZTk5NjE2CiBzaGEyNTYgIGFlMGRiNmNjNGRi
MzM5NDExNDhkZjBmNjdkZTUzZTc2YTc3YjFiNWE0NmIzMTY1ZWRiNzA0MGFhMjc1MDAxNWYgIExJ
Q0VOQ0UuY3lwcmVzcwogc2hhMjU2ICA2MGZiYzljY2NiNDU1ZTFhMzMwNmM5N2RiOTQyZDZmMjRm
YTkzNjY0YmU2MWQ1NGM0OTc2MzdlNmQwZTJhZTgzICBMSUNFTkNFLmZ3X3NzdF8wZjI4CiBzaGEy
NTYgIDUxODFiMGI1MWVmYzc5ZDVhY2IyYzliYjkyMDQyODc4ZmRiYWQ5N2E5MjExNGQ0YWI1ZTMy
ZTJiNWI1MmZjZTQgIExJQ0VOQ0UuaWJ0X2Zpcm13YXJlCi1zaGEyNTYgIDhjNDVhODM1NjJhNjlm
N2FjNDIwN2U0Y2I1YzAwNjNhZjJlNTQ1NzkxYjM5NDdiYzgxZGM4MjMwNTQ4MWMxNWMgIExJQ0VO
U0UuaWNlX2VuaGFuY2VkCiBzaGEyNTYgIDBlMGMxMTA3M2JhM2M4MzIwOTdkYTM4ZTA5MDVkYTM2
YjhhMzUyNmYyMTk0MDc5NzdiMTNiNzFjNjY3NWJlN2QgIExJQ0VOQ0UuaXQ5MTN4CiBzaGEyNTYg
IDE2ZDUwNDBjN2NmODUxZmM2OTNiNzU0MmUyMDg3MDkzNWI5OTgwMjUzM2VhMWJmZDIzMWMzNzdh
MjMwNWU1YzUgIExJQ0VOQ0UuaXdsd2lmaV9maXJtd2FyZQogc2hhMjU2ICAwZmM2N2JkNzE1YjMz
OTVmM2YyYWY0NjQ3ODE5MTBlOWU2OWM0YmEyM2RhMzA0MzUyMjI5YjQyZGM5ZTk4NmMzICBMSUNF
TkNFLm1pY3JvY2hpcAotc2hhMjU2ICA1OWFlMjA2Yzg5MTA4OTA1ZWJkYzlhZDRjOTMzNjUyNmJk
MmMwZDUwZmJmOTg4YzIxZThjMmE4MjcxOWQ0MmE0ICBMSUNFTkNFLm1veGEKIHNoYTI1NiAgMjA1
MWQ1YmYwNzU1YTA2NjhmOGMzZDlhMGQxYzQxZDRiOGNjNDExYWJhNzBmNzIwZmRhNzFhZTllM2I0
ZDI1YyAgTElDRU5DRS5xYXRfZmlybXdhcmUKIHNoYTI1NiAgNDA3MWExMWQ4NzhkYmMwYWM2ZDll
NzEyMDNkMDNiMTUxNjM4ZjlkN2E4YmM0N2E1NGMzY2I5NjQxMDBkNTgyMiAgTElDRU5DRS5xbGEy
eHh4CiBzaGEyNTYgIGQ3YmVjNzA2NjhkZGQ0YWFlOGZiNGFhMzI4NzBlNTRiNDlmY2RiMGI5YjAw
N2FhOWY1NGI1M2ExYWM3NDYxYmQgIExJQ0VOQ0UucmFsaW5rLWZpcm13YXJlLnR4dApAQCAtMzUs
NiArMzMsNyBAQCBzaGEyNTYgIDg1NDJhZWFiZjI3NjE5MzUxMjJkNjkzNTYxZTE2NzY2CiBzaGEy
NTYgIGJlOTA0Y2QyOGNiMjkyYjgwY2RiNmNmNDEyYWIwZDkxNTlkNDMxNjcxZTk4N2FkNDMzYzFm
NjJlMDk4OGE5YmMgIExJQ0VOU0UucWNvbQogc2hhMjU2ICBmYzYyMjNkNGJmZTlmMmY5ZTJlZGRj
NDRiOWZlNTcyMWQwY2FmNDlmMDFjYjA4ZDYwMjkwNmFkZDY4NmQ4YzZmICBMSUNFTlNFLnJhZGVv
bgogc2hhMjU2ICAyYmRkMmU3MTZmMDVkOTczN2QzZjlhMjBmOWEzYTNjMGNhZWUwZTg2NjEwMGRk
YjA2NzNmMTE3OGU0MmY5MmI5ICBMSUNFTlNFLnNkbWFfZmlybXdhcmUKLXNoYTI1NiAgNjg1Nzc0
OWUyM2Q2YTI4NTNlNWQzM2Y2ZDYwMTJhNjBkNWJhYTJiNGQ1MWI1ZjhjNjc5OWQwMGQ2ODczMzg0
MSAgV0hFTkNFCitzaGEyNTYgIDc1YWZkYjVkNDVhMjFmZjk1ZmY3YWE4MmQ2N2JjNDJhODM4MzBm
MmRlZjk4ZWE5MzdjMDFkNmU3NjAzZDc2ZjkgIFdIRU5DRQogc2hhMjU2ICBmYTQzZTFiOWExM2Iz
NDFhMDdhZGNhOWRiZTczZDBmOTA3MmQ3OTY2ZmRmZTgxMWMwMWYwZGQyODcyZDczMDlhICBxY29t
L05PVElDRS50eHQKIHNoYTI1NiAgYmVmOWM4MjhlODRmMjFlNzgzNWI0ZGU3ZGFmOTU0YTMyN2Ux
ZmY3Nzc4NzFiNThlMTE2MDM5YjY4NGMwZDYwNCAgTElDRU5DRS5lMTAwCisKZGlmZiAtcHVyTiBs
aW51eC1maXJtd2FyZS5vcmlnL2xpbnV4LWZpcm13YXJlLm1rIGxpbnV4LWZpcm13YXJlL2xpbnV4
LWZpcm13YXJlLm1rCi0tLSBsaW51eC1maXJtd2FyZS5vcmlnL2xpbnV4LWZpcm13YXJlLm1rCTIw
MjItMTItMDUgMjM6NTM6MzguOTgwMDA1NTgwICswMTAwCisrKyBsaW51eC1maXJtd2FyZS9saW51
eC1maXJtd2FyZS5tawkyMDIyLTEyLTA2IDAwOjIwOjI1LjAxMjkxNjM4MCArMDEwMApAQCAtNCw3
ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJTlVYX0ZJUk1XQVJFX1ZF
UlNJT04gPSAyMDIyMTAxMgorTElOVVhfRklSTVdBUkVfVkVSU0lPTiA9IDIwMjIxMTA5CiBMSU5V
WF9GSVJNV0FSRV9TT1VSQ0UgPSBsaW51eC1maXJtd2FyZS0kKExJTlVYX0ZJUk1XQVJFX1ZFUlNJ
T04pLnRhci54egogTElOVVhfRklSTVdBUkVfU0lURSA9ICQoQlIyX0tFUk5FTF9NSVJST1IpL2xp
bnV4L2tlcm5lbC9maXJtd2FyZQogTElOVVhfRklSTVdBUkVfSU5TVEFMTF9JTUFHRVMgPSBZRVMK
QEAgLTUxNCw2ICs1MTQsMTEgQEAgTElOVVhfRklSTVdBUkVfRklMRVMgKz0gaXdsd2lmaS05Pz8/
LSoudQogTElOVVhfRklSTVdBUkVfQUxMX0xJQ0VOU0VfRklMRVMgKz0gTElDRU5DRS5pd2x3aWZp
X2Zpcm13YXJlCiBlbmRpZgogCitpZmVxICgkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFX0lX
TFdJRklfNkUpLHkpCitMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSBpd2x3aWZpLXNvLWEwLWdmLWEw
Ki57dWNvZGUscG52bX0KK0xJTlVYX0ZJUk1XQVJFX0FMTF9MSUNFTlNFX0ZJTEVTICs9IExJQ0VO
Q0UuaXdsd2lmaV9maXJtd2FyZQorZW5kaWYKKwogaWZlcSAoJChCUjJfUEFDS0FHRV9MSU5VWF9G
SVJNV0FSRV9CUk9BRENPTV9USUdPTjMpLHkpCiBMSU5VWF9GSVJNV0FSRV9GSUxFUyArPSB0aWdv
bi8qCiAjIE5vIGxpY2Vuc2UgZmlsZTsgdGhlIGxpY2Vuc2UgaXMgaW4gdGhlIGZpbGUgV0hFTkNF
Cg==

--=-I4ofAx9gGg5L/waHGJBO
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--=-I4ofAx9gGg5L/waHGJBO--

