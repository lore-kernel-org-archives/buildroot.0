Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935C2C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 16:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FDA261273;
	Tue, 22 Mar 2022 16:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2XcjTcbX61wN; Tue, 22 Mar 2022 16:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D4F6126E;
	Tue, 22 Mar 2022 16:28:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6DE2E1BF357
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 16:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6896840587
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 16:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvVhumf9kMzQ for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 16:28:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A9E640494
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:28:29 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id k10so8592753edj.2
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 09:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=smv7OPyRtBmPwLbriJsnwLFUikrEx1GsuO3FdR2QXUs=;
 b=k776jBZ35i3e9KU5Yc6w1CxMfE5Vqn3drHlEBkukw9Av/9ANW+GUww8XGiaKUtdXlC
 JmTk5sYBbKF/hxByEGXo12nKzygry/qRRcDXbKWC5yXPU0h5h2+e0j5rdN+gCCpQqfva
 cGBCNHpjKPnAtObjyN6LP7VEPx+nCOANc6GQNkGX5dhSpmOWTcgEB2k136zYWBWHAom1
 EMKNmfTob5EXItzO36JINx9CFBbov3G3QN1uDjtEsMwDwAXK6MLj2j2ALIUhmE7YlecC
 KRm+Rbn8+gGGH2LeMHg0hAbfXhX2bD6mI3QcmDNLkkGPBeu8sDhTdQaFodgMRYqw+PZY
 L/VA==
X-Gm-Message-State: AOAM530ip/lbpNfLxWTqqcOfPGC2h8VjMqt8iy8qYolV8j+g/jc6TgT9
 +79ERA8bs4WxGu+XdKo/Bxw=
X-Google-Smtp-Source: ABdhPJx7oZujmLByxUoVEgNA0gEh8BCCwdDWnf59JlUstxs6Dcv/cDPf6s0LMExY0PFH8CV8YEwLHw==
X-Received: by 2002:a05:6402:3595:b0:419:336b:29e4 with SMTP id
 y21-20020a056402359500b00419336b29e4mr13370352edc.63.1647966506306; 
 Tue, 22 Mar 2022 09:28:26 -0700 (PDT)
Received: from localhost (tmo-098-218.customers.d1-online.com. [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id
 ji15-20020a170907980f00b006df87edf6ebsm8080852ejc.154.2022.03.22.09.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 09:28:25 -0700 (PDT)
Date: Tue, 22 Mar 2022 17:28:20 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Message-ID: <20220322172820.3d5763b9@tuxfamily.org>
In-Reply-To: <20220317223928.508338-1-fontaine.fabrice@gmail.com>
References: <20220317223928.508338-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: add s390x
 support
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
Cc: Cyril Bur <cyrilbur@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Thu, 17 Mar 2022 23:39:28 +0100
schrieb Fabrice Fontaine <fontaine.fabrice@gmail.com>:

> s390x is supported since
> https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/3934308046e5f113e19ed0ada002e2ec33335b8a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/kvm-unit-tests/Config.in         | 1 +
>  package/kvm-unit-tests/kvm-unit-tests.mk | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> index e470dd6157..a3d6756fb9 100644
> --- a/package/kvm-unit-tests/Config.in
> +++ b/package/kvm-unit-tests/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
>  		BR2_cortex_a17 || BR2_cortex_a17_a7
>  	default y if BR2_i386 || BR2_x86_64
>  	default y if BR2_powerpc64 || BR2_powerpc64le
> +	default y if BR2_s390x
>  
>  config BR2_PACKAGE_KVM_UNIT_TESTS
>  	bool "kvm-unit-tests"
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
> index d610442e03..2d05d08067 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> @@ -16,6 +16,8 @@ else ifeq ($(BR2_i386),y)
>  KVM_UNIT_TESTS_ARCH = i386
>  else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
>  KVM_UNIT_TESTS_ARCH = ppc64
> +else ifeq ($(BR2_s390x),y)
> +KVM_UNIT_TESTS_ARCH = s390x
>  else ifeq ($(BR2_x86_64),y)
>  KVM_UNIT_TESTS_ARCH = x86_64
>  endif

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
