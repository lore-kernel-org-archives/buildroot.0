Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED27C64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD72F405E2;
	Thu, 23 Feb 2023 22:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD72F405E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vFjSZA0RKVK; Thu, 23 Feb 2023 22:45:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B47FE405CF;
	Thu, 23 Feb 2023 22:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B47FE405CF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D820A1BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B247341874
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B247341874
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6n1zgs8nmua for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:44:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0357E4183D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0357E4183D
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:44:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C886240003;
 Thu, 23 Feb 2023 22:44:37 +0000 (UTC)
Date: Thu, 23 Feb 2023 23:44:34 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230223234434.5875481b@windsurf>
In-Reply-To: <20230223220947.8226-1-fontaine.fabrice@gmail.com>
References: <20230223220947.8226-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677192277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cdV0dyP1dPh1eCbPT9xIEe5jmcBx5pHMHaD7g340CCk=;
 b=LvwP45Tf23seBGRPAIBwL9TBf5j7nsYBYGrZke0yK6rxz2WSoTV1jYYWcNGuj5BrxQYPet
 0PUVRAYHXT6otZbwkSNGnR7+sfOj5EOKAmUd+CICE9YPan1pFMMWApe9B/TVtVXsZ+XH4V
 eQW1x+B3fDITQUMgtTudmf81SQdikFd2tKjmUCNKCdBcAp6O/dWw8p9W9lVxKRhzvO3Itd
 vjEWIUY0o+uDjt+YKZy/fByUWkD3k/gwJP//9C+Go3wLSHdrhl/KcbCjtHHnaNpxVAcl30
 olgiyD0QcW3OfEUmgeSNh1IWlJ+STj02L7zQons112Pa7Azmy19CnbTapjSUUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LvwP45Tf
Subject: Re: [Buildroot] [PATCH v2,1/1] package/gcc: fix GCC_DL_DIR
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
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 23 Feb 2023 23:09:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> GCC_DL_DIR is empty as gcc is not a "real" package, as a result, the
> following (silent) error is raised when BR2_CCACHE is set:
> 
> /home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/bin/ccache /usr/bin/gcc -O2 -I/home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/include -DBR_CROSS_PATH_SUFFIX='".br_real"' -DBR_CCACHE_HASH=\"` printf '%s\n'  --target=aarch64_be-buildroot-linux-gnu --with-sysroot=@HOST_DIR@/aarch64_be-buildroot-linux-gnu/sysroot --enable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --disable-decimal-float --enable-plugins --enable-lto --with-gmp=@HOST_DIR@ --with-mpc=@HOST_DIR@ --with-mpfr=@HOST_DIR@  --with-bugurl="http://bugs.buildroot.net/" --without-zstd --disable-libquadmath --disable-libquadmath-support --enable-tls --enable-threads --without-isl --without-cloog --with-abi="lp64" --with-cpu=cortex-a53 --enable-languages=c --disable-shared --without-headers --disable-threads --with-newlib --disable-largefile  | sha256sum - /gcc-11.3.0.tar.xz package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch packag
 e/
>  gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch | cut -c -64 | tr -d '\n'`\" -DBR_SYSROOT='"aarch64_be-buildroot-linux-gnu/sysroot"' -DBR_ADDITIONAL_CFLAGS='"-Wl,-z,max-page-size=65536", "-Wl,-z,common-page-size=65536", "-fstack-protector-strong",' -DBR_CCACHE -DBR2_RELRO_PARTIAL -s -Wl,--hash-style=both toolchain/toolchain-wrapper.c -o /home/thomas/autobuild/instance-0/output-1/build/host-gcc-initial-11.3.0/toolchain-wrapper
> sha256sum: /gcc-11.3.0.tar.xz: No such file or directory
> 
> This patch replaces GCC_DL_DIR by $($(PKG)_DL_DIR) as suggested by
> Arnout Vandecappelle.
> 
> Fixes:
>  - Found when investigating: http://autobuild.buildroot.org/results/ae75f5cdd4a1fe97359b99b2bcade258097c86dd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Use $($(PKG)_DL_DIR)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
