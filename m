Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE323C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63BB840A48;
	Wed,  7 Feb 2024 10:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BPLqPHOLK6hw; Wed,  7 Feb 2024 10:34:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 274A240A82
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 274A240A82;
	Wed,  7 Feb 2024 10:34:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 326B01BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FD7061340
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Z8187jOA5xN for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:34:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99AC960670
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99AC960670
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99AC960670
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:34:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3935E000B;
 Wed,  7 Feb 2024 10:34:02 +0000 (UTC)
Date: Wed, 7 Feb 2024 11:34:01 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240207113401.30235a22@windsurf>
In-Reply-To: <fc4857dac03f0017ce6dd7047225d8fade89c07f.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
 <fc4857dac03f0017ce6dd7047225d8fade89c07f.1706448055.git.yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707302043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vqz420dtbosojzP2eTWwbKGRTUpVE2qOKvOcic0Yb8U=;
 b=T20nsg63YTEkBF982Cr2Os77HnRpCnjVhMJDXK9UwPCY6HT3or7d3g7aygdDJEit0xla3P
 wYHz0ZoHs6xEtm1SnmXySsyCsyxpGv9+99bAikSjKMoJO13C7dbW5LEtduqna6xXXCL27w
 kRxIo1j3j7LDnsmgTmxAmGUc9AvxpRDZztKPui0b5qF7TCUoVbyZO2DsAE6Vy4YA/Vd+Tv
 WLutMg9kLJhsGyGsU/UTrUJ9wMycys0LMVktWstYw2Eyp24rH/ytKC7uQo8XaOS2x6Luuy
 jnUA+WCrY6SqDu17wWJ1VnRwsO1NxR713q0jUv5GHX3zTEf8DExK7iK3h5o+BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=T20nsg63
Subject: Re: [Buildroot] [PATCH 10/10] package/atkmm: propagate dependency
 from at-spi2-core
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
Cc: Daniel Lang <dalang@gmx.at>, James Knight <james.knight@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 28 Jan 2024 14:20:59 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 2c3ca7bea1de (package/atk: remove package) forgot to propagate to
> atkmm, the then just introduced dependency on !static from at-spi2-core,
> causing unmet dependencies warnings (unfortuantely, not errors), such
> as:
> 
>     $ KCONFIG_SEED=0xAFA763CA make randconfig
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_AT_SPI2_CORE
>       Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=y]
>       Selected by [y]:
>       - BR2_PACKAGE_ATKMM [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y]
> 
> Propagate the dependency now.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: James Knight <james.knight@collins.com>
> Cc: Daniel Lang <dalang@gmx.at>
> ---
>  package/atkmm/Config.in | 1 +
>  1 file changed, 1 insertion(+)

There's a patch at
https://patchwork.ozlabs.org/project/buildroot/patch/20230916154940.746749-1-fontaine.fabrice@gmail.com/
that propagates many more dependencies of at-spi2-core.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
