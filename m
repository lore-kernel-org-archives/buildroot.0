Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD060C77B75
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 05:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA2360EEF;
	Wed, 17 May 2023 05:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CA2360EEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETG5kAxOtCnT; Wed, 17 May 2023 05:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B00B610F4;
	Wed, 17 May 2023 05:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B00B610F4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A51CC1BF83A
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 05:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7851F4011A
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 05:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7851F4011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h3QU-4cUXxcj for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 05:18:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80ABD40105
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80ABD40105
 for <buildroot@buildroot.org>; Wed, 17 May 2023 05:18:07 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4efd6e26585so444388e87.1
 for <buildroot@buildroot.org>; Tue, 16 May 2023 22:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684300685; x=1686892685;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hiTF+8lOZVZadGq1E6pFASP6NjJ+lXH7eI5KN1qMyGw=;
 b=agZP0dRHLjN51v2bFihVGajHLe3RWVdJg/uFKk9pySWqeTBVbwS2ldJ+h9B5Q0HI21
 OcLPq4wdMCPDa21WPdy/4l5Tv/mEPJP2HuXuEXkd5wvKwP+CbBmkJnxtKtACgUJSmg0W
 UqUQhkesia7SU6OWCfQu7EfTXCZ5z0wb5FM6Pnwm1h6gyL3DwH17DmXyGkrNVGE3IqTa
 M27B4oIzCz4rinrSv5T0sLKdmZHjS3UWh6yetGeU1jlUe8EM4EMdCHYafVrR9TMoze6p
 VuHqm8LPQLx14EdvjJNjzZLCK+fLdQsR7iNrUa4bweQoKHN7pvwCgLxNKMPVCAZ/Wr/k
 e2sQ==
X-Gm-Message-State: AC+VfDwz56wLPFXSWSXazYvsFD7eI3Sh0Y39A6J0bBu/I93WnUseUyUk
 /tLArqKA9xMmviVLF2uUV9M=
X-Google-Smtp-Source: ACHHUZ7uWLasgg+9uJun/YLAzG8ZxdCyMV1O2Q3qujWsBZOi4eKl2c0b9NIVv1OoYmVjQ4LR0VIvmw==
X-Received: by 2002:a05:6512:507:b0:4f1:4fe6:56c8 with SMTP id
 o7-20020a056512050700b004f14fe656c8mr8434747lfb.34.1684300684961; 
 Tue, 16 May 2023 22:18:04 -0700 (PDT)
Received: from gimli ([2001:9b0:21e:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a197414000000b004f252003071sm3196638lfe.37.2023.05.16.22.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 22:18:04 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>,
 buildroot@buildroot.org
In-Reply-To: <20230512002511.1356447-2-christian@aperture.us>
References: <20230512002511.1356447-1-christian@aperture.us>
 <20230512002511.1356447-2-christian@aperture.us>
Date: Wed, 17 May 2023 07:18:03 +0200
Message-ID: <86h6sbtu2c.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684300685; x=1686892685;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=hiTF+8lOZVZadGq1E6pFASP6NjJ+lXH7eI5KN1qMyGw=;
 b=DpXLsVumbF8FQRnDhSmF7h/Dpp4swsA7uVuuTSvD28a0eK7Sl+C9vKnRjTIDsVp9y7
 OQJF9uz1oz5WoroUS3eEExhEOAUyirvpYka8l2QYyI0Twfeu2WrM7fhGEYa0EBaQK/YK
 /K6xaJy9Plb9EjbGqGsGOp8ZNV1WfCwC3GMxym1tJEZfVRcl9BdC6j8WyhKZO1rDsEf2
 mNeQsl2RWXWtJQzpSq7tqxayMVgaH9vpRfHfl29R+tks2NDud7hdIj9OVwSl+Cn7IQpy
 PnEZF6QJant/cSC9v8R8VDRPZSudeNca2YUpfhw7q+Qm+zfQUELOXT0dNsG366AkMgNx
 LFdw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DpXLsVum
Subject: Re: [Buildroot] [PATCH v2 2/2] package/podman: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hi,

even quicker review from minor things I noticed:

On Thu, May 11, 2023 at 17:25, Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
> [snip]
>  package/Config.in                     |  1 +
>  package/podman/Config.in              | 55 +++++++++++++++++++
>  package/podman/containers-policy.json | 14 +++++
>  package/podman/podman.hash            |  3 ++
>  package/podman/podman.mk              | 77 +++++++++++++++++++++++++++

You forgot to update the DEVELOPERS file with your new package.

> [snip]
> diff --git a/package/podman/Config.in b/package/podman/Config.in
> new file mode 100644
> index 0000000000..f23435621a
> --- /dev/null
> +++ b/package/podman/Config.in
> @@ -0,0 +1,55 @@
> +config BR2_PACKAGE_PODMAN
> +	bool "podman"
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
> +	depends on BR2_USE_MMU # libgpgme
> +	select BR2_PACKAGE_CATATONIT

Noob question, is CATATONIT really a dependency?  I thought it was only
needed/recommended when composing a new container.

> +	select BR2_PACKAGE_CNI_PLUGINS
> +	select BR2_PACKAGE_CONMON
> +	select BR2_PACKAGE_CNI_PLUGINS

Duplicate

> +	select BR2_PACKAGE_CRUN
> +	select BR2_PACKAGE_IPTABLES

Not sure, but for container networking we also need BRIDGE_UTILS, right?

> +	select BR2_PACKAGE_LIBGPGME

For rootless support, isn't SHADOW + SHADOW_SUBORDINATE_IDS and
SLIRP4NETNS required?

CGROUPFS_MOUNT is probably needed for non-systemd builds.

CA_CERTIFICATES is needed for https pull.


Best regards
 /Joachim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
