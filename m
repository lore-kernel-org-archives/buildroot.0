Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66256C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F2C940363;
	Wed,  7 Feb 2024 11:50:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVqjqrqgdO74; Wed,  7 Feb 2024 11:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 327D9404D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 327D9404D9;
	Wed,  7 Feb 2024 11:50:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 348281BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2212781769
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:50:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PGKDvSVv05Y4 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F341A80F16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F341A80F16
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F341A80F16
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:50:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8FDC1C0002;
 Wed,  7 Feb 2024 11:50:42 +0000 (UTC)
Date: Wed, 7 Feb 2024 12:50:41 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240207125041.175fb99a@windsurf>
In-Reply-To: <20240118220422.167000-1-fontaine.fabrice@gmail.com>
References: <20240118220422.167000-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707306643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbEVj+pJjyQF0byfpQIMtpa0wj0p75mFLb5DauV53uE=;
 b=ZQBr5SmwMAjLiQ27mNBNHDkxr0eSUvzuA2YFFgrbYfofBnIC3SCygDVB+fK8hNCsnkxPg3
 gy6wevcxfaoGNkRrmFDa7a++xlbqA3GrZuyvUHzEPBeZVcHNKjzoeU345Fc8uVO7ip7zXd
 4mhpddHFPlPqJwRj+s8rCOaJFyGqmqrZXc3URkvWVH+iuaGM70OVrlQ0Z6lKbV4Q3rUgSC
 CyIwhVLIQhlmpvNjYFo9bEzU9wSy5YyJ0ifzYJUhtMsy4dtFXNs7KIVP5ZEkU47oAtPQ14
 3fjfPW/W5azKx283PB9FW//18I3s9NmhqCUQPMW/OXED6bkWYwDQ7mBeXD/fBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZQBr5Smw
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: propagate libabseil-cpp
 dependencies
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
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 18 Jan 2024 23:04:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit fc7606010e4edde7a34c545fac0fe7f82d4a5e18 forgot to propagate
> libabseil-cpp dependencies to re2
> 
> Fixes:
>  - No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt5/qt5webengine/Config.in | 7 +++++--
>  package/re2/Config.in              | 7 +++++--
>  2 files changed, 10 insertions(+), 4 deletions(-)

I updated the package/grpc/Config.in package, as Yann did in his patch.

> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index cfa5893f41..49c9d0e450 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -10,11 +10,12 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	depends on !BR2_BINFMT_FLAT # qt5base-icu
>  	depends on BR2_USE_MMU # libglib2, qt5base-dbus
>  
> -comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, threads, wchar"
> +comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, dynamic library, threads, wchar"
>  	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS

This should have gone into BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS, so I
moved it there.

Thanks, applied with those two changes!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
