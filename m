Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB377C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DEB54097F;
	Sun, 12 Mar 2023 22:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DEB54097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XAklzMKn7V7d; Sun, 12 Mar 2023 22:04:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C74940981;
	Sun, 12 Mar 2023 22:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C74940981
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA3E81BF868
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79E95819D1
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79E95819D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrYs5Ev6K0RZ for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:04:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AD52819F5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AD52819F5
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:04:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2B15CE0004;
 Sun, 12 Mar 2023 22:04:03 +0000 (UTC)
Date: Sun, 12 Mar 2023 23:04:02 +0100
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230312230402.50be40b1@windsurf>
In-Reply-To: <20230215073256.186476-3-christian@paral.in>
References: <20230215073256.186476-1-christian@paral.in>
 <20230215073256.186476-3-christian@paral.in>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678658643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eTbc2qgtP3bxPJgUynnSjVDXVvMPqllSrloYvF1w9AM=;
 b=HvM8Mg7hvms79ASbgLQDbg3Mljc1/1Rq7mrprr+jY9Y4ujZLSlPyQhHcQowsMLK94qz0Ur
 PjFnUfhpRtn90RRvpOA7vGTBixxPgWj7/lfoleJjsJgBoCbBm1HCXP1CJSYtvu0mdTnz6G
 SLtG2y7+wwxKliQt+2gLmdmS4R6QX7h+Wu52TmXYCvy72fjpSZYSU+oX9WDRN+rCdrbJvn
 N9MI4gLCTZzMFdCY4o6VK1Nkcc7+bUmrroVh1DFLR95QSyKdLPr3XSuHk8nE7+M78xqXtG
 SYiolblpNRjpd39S6CfUkcZSTcueqKd8EXo6B0lkP1BrrWg5prYA/XTC/jzANw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HvM8Mg7h
Subject: Re: [Buildroot] [PATCH v3 3/3] package/go: use host compiler when
 go-bootstrap unsupported
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Tue, 14 Feb 2023 23:32:56 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> The process for "bootstrapping" the Go compiler in Buildroot is:
> 
> 1. Compile a C/C++ cross-compiler (gcc) as the host toolchain.

I find "host toolchain" confusing here. I generally understand "host
toolchain" as "native toolchain".

> diff --git a/package/go/go.mk b/package/go/go.mk
> index 4db703a301..68f6d9e36b 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -12,7 +12,6 @@ GO_LICENSE = BSD-3-Clause
>  GO_LICENSE_FILES = LICENSE
>  GO_CPE_ID_VENDOR = golang
>  
> -HOST_GO_DEPENDENCIES = host-go-bootstrap-stage2
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
>  HOST_GO_ROOT = $(HOST_DIR)/lib/go
> @@ -109,6 +108,11 @@ else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  HOST_GO_CGO_ENABLED = 1
>  endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  
> +ifeq ($(HOST_GO_CGO_ENABLED),1)
> +# For cgo support the toolchain needs to be available.
> +HOST_GO_DEPENDENCIES += toolchain
> +endif

Why is this added as part of this commit? It seems completely
unrelated. And in fact, shouldn't this be the correct thing to do
instead of what PATCH 1/3 is doing with the toolchain dependency added
on host-go-bootstrap-stage2 ?

> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 4353e9585e..943c7d0daf 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -217,6 +217,10 @@ if grep -q ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG ; then
>  	fi
>  fi
>  
> +if grep -q ^BR2_NEEDS_HOST_GO=y $BR2_CONFIG ; then
> +	check_prog_host "go"
> +fi

I think this is missing a version check on go: you need at least go
1.17.x to be able to build a go >= 1.20. The check as written here does
not check the go version.

Also, I am wondering if we couldn't improve things a bit and use an
already installed (and sufficiently recent) Go compiler to save on
building host-go-bootstrap-stage{1,2} even on architectures where the
full bootstrap build is supported.

We would have the following cases:

 - Architecture supported by bootstrap-stage{1,2}

   - If system-provided Go is available and recent enough => use it and skip bootstrap
   - If not, do bootstrapping

 - Architecture not supported by bootstrap-stage{1,2}

   - If system-provided Go is available and recent enough => use it
   - If not, should not happen due to check

It is of course not mandatory to implement this right now. It would be
a nice to have, but not a must have for sure.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
