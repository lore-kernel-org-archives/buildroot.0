Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D55DC52D7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 20:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F774400B5;
	Thu, 15 Aug 2024 20:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Awsh7yb7xFjX; Thu, 15 Aug 2024 20:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B497F40144
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B497F40144;
	Thu, 15 Aug 2024 20:37:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 275F91BF3F4
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 157D560ADB
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7i2qUNqnAGSs for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 20:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DADF06071E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DADF06071E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DADF06071E
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 20:37:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A59E413F879;
 Thu, 15 Aug 2024 22:37:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 15 Aug 2024 22:37:13 +0200
Date: Thu, 15 Aug 2024 22:37:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zr5m-WL2D41h8xqz@landeda>
References: <20240815202356.535066-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240815202356.535066-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723754238;
 bh=wEYhqdfzS1k/mluzP1tkbz+2RDG+wEnjpJ0VlVp25NA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=POdKwjp3dAVHYUNgXSgoeV5cR044+rhS+z91t6wdkQdDdGNpXgrtlXrLk49ppPhTg
 FRXA0kIoMKCEMKETsp+UMGywlIgp+bUPnvFBWbo62wG9YTRh+saTBxpPmg6BD2SE2R
 Bd6qPzS3JNIMRo46ViVj50kEP5kY3E0HWAVf81uP3edWhGLaYf8POP1U95gXmiYN3i
 T6RhkaxOIy9Ob8M/WWe68Pqe2y7+0Ro++3SAwdPug6wnJIGXKemdF2iRvoBTXozv2B
 eIXQyaDKYEfHFq4dHg3HfGPFKBsj7qCbU7vx9lZzU0oubI6idS3GQEM6/TbzowThtu
 qXkNCsjhIilGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=POdKwjp3
Subject: Re: [Buildroot] [PATCH] package/python-tpm2-pytss: add missing
 'depends on'
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-15 22:23 +0200, Thomas Petazzoni via buildroot spake thusly:
> In commit
> c72c6f26ed706474f6607f97be2925834c8baa03 ("package/python-tpm2-pytss:
> new package"), when the package was introduced, a dependency of a
> package being selected was not properly propagated:
> BR2_PACKAGE_PYTHON_CRYPTOGRAPHY depends on
> BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS, so we should replicate
> this dependency.
> 
> Fixes:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
>   Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_PYTHON_TPM2_PYTSS [=y] && BR2_PACKAGE_PYTHON3 [=y] && !BR2_STATIC_LIBS [=n]
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-tpm2-pytss/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-tpm2-pytss/Config.in b/package/python-tpm2-pytss/Config.in
> index 60d9e8b9d3..dec9a311d4 100644
> --- a/package/python-tpm2-pytss/Config.in
> +++ b/package/python-tpm2-pytss/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PYTHON_TPM2_PYTSS
>  	bool "python-tpm2-pytss"
>  	depends on !BR2_STATIC_LIBS # tpm2-tss
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
>  	select BR2_PACKAGE_PYTHON_ASN1CRYPTO # runtime
>  	select BR2_PACKAGE_PYTHON_CFFI # runtime
>  	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
> @@ -11,4 +12,5 @@ config BR2_PACKAGE_PYTHON_TPM2_PYTSS
>  	  https://github.com/tpm2-software/tpm2-pytss
>  
>  comment "python-tpm2-pytss needs a toolchain w/ dynamic library"
> +	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
>  	depends on BR2_STATIC_LIBS
> -- 
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
