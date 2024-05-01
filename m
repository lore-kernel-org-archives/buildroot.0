Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7A3C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D13240165;
	Wed,  1 May 2024 21:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XDtO6rw2QWE; Wed,  1 May 2024 21:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B0F1401D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B0F1401D8;
	Wed,  1 May 2024 21:13:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B08591BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D4C460805
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQABKMXBfJzM for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:13:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BCB26078C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BCB26078C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BCB26078C
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:13:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FC96FF804;
 Wed,  1 May 2024 21:13:47 +0000 (UTC)
Date: Wed, 1 May 2024 23:13:46 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240501231346.442f0182@windsurf>
In-Reply-To: <20240425195816.2758964-2-brandon.maier@collins.com>
References: <20240412210850.17265-1-brandon.maier@collins.com>
 <20240425195816.2758964-2-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714598028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVpHGBQjsWzVx1pu6qJjYvAxvbW5Rw2GkejT/t/Dbs0=;
 b=JkFh+npBq3+aWfhchc1xE6giyXX9qYovbO0Zlc2LhYhZQ0ePXbojZknaWtivpvVsHIj69g
 Wa2Q6UKT7NyEswpXIGj8r/eFr3lOgFhxC1ar0BVYSkQ2wqoCCyoiRi56KOR15kMGaKUgzg
 O9WDk+Y4CEaPOVI1hRHs//pA3iqZ3xb5qEb8C/CrgPWSBPyFOlTsjPd6m2BleI+PdO+eGa
 6DOrWWGFx+XtNrIpBBYey1u9kz9V8Xq8vJ8eMy4FlqhvYUIBa1KPIzHgsSvYCcpj5ad9Qh
 JxpVtm0XNF9DHSVpBxoqPc8xfC7ymv0JrYRD0qa+IEHApB3Bq1fAT45CFrZFKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JkFh+npB
Subject: Re: [Buildroot] [PATCH v2 2/4] package/bats-support: add bats
 support library
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Brandon,

Thanks for the patch!

Commit title should be:

	package/bats-support: new package

More comments below.

On Thu, 25 Apr 2024 19:58:14 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> This library provides support functions needed by the bats-assert and
> bats-file libraries.
> 
> This library does not provide an installer. Manually install the files
> under /usr/lib/bats/bats-support which is what the Arch Linux package
> does[1]. This makes the library loadable using `bats_load_library`[2].
> 
> [1] https://gitlab.archlinux.org/archlinux/packaging/packages/bats-support/-/blob/main/PKGBUILD?ref_type=heads
> [2] https://bats-core.readthedocs.io/en/stable/writing-tests.html#bats-load-library-load-system-wide-libraries
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
> Changes v1 -> v2:
> - fix older versions of `install` that don't support -D

Hu? We use the -D option of install everywhere in Buildroot. How can
your build work if you have a version of install that doesn't support
-D ?
> +define BATS_SUPPORT_INSTALL_TARGET_CMDS
> +	install -d -m 0755 $(TARGET_DIR)/usr/lib/bats/bats-support/src
> +	install -m 0644 $(@D)/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-support"
> +	install -m 0644 $(@D)/src/*.bash -t "$(TARGET_DIR)/usr/lib/bats/bats-support/src"

Use $(INSTALL) instead of install.

You can skip the double quotes around the file paths. We don't double
quotes the paths in any other Buildroot .mk file.

Also, -m 0644 is not consistent with how the files from bats-core are
installed:

$ ls -l output/target/usr/lib/bats-core/
total 68
-rwxr-xr-x. 1 thomas thomas  7988  1 mai   23:03 common.bash
-rwxr-xr-x. 1 thomas thomas  6058  1 mai   23:03 formatter.bash
-rwxr-xr-x. 1 thomas thomas   838  1 mai   23:03 preprocessing.bash
-rwxr-xr-x. 1 thomas thomas  3722  1 mai   23:03 semaphore.bash
-rwxr-xr-x. 1 thomas thomas 16483  1 mai   23:03 test_functions.bash
-rwxr-xr-x. 1 thomas thomas 14979  1 mai   23:03 tracing.bash
-rwxr-xr-x. 1 thomas thomas  1019  1 mai   23:03 validator.bash
-rwxr-xr-x. 1 thomas thomas  1900  1 mai   23:03 warnings.bash

They are installed 0755. Should we try to be consistent with this? Or
it doesn't make sense for a specific reason?

Also, while not mandatory at all, it would be nice to have small
runtime tests for these bats-* packages. Nothing fancy, just something
stupid/simple that exercises a bit those packages.

These comments apply in a completely identical way to the other 2
patches in this series.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
