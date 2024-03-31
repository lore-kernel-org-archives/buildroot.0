Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A1FCD128A
	for <buildroot@archiver.kernel.org>; Sun, 31 Mar 2024 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3656A8186B;
	Sun, 31 Mar 2024 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IC81UBrSmk1u; Sun, 31 Mar 2024 20:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53A2E81304
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53A2E81304;
	Sun, 31 Mar 2024 20:03:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 150191BF31B
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 20:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2A0281304
 for <buildroot@lists.busybox.net>; Sun, 31 Mar 2024 20:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lf8XHJbInsFR for <buildroot@lists.busybox.net>;
 Sun, 31 Mar 2024 20:03:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=nisargjhaveri@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6405D812D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6405D812D3
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6405D812D3
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 20:03:17 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56899d9bf52so4364120a12.2
 for <buildroot@buildroot.org>; Sun, 31 Mar 2024 13:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711915396; x=1712520196;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kLfPXUQwwMY/+7HL3OZo6GSPvEU1BU9PosELcHdxZ/k=;
 b=K1GPIQnGWIOQboSoNEsPBGiFMHyEaCgm1a82XRmi9ppHR9HFOT4B3OszjOH189qVUc
 bfAgF6DSZSWF2znyDlydFnv1pWj/8FQd9N5jA2mPefrqQ+mkSgkDywowFfA8Zf8blcM+
 O0Al72WvJTJpdsFtZEiHt+9xwkrwJ17sqZlnnc7P+Z4hemnZIZTPSwPNBzrGRQFI3204
 VRFh/73nzyN56lnkKzH0Oh4w/ekK5XhFag1lMeensOyCq1pNExsCrPl1kSdgGVna4zFr
 B/vigX+Kczv7sCx380zBwlMiSEx8//JEHjxFsGvhdjfBeObysq13/UIFopZlTxeLGcFa
 wJgw==
X-Gm-Message-State: AOJu0YwjX7XUiIxC8FYiWBhQM3pO+KSXKtcRGDrt1UiqHlSMZuVjTPJ0
 1IoWzWo294o5iFDqU0JxQufq+mNhe1AWojHPqTsZyJPZe+3SIyTcvy2A7p3u5JwHBgmQDIlfEgp
 zC8u5ED+xO/B5Pt15vyuxNrLiHBXjfckTzQukiQ==
X-Google-Smtp-Source: AGHT+IHrkndfh87R4FXdcoCWzh9UxtWF9ziJ2czyXf3TdZ+L0J7pIy4GU1gq50OPHtW+eCYqBaLDgbpKL2TeWhOYpmY=
X-Received: by 2002:a17:907:7216:b0:a4e:14e6:2084 with SMTP id
 dr22-20020a170907721600b00a4e14e62084mr6900773ejc.51.1711915395573; Sun, 31
 Mar 2024 13:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <CANsE+Wd-NkLvVgKnNugSNqTYE8HNkO0yOLjpqKsnFt4t-aZ6LA@mail.gmail.com>
 <20240229052236.50171-1-nisargjhaveri@gmail.com>
In-Reply-To: <20240229052236.50171-1-nisargjhaveri@gmail.com>
From: Nisarg Jhaveri <nisargjhaveri@gmail.com>
Date: Mon, 1 Apr 2024 01:33:04 +0530
Message-ID: <CANsE+WfX7+hfpeTAeeugFQWSVOCUA3Sk81CxDX8BDh+yEtw_ig@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711915396; x=1712520196; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kLfPXUQwwMY/+7HL3OZo6GSPvEU1BU9PosELcHdxZ/k=;
 b=g6STeCv2K98wga/iM6c0FQp1aCsSjXfxeJJZc7HPRehmew/2BMMJF+XBoaW3Le6D9r
 /SsVt+KizJKbQYYhR+IS/aCyNZOJI0ha7eOoUc2rWhrpMFjGJBSyGMAJg6XjZy4FcFoT
 MCE/SgLDOI27j3TPjuGitQsx+wdvinHSKbTZbOf/w/aP2KlC6Crr8XSafVPC3wm739s0
 WXvdJ3XucDisspVLwJO9XgV5OinGYjmBkrABWSLZEcrF21+/fV9iNftee9phjdDeljIN
 hUvqTurNp6/LWA+uiYQWZLYbu4Kw8iPCO4T8u2t7XefwTxMXwZVE7VKupO3n+Fl991dC
 30XA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=g6STeCv2
Subject: Re: [Buildroot] [PATCH v3 1/1] package/brcmfmac_sdio-firmware-rpi:
 bump version to 26ff205
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
Cc: Martin Bark <martin@barkynet.com>
Content-Type: multipart/mixed; boundary="===============1007593979410506380=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1007593979410506380==
Content-Type: multipart/alternative; boundary="00000000000009ee6c0614fa5d59"

--00000000000009ee6c0614fa5d59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This should also be backported to 2024.02.1 as the builds for Raspberry Pi
boards are broken since 13ba668a2da3a0dcb386578ce15b00a444101dbe.

Backport to: 2024.02.1

On Thu, Feb 29, 2024 at 10:53=E2=80=AFAM Nisarg Jhaveri <nisargjhaveri@gmai=
l.com>
wrote:

> The current version is more than 2 years old. Update to the latest.
> A lot of the files are symlinked. Instead of individually restoring the
> links, using `cp --remove-destination --no-dereference` and `chmod` inste=
ad
> of `install`.
>
> Signed-off-by: Nisarg Jhaveri <nisargjhaveri@gmail.com>
> ---
> Changes v2 -> v3:
>   - Attempt to fix patch formatting
>
> Changes v1 -> v2:
>   - Attempt to fix patch formatting
>
> ---
>  .../brcmfmac_sdio-firmware-rpi.hash           |  4 +--
>  .../brcmfmac_sdio-firmware-rpi.mk             | 27 +++++++------------
>  2 files changed, 12 insertions(+), 19 deletions(-)
>
> diff --git
> a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
> b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
> index a12e92cbac..aa1043518b 100644
> --- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
> +++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  e51b717c2a60ca29fcdd8e04e07c00996226cb48fa56a8ad1934b5f4ddee2e3d
> brcmfmac_sdio-firmware-rpi-ea9963f3f77b4bb6cd280577eb115152bdd67e8d.tar.g=
z
> -sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d
> LICENCE.broadcom_bcm43xx
> +sha256  2f0917b104739455dd488dd8f5af2ee4430801a7ac8fe8d9866e74bfbb185356
> brcmfmac_sdio-firmware-rpi-26ff205b45dc109b498a70aaf182804ad9dbfea5.tar.g=
z
> +sha256  ea8b7b7b6cfc6fd30587ed977100f6a542734ce53218b5b63de16180acddd599
> LICENCE
> diff --git a/package/brcmfmac_sdio-firmware-rpi/
> brcmfmac_sdio-firmware-rpi.mk b/package/brcmfmac_sdio-firmware-rpi/
> brcmfmac_sdio-firmware-rpi.mk
> index 5332bf53d7..7860de3ef7 100644
> --- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
> +++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
> @@ -4,33 +4,26 @@
>  #
>
>  ########################################################################=
########
>
> -BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION =3D
> ea9963f3f77b4bb6cd280577eb115152bdd67e8d
> +BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION =3D
> 26ff205b45dc109b498a70aaf182804ad9dbfea5
>  BRCMFMAC_SDIO_FIRMWARE_RPI_SITE =3D $(call
> github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_=
VERSION))
>  BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE =3D PROPRIETARY
> -BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES =3D LICENCE.broadcom_bcm43xx
> +BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES =3D LICENCE
>
>  ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT),y)
>  define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_BT
> -       $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
> -       $(INSTALL) -m 0644 $(@D)/firmware/brcm/*.hcd
> $(TARGET_DIR)/lib/firmware/brcm
> +       $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
> $(TARGET_DIR)/lib/firmware/synaptics
> +       cp --remove-destination --no-dereference $(@D)/firmware/brcm/*.hc=
d
> $(TARGET_DIR)/lib/firmware/brcm
> +       cp --remove-destination --no-dereference
> $(@D)/firmware/synaptics/*.hcd $(TARGET_DIR)/lib/firmware/synaptics
> +       chmod 644 $(TARGET_DIR)/lib/firmware/brcm/*.hcd
> $(TARGET_DIR)/lib/firmware/synaptics/*.hcd
>  endef
>  endif
>
>  ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI),y)
>  define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_WIFI
> -       $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
> -       $(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac*
> $(TARGET_DIR)/lib/firmware/brcm
> -       ln -sf ../cypress/cyfmac43430-sdio.bin
> $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.bin
> -       ln -sf ../cypress/cyfmac43430-sdio.clm_blob
> $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.clm_blob
> -       ln -sf brcmfmac43430-sdio.txt
> $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.=
txt
> -       ln -sf brcmfmac43430-sdio.txt
> $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,model-zero=
-w.txt
> -       ln -sf ../cypress/cyfmac43455-sdio.bin
> $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.bin
> -       ln -sf ../cypress/cyfmac43455-sdio.clm_blob
> $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob
> -       ln -sf brcmfmac43455-sdio.txt
> $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-=
plus.txt
> -       ln -sf brcmfmac43455-sdio.txt
> $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-=
plus.txt
> -       ln -sf brcmfmac43455-sdio.txt
> $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.=
txt
> -       $(INSTALL) -d $(TARGET_DIR)/lib/firmware/cypress
> -       $(INSTALL) -m 0644 $(@D)/firmware/cypress/cyfmac*
> $(TARGET_DIR)/lib/firmware/cypress
> +       $(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
> $(TARGET_DIR)/lib/firmware/cypress
> +       cp --remove-destination --no-dereference
> $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
> +       cp --remove-destination --no-dereference
> $(@D)/firmware/cypress/cyfmac* $(TARGET_DIR)/lib/firmware/cypress
> +       chmod 644 $(TARGET_DIR)/lib/firmware/brcm/brcmfmac*
> $(TARGET_DIR)/lib/firmware/cypress/cyfmac*
>  endef
>  endif
>
> --
> 2.38.1.vfs.0.0
>
>

--=20
Nisarg Jhaveri
=E0=AA=A8=E0=AA=BF=E0=AA=B8=E0=AA=B0=E0=AB=8D=E0=AA=97 =E0=AA=9D=E0=AA=B5=
=E0=AB=87=E0=AA=B0=E0=AB=80

--00000000000009ee6c0614fa5d59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This should also be backported to=C2=A02024.02.1 as the bu=
ilds for Raspberry Pi boards are broken since=C2=A013ba668a2da3a0dcb386578c=
e15b00a444101dbe.<div><br></div><div>Backport to:=C2=A02024.02.1<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, Feb 29, 2024 at 10:53=E2=80=AFAM Nisarg Jhaveri &lt;<a href=3D"mailt=
o:nisargjhaveri@gmail.com">nisargjhaveri@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">The current version is mo=
re than 2 years old. Update to the latest.<br>
A lot of the files are symlinked. Instead of individually restoring the lin=
ks, using `cp --remove-destination --no-dereference` and `chmod` instead of=
 `install`.<br>
<br>
Signed-off-by: Nisarg Jhaveri &lt;<a href=3D"mailto:nisargjhaveri@gmail.com=
" target=3D"_blank">nisargjhaveri@gmail.com</a>&gt;<br>
---<br>
Changes v2 -&gt; v3:<br>
=C2=A0 - Attempt to fix patch formatting<br>
<br>
Changes v1 -&gt; v2:<br>
=C2=A0 - Attempt to fix patch formatting<br>
<br>
---<br>
=C2=A0.../brcmfmac_sdio-firmware-rpi.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 4 +--<br>
=C2=A0.../<a href=3D"http://brcmfmac_sdio-firmware-rpi.mk" rel=3D"noreferre=
r" target=3D"_blank">brcmfmac_sdio-firmware-rpi.mk</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 27 +++++++------------<br>
=C2=A02 files changed, 12 insertions(+), 19 deletions(-)<br>
<br>
diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.=
hash b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash<b=
r>
index a12e92cbac..aa1043518b 100644<br>
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash<br=
>
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash<br=
>
@@ -1,3 +1,3 @@<br>
=C2=A0# Locally calculated<br>
-sha256=C2=A0 e51b717c2a60ca29fcdd8e04e07c00996226cb48fa56a8ad1934b5f4ddee2=
e3d=C2=A0 brcmfmac_sdio-firmware-rpi-ea9963f3f77b4bb6cd280577eb115152bdd67e=
8d.tar.gz<br>
-sha256=C2=A0 b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec=
30d=C2=A0 LICENCE.broadcom_bcm43xx<br>
+sha256=C2=A0 2f0917b104739455dd488dd8f5af2ee4430801a7ac8fe8d9866e74bfbb185=
356=C2=A0 brcmfmac_sdio-firmware-rpi-26ff205b45dc109b498a70aaf182804ad9dbfe=
a5.tar.gz<br>
+sha256=C2=A0 ea8b7b7b6cfc6fd30587ed977100f6a542734ce53218b5b63de16180acddd=
599=C2=A0 LICENCE<br>
diff --git a/package/brcmfmac_sdio-firmware-rpi/<a href=3D"http://brcmfmac_=
sdio-firmware-rpi.mk" rel=3D"noreferrer" target=3D"_blank">brcmfmac_sdio-fi=
rmware-rpi.mk</a> b/package/brcmfmac_sdio-firmware-rpi/<a href=3D"http://br=
cmfmac_sdio-firmware-rpi.mk" rel=3D"noreferrer" target=3D"_blank">brcmfmac_=
sdio-firmware-rpi.mk</a><br>
index 5332bf53d7..7860de3ef7 100644<br>
--- a/package/brcmfmac_sdio-firmware-rpi/<a href=3D"http://brcmfmac_sdio-fi=
rmware-rpi.mk" rel=3D"noreferrer" target=3D"_blank">brcmfmac_sdio-firmware-=
rpi.mk</a><br>
+++ b/package/brcmfmac_sdio-firmware-rpi/<a href=3D"http://brcmfmac_sdio-fi=
rmware-rpi.mk" rel=3D"noreferrer" target=3D"_blank">brcmfmac_sdio-firmware-=
rpi.mk</a><br>
@@ -4,33 +4,26 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION =3D ea9963f3f77b4bb6cd280577eb115152bdd=
67e8d<br>
+BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION =3D 26ff205b45dc109b498a70aaf182804ad9d=
bfea5<br>
=C2=A0BRCMFMAC_SDIO_FIRMWARE_RPI_SITE =3D $(call github,LibreELEC,brcmfmac_=
sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION))<br>
=C2=A0BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE =3D PROPRIETARY<br>
-BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES =3D LICENCE.broadcom_bcm43xx<br>
+BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES =3D LICENCE<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT),y)<br>
=C2=A0define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_BT<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0644 $(@D)/firmware/brcm/*.hcd $(=
TARGET_DIR)/lib/firmware/brcm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm $=
(TARGET_DIR)/lib/firmware/synaptics<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp --remove-destination --no-dereference $(@D)/=
firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp --remove-destination --no-dereference $(@D)/=
firmware/synaptics/*.hcd $(TARGET_DIR)/lib/firmware/synaptics<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 644 $(TARGET_DIR)/lib/firmware/brcm/*.hcd=
 $(TARGET_DIR)/lib/firmware/synaptics/*.hcd<br>
=C2=A0endef<br>
=C2=A0endif<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI),y)<br>
=C2=A0define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_WIFI<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac=
* $(TARGET_DIR)/lib/firmware/brcm<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../cypress/cyfmac43430-sdio.bin $(TARGET=
_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../cypress/cyfmac43430-sdio.clm_blob $(T=
ARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.clm_blob<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib=
/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib=
/firmware/brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../cypress/cyfmac43455-sdio.bin $(TARGET=
_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.bin<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf ../cypress/cyfmac43455-sdio.clm_blob $(T=
ARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib=
/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib=
/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib=
/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d $(TARGET_DIR)/lib/firmware/cypres=
s<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0644 $(@D)/firmware/cypress/cyfma=
c* $(TARGET_DIR)/lib/firmware/cypress<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm $=
(TARGET_DIR)/lib/firmware/cypress<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp --remove-destination --no-dereference $(@D)/=
firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp --remove-destination --no-dereference $(@D)/=
firmware/cypress/cyfmac* $(TARGET_DIR)/lib/firmware/cypress<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 644 $(TARGET_DIR)/lib/firmware/brcm/brcmf=
mac* $(TARGET_DIR)/lib/firmware/cypress/cyfmac*<br>
=C2=A0endef<br>
=C2=A0endif<br>
<br>
-- <br>
2.38.1.vfs.0.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Nisarg Jhaveri</div><div>=E0=AA=A8=E0=AA=BF=E0=AA=B8=E0=
=AA=B0=E0=AB=8D=E0=AA=97 =E0=AA=9D=E0=AA=B5=E0=AB=87=E0=AA=B0=E0=AB=80<br><=
/div></div></div>

--00000000000009ee6c0614fa5d59--

--===============1007593979410506380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1007593979410506380==--
