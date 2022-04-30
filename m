Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA7DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 12:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5177419F5;
	Sat, 30 Apr 2022 12:26:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vcbDOF0JG_fY; Sat, 30 Apr 2022 12:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40792419B2;
	Sat, 30 Apr 2022 12:26:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44E651BF4E6
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 12:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32A446063B
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 12:26:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihv7tdK790yQ for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 12:26:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1890600D1
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 12:26:38 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e24so13931546wrc.9
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 05:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UuK28JF111TPSNaMiclWroUbvZRp+FminpnGecRrUT0=;
 b=DIFUBAQ8US9sUsNxLyy5raITvq+a8KwVinTrgeVIe60XP9fOcil1+exiOUiPDUxpD9
 48a3D0aWrysOb1KEi54gBWt1O17ACf5mAGrMkNKs1V2P6xUwh9kRFpn6JjpCII8YwaOY
 JYuQk+TusLrC2D/x/CndIn6yd8iXTyjchF3wVU5HWgkFBxrR3t1YbiwFzMJ0qum9HMjh
 xG9Un114FMax+37yIgfJsFBj8x9tbWYvfBh0Fg4Tf1HUxCFsk/oJKDtpNuPyYvzOByMi
 oWgeLOfw/+PKljEcMjVPlZmpFYZ4enHKRAaiqTlRsHhjjY6gDG5757SDuf/BcJR2isP+
 BTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UuK28JF111TPSNaMiclWroUbvZRp+FminpnGecRrUT0=;
 b=RS+2gyUOocZ63fMtXM72Hn1Sd80GIRd8FK7C4obJnYX/IlgYuoNlrFFVPgY2PF9M2Y
 2h0V0WNsHyPHX/nlDAp8mMeFY1PKz8sCNqgG6wA4QEEN4QQ+0/vwXr93EtqDQG6HzBB7
 JKCrvP0vK/NuvEBR6akQjY67OGLr6H717kzJ/MIoMlZCXsrmQJ22/UPZLoazJyeYBmnt
 jtJcTA21WKBG9XYwJL1jd/Ri4n7n9H17w3MPu0R8DM2Xzdk2fy1VFxKwI880o/h6VoFV
 UJdkh9ELLoAgPq3mEFTwsJ7uXZxRhPuPWxjxU5hBAilQ9eeHumCNwFinsH4yuBhs47+L
 HZqw==
X-Gm-Message-State: AOAM530gwyKe7zDlThIYN7gKQFAXbUj0Pocu54jl2A71VKm9tQC3z9BJ
 Z9c/Wg0fhhvNoJHaOI4OKOZgTUvxfYPA2KTaugczYzC6h0Q=
X-Google-Smtp-Source: ABdhPJw+fwoy5Xp56zZe8hRjWAhob0hA3De8WltiLSaSUsCzeQoM+8sxD4OD71I8Hqw9XVm2c0xbww7FzMlLlIdvq/M=
X-Received: by 2002:a5d:428f:0:b0:20a:de6f:6b02 with SMTP id
 k15-20020a5d428f000000b0020ade6f6b02mr3052059wrq.542.1651321596740; Sat, 30
 Apr 2022 05:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220422100918.2818811-1-thomas.perrot@bootlin.com>
In-Reply-To: <20220422100918.2818811-1-thomas.perrot@bootlin.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 30 Apr 2022 14:26:24 +0200
Message-ID: <CAEyMn7bMtshaEzSG+yc_gsmtHpdNoc6GTyDgs5mEseerXznpMQ@mail.gmail.com>
To: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 2/2] package/imx-cst: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Am Fr., 22. Apr. 2022 um 12:16 Uhr schrieb Thomas Perrot via buildroot
<buildroot@buildroot.org>:
>
> This package provides i.MX Code Signing Tools uses to sign i.MX bootloader
> to enable secure boot (HABv4 and AHAB).
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>
> Changes v2:
>   - Add a trailing slash
>   - Preserve CFLAGS and LDFLAGS
>
> Changes v3:
>   - Hard code the OSTYPE variable to linux64
>
>  DEVELOPERS                     |  1 +
>  package/Config.in.host         |  1 +
>  package/imx-cst/Config.in.host |  8 +++++++
>  package/imx-cst/imx-cst.hash   |  3 +++
>  package/imx-cst/imx-cst.mk     | 43 ++++++++++++++++++++++++++++++++++
>  5 files changed, 56 insertions(+)
>  create mode 100644 package/imx-cst/Config.in.host
>  create mode 100644 package/imx-cst/imx-cst.hash
>  create mode 100644 package/imx-cst/imx-cst.mk
>

What about having the package located in package/freescale-imx/ like
the most other packages for the imx family?

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 6e49334dcc42..86cb04e54e5d 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2767,6 +2767,7 @@ F:        package/xorcurses/
>
>  N:     Thomas Perrot <thomas.perrot@bootlin.com>
>  F:     package/byacc/
> +F:     package/imx-cst/
>
>  N:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  F:     arch/Config.in.arm
> diff --git a/package/Config.in.host b/package/Config.in.host
> index cd1c34b5a3d9..282594b40b8d 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -40,6 +40,7 @@ menu "Host utilities"
>         source "package/google-breakpad/Config.in.host"
>         source "package/gptfdisk/Config.in.host"
>         source "package/imagemagick/Config.in.host"
> +       source "package/imx-cst/Config.in.host"
>         source "package/imx-mkimage/Config.in.host"
>         source "package/imx-usb-loader/Config.in.host"
>         source "package/jh71xx-tools/Config.in.host"
> diff --git a/package/imx-cst/Config.in.host b/package/imx-cst/Config.in.host
> new file mode 100644
> index 000000000000..84cb825e59cf
> --- /dev/null
> +++ b/package/imx-cst/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_IMX_CST
> +       bool "host imx-cst"
> +       help
> +         I.MX code signing tool provides software code signing
> +         support designed that integrate the HABv4 and AHAB
> +         library.
> +
> +         https://www.nxp.com/webapp/sps/download/license.jsp?colCode=IMX_CST_TOOL
> diff --git a/package/imx-cst/imx-cst.hash b/package/imx-cst/imx-cst.hash
> new file mode 100644
> index 000000000000..9c27bfe82038
> --- /dev/null
> +++ b/package/imx-cst/imx-cst.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  2bcc03c7cedba58f7207a72a28e75cfe78007988d68c1095c793cce991c2936e  imx-cst-e2c687a856e6670e753147aacef42d0a3c07891a-br1.tar.gz
> +sha256  5dee6f54c636a97b15d7e9dfc8075248c36764b3819828cbc94cbd17c1755fb9  LICENSE.bsd3
> diff --git a/package/imx-cst/imx-cst.mk b/package/imx-cst/imx-cst.mk
> new file mode 100644
> index 000000000000..120f9c5575e1
> --- /dev/null
> +++ b/package/imx-cst/imx-cst.mk
> @@ -0,0 +1,43 @@
> +################################################################################
> +#
> +# imx-cst
> +#
> +################################################################################
> +
> +# debian/3.3.1+dfsg-2
> +IMX_CST_SITE = https://gitlab.apertis.org/pkg/imx-code-signing-tool.git
> +IMX_CST_SITE_METHOD = git
> +IMX_CST_VERSION = e2c687a856e6670e753147aacef42d0a3c07891a
> +IMX_CST_LICENSE = BSD-3-Clause
> +IMX_CST_LICENSE_FILES = LICENSE.bsd3
> +
> +HOST_IMX_CST_DEPENDENCIES = host-byacc host-flex host-openssl
> +
> +# We don't use HOST_CONFIGURE_OPTS when building cst, because we need
> +# to preserve the CFLAGS/LDFLAGS used by their Makefile.
> +define HOST_IMX_CST_BUILD_CMDS
> +       $(HOST_MAKE_ENV) $(MAKE) \
> +               OSTYPE=linux64 \
> +               ENCRYPTION=yes \
> +               AR="$(HOSTAR)" \
> +               CC="$(HOSTCC)" \
> +               LD="$(HOSTCC)" \
> +               OBJCOPY="$(HOSTOBJCOPY)" \
> +               RANLIB="$(HOSTRANLIB)" \
> +               EXTRACFLAGS="$(HOST_CFLAGS) $(HOST_CPPFLAGS)" \
> +               EXTRALDFLAGS="$(HOST_LDFLAGS)" \
> +               PWD=$(@D)/code/cst \
> +               -C $(@D)/code/cst \
> +               build
> +       $(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> +               COPTS="$(HOST_CFLAGS) $(HOST_CPPFLAGS) $(HOST_LDFLAGS)" \
> +               -C $(@D)/code/hab_csf_parser
> +endef
> +
> +define HOST_IMX_CST_INSTALL_CMDS
> +       $(INSTALL) -D -m 755 $(@D)/code/cst/code/obj.linux64/cst $(HOST_DIR)/bin/cst
> +       $(INSTALL) -D -m 755 $(@D)/code/cst/code/obj.linux64/srktool $(HOST_DIR)/bin/srktool
> +       $(INSTALL) -D -m 755 $(@D)/code/hab_csf_parser/csf_parser $(HOST_DIR)/bin/csf_parser
> +endef
> +
> +$(eval $(host-generic-package))
> --
> 2.35.1
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
