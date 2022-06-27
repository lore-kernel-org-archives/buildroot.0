Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666E0C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 12:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB36141923;
	Mon, 27 Jun 2022 12:50:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB36141923
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fP30Uj9ZnzRk; Mon, 27 Jun 2022 12:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 501424191A;
	Mon, 27 Jun 2022 12:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 501424191A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E42E1BF315
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 12:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35B1240C20
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 12:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35B1240C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dno_EwWJ96Ar for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 12:50:40 +0000 (UTC)
X-Greylist: delayed 00:14:11 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D64764013F
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0098.outbound.protection.office365.us [23.103.208.98])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D64764013F
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 12:50:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=gSQQA0POqsolZKdjWLSg3+NVWXb7pXJEiCHQ4+b/O6SmRRzWUVTavlsKDQNogXjFbSjPwramu9PGzspVd7CRIa1EJb7JtHAhoEDrfGKkhCsNtvPRptAHzuf+NJPCFaI2GAPZjCN/LISyGwDOVaAWIcC4g82y9sNDwGW7u8SAKtCyG6anrQS1RfePA7mKHz6d7vMlL2P/M0DEjTAWC2FVLk9LM0OEP3rw33zIrE/Q9bqr8BEhKSoLb27dF3QfqKDF6PoQA9e0M0yUgf9zPqFQhpTE/hoDaK+BsVzLuhmvehWIam7BEfSb9VfdRNfMw6wzQq/ATru4KYUVN1mhBptkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnsLlGeek+JMFPVOUdwbJjaqd1zVIDZAeRSE2m4VM50=;
 b=1Qh3CtUTTajN96IUElezpTcxzLmJGdSxYQLAXOuBuChpY9yCWjbFEpCh3Q2jPYIRoZZw5SbLkYb37o6bRJRKUAnoxaQrlol8csHUpZpa0ezkizborbmlY6mUPsyT1xP6qbJ3/eq06M6BU6SH2ZCNaK4v5+S98Oo1JFKnAvvvFl22+DlLHhb+q4WPgp46IOG5xIRqbmzgiWVELwEc+YEyIEAXNU+KENZBF7d0BOAjZ7ZbqbXLvm9B5O6+FibnTEbR0H5SBBp5qv2vDJUGTWA218ERFccSrdZx7OIAFtNEzAd8DFNy1Ykluwbr6De57HG0qIJDdB8Wwhxgh8PnOAs4AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (52.145.24.207) by
 PH1P110MB1345.NAMP110.PROD.OUTLOOK.COM (52.145.25.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.22; Mon, 27 Jun 2022 12:36:22 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e89b:a042:1655:b423]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::e89b:a042:1655:b423%6]) with mapi id 15.20.5353.024; Mon, 27 Jun 2022
 12:36:22 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>
Thread-Topic: [External] - [Buildroot] [PATCH v1 1/1] package/nvidia-driver:
 bump verstion to 515.48.07
Thread-Index: AQHYiWKUUxSSStL/L0KgwZXpPMqCvq1jLvrA
Date: Mon, 27 Jun 2022 12:36:22 +0000
Message-ID: <PH1P110MB1603A57FB018D70B7354613F9FB99@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20220626134142.9304-1-raphael.pavlidis@gmail.com>
In-Reply-To: <20220626134142.9304-1-raphael.pavlidis@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67da4b9f-19aa-4947-da30-08da5839a4cd
x-ms-traffictypediagnostic: PH1P110MB1345:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3t9XiUqOQ0Zy7jTmGVD2bU4VCslVhXh3jRpZqok4ZGrkxG8mCPX+H8Idv/jAEtoCS6tieyBAe30YRVDFPqdP4VGR4k+q4F/8OZvYz8OSV9GmWqRQ86+8Ksj6/QefLMEmdhkdxzhx8esPd8YWzYODpJX81xZ6shbAwgF6h44YCj5nPzBlljvbDNET2bitA25tz/pPXnbVrJfncq/a6baOfWL89Xla/caCt6L+ReUyfXfpJZpZKcY+JBJRM7PJUoKkPqPT3RLA9SWaYTKjkIP4M0V7EdKYENaWr7vJPduXSTQcdQhNsPqSKCs5YLxo0irlVChiQVWVTa+Vo7EacLJNNRPi8JO2VEd1YDRNLlfKfOBVy3apkxdqtuETWPqDKT2rDQLAj/rCRwUpBwIAYEHPzGr63RTCPBD6tppLeVCJ9ucAB+ZcCyVFQ/gCPPNN0Qg2kL4CcwiiNDurYH6ZNy5yXYfYHJrJ3XIZuCAsnOkVqR76bXuwTJ2Rah2Fj6p8jGALD+l+Vi/uhG2VCPnLHy+z8DXwKsHhWLHefwnjxRjWMWm2Jl2KVjFv3Sw4i88MP0ATifMAXIB2OBMwUboz8XTMJ2II9GsJ6Kl7pA1pTzoRVlpwpSp4SxHbtEFdj0fzuphgHtpzg0E5R9xbMFVyArJt5T+WY6cfoyxBHXMyDuyFgrlIXz8cYZGQldzn3sJqHv0R43DiSx7Hh969WxItrv/+TWlzp52viZHDalcUnuwCTIv855X3qYQHOG6k+522yr0+vu7WG0iejCe5AbywFpMF5gRIpk+/syZ8OKomuXEFa1WudEwvYfrBS9O6+D2NCSvM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39830400003)(136003)(396003)(966005)(41300700001)(38070700005)(2906002)(6916009)(186003)(5660300002)(66476007)(8676002)(76116006)(64756008)(19625735003)(71200400001)(26005)(4326008)(66556008)(8936002)(66446008)(33656002)(508600001)(55016003)(52536014)(122000001)(54906003)(41320700001)(66946007)(83380400001)(9686003)(86362001)(53546011)(6506007)(7696005)(38100700002)(41080700001)(15866825006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: W7304y/d46aiw6mg5FFKCpvQRGlbsq7D3c6I0Uo0wbKj+CLmBA80hwym0R8R0Wol5GiY99FPzKOj3Y4TiZKVFR0US009Fh7fd6ciNcbFUPFsBm+nlulOwMKo5X7fjrkE8x+p+FPM0K28GBqConoyKQMv3gO4653jjeh72j5QPpjR8F+E76OXW/PT63vHqgk5G+VNo46653PxT9VzfLqZaoYAvYrUFtnpTFMfrODkIakdqg6mXDBcdwCKXgB9nndqBg6/MnqTz0VARkKNMIBbZFZrhY6MDlxWqF/6zobiY7HAYqeI8Mm966x+7eRfnr48a4aAxs+D3LeJsRNcY4Kyw3xJoPJozWGRlTusPvwWGH58xeSSIlOUFk7jFCs3YyAU2G7L16yIkL+KX2CgfZtrQkIOF3Yd70X1Lm/quNeO7C4=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67da4b9f-19aa-4947-da30-08da5839a4cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 12:36:22.7212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1345
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnsLlGeek+JMFPVOUdwbJjaqd1zVIDZAeRSE2m4VM50=;
 b=377QS0naT79WayUb2VxP92TiioxLpDZdPmXSCGkz0FDyHjXAFXZNKWxLhwDiM8FjxMwA+YdR4bkbwQqmdshLx8YkZZTUCShgNYzPtYSjZl0NYyyD6LcvEJVEJLfZNXzqo09PsOmzLWl3tyJKoxdqtTR+GdU4HF+jRIM/n1vXjI/QH0x03dPmujeM8KYHRCts8z7CLeEgVellMkPuj2aENJxe76DFtYrvEaAQvA6ft3HI2fGE53a0sty9YTp+MoLYcw9xlwLVv6bIUe0ysbo1H3/EMZvBqW4TboQln/MyfQYEgjo7ki3Vrvdn00XkHaHOZgMvJm93Mcem3Y/wcRqclw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=377QS0na
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH v1 1/1] package/nvidia-driver:
 bump verstion to 515.48.07
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Raphael

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Raphael
> Pavlidis via buildroot
> Sent: Sunday, June 26, 2022 8:42 AM
> To: buildroot@buildroot.org
> Cc: Yann E . MORIN <yann.morin.1998@free.fr>; Raphael Pavlidis
> <raphael.pavlidis@gmail.com>
> Subject: [External] - [Buildroot] [PATCH v1 1/1] package/nvidia-driver: bump
> verstion to 515.48.07
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>  package/nvidia-driver/nvidia-driver.hash |  6 +++---
>  package/nvidia-driver/nvidia-driver.mk   | 24 +++++++-----------------
>  2 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/package/nvidia-driver/nvidia-driver.hash b/package/nvidia-
> driver/nvidia-driver.hash
> index 7f2248d0f9..06cf292c58 100644
> --- a/package/nvidia-driver/nvidia-driver.hash
> +++ b/package/nvidia-driver/nvidia-driver.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256
> 51adb28f0ed4548f35a88a93ad6767ebd807fa14f418bf5e51a6d63a3ff7f275
> NVIDIA-Linux-x86-390.132.run
> -sha256
> b6b4b8af37e78e026c9ebdf4a5c64ea412dfcb710931dd028c22dac228de659d
> NVIDIA-Linux-x86_64-390.132-no-compat32.run
> -sha256
> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526
> LICENSE
> +sha256
> e28764cc5b13c32e76370513daeafc05c289b77ee0511552450f1a00e31ae1e3
> NVIDIA-Linux-x86_64-515.48.07.run
> +sha256
> 9ec1515cb214261ae4081a6fc9489800b5fef41c6a8d669e84e4ab1de7f3dc14
> NVIDIA-Linux-x86_64-515.48.07-no-compat32.run
> +sha256
> bd28b0c5aeeb00eb11d3ec6f6f3449d4b3a40100914258332734a53527997526
> LICENSE
> diff --git a/package/nvidia-driver/nvidia-driver.mk b/package/nvidia-
> driver/nvidia-driver.mk
> index 54c2aa46d8..d12fa543bd 100644
> --- a/package/nvidia-driver/nvidia-driver.mk
> +++ b/package/nvidia-driver/nvidia-driver.mk
> @@ -4,7 +4,7 @@
>  #
> 
> ##########################################################
> ######################
> 
> -NVIDIA_DRIVER_VERSION = 390.132
> +NVIDIA_DRIVER_VERSION = 515.48.07

I don't think the discussion has been had on the ML, but I know we've discussed in the IRC channel that there may be a need to duplicate the nvidia-driver package and differentiate between the latest production branch and the legacy branch.

It's my understanding the new production branch does not support older GPUs which have been historically used in embedded systems [1]

>  NVIDIA_DRIVER_SUFFIX = $(if $(BR2_x86_64),_64)
>  NVIDIA_DRIVER_SITE = http://download.nvidia.com/XFree86/Linux-
> x86$(NVIDIA_DRIVER_SUFFIX)/$(NVIDIA_DRIVER_VERSION)
>  NVIDIA_DRIVER_SOURCE = NVIDIA-Linux-x86$(NVIDIA_DRIVER_SUFFIX)-
> $(NVIDIA_DRIVER_VERSION)$(if $(BR2_x86_64),-no-compat32).run
> @@ -42,7 +42,7 @@ NVIDIA_DRIVER_PROVIDES += libgl libegl libgles
>  # So we only install the legacy library for now.
>  NVIDIA_DRIVER_LIBS_GL = \
>         libGLX.so.0 \
> -       libGL.so.$(NVIDIA_DRIVER_VERSION) \
> +       libGL.so.1.7.0 \
>         libGLX_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS_EGL = \
> @@ -57,11 +57,13 @@ NVIDIA_DRIVER_LIBS_GLES = \
>         libGLESv2_nvidia.so.$(NVIDIA_DRIVER_VERSION)
> 
>  NVIDIA_DRIVER_LIBS_MISC = \
> +       libnvidia-allocator.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-cfg.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-eglcore.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-egl-wayland.so.1.0.2 \
> +       libnvidia-egl-wayland.so.1.1.9 \
>         libnvidia-glcore.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-glsi.so.$(NVIDIA_DRIVER_VERSION) \
> -       tls/libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
> +       libnvidia-tls.so.$(NVIDIA_DRIVER_VERSION) \
>         libvdpau_nvidia.so.$(NVIDIA_DRIVER_VERSION):vdpau/ \
>         libnvidia-ml.so.$(NVIDIA_DRIVER_VERSION)
> 
> @@ -71,30 +73,19 @@ NVIDIA_DRIVER_LIBS += \
>         $(NVIDIA_DRIVER_LIBS_GLES) \
>         $(NVIDIA_DRIVER_LIBS_MISC)
> 
> -# Install the gl.pc file
> -define NVIDIA_DRIVER_INSTALL_GL_DEV
> -       $(INSTALL) -D -m 0644 $(@D)/libGL.la $(STAGING_DIR)/usr/lib/libGL.la
> -       $(SED) 's:__GENERATED_BY__:Buildroot:'
> $(STAGING_DIR)/usr/lib/libGL.la
> -       $(SED) 's:__LIBGL_PATH__:/usr/lib:' $(STAGING_DIR)/usr/lib/libGL.la
> -       $(SED) 's:-L[^[:space:]]\+::' $(STAGING_DIR)/usr/lib/libGL.la
> -       $(INSTALL) -D -m 0644 package/nvidia-driver/gl.pc
> $(STAGING_DIR)/usr/lib/pkgconfig/gl.pc
> -       $(INSTALL) -D -m 0644 package/nvidia-driver/egl.pc
> $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
> -endef
> -
>  # Those libraries are 'private' libraries requiring an agreement with
>  # NVidia to develop code for those libs. There seems to be no restriction
>  # on using those libraries (e.g. if the user has such an agreement, or
>  # wants to run a third-party program developed under such an agreement).
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_PRIVATE_LIBS),y)
>  NVIDIA_DRIVER_LIBS += \
> -       libnvidia-ifr.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-fbc.so.$(NVIDIA_DRIVER_VERSION)
>  endif
> 
>  # We refer to the destination path; the origin file has no directory
> component
>  NVIDIA_DRIVER_LIBS += \
>         nvidia_drv.so:xorg/modules/drivers/ \
> -       libglx.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensions/
> +
> libglxserver_nvidia.so.$(NVIDIA_DRIVER_VERSION):xorg/modules/extensio
> ns/
> 
>  # libglx needs a symlink according to the driver README. It has no SONAME
>  define NVIDIA_DRIVER_SYMLINK_LIBGLX
> @@ -109,7 +100,6 @@ NVIDIA_DRIVER_LIBS += \
>         libcuda.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-compiler.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvcuvid.so.$(NVIDIA_DRIVER_VERSION) \
> -       libnvidia-fatbinaryloader.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-ptxjitcompiler.so.$(NVIDIA_DRIVER_VERSION) \
>         libnvidia-encode.so.$(NVIDIA_DRIVER_VERSION)
>  ifeq ($(BR2_PACKAGE_NVIDIA_DRIVER_CUDA_PROGS),y)
> --
> 2.35.1

The installer framework for both drivers are similar and I have a branch languishing somewhere that abstracts this and replicates the C implementation in Python that works for the BR package(s). I need to find the time to update it and submit it.

> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> CAUTION: This email originated from outside of the organization. Do not click
> links or open attachments unless you recognize the sender and know the
> content is safe.

1: https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
