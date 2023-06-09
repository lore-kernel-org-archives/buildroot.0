Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACCEC7EE25
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 19:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B87FD41F52;
	Fri,  9 Jun 2023 19:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B87FD41F52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ni1VMNG1KsuL; Fri,  9 Jun 2023 19:05:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A628741F49;
	Fri,  9 Jun 2023 19:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A628741F49
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA4A91BF419
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 19:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B204041F49
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 19:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B204041F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAFWBslRanrA for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 19:05:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 322CF41F47
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 322CF41F47
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 19:05:08 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f61b45ee0dso2700864e87.0
 for <buildroot@buildroot.org>; Fri, 09 Jun 2023 12:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686337506; x=1688929506;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PVI/pJSXkFm508SWPMkWZornajQmgjo4ZD14mUdTjEg=;
 b=AUQN3w3yROhCe5zxY3vHm21zQ2WyUBbhhH8mA6ZcsbRWwXYW5P/U4eHauBu3YQIN2T
 bmn4RAYMECFePdqRu+AK4iBQgbX8ZmKTnpaiL76utp1A8h/jMSPAIeWiiow+Yg5AN8bo
 EYDkxfYqUrtENuILRbJ4JnzK6EMYxPR60i7ref9gIa66ijRb+N1DpIFhnBxfc+F81PL+
 6Mw6ycpuPb1n8G4UyFFBJDOz2m+xBV2SKGnnx9DrdxgwPmvMYMbAvtRfhhnzKdtEQtyU
 aDzIw2sI4NCXx3CGValTdU4Cay+zP/cA7TKGN0ijx2vQ1k2RQErbC3s/Lh6loRS3dQTp
 yPxg==
X-Gm-Message-State: AC+VfDx8u8MPs1aDugTp9lm1HW4+JIonU3QbaxUyV7NcolF5u9NRKk5v
 1eG5Pqu4T9GRzcGC83xPFrU=
X-Google-Smtp-Source: ACHHUZ7+fuA7I8M1npz6wIQeeeIzP/3go+0AEK3QU0RVmPtfYQmilh5tEz80ywcCdFS1VItTcdqNQA==
X-Received: by 2002:a19:8c4a:0:b0:4f4:cac3:693f with SMTP id
 i10-20020a198c4a000000b004f4cac3693fmr1721533lfj.12.1686337505196; 
 Fri, 09 Jun 2023 12:05:05 -0700 (PDT)
Received: from hs ([213.87.133.65]) by smtp.gmail.com with ESMTPSA id
 r23-20020ac252b7000000b004f2ce4b0f2esm630125lfm.168.2023.06.09.12.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 12:05:04 -0700 (PDT)
Date: Fri, 9 Jun 2023 22:05:02 +0300
From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
To: =?iso-8859-1?Q?Jos=E9?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <ZIN33i5P-uTd5O3M@hs>
References: <20230608175538.1347170-1-salvador.joseluis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230608175538.1347170-1-salvador.joseluis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686337506; x=1688929506;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PVI/pJSXkFm508SWPMkWZornajQmgjo4ZD14mUdTjEg=;
 b=KCFQukeLYfyTLq85w78MW+BGzJgir8w3WsIKBnUxnKn0Cuj4jUgCVYfHTdAZEUPAtx
 Geg9eoXA4rupHcUkQPRl61GWSFdd4XMT4QK5uXzuR0W5Ijnkwv8VwiAVvw8/JJGLOIa/
 Qs2bFRp4EBnHuv0O44mGiraRQtnCQWjhGX/PX6Gpz5l7Pf19AjA+O+dpJIEgaDcWjnbP
 o/NLxuSFf+F6mSEDCKhTkn6UcuVRck26XbDhLRsgQE14uMDD8XV+kOIGKsb6wvqLxBhM
 taeHkt0HdwxPKeE7pa8OO3AEDGGH7uEqGgRyPWBLyGolRXed0tfo1c0mHUV5wE/5iHmN
 4TPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=KCFQukeL
Subject: Re: [Buildroot] [PATCH] package/zfs: fix autotools crosscompilations
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
Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jos=E9,

I am glad to confirm that your patch fixes the issue. Tested on:

Host:
Debian 11.7 x86-64

Toolchains:
x86-64--glibc--bleeding-edge-2022.08
armv6-eabihf--glibc--bleeding-edge-2022.08

Thank you!

-- =

Alexander.

On Thu, Jun 08, 2023 at 07:55:38PM +0200, Jos=E9 Luis Salvador Rufo wrote:
> Signed-off-by: Jos=E9 Luis Salvador Rufo <salvador.joseluis@gmail.com>
> ---
>  package/zfs/zfs.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> =

> diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
> index 97e9442cf8..e99413e611 100644
> --- a/package/zfs/zfs.mk
> +++ b/package/zfs/zfs.mk
> @@ -58,6 +58,14 @@ else
>  ZFS_CONF_OPTS +=3D --disable-pam
>  endif
>  =

> +# Sets the environment for the `make` that will be run ZFS autotools che=
cks.
> +ZFS_CONF_ENV +=3D \
> +	ARCH=3D$(KERNEL_ARCH) \
> +	CROSS_COMPILE=3D"$(TARGET_CROSS)"
> +ZFS_MAKE_ENV +=3D \
> +	ARCH=3D$(KERNEL_ARCH) \
> +	CROSS_COMPILE=3D"$(TARGET_CROSS)"
> +
>  # ZFS userland tools are unfunctional without the Linux kernel modules.
>  ZFS_MODULE_SUBDIRS =3D \
>  	module/avl \
> -- =

> 2.41.0
> =

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
