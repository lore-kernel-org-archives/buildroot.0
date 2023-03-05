Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E33C6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0F24408D4;
	Sun,  5 Mar 2023 17:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0F24408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q8M1H-8TuEHD; Sun,  5 Mar 2023 17:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3D99409F1;
	Sun,  5 Mar 2023 17:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3D99409F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 182501BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E612C409F1
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E612C409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xvJPcNjwN4Fp for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:37:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D723408D4
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D723408D4
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:37:16 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E2A81C0006;
 Sun,  5 Mar 2023 17:37:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYsIL-001hlm-1A; Sun, 05 Mar 2023 18:37:13 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230223220947.8226-1-fontaine.fabrice@gmail.com>
Date: Sun, 05 Mar 2023 18:37:13 +0100
In-Reply-To: <20230223220947.8226-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 23 Feb 2023 23:09:47 +0100")
Message-ID: <87y1ob6qwm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > GCC_DL_DIR is empty as gcc is not a "real" package, as a result, the
 > following (silent) error is raised when BR2_CCACHE is set:

 > /home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/bin/ccache
 > /usr/bin/gcc -O2
 > -I/home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/include
 > -DBR_CROSS_PATH_SUFFIX='".br_real"' -DBR_CCACHE_HASH=\"` printf '%s\n'
 > --target=aarch64_be-buildroot-linux-gnu
 > --with-sysroot=@HOST_DIR@/aarch64_be-buildroot-linux-gnu/sysroot
 > --enable-__cxa_atexit --with-gnu-ld --disable-libssp
 > --disable-multilib --disable-decimal-float --enable-plugins
 > --enable-lto --with-gmp=@HOST_DIR@ --with-mpc=@HOST_DIR@
 > --with-mpfr=@HOST_DIR@ --with-bugurl="http://bugs.buildroot.net/"
 > --without-zstd --disable-libquadmath --disable-libquadmath-support
 > --enable-tls --enable-threads --without-isl --without-cloog
 > --with-abi="lp64" --with-cpu=cortex-a53 --enable-languages=c
 > --disable-shared --without-headers --disable-threads --with-newlib
 > --disable-largefile | sha256sum - /gcc-11.3.0.tar.xz
 > package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch
 > package/
 >  gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch
 > package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch
 > package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch
 > package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch
 > package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch
 > package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch
 > | cut -c -64 | tr -d '\n'`\"
 > -DBR_SYSROOT='"aarch64_be-buildroot-linux-gnu/sysroot"'
 > -DBR_ADDITIONAL_CFLAGS='"-Wl,-z,max-page-size=65536",
 > "-Wl,-z,common-page-size=65536", "-fstack-protector-strong",'
 > -DBR_CCACHE -DBR2_RELRO_PARTIAL -s -Wl,--hash-style=both
 > toolchain/toolchain-wrapper.c -o
 > /home/thomas/autobuild/instance-0/output-1/build/host-gcc-initial-11.3.0/toolchain-wrapper
 > sha256sum: /gcc-11.3.0.tar.xz: No such file or directory

 > This patch replaces GCC_DL_DIR by $($(PKG)_DL_DIR) as suggested by
 > Arnout Vandecappelle.

 > Fixes:
 >  - Found when investigating: http://autobuild.buildroot.org/results/ae75f5cdd4a1fe97359b99b2bcade258097c86dd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Arnout Vandecappelle):
 >  - Use $($(PKG)_DL_DIR)

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
