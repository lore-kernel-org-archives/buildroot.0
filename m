Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD8DC64EC4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02D6E4107F;
	Wed, 22 Feb 2023 15:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02D6E4107F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2CxgFjNqO6n; Wed, 22 Feb 2023 15:05:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D28F41083;
	Wed, 22 Feb 2023 15:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D28F41083
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 027861BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0A61418FE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0A61418FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHbRskA4PHs4 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:04:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75C82415DA
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75C82415DA
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:04:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i11so1889264wrp.5
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 07:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rFvWqnhIzhoDhtuMmUonUmLJ647HPcAxu/YO7HARWKc=;
 b=6dAQssrXgryn0+f/SOJpE5QyzrRdCsurOh2GkNXJdi1+CjJrOnmiUZH3tPWkA2jAHm
 P2cK82URl9H9z5X6ezzKXq+oTs2kDk1dHNBtB5/zvstWIqjJjpm3HjHwnMd+3l3an9ug
 QWKT9Ni3PARM/qQZhArgXVSnX9F0AQjs3RfmA62i+qFy6s7O7Zu0CwFTRNkdyBCQiVce
 33Pn2XB9htZXGz89E6EBSJ4C7iy6iRYlK5okeCGQeEYx6S096NJTOvR2YE0GF8WknNgN
 IkPzNBbBEtB3xh4k/5P2YtWdhPIUUyaNETy8tWfjj5U8SFHneUJXYKBiywZ+8X0z5wjr
 6gxQ==
X-Gm-Message-State: AO0yUKUAqEjvtQW2eOmWtCWYkMn3qU0asS2T4w1ujpmtgwPt+NGZurhg
 Cu/sJLWUqq3gdRDE1gHXTm/nC9/KcgA=
X-Google-Smtp-Source: AK7set+ndnBfugEQlaP0Mu8G7XwiVmPnEdxWQuzVJykBoEiLAZMqfK3fHGfmqwzPNc4jLIyiSk/pjw==
X-Received: by 2002:a5d:54c8:0:b0:2c5:99af:6ad7 with SMTP id
 x8-20020a5d54c8000000b002c599af6ad7mr6704527wrv.24.1677078296151; 
 Wed, 22 Feb 2023 07:04:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 a16-20020adffb90000000b002c54c92e125sm6542058wrr.46.2023.02.22.07.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:04:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 16:04:49 +0100
Message-Id: <20230222150449.2005824-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rFvWqnhIzhoDhtuMmUonUmLJ647HPcAxu/YO7HARWKc=;
 b=gTrx1JudFdcpjEr09xJZT5cj/zFH2fR5Jve7BxRomsbIbITlsphg8Aq2HHSrcBEoiL
 AvkM/14jCydn+wLynkDbWjvQOc+ktvxzcbkkFCetIbQyI7NEpwizscH3wrATk8QJDj9S
 wQK3EHZ6IVv7sAkmiiBJ47QgK+6qePWss/64q2GjmIWfizjM9BIBCjGGfMke2R5z1Uu/
 BnFQI6mUxr1yN5/ko/H4+ymQLGhBr90Zo0SA+t4Y7hEBJZRIW2qDDTshK8Ny+DFwf1ti
 GZXI/WSU8R0qWQEJlHesrUcNBwGEcKYiNDazBG2djSyh1ANoyzOlWTm6tZQWcdYtD0O/
 Brjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gTrx1Jud
Subject: [Buildroot] [PATCH RFC,1/1] package/gcc: fix GCC_DL_DIR
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC_DL_DIR is empty as gcc is not a "real" package, as a result, the
following (silent) error is raised when BR2_CCACHE is set:

/home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/bin/ccache /usr/bin/gcc -O2 -I/home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/include -DBR_CROSS_PATH_SUFFIX='".br_real"' -DBR_CCACHE_HASH=\"` printf '%s\n'  --target=aarch64_be-buildroot-linux-gnu --with-sysroot=@HOST_DIR@/aarch64_be-buildroot-linux-gnu/sysroot --enable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --disable-decimal-float --enable-plugins --enable-lto --with-gmp=@HOST_DIR@ --with-mpc=@HOST_DIR@ --with-mpfr=@HOST_DIR@  --with-bugurl="http://bugs.buildroot.net/" --without-zstd --disable-libquadmath --disable-libquadmath-support --enable-tls --enable-threads --without-isl --without-cloog --with-abi="lp64" --with-cpu=cortex-a53 --enable-languages=c --disable-shared --without-headers --disable-threads --with-newlib --disable-largefile  | sha256sum - /gcc-11.3.0.tar.xz package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch package/
 gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch | cut -c -64 | tr -d '\n'`\" -DBR_SYSROOT='"aarch64_be-buildroot-linux-gnu/sysroot"' -DBR_ADDITIONAL_CFLAGS='"-Wl,-z,max-page-size=65536", "-Wl,-z,common-page-size=65536", "-fstack-protector-strong",' -DBR_CCACHE -DBR2_RELRO_PARTIAL -s -Wl,--hash-style=both toolchain/toolchain-wrapper.c -o /home/thomas/autobuild/instance-0/output-1/build/host-gcc-initial-11.3.0/toolchain-wrapper
sha256sum: /gcc-11.3.0.tar.xz: No such file or directory

This patch replaces GCC_DL_DIR by HOST_GCC_INITIAL_DL_DIR. As, this can
be considered as a "hack", any comment to improve this patch is
appreciated

Fixes:
 - Found when investigating: http://autobuild.buildroot.org/results/ae75f5cdd4a1fe97359b99b2bcade258097c86dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 6dfd93f2a4..0755b59e96 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -284,7 +284,7 @@ HOST_GCC_COMMON_MAKE_OPTS = \
 	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 ifeq ($(BR2_CCACHE),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(GCC_DL_DIR)/$(GCC_SOURCE)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_INITIAL_DL_DIR)/$(GCC_SOURCE)
 
 # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned
 # and unversioned patches unconditionally. Moreover, to facilitate the
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
