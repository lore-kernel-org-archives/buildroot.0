Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82173C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 14:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43742400B9;
	Wed,  7 Feb 2024 14:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NRxKZ9O4f_-6; Wed,  7 Feb 2024 14:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2BFC404D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2BFC404D3;
	Wed,  7 Feb 2024 14:26:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BE4761BF276
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB4E760D76
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CgPF78_JzQw for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 14:26:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A195D60BC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A195D60BC1
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A195D60BC1
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:26:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8DDAC000B;
 Wed,  7 Feb 2024 14:26:44 +0000 (UTC)
Date: Wed, 7 Feb 2024 15:26:43 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207152643.1443c46a@windsurf>
In-Reply-To: <3afcc982685e876ac9b2ae54f86164647040ab85.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <3afcc982685e876ac9b2ae54f86164647040ab85.1706448055.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707316005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4QlelNf3Luvk9zQx5eQ764N8ABOnuE7BPuLQg7/AoOA=;
 b=FxNatshF/Fk+sYfO+4Ycm3/w9Uo3kSsB2SkOoL4zQK4uTB3UgOeYhScf0AJvf41J5ja9Bb
 MrXlx6OOsfRgqVjN1JHnCT+1w7TGLyYcYdftDOYjIjsUV1v9FklHlTLoBK14mZNwmNGL+K
 5j8Kv4LAagEpiIpaEKj5TswZ4T0GsFgcii5QCzneCS4aSOdt/ngeVMttHI9DyoHkfGR21U
 BIj6CxbGk8+nRFpLSK7wvvhJK2pal1uw0aJQh2NhuZsAtmx+TqFTxmHETsTMu/gsW+VfKc
 AocFMAwc0ddYBnQ5HhhUToJFXT3jix4tvyEvE+yIbg+sVJ1RiKFe5jRcgghkOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FxNatshF
Subject: Re: [Buildroot] [PATCH 07/10] package/python-ml-dtypes: propagate
 dependencies from numpy, pybind
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jan 2024 14:20:56 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit ebe47e7605c6 (package/python-ml-dtypes: new package) forgot to
> account for all the dependencies from python-pybind and python-numpy,
> causing unmet dependencies warnings (unfortunately, not errors), such
> as:
> 
>     $ KCONFIG_SEED=0x85C244F4 make randconfig
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_NUMPY
>       Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && BR2_INSTALL_LIBSTDCPP [=n] && (BR2_TOOLCHAIN_USES_GLIBC [=y] || BR2_TOOLCHAIN_USES_MUSL [=n]) && BR2_TOOLCHAIN_GCC_AT_LEAST_9 [=y]
>       Selected by [y]:
>       - BR2_PACKAGE_PYTHON_ML_DTYPES [=y] && BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && (BR2_TOOLCHAIN_USES_GLIBC [=y] || BR2_TOOLCHAIN_USES_MUSL [=n]) && BR2_TOOLCHAIN_GCC_AT_LEAST_9 [=y] && BR2_HOST_GCC_AT_LEAST_9 [=y]
> 
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_PYBIND
>       Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_INSTALL_LIBSTDCPP [=n]
>       Selected by [y]:
>       - BR2_PACKAGE_PYTHON_ML_DTYPES [=y] && BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS [=y] && (BR2_TOOLCHAIN_USES_GLIBC [=y] || BR2_TOOLCHAIN_USES_MUSL [=n]) && BR2_TOOLCHAIN_GCC_AT_LEAST_9 [=y] && BR2_HOST_GCC_AT_LEAST_9 [=y]
> 
> Propagate the C++ dependency from both numpy and pybind.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Julien Olivain <ju.o@free.fr>
> ---
>  package/python-ml-dtypes/Config.in | 1 +
>  1 file changed, 1 insertion(+)

This has already been fixed by
650c2b83b515bf6941189b837d87819a901ec901, which also added the
Config.in comment.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
