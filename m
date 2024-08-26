Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5919C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 13:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D59B60670;
	Mon, 26 Aug 2024 13:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJL9w8eq3fOU; Mon, 26 Aug 2024 13:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C8A606B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C8A606B1;
	Mon, 26 Aug 2024 13:05:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18D631BF2F4
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 13:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11A8C402BA
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 13:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ItwiWhHjuBvn for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 13:05:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 40698402AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40698402AC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40698402AC
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 13:05:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20586C000E;
 Mon, 26 Aug 2024 13:05:53 +0000 (UTC)
Date: Mon, 26 Aug 2024 15:05:51 +0200
To: Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20240826150551.3b032be6@windsurf>
In-Reply-To: <20240825194124.4719-3-geomatsi@gmail.com>
References: <20240825194124.4719-1-geomatsi@gmail.com>
 <20240825194124.4719-3-geomatsi@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724677553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWCpBFpYHuSf8XLiA9ne5QaeMUlWbsu3QlHlrYs5EvQ=;
 b=LLRCTJE8/GVm65B6PDQ3G+VwqfrfmqfcKSnV3QFMvgg2SbXoK5CwN36UJpRPFZKMUBEsqY
 K+srf0d6fjOxfyzmsTOW0AOPSWIKdGFBuuUyN6rQekYm+oxfykL0PMq8bh8QNPxHtPJkD8
 lfnZZQOtAkKPvMVrssetY69/8GGp50IKJX3IVt32ToNxFAWbEaTI+Q0E6BCQoGs5S+KZ15
 qH9GiLiMuAGcVSkcdlpp6i0OPwjDadJS6Ui+bMP3ppNvRePpfc+br8/U5t4ALBMuVyctPy
 +TlCONSx/noQh5s86jHVlG+0R9VM+WO0Vo8cI8gD91DV4r0ikNUsQ98FtT+CDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LLRCTJE8
Subject: Re: [Buildroot] [PATCH 2/2] package/linux-tools: perf: explicit
 option for libbfd support
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Sergey,

On Sun, 25 Aug 2024 22:41:09 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> Before Linux v6.4, libbfd support in perf was opted in by default and
> could be disabled using NO_LIBBFD=1. Starting from Linux v6.4, libbfd
> support in perf is opted out by default and can be enabled with new

s/with new/with the new/

> variable BUILD_NONDISTRO=1. For details see the kernel commit [1].
> In brief, the reason why libbfd support in perf is usually disabled
> is license: binutils is GPLv3, so some distributions can not ship
> perf linked against libbfd.
> 
> This commit adds new NONDISTRO option for perf to explicitly enable

s/adds new/adds a new/

s/for perf/to perf/

> libbfd support in perf when appropriate. Note that if binutils is
> enabled in config, but NONDISTRO is not enabled, then legacy option

s/in config/in the configuration/

s/then legacy/then the legacy option/

> NO_LIBBFD will be set for perf in pre-v6.4 Linux kernels.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dd317df072071903031ab5f91b4823858445c4a0
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  package/linux-tools/Config.in             | 6 ++++++
>  package/linux-tools/linux-tool-perf.mk.in | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 5a38f6dafe..e87a1d571a 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -112,6 +112,12 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
>  	  enables zooming into DSOs and threads as well as other
>  	  features.
>  
> +config BR2_PACKAGE_LINUX_TOOLS_PERF_NONDISTRO
> +	bool "enable perf NONDISTRO"

I know the upstream variable is named NONDISTRO, but to mean
"NONDISTRO" doesn't make any sense. Shouldn't this be named after the
feature it provides, or after binutils, or something?

> +	help
> +	  Enable building an linking against libbfd and libiberty

s/an/and/

> +	  distribution license incompatible libraries.

incompatible with what? Is it the fact that tools/perf is GPLv2 only
and libbfd/libiberty are GPLv3+ ?

I think this help text needs to be improved to really explained what
happens.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
