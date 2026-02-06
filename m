Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC52DEE20AF
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 15:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FE05611E5;
	Fri,  6 Feb 2026 15:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Go8Za-8zgSGm; Fri,  6 Feb 2026 15:32:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D29A611D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770391968;
	bh=FlbY9OUAAZcBRuEQWGElQXyKekT+WJXJU0jzjmsdw8c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OAgo3yGdXvmiAPpbC3te7IodK8RZnPQ2XBr3NC0sdsvOLR62bAnqQ9wMtyS0DNCCy
	 HUUvo7jwi6nsYC/7fkIM9UC/obZjmwgF7f/GkiJxAvSEWD6xSANa9HNg8mCTy1f+Qq
	 HEo8MHF9umWX/W2RtTj4HyGQyP0Ft/NgEXoHMTNxmSPBCgCf0tDEO5r//uphrXXFrL
	 /uzaFCDetWmX+EwyKs1+22sAPBNx3FKTXQSdI3tmxdA6+E3RAvoQEjb4/qDaisYsRH
	 EuU1Q2dGwEISbWIaouZMjuN48yOSn2yc0/Myv0bJbkE4obuMj0fIxae6UYFMdDRVVR
	 p0O+aa/Qjr3yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D29A611D9;
	Fri,  6 Feb 2026 15:32:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 317E92EB
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 15:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22DF541AB7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 15:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tu0iqHM4WbPN for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 15:32:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2D0641A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2D0641A6E
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2D0641A6E
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 15:32:45 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-65808bb859cso3285434a12.2
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 07:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770391963; x=1770996763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z41aEc+B3HYyGGq2Nw/r+NtHuG6vy5yLJFvH2VtcRm4=;
 b=j66hzjJsYt8cDCr/B5u8wI9Ly8s6za9c2LWX6dqJQ2iWWbe68ghCOCvuCyXDAE5pvG
 bT41ePV5ilV7eE1HVUwEgoQuSx7WKhDxpNtTkChkTmRVsqBxuXzwk6pTXPaaT3UuN5OQ
 QZE0Nh4BIi1gfSMWZBU20coT/mGeevyrUxe21v7A7G0RQJJnj2Qt0vwyMatc86YkqRpA
 R2iQabqZCa0vtarzCAExlOkge2emKLhgghZUXuljSvLMCWRHI7vqlg7j+I6lnUKkvfP+
 zf7YpWb2aEvdKI0mMCCc3K8K8pk9whjOoGN0pdYyCuBa1SHZlmI5bRVQzmaykI2Z0jIH
 UFsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2bjy0A+MHdKVtcJNJINa2COnfyeh72xPrp4Bk5aGLUSq+SE6N3bSM6chbPhYeDfJqf7s2gYEh6/8=@buildroot.org
X-Gm-Message-State: AOJu0YzD+EDCqDP5MvFulKZLNafOWULU8QvEyVxQtQtciITQI3Rsr72a
 4ToQy7Myu4pg2tlIrMq3NLs8nMNhNnLf8XVGpwTvs9OLHlcbZMC2LlUVWx+4wVGvsOE=
X-Gm-Gg: AZuq6aLbnEjR0hiG3+4fIDiGfBE2kz6ACKIhWdfF3IvuLce14Fz7zmgvozuZ5csPo9H
 6rdqqTBRBszBnh1gdLCx50p+GifypV6XdIPt5rKVX58xq8Nb91ONpOOwTnCatDy490BkBS3GHID
 HqLO/lWIF9T2tSw/QZDeTrNQ/E6ItuwVv4fouXhTSLRjrtV/Gm9o5ls/X7+vppH2Vpq54xMrVeG
 vQ14HZk+U9eTgra93DFfiFrCzhTcgKm5FuGNwgdPbWLNrQf/dinzZIvpKIdfUiLP2OlTKzWeexM
 vec8rqx/viDAWCySYVdQnhQb3RpQy5Rtpaw+lkeDMNhO+Yn7F4A9njtRZ/nyXziMJq3WSWQgt3s
 URZRtfIWqMcW0zWjk1oHTYWaclBHX6iU6A1l1cOOjobkFkGX9odywbarRPGM9hUeoHm0w6Bir4n
 G9qTw=
X-Received: by 2002:a05:6402:2750:b0:658:d541:9675 with SMTP id
 4fb4d7f45d1cf-65984170c90mr1488575a12.18.1770391963024; 
 Fri, 06 Feb 2026 07:32:43 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65984019d78sm606541a12.25.2026.02.06.07.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 07:32:42 -0800 (PST)
To: Martin Bachmann <martin.bachmann@designwerk.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Martin Bark <martin@barkynet.com>, Richard Braun <rbraun@sceen.net>
Date: Fri,  6 Feb 2026 16:32:39 +0100
Message-ID: <20260206153239.190666-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <ZR0P278MB0869DAD9AF70390766B4C0318B66A@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
References: <ZR0P278MB0869DAD9AF70390766B4C0318B66A@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770391963; x=1770996763; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z41aEc+B3HYyGGq2Nw/r+NtHuG6vy5yLJFvH2VtcRm4=;
 b=ekdR0Td6N79CeAZmXjWdbz46qTEV6PvTU3mxCbmng3UaR3604+kbZNCxzFineSpCsu
 8RDlCy/lJyqKfadpT+uENgYa+duXKd9XFDQNaUUPziikEmryGIPYyPAsm13JE9U2Eger
 6LPvdzspMDe2abtMycJVYsP/tF4l0IXhW5oC36kZDawmwg7th7AYsZY1n9+TJZpMmi5C
 /uIu1p4FpF4qq0d6305HGy9nxP4yv1ZSJWED6B3ip1isPMIO2LvbIBa4Pp+np1uXrvlY
 YsDsTb8F5H5JFo/bhvwRycwROnwFoZ1c3uzUk0uIMYAT5ZSyAS1enXTBMlR2QzVmpdO7
 7new==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ekdR0Td6
Subject: Re: [Buildroot] [PATCH 1/1] Updating license information to comply
 with SPDX
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Martin,

Thanks for taking the time to look at this.

As a general remark I think the maintainers will ask you to split your changes
into a single commit per package.
The reason for this is not only aesthetic it allows the LTS maintainer to
Cherry pick the changes that are needed for the LTS branches more easily.

Another general remark would be to also provide a single explaination per
modification to explain your thought process. I understand that 'Public
License' is not a valid SPDX license but SPDX seems to provide multiple variant
of 'Public License' so why use the 'unlicense' one ?

I added some more comments below.

In reply of:
> From cbf5dd2b76ee68f2432f326c63807d1155d79e73 Mon Sep 17 00:00:00 2001
> From: Martin Bachmann <martin.bachmann@designwerk.com>
> Date: Fri, 6 Feb 2026 15:44:10 +0100
> Subject: [PATCH 1/1] Updating license information to comply with SPDX
> 
> Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>

> ---
>  package/dropbear/dropbear.mk     | 3 ++-
>  package/libmd/libmd.mk           | 3 ++-
>  package/mesa3d/mesa3d.mk         | 2 +-
>  package/python3/python3.mk       | 2 +-
>  package/tzdata/tzdata.mk         | 3 ++-
>  package/util-linux/util-linux.mk | 2 +-
>  6 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index e4e42cf994..ad0379e89a 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -7,7 +7,8 @@
>  DROPBEAR_VERSION = 2025.89
>  DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>  DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
> -DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
> +# Public Domain => unlicense - which is recognized by SPDX
> +DROPBEAR_LICENSE = MIT, BSD-2-Clause, unlicense
>  DROPBEAR_LICENSE_FILES = LICENSE
>  DROPBEAR_TARGET_BINS = dropbearkey dropbearconvert scp
>  DROPBEAR_PROGRAMS = dropbear $(DROPBEAR_TARGET_BINS)
> diff --git a/package/libmd/libmd.mk b/package/libmd/libmd.mk
> index 8bbebc1bf1..6942fd9d4b 100644
> --- a/package/libmd/libmd.mk
> +++ b/package/libmd/libmd.mk
> @@ -7,7 +7,8 @@
>  LIBMD_VERSION = 1.1.0
>  LIBMD_SOURCE = libmd-$(LIBMD_VERSION).tar.xz
>  LIBMD_SITE = https://archive.hadrons.org/software/libmd
> -LIBMD_LICENSE = BSD-2-Clause, BSD-3-Clause, Beerware, ISC, Public Domain
> +# Public Domain => unlicense - which is recognized by SPDX
> +LIBMD_LICENSE = BSD-2-Clause, BSD-3-Clause, Beerware, ISC, unlicense
>  LIBMD_LICENSE_FILES = COPYING
>  LIBMD_INSTALL_STAGING = YES
>  
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index b5300df2ba..db6217eae6 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -8,7 +8,7 @@
>  MESA3D_VERSION = 25.3.4
>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://archive.mesa3d.org
> -MESA3D_LICENSE = MIT, SGI, Khronos
> +MESA3D_LICENSE = MIT, SGI-B-2.0

What is the justification to drop the 'Khronos' part ?

>  MESA3D_LICENSE_FILES = \
>  	docs/license.rst \
>  	licenses/MIT \
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index a240349d3e..3ead191663 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -8,7 +8,7 @@ PYTHON3_VERSION_MAJOR = 3.14
>  PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
>  PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>  PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
> -PYTHON3_LICENSE = Python-2.0, others
> +PYTHON3_LICENSE = PSF-2.0

Why is the "others" part no longer needed ?

>  PYTHON3_LICENSE_FILES = LICENSE
>  PYTHON3_CPE_ID_VENDOR = python
>  PYTHON3_CPE_ID_PRODUCT = python
> diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
> index a7b6dd8f65..7220672992 100644
> --- a/package/tzdata/tzdata.mk
> +++ b/package/tzdata/tzdata.mk
> @@ -11,7 +11,8 @@ TZDATA_SELINUX_MODULES = tzdata
>  TZDATA_STRIP_COMPONENTS = 0
>  TZDATA_DEPENDENCIES = host-tzdata
>  HOST_TZDATA_DEPENDENCIES = host-zic
> -TZDATA_LICENSE = Public domain
> +# Public Domain => unlicense - which is recognized by SPDX
> +TZDATA_LICENSE = unlicense
>  TZDATA_LICENSE_FILES = LICENSE
>  
>  # Take care when re-ordering this list since this might break zone
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index af6044af32..7617041a46 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -21,7 +21,7 @@ UTIL_LINUX_LICENSE = \
>  	LGPL-2.1+ (libblkid, libfdisk, libmount), \
>  	BSD-3-Clause (libuuid), \
>  	BSD-2-Clause (xxhash), \
> -	ISC (rfkill) \
> +	ISC (rfkill), \

Good catch !

>  	MIT (hardlink, flock)
>  UTIL_LINUX_LICENSE_FILES = README.licensing \
>  	Documentation/licenses/COPYING.BSD-2-Clause \
> -- 
> 2.25.1

Thanks,
PERALE Thomas

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
