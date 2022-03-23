Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A51AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 10:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C2441910;
	Wed, 23 Mar 2022 10:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9zPn4VLOU9Z; Wed, 23 Mar 2022 10:15:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43C5641908;
	Wed, 23 Mar 2022 10:15:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE331BF59C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 10:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ECD941908
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 10:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZO_MSxquRZo for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 10:15:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96B8D41906
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 10:15:09 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id yy13so1847630ejb.2
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 03:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RiQOGRQmKNrHuj8v6wMvNG0KDxWgqV0Bg8jPHPJlkLk=;
 b=iSow0pRYMGS+uglIpk9D+BAAzmT+Y+E0ES6mIRxFFsDb7szMJ9X6YFDC0eSaLSCK9t
 KXf6Dc2xWjRpjKiIF91meF1g+jysI2jeIA65bCf7+0Hwxi1+5Oz0OQxzWVXqffvjMyLc
 zsgEqPQwUkhh1fHBPGP0VZy4PZVt9Beu8NJFcz/2n2dkm2QjlDaAhsjyTRQHEKcwo87v
 CyIgM2ju8l2RjuRx+F/ut8gYcdnocTXUdzP1MljE3vJx21nRrX6Ty63h7/KZy+qOnllg
 9vDqfahCPcKt26wH96DCekcsBFw86o8KA2EUwelukwP0dwJL3aK8p11qykpZeqp9egSi
 0tWg==
X-Gm-Message-State: AOAM532tJuAMVEDm1lhnZIxRIeRLIx46LTnO2pBY5JOTnvAHavJEw+ls
 3LQ+HpMZUKYp1rWt0Gd5V8g=
X-Google-Smtp-Source: ABdhPJxpoiACELaGRTaClEv5HVeDpyVY5jup7vKkfVTuaOeKZ7qzKfW35zlPOfOFAm+x/hMh9RQLMg==
X-Received: by 2002:a17:906:2403:b0:6d1:ca2:4da7 with SMTP id
 z3-20020a170906240300b006d10ca24da7mr29719625eja.533.1648030507715; 
 Wed, 23 Mar 2022 03:15:07 -0700 (PDT)
Received: from localhost (tmo-098-218.customers.d1-online.com. [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090672c400b006e0035654b0sm4281691ejl.84.2022.03.23.03.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 03:15:07 -0700 (PDT)
Date: Wed, 23 Mar 2022 11:15:05 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Cornelia Huck <cohuck@redhat.com>, buildroot@buildroot.org
Message-ID: <20220323111505.29ced52e@tuxfamily.org>
In-Reply-To: <20220322170800.1872403-1-cohuck@redhat.com>
References: <20220322170800.1872403-1-cohuck@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kvm-unit-tests: add more arm
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
Cc: Matt Weber <matthew.weber@collins.com>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Tue, 22 Mar 2022 18:08:00 +0100
schrieb Cornelia Huck <cohuck@redhat.com>:

> Add some more cortexes with VHE, and enable aarch64.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> Resent because I was subscribed with a different email address.
> Sorry about the spam.
> 
> ---
>  package/kvm-unit-tests/Config.in         | 5 ++++-
>  package/kvm-unit-tests/kvm-unit-tests.mk | 4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> index e470dd6157f0..b084375e62e9 100644
> --- a/package/kvm-unit-tests/Config.in
> +++ b/package/kvm-unit-tests/Config.in
> @@ -3,7 +3,10 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
>  	# On ARM, it uses virtualization extensions
>  	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
>  		BR2_cortex_a15 || BR2_cortex_a15_a7 || \
> -		BR2_cortex_a17 || BR2_cortex_a17_a7
> +		BR2_cortex_a17 || BR2_cortex_a17_a7 || \
> +		BR2_cortex_a55 || BR2_cortex_a75 || \
> +		BR2_cortex_a75_a55 || BR2_cortex_a76 || \
> +		BR2_cortex_a76_a55
>  	default y if BR2_i386 || BR2_x86_64
>  	default y if BR2_powerpc64 || BR2_powerpc64le
>  
> diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
> index d610442e039f..d72eba02bc3b 100644
> --- a/package/kvm-unit-tests/kvm-unit-tests.mk
> +++ b/package/kvm-unit-tests/kvm-unit-tests.mk
> @@ -10,7 +10,9 @@ KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive
>  KVM_UNIT_TESTS_LICENSE = LGPL-2.0
>  KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
>  
> -ifeq ($(BR2_arm),y)
> +ifeq ($(BR2_aarch64),y)
> +KVM_UNIT_TESTS_ARCH = aarch64
> +else ifeq ($(BR2_arm),y)
>  KVM_UNIT_TESTS_ARCH = arm
>  else ifeq ($(BR2_i386),y)
>  KVM_UNIT_TESTS_ARCH = i386

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

Note: This will likely have a contextual conflict with :

 https://lists.buildroot.org/pipermail/buildroot/2022-March/638940.html

... but I hope this will easy to sort out.

 Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
