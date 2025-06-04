Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E791C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDC9583A63;
	Wed,  4 Jun 2025 18:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsttAGQ8hYoT; Wed,  4 Jun 2025 18:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E64F780E18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E64F780E18;
	Wed,  4 Jun 2025 18:22:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D9F4DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2361D60C14
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReZ3ZbplW1aM for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D5ED60C06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5ED60C06
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D5ED60C06
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:22:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B3F51C010A; Wed,  4 Jun 2025 20:22:50 +0200 (CEST)
Message-ID: <14cd5508-f803-48cc-8e30-42418f2e5cc2@rnout.be>
Date: Wed, 4 Jun 2025 20:22:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Karoly Kasza <kaszak@gmail.com>
References: <20250517191202.3477863-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250517191202.3477863-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YK/Jg0QEzI/Xv/rO4HEHeE0+VyxgMRBzrCTmzimIQzU=;
 b=nD6KZEnNMpzlypmldNX/NDivQX2pyqLgwRJw+yec/GpFbTzooTv+u1sUGNw+dOQC/Rp8DC
 sUHTyBKmvQ5SshSCNZuUXIrJCVMEPECg++13pZCLVpzPfDeI2URhfqQ04a/6A4RbdsP+zX
 2a7vLsvYQdMz6bAJ28GY8JzHEAbDBxQwa8wVN1IHdQ1t01YzWdR8B8iX+DKlyfoJWI63Mk
 0c0UipVGbZS6OQ78UCuBOJt43GT8sk+oriUW3mK99XPOu5pCuaNq9uKM+A9FmJqnSwfYRS
 x+tpsJnS6NE8YKYNSuyafRDrnCJwuEx26XR3J1yjmfpKgf7HihXc9QZNBhaPeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nD6KZEnN
Subject: Re: [Buildroot] [PATCH] package/openvmtools: needs libxcrypt with
 glibc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/05/2025 21:12, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/b3b66d7dff38ca6fb0be9a98d98db721ee98ef1b
> 
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> checking for crypt in -lcrypt... no
> configure: error: libcrypt not found. Please install the libc/libcrypt devel package(s).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/openvmtools/Config.in      | 1 +
>   package/openvmtools/openvmtools.mk | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
> index b62e5d0361..e6a2cd4a54 100644
> --- a/package/openvmtools/Config.in
> +++ b/package/openvmtools/Config.in
> @@ -16,6 +16,7 @@ config BR2_PACKAGE_OPENVMTOOLS
>   	select BR2_PACKAGE_LIBGLIB2
>   	select BR2_PACKAGE_LIBDNET
>   	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>   	help
>   	  Open Virtual Machine Tools for VMware guest OS
>   
> diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
> index 3106b9ecd6..a4ff1fd71a 100644
> --- a/package/openvmtools/openvmtools.mk
> +++ b/package/openvmtools/openvmtools.mk
> @@ -35,6 +35,10 @@ ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
>   OPENVMTOOLS_DEPENDENCIES += libtirpc
>   endif
>   
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +OPENVMTOOLS_DEPENDENCIES += libxcrypt
> +endif
> +
>   # When libfuse is available, openvmtools can build vmblock-fuse, so
>   # make sure that libfuse gets built first
>   ifeq ($(BR2_PACKAGE_LIBFUSE),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
