Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE07ECCD1BC
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A701F6147D;
	Wed, 22 Oct 2025 16:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8AWpQnMojuG; Wed, 22 Oct 2025 16:43:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FE0861481
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FE0861481;
	Wed, 22 Oct 2025 16:43:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ED4470A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FE4240CAE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpO9Dl4jfiSS for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CB15640C89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB15640C89
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB15640C89
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9D593B97918D; Wed, 22 Oct 2025 18:43:03 +0200 (CEST)
To: Baruch Siach <baruch@tkos.co.il>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:02 +0200
Message-ID: <20251022164302.286060-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <5ff528f1f4822ab5d2d0ea102bc7c44281026e14.1759924403.git.baruch@tkos.co.il>
References: <5ff528f1f4822ab5d2d0ea102bc7c44281026e14.1759924403.git.baruch@tkos.co.il>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151385; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=MiP/oDrZokecioVF3nzfmCanpXosuJgDqSyIcLM87dc=;
 b=hveL1WaIsxO6zb96okXB5TOKAhoT8RxuMg1vMLmG/wOxxUJeKbfXxI90i3u7pcosJ+rj0v
 AkWPPcXiKyfN7ApSpHIWR14u8vW6dnctpw8eE6zIdEFT376nLHt9bTb4gn4resrAP3rHda
 DApPL5pog19hEuF9rFSbr5Ci7fpgDUG7uu6CljtH0N7rMXaEFxrUcGx0pC6uO+W45kFx/H
 BXyE6GJsDJYhgrsTpJP+3y3WJHioB29Yjc/xNkTmbI0TLZP3IoFJw0mnNYMpb3+cxmKvgQ
 w6W46nsCTQphqybGvIeA35j5bqg3TzC5gP4GaHQmaanoad7W3Uj0EYzjhQs7LQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hveL1WaI
Subject: Re: [Buildroot] [PATCH] package/ebtables: disable sparc64 target
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Commit c5d6cde7b627 ("package/ebtables: remove KERNEL_64_USERSPACE_32
> workaround") fixed build with GCC 14 for when Buildroot
> BR2_KERNEL_64_USERLAND_32 is enabled. However, ebtables configure script
> enables its own KERNEL_64_USERSPACE_32 macro unconditionally for sparc64
> target, which triggers a similar build failure.
> 
> Disable sparc64 target for ebtables and its reverse dependency to avoid
> build failure.
> 
> Fixes:
> https://autobuild.buildroot.net/results/9a2510e0038cd13db8c3aac0122ea7a0f834fcd2/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/ebtables/Config.in | 1 +
>  package/libvirt/Config.in  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
> index ce5f67bc61f9..83337feec6c6 100644
> --- a/package/ebtables/Config.in
> +++ b/package/ebtables/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_EBTABLES
>  	depends on BR2_USE_MMU # fork()
>  	# https://lore.kernel.org/all/20210518181730.13436-1-patrickdepinguin@gmail.com/
>  	depends on !BR2_KERNEL_64_USERLAND_32
> +	depends on !BR2_sparc64 # int-conversion error
>  	help
>  	  Ethernet bridge frame table administration
>  
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index c55ab429ebc3..5664f69dd8d6 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -46,6 +46,7 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
>  	default y
>  	depends on BR2_INSTALL_LIBSTDCPP # nmap
>  	depends on !BR2_KERNEL_64_USERLAND_32 # ebtables
> +	depends on !BR2_sparc64 # ebtables
>  	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS # radvd -> libbsd
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	select BR2_PACKAGE_DNSMASQ
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
