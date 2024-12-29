Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A881BE7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 14:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4978C60852;
	Sun, 29 Dec 2024 14:42:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ukixBAtlXyu; Sun, 29 Dec 2024 14:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BEAD607FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BEAD607FD;
	Sun, 29 Dec 2024 14:42:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 656D672
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52CBF607F7
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izix2YrXy2f5 for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 14:41:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8D35860783
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D35860783
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D35860783
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 14:41:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 299E119F5C6;
 Sun, 29 Dec 2024 15:41:52 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52662])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Dec 2024 15:41:52 +0100
MIME-Version: 1.0
Date: Sun, 29 Dec 2024 15:41:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241229093332.334759-1-thomas.petazzoni@bootlin.com>
References: <20241229093332.334759-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <4ec6a821a844d53ce68489983d4e4068@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735483313;
 bh=ZF/EQiOsm5AImamvbIoeN8jeexoeUlpjEKQIA+BDidM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ln1KJHtX0h1kQYlpcURTeIa+DcaBemNxp+r92jtoScvb2fWU2r/QWy0RFjliUmC1x
 HRGlU/H1Zm6GAiPqZxT/t4lArKaJxoi8pBft7+Sb1GO9/QmqRuFqG6wxeUESt/lZPn
 yNyHrB7sYVXH6aQR+KAkNULkyJevcpPyvWQgaOKk3OLUOxDYDCJhr+vbPzcMj8MSqO
 YiM6hWQUXYk9d2JKCu3KAwGns2kbWNDuf3mCyg3MThKUytkJF3fi/DI2HNOBjFHMgn
 vD7AiE7BPidetebktcppQsFuNbMcrmfJdQ8CRW93bpIFkbEqEbsOAMCau1kTNVA0BI
 scmwNHdg6i0YQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ln1KJHtX
Subject: Re: [Buildroot] [PATCH] linux: select
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when needed
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 29/12/2024 10:33, Thomas Petazzoni via buildroot wrote:
> The autobuilders are regularly reporting issues when building the
> Linux kernel due to BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL not being
> enabled.
> 
> Since the autobuilders are always using
> BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG, let's have this option
> select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL when the latest kernel is
> used.
> 
> For now, we enable this for ARC, Sparc and x86-64, but it might have
> to be extended for additional architectures based on build results.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/596699ede6e651163a23fa50386d84aca24c9a28
>   
> http://autobuild.buildroot.net/results/77a767bcd78f9ed21668cc268e91a4584a821661
>   
> http://autobuild.buildroot.net/results/e846d13c9f001b76a08ffb94f69c8dd26b4f5811
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  linux/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index be44c00d7d..50f1e31427 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -168,6 +168,12 @@ config BR2_LINUX_KERNEL_USE_DEFCONFIG
> 
>  config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
>  	bool "Use the architecture default configuration"
> +	# We know that the default configuration on some architectures
> +	# requires host-openssl, so select it for the latest kernel
> +	# version. This is mainly needed to fix autobuilder testing.
> +	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
> +	       BR2_LINUX_KERNEL_LATEST_VERSION && \
> +	       (BR2_arcle || BR2_arceb || BR2_sparc || BR2_x86_64)

While reviewing, I quickly tested with:

     cat <<EOF >.config
     BR2_x86_64=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
     BR2_TOOLCHAIN_EXTERNAL=y
     EOF
     make olddefconfig
     make

It failed with output:

     In file included from 
/buildroot/output/build/linux-6.12.5/tools/objtool/include/objtool/objtool.h:13,
                      from weak.c:10:
     
/buildroot/output/build/linux-6.12.5/tools/objtool/include/objtool/elf.h:10:10: 
fatal error: gelf.h: No such file or directory

This hints to a missing BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y.

Do you think we will need the same logic for other
BR2_LINUX_KERNEL_NEEDS_HOST_* configs? It is likely that autobuilder
will catch this kind of failures.

I was wondering if this logic will not become a bit complicated over
time (e.g. BR2_LINUX_KERNEL_NEEDS_HOST_PYTHON3 for aarch64, ...).
What do you think?

If you think this is OK, I'll apply this patch as is and we'll
update those conditions in future commits, when needed.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
