Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A02C77B7A
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 05:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AE1F605BA;
	Wed, 17 May 2023 05:08:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AE1F605BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwAmpuLDQupa; Wed, 17 May 2023 05:08:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D14316FE6F;
	Wed, 17 May 2023 05:08:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D14316FE6F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 766151BF83A
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 05:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E0754040B
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 05:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E0754040B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXMoYgdesROW for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 05:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45DE403EC
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D45DE403EC
 for <buildroot@buildroot.org>; Wed, 17 May 2023 05:08:18 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f38bea8be8so7236320e87.0
 for <buildroot@buildroot.org>; Tue, 16 May 2023 22:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684300096; x=1686892096;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2RqYBqeTJSspjPwgsGgXriEDiXf22WMCILwm7cadNYc=;
 b=axM5TpRO+wuRr3TMqpM7Pc8QPUZqOH0t3UnVcdEFFi3BgKZ/zBCbcxGbA8Xf7FbtUd
 cwjhtKS68bmqgKc56p+m8feImHvn22Ks60cvV8CwaV959VxCIkFry0o26P2tYi7ZSjOy
 XF0Npuq+q1LwhOYddCo/8TIrcpMCBXUnltsS+o1bMLODQyeMbje1DFqNAAg9r9a3VCL3
 kZTdKolINixJlmjBtSut+FCuIN5oQC9cZz2pSXtBUYDNl84IQvQhCjIaAbVC+9jzfc78
 Ct3sACR8tZm9nYnxpcYYSmr5JXXva8Zwvy3+Oskb+DG5+hq/zfoXWNylf9O+LXN+Op/V
 zd/A==
X-Gm-Message-State: AC+VfDwx9BqE4wsKWhLv1RRTMJSRLyxeym3lxH/dcKmWEi67R6TH0BmU
 XoUjqRlssd8FXNj0uRtU+F8=
X-Google-Smtp-Source: ACHHUZ6TR1e8C4fbPDp8245TcOexlTILuNCBqqb+dWS+f0QZXXjSLpY+XbGXHhE0poOmiZJ7YAuKpQ==
X-Received: by 2002:a05:6512:31ce:b0:4f0:3e1:9ada with SMTP id
 j14-20020a05651231ce00b004f003e19adamr280749lfe.31.1684300096155; 
 Tue, 16 May 2023 22:08:16 -0700 (PDT)
Received: from gimli ([2001:9b0:21e:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b004efd57ba3d1sm3192573lfq.57.2023.05.16.22.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 22:08:15 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: Christian Stewart via buildroot <buildroot@buildroot.org>,
 buildroot@buildroot.org
In-Reply-To: <20230512002511.1356447-1-christian@aperture.us>
References: <20230512002511.1356447-1-christian@aperture.us>
Date: Wed, 17 May 2023 07:08:14 +0200
Message-ID: <86mt23tuip.fsf@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684300096; x=1686892096;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=2RqYBqeTJSspjPwgsGgXriEDiXf22WMCILwm7cadNYc=;
 b=BOMdcac6+quyci/8S2RGzq3+nuKk17+JMwpPmbielut0es9yfWfeYYgPVMsxlv8rqm
 ifulhgxZ1LVk2ckYvdGUNj7dc5GucRXhascMjqH2IvQtjQlLfxh4ebQM1v4ZtDfjyvdR
 dUQSUd9Vp8KYHoU3hM5Ii1r5KuJt6dmoCcRJy7mMPI6PNSa18+zNP1h37g29qLgJQyZ8
 7F0zfD/AxPa7G6Qv3PK67mczZ0ltjiJ0oXfs2GtN2tUcXj5sm02uTh9ukTwRy8bMFRKc
 vg5WWGm4A+TEbslTCXcv/O7HHcM/f7Wj6q9bjLJOS+kTXDR9pi0tCHoHQerGFIkOK48M
 4Tfw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BOMdcac6
Subject: Re: [Buildroot] [PATCH v2 1/2] package/conmon: new package
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


Hi!

Here's a very quick review while trying out your patch to get podman
running.  Only a cursory glance, have not run check-package.

On Thu, May 11, 2023 at 17:25, Christian Stewart via buildroot <buildroot@buildroot.org> wrote:
> [snip]
> diff --git a/package/conmon/Config.in b/package/conmon/Config.in
> new file mode 100644
> index 0000000000..c4b428a541
> --- /dev/null
> +++ b/package/conmon/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_CONMON
> +	bool "conmon"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve

Shouldn't there also be a select BR2_PACKAGE_LIBGLIB2 here as well?

> +	help
> +	  Conmon is an OCI container runtime monitor.
> +
> +	  https://github.com/containers/conmon
> +
> +comment "conmon needs a glibc or musl toolchain w/ threads, wchar"
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_TOOLCHAIN_USES_UCLIBC
> +	depends on BR2_USE_MMU
> diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
> new file mode 100644
> index 0000000000..cda059042a
> --- /dev/null
> +++ b/package/conmon/conmon.mk
> @@ -0,0 +1,36 @@
> +################################################################################
> +#
> +# conmon
> +#
> +################################################################################
> +
> +CONMON_VERSION = 2.1.7
> +CONMON_SITE = $(call github,containers,conmon,v$(CONMON_VERSION))
> +CONMON_LICENSE = Apache-2.0
> +CONMON_LICENSE_FILES = LICENSE
> +
> +CONMON_DEPENDENCIES += host-pkgconf libglib2

The libglib2 dependency is listed here, so Config.in should select it, right?

> +
> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
> +CONMON_ENABLE_SECCOMP = 1
> +CONMON_DEPENDENCIES += libseccomp
> +else
> +CONMON_ENABLE_SECCOMP = 0
> +endif

Should be 0, 1 here, because 'echo 0' below enable LIBSECCOMP in conmon.

> +define CONMON_CONFIGURE_CMDS
> +	printf '#!/bin/bash\necho "$(CONMON_ENABLE_SECCOMP)"\n' > \
> +		$(@D)/hack/seccomp-notify.sh
> +	chmod +x $(@D)/hack/seccomp-notify.sh
> +endef

Best regards
 /Joachim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
