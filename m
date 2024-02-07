Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F5BC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 14:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 375ED4051A;
	Wed,  7 Feb 2024 14:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ut8kpr5fRF7N; Wed,  7 Feb 2024 14:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCADA400B9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCADA400B9;
	Wed,  7 Feb 2024 14:25:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 632FB1BF276
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50D8F40985
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9gMG46SGlRe for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 14:25:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33E5A40933
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33E5A40933
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33E5A40933
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:25:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2023720002;
 Wed,  7 Feb 2024 14:25:51 +0000 (UTC)
Date: Wed, 7 Feb 2024 15:25:49 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207152549.767b3a75@windsurf>
In-Reply-To: <7a6ed8af0a4692069c8b146c6b14647db89c9d23.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <7a6ed8af0a4692069c8b146c6b14647db89c9d23.1706448055.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707315951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XSSkhfJhH2N4f+OCyrppOEIL+slIQHiqIhBxdlLFpNc=;
 b=ECUm4gR/uRiL5ykRJpphliyjhrekb2xxrs8AD+Ug8ypEc/6Ja1dwsog9/G0JqXSPIXVig7
 Hkm3Yq1HSbtPMDJJ5hQBQB2z85PjgP9c+DfMIhv91lPW32XTVqnq27DkXcKnWXCJ4XZrNL
 JvtkLvwahVb+exkJIoW5hAAh7YRDtow0xWuuphH6aaFQF1bIB5z03KMN+fPfFQtnu2t2d1
 aWTVbQ44UI4GhSA7lH3gMB3JOrSXRD+83PuFfyc+soNE/o4fPvxdRAVvG/AV+jNg9vsXrd
 E45kPoee8/QAzhxd/SzIDrSIQkHn/fz2Y2/wKIsvw/OZLriiOHhhsUpwQNvImg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ECUm4gR/
Subject: Re: [Buildroot] [PATCH 06/10] package/petitboot: propagate
 depednencies from kexec/kexec-lite
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
Cc: Julien Olivain <ju.o@free.fr>, Laurent Vivier <laurent@vivier.eu>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jan 2024 14:20:55 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 719921bebe17 (package/kexec: bump to version 2.0.27) forgot to
> propagate the new dependency on kernel headers to petitboot, which may
> select kexec, causing unmet dependencies warnings (unfortunately, not
> errors), such as;
> 
>     $ KCONFIG_SEED=0x84462FFC make randconfig
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_KEXEC
>       Depends on [n]: BR2_PACKAGE_KEXEC_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=n]
>       Selected by [y]:
>       - BR2_PACKAGE_PETITBOOT [=y] && (BR2_PACKAGE_KEXEC_ARCH_SUPPORTS [=y] || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS [=n]) && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_PACKAGE_HAS_UDEV [=y] && !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS [=n]
> 
> Propagate the dependency from kexec, and add comments about dependencies
> also inherited from kexec-lite.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Julien Olivain <ju.o@free.fr>
> ---
>  package/petitboot/Config.in | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
