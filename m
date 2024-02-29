Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87921C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 05:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1895C40578;
	Thu, 29 Feb 2024 05:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QjGAU0DJcstg; Thu, 29 Feb 2024 05:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6365C40529
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6365C40529;
	Thu, 29 Feb 2024 05:14:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 276771BF420
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 05:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14CAB60856
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 05:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s09VUHtGp2Se for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 05:14:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=nisargjhaveri@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BDF1F60841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDF1F60841
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDF1F60841
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 05:14:14 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a444205f764so26017966b.2
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709183652; x=1709788452;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gqaJHq1NkkVV1rugC213PW0UeNdwMzPYb3dezzRjV6c=;
 b=BNzTv5n7Jf8H1s0L9+/b7l6ZNZxf6vJ/CxarQ5N/1JClvXvfGtmEXcRbh91zBHdTOp
 h4C3nUfrA9VJ48J70UToQspgJfkD2dMq18V09MT/0yeW702QLgjLOGjdsMJ3c/wDJ7LV
 Tc4ugb3jP+osTmIkRdeL3DWpXZQurTOLGfUai2YeSm+nf20OfjCr4ABRkw7mFnJ4O0DB
 PpBHtCA4W5AuH7NFC2Ea8/ULldU739hd45AoA7LG9sDoK0846u6WBH9UoUFl0QGEkYTc
 sXzYVJwfDpEhIVzTl9ItUJY9ckij5V585kB3OWm2uZcUw8Rmb0AZkf2qB/EmH9a+PJur
 bsKg==
X-Gm-Message-State: AOJu0YxznWOoWSt+rgNhc6Jmho7Wd3V0+xpBJDAL0XZDzq8cLNXJF02w
 jpCCQvMQZL+ybpCGLJxa3G/yEIVQ1IJ8Ji4bVuB3b3oEdKhYPIZncAmDTi56X7HpVrTx+pkPxfU
 wzf4uvzukiAMmVK8rMPBuSYbgxrGkErowGN+z4A==
X-Google-Smtp-Source: AGHT+IFqLxgr4g5t0QvyOZzfbaTbZd9+tg3BYfD2mVvx2nHnhm0owQqT4/xCh4/NgYPATS+Pc1G9Tt2yQ4NwFxcW7uA=
X-Received: by 2002:a17:906:bccf:b0:a44:24c6:abe8 with SMTP id
 lw15-20020a170906bccf00b00a4424c6abe8mr566815ejb.12.1709183652284; Wed, 28
 Feb 2024 21:14:12 -0800 (PST)
MIME-Version: 1.0
From: Nisarg Jhaveri <nisargjhaveri@gmail.com>
Date: Thu, 29 Feb 2024 10:44:00 +0530
Message-ID: <CANsE+Wd-NkLvVgKnNugSNqTYE8HNkO0yOLjpqKsnFt4t-aZ6LA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709183652; x=1709788452; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gqaJHq1NkkVV1rugC213PW0UeNdwMzPYb3dezzRjV6c=;
 b=WkbwcMM7ZdktViYD1HsTdByNJ63qLnb0fhO12ECCjtxnBzkeyx17FJQVelUQ0o3nLx
 DESrL8uhLCKGz0pkCZP7Qj/8dYJ9fg4hUnzm35BcDL1dyB+J/fYHfL33btRsNazemfmG
 VorIyHTpW8tkle7ATuV/fwx1iZLI24Fu5nG81i3Kxo2DbPUeYXVnnCgX9yLTb+ciFuYL
 wlh5IptjubU41vQiQqsMlH4xuuUkdCY9FcEEal2sBKRBcXhN6P1dKI+7S++86I17WSvq
 RlY/czh3eRI+iIg3edB8yPYOBq/SxvkatN8ei6Teqkax+amaqq6C1QfRvEh8z5MzbIqk
 UY2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WkbwcMM7
Subject: [Buildroot] [PATCH v2 1/1] package/brcmfmac_sdio-firmware-rpi: bump
 version to 26ff205
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
Cc: Martin Bark <martin@barkynet.com>, Nisarg Jhaveri <nisargjhaveri@gmail.com>
Content-Type: multipart/mixed; boundary="===============2294870419962375908=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2294870419962375908==
Content-Type: multipart/alternative; boundary="000000000000734bc006127e54e7"

--000000000000734bc006127e54e7
Content-Type: text/plain; charset="UTF-8"

The current version is more than 2 years old. Update to the latest.
A lot of the file are symlinked. Instead of individually restoring the
links, using `cp --remove-destination --no-dereference` and `chmod` instead
of `install`.

Signed-off-by: Nisarg Jhaveri <nisargjhaveri@gmail.com>
---
Changes v1 -> v2:
- Attempt to fix patch formatting

---
.../brcmfmac_sdio-firmware-rpi.hash | 4 +--
.../brcmfmac_sdio-firmware-rpi.mk | 27 +++++++------------
2 files changed, 12 insertions(+), 19 deletions(-)

diff --git
a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
index a12e92cbac..aa1043518b 100644
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
@@ -1,3 +1,3 @@
# Locally calculated
-sha256 e51b717c2a60ca29fcdd8e04e07c00996226cb48fa56a8ad1934b5f4ddee2e3d
brcmfmac_sdio-firmware-rpi-ea9963f3f77b4bb6cd280577eb115152bdd67e8d.tar.gz
-sha256 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d
LICENCE.broadcom_bcm43xx
+sha256 2f0917b104739455dd488dd8f5af2ee4430801a7ac8fe8d9866e74bfbb185356
brcmfmac_sdio-firmware-rpi-26ff205b45dc109b498a70aaf182804ad9dbfea5.tar.gz
+sha256 ea8b7b7b6cfc6fd30587ed977100f6a542734ce53218b5b63de16180acddd599
LICENCE
diff --git a/package/brcmfmac_sdio-firmware-rpi/
brcmfmac_sdio-firmware-rpi.mk b/package/brcmfmac_sdio-firmware-rpi/
brcmfmac_sdio-firmware-rpi.mk
index 5332bf53d7..7860de3ef7 100644
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
@@ -4,33 +4,26 @@
#
################################################################################
-BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION =
ea9963f3f77b4bb6cd280577eb115152bdd67e8d
+BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION =
26ff205b45dc109b498a70aaf182804ad9dbfea5
BRCMFMAC_SDIO_FIRMWARE_RPI_SITE = $(call
github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION))
BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE = PROPRIETARY
-BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENCE.broadcom_bcm43xx
+BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENCE
ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT),y)
define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_BT
- $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
- $(INSTALL) -m 0644 $(@D)/firmware/brcm/*.hcd
$(TARGET_DIR)/lib/firmware/brcm
+ $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
$(TARGET_DIR)/lib/firmware/synaptics
+ cp --remove-destination --no-dereference $(@D)/firmware/brcm/*.hcd
$(TARGET_DIR)/lib/firmware/brcm
+ cp --remove-destination --no-dereference $(@D)/firmware/synaptics/*.hcd
$(TARGET_DIR)/lib/firmware/synaptics
+ chmod 644 $(TARGET_DIR)/lib/firmware/brcm/*.hcd
$(TARGET_DIR)/lib/firmware/synaptics/*.hcd
endef
endif
ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI),y)
define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_WIFI
- $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
- $(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac*
$(TARGET_DIR)/lib/firmware/brcm
- ln -sf ../cypress/cyfmac43430-sdio.bin
$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.bin
- ln -sf ../cypress/cyfmac43430-sdio.clm_blob
$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.clm_blob
- ln -sf brcmfmac43430-sdio.txt
$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
- ln -sf brcmfmac43430-sdio.txt
$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt
- ln -sf ../cypress/cyfmac43455-sdio.bin
$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.bin
- ln -sf ../cypress/cyfmac43455-sdio.clm_blob
$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob
- ln -sf brcmfmac43455-sdio.txt
$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
- ln -sf brcmfmac43455-sdio.txt
$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
- ln -sf brcmfmac43455-sdio.txt
$(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
- $(INSTALL) -d $(TARGET_DIR)/lib/firmware/cypress
- $(INSTALL) -m 0644 $(@D)/firmware/cypress/cyfmac*
$(TARGET_DIR)/lib/firmware/cypress
+ $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
$(TARGET_DIR)/lib/firmware/cypress
+ cp --remove-destination --no-dereference $(@D)/firmware/brcm/brcmfmac*
$(TARGET_DIR)/lib/firmware/brcm
+ cp --remove-destination --no-dereference $(@D)/firmware/cypress/cyfmac*
$(TARGET_DIR)/lib/firmware/cypress
+ chmod 644 $(TARGET_DIR)/lib/firmware/brcm/brcmfmac*
$(TARGET_DIR)/lib/firmware/cypress/cyfmac*
endef
endif
-- 
2.38.1.vfs.0.0

--000000000000734bc006127e54e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"color:rgb(59,59,59);fon=
t-family:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-size:12px;line=
-height:18px;white-space:pre"><div>The current version is more than 2 years=
 old. Update to the latest.</div><div>A lot of the file are symlinked. Inst=
ead of individually restoring the links, using `cp --remove-destination --n=
o-dereference` and `chmod` instead of `install`.</div><br><div>Signed-off-b=
y: Nisarg Jhaveri &lt;<a href=3D"mailto:nisargjhaveri@gmail.com">nisargjhav=
eri@gmail.com</a>&gt;</div><div>---</div><div>Changes v1 -&gt; v2:<br></div=
><div>  - Attempt to fix patch formatting</div><div><br></div><div>---</div=
><div> .../brcmfmac_sdio-firmware-rpi.hash           |  4 +--</div><div> ..=
./<a href=3D"http://brcmfmac_sdio-firmware-rpi.mk">brcmfmac_sdio-firmware-r=
pi.mk</a>             | 27 +++++++------------</div><div> 2 files changed, =
12 insertions(+), 19 deletions(-)</div><br><div><span style=3D"color:rgb(0,=
0,128)">diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmw=
are-rpi.hash b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rp=
i.hash</span></div><div>index a12e92cbac..aa1043518b 100644</div><div><span=
 style=3D"color:rgb(0,0,128)">--- a/package/brcmfmac_sdio-firmware-rpi/brcm=
fmac_sdio-firmware-rpi.hash</span></div><div><span style=3D"color:rgb(0,0,1=
28)">+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.ha=
sh</span></div><div>@@ -1,3 +1,3 @@</div><div> # Locally calculated</div><d=
iv><span style=3D"color:rgb(163,21,21)">-sha256  e51b717c2a60ca29fcdd8e04e0=
7c00996226cb48fa56a8ad1934b5f4ddee2e3d  brcmfmac_sdio-firmware-rpi-ea9963f3=
f77b4bb6cd280577eb115152bdd67e8d.tar.gz</span></div><div><span style=3D"col=
or:rgb(163,21,21)">-sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e=
8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx</span></div><div><span style=3D=
"color:rgb(9,134,88)">+sha256  2f0917b104739455dd488dd8f5af2ee4430801a7ac8f=
e8d9866e74bfbb185356  brcmfmac_sdio-firmware-rpi-26ff205b45dc109b498a70aaf1=
82804ad9dbfea5.tar.gz</span></div><div><span style=3D"color:rgb(9,134,88)">=
+sha256  ea8b7b7b6cfc6fd30587ed977100f6a542734ce53218b5b63de16180acddd599  =
LICENCE</span></div><div><span style=3D"color:rgb(0,0,128)">diff --git a/pa=
ckage/brcmfmac_sdio-firmware-rpi/<a href=3D"http://brcmfmac_sdio-firmware-r=
pi.mk">brcmfmac_sdio-firmware-rpi.mk</a> b/package/brcmfmac_sdio-firmware-r=
pi/<a href=3D"http://brcmfmac_sdio-firmware-rpi.mk">brcmfmac_sdio-firmware-=
rpi.mk</a></span></div><div>index 5332bf53d7..7860de3ef7 100644</div><div><=
span style=3D"color:rgb(0,0,128)">--- a/package/brcmfmac_sdio-firmware-rpi/=
<a href=3D"http://brcmfmac_sdio-firmware-rpi.mk">brcmfmac_sdio-firmware-rpi=
.mk</a></span></div><div><span style=3D"color:rgb(0,0,128)">+++ b/package/b=
rcmfmac_sdio-firmware-rpi/<a href=3D"http://brcmfmac_sdio-firmware-rpi.mk">=
brcmfmac_sdio-firmware-rpi.mk</a></span></div><div>@@ -4,33 +4,26 @@</div><=
div> #</div><div> #########################################################=
#######################</div><div> </div><div><span style=3D"color:rgb(163,=
21,21)">-BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION =3D ea9963f3f77b4bb6cd280577eb1=
15152bdd67e8d</span></div><div><span style=3D"color:rgb(9,134,88)">+BRCMFMA=
C_SDIO_FIRMWARE_RPI_VERSION =3D 26ff205b45dc109b498a70aaf182804ad9dbfea5</s=
pan></div><div> BRCMFMAC_SDIO_FIRMWARE_RPI_SITE =3D $(call github,LibreELEC=
,brcmfmac_sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION))</div><di=
v> BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE =3D PROPRIETARY</div><div><span style=
=3D"color:rgb(163,21,21)">-BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES =3D LIC=
ENCE.broadcom_bcm43xx</span></div><div><span style=3D"color:rgb(9,134,88)">=
+BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES =3D LICENCE</span></div><div> </d=
iv><div> ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT),y)</div><div> d=
efine BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_BT</div><div><span style=3D=
"color:rgb(163,21,21)">-   $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm</s=
pan></div><div><span style=3D"color:rgb(163,21,21)">-   $(INSTALL) -m 0644 =
$(@D)/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm</span></div><div>=
<span style=3D"color:rgb(9,134,88)">+   $(INSTALL) -d $(TARGET_DIR)/lib/fir=
mware/brcm $(TARGET_DIR)/lib/firmware/synaptics</span></div><div><span styl=
e=3D"color:rgb(9,134,88)">+   cp --remove-destination --no-dereference $(@D=
)/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm</span></div><div><spa=
n style=3D"color:rgb(9,134,88)">+   cp --remove-destination --no-dereferenc=
e $(@D)/firmware/synaptics/*.hcd $(TARGET_DIR)/lib/firmware/synaptics</span=
></div><div><span style=3D"color:rgb(9,134,88)">+   chmod 644 $(TARGET_DIR)=
/lib/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/synaptics/*.hcd</span><=
/div><div> endef</div><div> endif</div><div> </div><div> ifeq ($(BR2_PACKAG=
E_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI),y)</div><div> define BRCMFMAC_SDIO_FIRMW=
ARE_RPI_INSTALL_TARGET_WIFI</div><div><span style=3D"color:rgb(163,21,21)">=
-   $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm</span></div><div><span st=
yle=3D"color:rgb(163,21,21)">-   $(INSTALL) -m 0644 $(@D)/firmware/brcm/brc=
mfmac* $(TARGET_DIR)/lib/firmware/brcm</span></div><div><span style=3D"colo=
r:rgb(163,21,21)">-   ln -sf ../cypress/cyfmac43430-sdio.bin $(TARGET_DIR)/=
lib/firmware/brcm/brcmfmac43430-sdio.bin</span></div><div><span style=3D"co=
lor:rgb(163,21,21)">-   ln -sf ../cypress/cyfmac43430-sdio.clm_blob $(TARGE=
T_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.clm_blob</span></div><div><span=
 style=3D"color:rgb(163,21,21)">-   ln -sf brcmfmac43430-sdio.txt $(TARGET_=
DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt</span><=
/div><div><span style=3D"color:rgb(163,21,21)">-   ln -sf brcmfmac43430-sdi=
o.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,model-=
zero-w.txt</span></div><div><span style=3D"color:rgb(163,21,21)">-   ln -sf=
 ../cypress/cyfmac43455-sdio.bin $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43=
455-sdio.bin</span></div><div><span style=3D"color:rgb(163,21,21)">-   ln -=
sf ../cypress/cyfmac43455-sdio.clm_blob $(TARGET_DIR)/lib/firmware/brcm/brc=
mfmac43455-sdio.clm_blob</span></div><div><span style=3D"color:rgb(163,21,2=
1)">-   ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmf=
mac43455-sdio.raspberrypi,3-model-a-plus.txt</span></div><div><span style=
=3D"color:rgb(163,21,21)">-   ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/l=
ib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt</span></=
div><div><span style=3D"color:rgb(163,21,21)">-   ln -sf brcmfmac43455-sdio=
.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model=
-b.txt</span></div><div><span style=3D"color:rgb(163,21,21)">-   $(INSTALL)=
 -d $(TARGET_DIR)/lib/firmware/cypress</span></div><div><span style=3D"colo=
r:rgb(163,21,21)">-   $(INSTALL) -m 0644 $(@D)/firmware/cypress/cyfmac* $(T=
ARGET_DIR)/lib/firmware/cypress</span></div><div><span style=3D"color:rgb(9=
,134,88)">+   $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm $(TARGET_DIR)/l=
ib/firmware/cypress</span></div><div><span style=3D"color:rgb(9,134,88)">+ =
  cp --remove-destination --no-dereference $(@D)/firmware/brcm/brcmfmac* $(=
TARGET_DIR)/lib/firmware/brcm</span></div><div><span style=3D"color:rgb(9,1=
34,88)">+   cp --remove-destination --no-dereference $(@D)/firmware/cypress=
/cyfmac* $(TARGET_DIR)/lib/firmware/cypress</span></div><div><span style=3D=
"color:rgb(9,134,88)">+   chmod 644 $(TARGET_DIR)/lib/firmware/brcm/brcmfma=
c* $(TARGET_DIR)/lib/firmware/cypress/cyfmac*</span></div><div> endef</div>=
<div> endif</div><div> </div><div><span style=3D"color:rgb(163,21,21)">-- <=
/span></div><div>2.38.1.vfs.0.0</div><br></div></div></div></div>

--000000000000734bc006127e54e7--

--===============2294870419962375908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2294870419962375908==--
