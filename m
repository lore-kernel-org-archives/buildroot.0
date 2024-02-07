Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C338C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7F0140338;
	Wed,  7 Feb 2024 11:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zHpsVx0nf7Sx; Wed,  7 Feb 2024 11:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0FDF4033B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0FDF4033B;
	Wed,  7 Feb 2024 11:50:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B595C1BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2AE0814C1
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:50:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJxtVmMckVlr for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:50:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C0A680A7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C0A680A7C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C0A680A7C
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:50:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4E28F60003;
 Wed,  7 Feb 2024 11:50:08 +0000 (UTC)
Date: Wed, 7 Feb 2024 12:50:06 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207125006.27c84c03@windsurf>
In-Reply-To: <afdc6d0fddd8f45aea24b544612a680bfa241475.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <afdc6d0fddd8f45aea24b544612a680bfa241475.1706448055.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707306608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Owj4LX56qzrsshFLsfKi1duwQW+/yAbNs1Llqfgb//I=;
 b=LI1QJZgnST//Va6glNooNVjGNJ42jIR9ILcmQpiLo0GrMFuVCL0rufAkE90GDOUIrQpV28
 vBWxYnI9RglOKbG1LLMmH1e5PNcYFLW05HYsULNskR2cDALrMu4DGuSOklNf45AsUnv/7B
 SX/xvwaMm1tS6SuET20TBlavVlQuGvGc37T0/vwPJqiVYY0GicEimf9Ux49APpsNNT3kYG
 Icm6ZUpCv+VLfqzIBcAmK4X1uKYKIZWSmFIIRq/uYCuAx72YMkisPwQxWDgTNvCQpzhQbu
 lqI/yluUSXsoHobA4rXmkRVuMtwR+8ZitPE3U2a2V+70crd5rkgjUOCiCdviWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LI1QJZgn
Subject: Re: [Buildroot] [PATCH 04/10] package/re2: propagate dependencies
 from libabseil-cpp
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jan 2024 14:20:53 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit fc7606010e4e (package/re2: bump to version 2023.11.01) forgot to
> propagate the arch dependency from libabsel-cpp to re2, and transitively
> to its dependees, causing unmet dependencies warnings (unfortunately,
> not errors), such as:
> 
>     $ KCONFIG_SEED=0xCCB17344 make randconfig
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBABSEIL_CPP
>       Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n] && BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS [=n]
>       Selected by [y]:
>       - BR2_PACKAGE_RE2 [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]
> 
> Fix that, and propagate the dependency.
> 
> Note that qt5webengine depends on glibc, so that implies !static
> already.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Michael Nosthoff <buildroot@heine.tech>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/grpc/Config.in             | 2 +-
>  package/qt5/qt5webengine/Config.in | 1 +
>  package/re2/Config.in              | 8 ++++++--
>  3 files changed, 8 insertions(+), 3 deletions(-)

There was already a previous patch from Fabrice to fix this, so I
applied his patch
https://patchwork.ozlabs.org/project/buildroot/patch/20240118220422.167000-1-fontaine.fabrice@gmail.com/,
with some edits.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
